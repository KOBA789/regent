var regent = require('../');

var $ = regent.generator;

// equal ^[a-zA-Z]{5}$
var wordGen = $.times($.one($.range('a', 'z'), $.range('A', 'Z')), 4);
var words = wordGen.map(function (gen) {
  return gen();
});

words.forEach(function (word) {
  console.log(word);
});