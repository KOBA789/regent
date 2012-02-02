regent = require '../'

describe 'util', ->
  describe 'combine', ->
    it 'should return combination', ->
      data = [['a', 'b'], ['c', 'd'], ['e', 'f']]
      exp = ['ace', 'acf', 'ade', 'adf', 'bce', 'bcf', 'bde', 'bdf']
      regent.util.combine(data, (a, b) -> a + b ).should.eql exp

describe 'generator', ->
  describe 'a smaller alphabet', ->
    alphabetGens = regent.generator.range 'a', 'z'
    it 'should be a char from a to z', ->
      alphabetGens.every (gen) ->
        gen().match(/[a-z]/)
      .should.be_true

  describe 'an alphabet', ->
    smallGen = regent.generator.range 'a', 'z'
    bigGen = regent.generator.range 'A', 'Z'
    alphabetGens = regent.generator.one smallGen, bigGen
    it 'should be a char from A to z', ->
      alphabetGens.every (gen) ->
        gen().match(/[a-zA-Z]/)
      .should.be_true

  describe 'a word(length 10)', ->
    smallGen = regent.generator.range 'a', 'z'
    bigGen = regent.generator.range 'A', 'Z'
    alphabetGen = regent.generator.one smallGen, bigGen
    wordGens = regent.generator.times alphabetGen, 10

    words = wordGens.map (gen) -> gen()
    it 'should be a word', ->
      words.every (word) ->
        word.match(/[a-zA-Z]/)
      .should.be_true

    describe 'length', ->
      it 'should be 10', ->
        words.every (word) ->
          word.length.should.equal 10
        .should.be_true