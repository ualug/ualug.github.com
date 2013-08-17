$ ->
  log = (arg) ->
    console.log arg
    arg

  FeedItem = Backbone.Model.extend
    defaults:
      date: moment()
      type: "normal"
    preRender: ->
      user   = this.get "user"
      action = this.get "action"
      target = this.get "target"
      return false unless action && target && user
      this.set "text", "" +
        "<a class='user' href='#{user.link}' title='#{user.name}'><img src='#{user.avatar}' /></a>" +
        " #{action} " +
        "<a class='target' href='#{target.link}'>#{target.name}</a>"
      return this.get "text"

  FeedItemView = Backbone.View.extend
    tagName: "li"
    template: _.template $("noscript.template.feed").text()
    render: ->
      $("section.feed ul").append this.template
        date: this.model.get "date"
        text: this.model.get "text"
        type: this.model.get "type"
      return this

  FeedItems = Backbone.Collection.extend
    model: FeedItem
    fetch: ->
      that = feed || this
      $.get "https://stuff.passcod.name/ualug-feed/github.json", (j) ->
        items = []
        _(j).each (ev, k) ->
          item =
            date: moment ev.created_at
            user:
              name: ev.actor.login
              link: "https://github.com/#{ev.actor.login}"
              avatar: ev.actor.avatar_url
          
          _.extend item, switch ev.type.replace("Event", "")
            when "Follow"
              action: "followed" 
              target: 
                name: ev.payload.target.login
                link: "https://github.com/#{ev.payload.target.login}"
              type: "special"
            when "Fork"
              action: "forked" 
              target: 
                name: ev.payload.forkee.name
                link: ev.payload.forkee.html_url
              type: "create"
            when "Create"
              action: "created" 
              target: 
                name: ev.repo.name
                link: "https://github.com/#{ev.repo.name}"
              type: "create"
            when "Watch"
              action: "starred" 
              target: 
                name: "#{ev.repo.name}"
                link: "https://github.com/#{ev.repo.name}"
              type: "special"
            when "Push"
              action: "pushed to" 
              target: 
                name: ev.repo.name
                link: "https://github.com/#{ev.repo.name}"
            when "Gist"
              action: "gisted" 
              target: 
                name: "#" + ev.payload.gist.id
                link: ev.payload.gist.html_url
              type: ev.payload.action
            when "Delete"
              action: "deleted" 
              target: 
                name: ev.payload.ref
                link: "https://github.com/#{ev.repo.name}"
              type: "delete"
            when "CommitComment"
              action: "commented on" 
              target: 
                name: ev.repo.name
                link: ev.payload.comment.html_url
            when "Download"
              action: "uploaded" 
              target: 
                name: ev.payload.download.name
                link: ev.payload.download.html_url
              type: "create"
            when "Gollum"
              action: "wikied" 
              target: 
                name: ev.repo.name
                link: "https://github.com/#{ev.repo.name}/wiki"
            when "IssueComment"
              action: "commented on" 
              target: 
                name: "#{ev.repo.name}\##{ev.payload.issue.number}"
                link: ev.payload.comment.html_url
            when "Issues"
              action: ev.payload.action
              target: 
                name: "#{ev.repo.name}\##{ev.payload.issue.number}"
                link: ev.payload.issue.html_url
              type: switch ev.payload.action
                when "opened"
                  "create"
                when "reopened"
                  "special"
                when "closed"
                  "delete"
            when "Member"
              action: "added a collaborator"
              target:
                name: ev.payload.member.login
                link: "https://github.com/#{ev.payload.member.login}"
              type: "create"
            when "Public"
              action: "open sourced"
              target: 
                name: ev.repo.name
                link: "https://github.com/#{ev.repo.name}"
              type: "create"
            when "PullRequest"
              action: ev.payload.action
              target: 
                name: "#{ev.repo.name}\##{ev.payload.number}"
                link: ev.payload.pull_request.html_url
              type: switch ev.payload.action
                when "opened"
                  "create"
                when "reopened"
                  "special"
                when "closed"
                  "delete"
            when "PullRequestReviewComment"
              action: "commented on" 
              target: 
                name: ev.repo.name
                link: ev.payload.comment.html_url
            when "TeamAdd"
              action: "added team member"
              target:
                name: "#{ev.payload.user.login} (team: #{ev.payload.team.name})"
                link: "https://github.com/#{ev.payload.user.login}"

          items[k] = new FeedItem item

        that.reset items
      return this

  
  feed = new FeedItems
  feed.on "reset", ->
    $("section.feed ul").html("").removeClass "loading"
    items = _(feed.models.reverse()).chain().uniq(true, (item) -> item.preRender())
    if n = $("section.feed").attr "data-n"
      items = items.first(+n) if /^\d+$/.test n
    items.each (item) ->
      (new FeedItemView {model: item}).render()
  
  feed.fetch()
  setInterval feed.fetch, 60000
