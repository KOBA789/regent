var regent = require('../');

var $ = regent.generator;

// equal ^[01]{5}$
var binaryGen = $.times($.one($.pure('0'), $.pure('1')), 4);
var binaries = binaryGen.map(function (gen) {
  return gen();
});

binaries.forEach(function (binary) {
  console.log(binary);
});