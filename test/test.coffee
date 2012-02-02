regent = require '../'

describe 'generator', ->
  describe 'smaller alphabets', ->
    alphabetGen = regent.generator.range 'a', 'z'
    it 'should be a char from a to z', ->
      alphabetGen().match(/[a-z]/).should.be_true

  describe 'alphabets', ->
    smallGen = regent.generator.range 'a', 'z'
    bigGen = regent.generator.range 'A', 'Z'
    alphabetGen = regent.generator.one smallGen, bigGen
    it 'should be a char from A to z', ->
      alphabetGen().match(/[a-zA-Z]/).should.be_true

  describe 'word', ->
    smallGen = regent.generator.range 'a', 'z'
    bigGen = regent.generator.range 'A', 'Z'
    alphabetGen = regent.generator.one smallGen, bigGen
    wordGen = regent.generator.times alphabetGen, 10
    it 'should be a word', ->
      console.log wordGen()