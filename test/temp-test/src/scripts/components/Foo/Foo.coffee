`/** @jsx React.DOM */`

`'use strict';`

React = require 'react/addons'

Foo = React.createClass
  
  render: ->
    `<div>
      <p>Content for Foo</p>
    </div>`

module.exports = Foo
