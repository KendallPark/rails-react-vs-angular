# @cjsx React.DOM

@Raffler = React.createClass
  getInitialState: ->
    entries: @props.entries
    lastWinner: null

  addEntry: (name) ->
    console.log "outer thing", name
    $.ajax
      url: "/entries"
      dataType: "json"
      type: "POST"
      data: {entry: {name: name}}
      success: (entry) =>
        newState = React.addons.update @state,
          entries: {$push: [entry]}
        @setState(newState)

  drawWinner: ->
    pool = []
    _.each @props.entries, (entry) ->
      pool.push entry if !entry.winner

    if pool.length > 0
      entry = pool[Math.floor(Math.random()*pool.length)]
      index = @state.entries.indexOf(entry) # hint

      # Need to figure out how to update nested properites on state
      # https://facebook.github.io/react/docs/update.html
      newState = {}
      
      @setState newState

  render: ->
    # you need to pass the addEntry function to AddEntryForm as props
    # you need to pass the @state.entries to the EntryList as props
    # you need to call drawWinner when the button is clicked

    <div>
      <AddEntryForm />
      <EntryList />
      <button>Draw Winner</button>
    </div>


@AddEntryForm = React.createClass
  onKeyPress: (e) ->
    return unless e.key is "Enter"
    @addEntry()

  addEntry: ->
    # https://facebook.github.io/react/docs/more-about-refs.html
    name = "" # figure out how to get this value from the nameField

    # call the addEntry method in the Raffler via props!!!

  render: ->
    <div className="form">
      <input ref="nameField" type="text" defaultValue="" onKeyPress={this.onKeyPress} />
      <button onClick={this.addEntry}>Add</button>
    </div>


@EntryList = React.createClass
  render: ->
    # HINT: https://facebook.github.io/react/blog/2013/11/05/thinking-in-react.html
    listItems = []

    # need to populate the listItems
    
    <ul>
      {listItems}
    </ul>

