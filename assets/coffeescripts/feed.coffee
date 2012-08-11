$ ->
  log = (arg) ->
    console.log arg
    arg

  FeedItem = Backbone.Model.extend
    defaults:
      date: moment()
      type: "normal"

  FeedItemView = Backbone.View.extend
    tagName: "li"
    template: _.template $("noscript.template.feed").html()
    render: ->
      $("section.feed ul").append this.template
        date: this.model.get "date"
        text: this.model.get "text"
        link: this.model.get "link"
        type: this.model.get "type"
      log this

  fewt = [
    ["2 Jul 2012",  "#", "passcod commented on #16"]
    ["5 Jul 2012",  "#", "inkybutton created Blah", "create"]
    ["2 Aug 2012",  "#", "milosivanovic forked Foo"]
    ["10 Aug 2012", "#", "sam did something bad", "delete"]
  ]

  window.fewn = []

  _(fewt).each (v, k) ->
    fewn[k] =
      m: new FeedItem
        date: moment v[0]
        text: v[2]
        link: v[1]
        type: v[3]

    fewn[k].v = new FeedItemView
      model: fewn[k].m

    fewn[k].v.render()