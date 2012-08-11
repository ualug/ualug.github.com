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
      this.set "text", "" +
        "<a class='user' href='#{user.link}'>#{user.name}</a>" +
        " #{action} " +
        "<a class='target' href='#{target.link}'>#{target.name}</a>"
      return this.get "text"

  FeedItemView = Backbone.View.extend
    tagName: "li"
    template: _.template $("noscript.template.feed").html()
    render: ->
      $("section.feed ul").append this.template
        date: this.model.get "date"
        text: this.model.get "text"
        type: this.model.get "type"
      return this

  FeedItems = Backbone.Collection.extend
    model: FeedItem
    fetch: ->
      that = this
      $.get "https://ualug-github-feed.herokuapp.com/proxy/github.json", (j) ->
        items = []
        _(j).each (ev, k) ->
          item =
            date: moment ev.created_at
            user:
              name: ev.actor.login
              link: ev.actor.url
          
          _.extend item, switch ev.type.replace("Event", "")
            when "Follow"
              action: "followed" 
              target: 
                name: ev.payload.target.login
                link: ev.payload.target.url
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
              action: "stared" 
              target: 
                name: "#{ev.repo.name}"
                link: "https://github.com/#{ev.repo.name}"
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
                when "closed"
                  "delete"
            when "Member"
              action: "added a collaborator"
              target:
                name: ev.payload.member.login
                link: ev.payload.member.html_url
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
                when "closed"
                  "delete"
            when "PullRequestReviewComment"
              action: "commented on" 
              target: 
                name: ev.repo.name
                link: ev.payload.comment.html_url

          items[k] = new that.model item

        that.reset items
      return this


  feed = new FeedItems
  feed.on "reset", ->
    _(_(feed.models.reverse())
      .chain()
      .uniq(true, (item) -> item.preRender())
      .first(15)
      .value()
    ).each (item) ->
      (new FeedItemView {model: item}).render()
  
  feed.fetch()