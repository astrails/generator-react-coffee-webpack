`'use strict';`

component = undefined

describe 'Foo', ->

  beforeEach ->
    Foo = require '../../../src/scripts/components/Foo/Foo.coffee'
    component = Foo()

  it 'should create a new instance of Foo', ->
    expect(component).toBeDefined()