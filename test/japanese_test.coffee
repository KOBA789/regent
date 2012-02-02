regent = require '../lib'

describe 'japanese', ->
  describe 'hiragana', ->
    hiraganaGens = regent.generator.range 'あ', 'ん'
    it 'should match', ->
      hiraganaGens.every (gen) ->
        hiragana = gen()
        hiragana.match(/^[あ-ん]$/)
      .should.equal true
    it 'should not match', ->
      hiraganaGens.every (gen) ->
        hiragana = gen()
        hiragana.match(/^[a-zA-Z_]$/)
      .should.equal false

  describe 'tango', ->
    hiraganaGens = regent.generator.range 'あ', 'ん'
    tangoGens = regent.generator.many1 hiraganaGens
    it 'should match', ->
      tangoGens.every (gen) ->
        tango = gen()
        tango.match(/^[あ-ん]+$/)
      .should.equal true

    it 'should not match', ->
      tangoGens.every (gen) ->
        tango = gen()
        tango.match(/^[a-zA-Z_]+$/)
      .should.equal false
