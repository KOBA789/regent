var util = require('./util');

var generator = module.exports;

generator.many1 = function (gen) {
  return function () {
    var result = [];
    for (var i = 0; i < util.random(1, 256); i ++) {
      result.push(gen());
    }
    return result.join('');
  };
};

generator.many = function (gen) {
  return function () {
    var result = [];
    for (var i = 0; i < util.random(0, 256); i ++) {
      result.push(gen());
    }
    return result.join('');
  };
};

generator.times = function (gen, count) {
  return function () {
    var result = [];
    for (var i = 0; i < count; i ++) {
      result.push(gen());
    }
    return result.join('');
  };
};

generator.one = function () {
  var args = arguments;
  return function () {
    return args[util.random(0, args.length - 1)]();
  };
};

generator.pure = function (str) {
  return function () {
    return str;
  };
};

generator.range = function (beginChar, endChar) {
  if (beginChar.length !== 1 || endChar.length !== 1) {
    throw Error('Argument type is miss match.');
  }
  var minCode = beginChar.charCodeAt(0);
  var maxCode = endChar.charCodeAt(0);

  return function () {
    var charCode = util.random(minCode, maxCode);
    return String.fromCharCode(charCode);    
  };
};
