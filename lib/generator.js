var util = require('./util');

var generator = module.exports;

generator.many1 = function (gen) {
  return generator.times(gen, util.random(1, 15));
};

generator.many = function (gen) {
  return generator.many1(gen).concat(generator.pure(''));
};

generator.times = function (gen, count) {
  var genList = [];
  for (var i = 0; i < count; i ++) {
    genList.push(gen);
  }
  return util.combine(genList, function (a, b) {
    return function () {
      return a() + b();
    };
  });
};

generator.one = function () {
  var args = Array.prototype.slice.call(arguments);
  return args.reduce(function (prev, curr) {
    return prev.concat(curr);
  });
};

generator.pure = function (str) {
  return [function () {
    return str;
  }];
};

generator.range = function (beginChar, endChar) {
  if (beginChar.length !== 1 || endChar.length !== 1) {
    throw Error('Argument type is miss match.');
  }
  var minCode = beginChar.charCodeAt(0);
  var maxCode = endChar.charCodeAt(0);

  return [function () {
    var charCode = util.random(minCode, maxCode);
    return String.fromCharCode(charCode);    
  }];
};
