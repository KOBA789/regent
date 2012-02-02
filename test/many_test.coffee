regent = require '../'

describe 'generator#many', ->
  describe 'a long word(length 1..)', ->
    smallGen = regent.generator.range 'a', 'z'
    bigGen = regent.generator.range 'A', 'Z'
    alphabetGen = regent.generator.one smallGen, bigGen
    wordGens = regent.generator.many1 alphabetGen
    it 'should be a word', ->
      wordGens.every (gen) ->
        word = gen()
        word.match(/[a-zA-Z]+/)
      .should.be_true

  describe 'a long word(length 0..)', ->
    smallGen = regent.generator.range 'a', 'z'
    bigGen = regent.generator.range 'A', 'Z'
    alphabetGen = regent.generator.one smallGen, bigGen
    wordGens = regent.generator.many alphabetGen
    it 'should be a word', ->
      wordGens.every (gen) ->
        gen().match(/[a-zA-Z]*/)
      .should.be_true