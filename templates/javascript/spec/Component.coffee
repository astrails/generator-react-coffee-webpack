`'use strict';`

component = undefined

describe '<%= classedName %>', ->

  beforeEach ->
    <%= classedName %> = require '../../../src/scripts/components/<%= classedName %>/<%= classedName %>.coffee'
    component = <%= classedName %>()

  it 'should create a new instance of <%= classedName %>', ->
    expect(component).toBeDefined()