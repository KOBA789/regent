var util = module.exports;

util.random = function (min, max) {
  var a = min;
  var b = max - min + 1;

  return a + Math.floor(Math.random() * b);
};