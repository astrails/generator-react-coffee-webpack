`/** @jsx React.DOM */`

`'use strict';`

React = require 'react/addons'

<%= classedName %> = React.createClass
  
  render: ->
    `<div>
      <p>Content for <%= classedName %></p>
    </div>`

module.exports = <%= classedName %>
