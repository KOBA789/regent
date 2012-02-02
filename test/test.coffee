regent = require '../'

describe 'generator', ->
  describe 'a smaller alphabet', ->
    alphabetGen = regent.generator.range 'a', 'z'
    it 'should be a char from a to z', ->
      alphabetGen().match(/[a-z]/).should.be_true

  describe 'an alphabet', ->
    smallGen = regent.generator.range 'a', 'z'
    bigGen = regent.generator.range 'A', 'Z'
    alphabetGen = regent.generator.one smallGen, bigGen
    it 'should be a char from A to z', ->
      alphabetGen().match(/[a-zA-Z]/).should.be_true

  describe 'a word(length 10)', ->
    smallGen = regent.generator.range 'a', 'z'
    bigGen = regent.generator.range 'A', 'Z'
    alphabetGen = regent.generator.one smallGen, bigGen
    wordGen = regent.generator.times alphabetGen, 10
    word = wordGen()

    it 'should be a word', ->
      word.match(/[a-zA-Z]/).should.be_true

    describe 'length', ->
      it 'should be 10', ->
        word.length.should.equal 10

  describe 'a long word', ->
    smallGen = regent.generator.range 'a', 'z'
    bigGen = regent.generator.range 'A', 'Z'
    alphabetGen = regent.generator.one smallGen, bigGen
    wordGen = regent.generator.many1 alphabetGen
    word = wordGen()
    it 'should be a word', ->
      word.match(/[a-zA-Z]+/).should.be_true