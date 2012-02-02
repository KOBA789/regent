var util = module.exports;

util.random = function (min, max) {
  var a = min;
  var b = max - min + 1;

  return a + Math.floor(Math.random() * b);
};

util.combine = function (list, func) {
  var first = list.shift();
  var second = list.shift();
  if (second === undefined) {
    return first;
  }
  var combination = first.map(function (val1) {
    return second.map(function (val2) {
      return func(val1, val2);
    });
  }).reduce(function (val1, val2) {
    return val1.concat(val2);
  });
  if (list.length === 0) {
    return combination;
  } else {
    return util.combine([combination].concat(list), func);
  }
};