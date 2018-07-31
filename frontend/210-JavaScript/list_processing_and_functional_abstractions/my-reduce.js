function myReduce(array, func, initial) {
  var accumulator = typeof initial === 'undefined' ? array[0] : initial;
  var index = typeof initial === 'undefined' ? 1 : 0;

  array.slice(index).forEach(function(element) {
    accumulator = func(accumulator, element);
  });

  return accumulator;
}

var smallest = function (result, value) {
  return result <= value ? result : value;
};

var sum = function (result, value) {
  return result + value;
};

console.log(myReduce([5, 12, 15, 1, 6], smallest));           // 1
console.log(myReduce([5, 12, 15, 1, 6], sum, 10));            // 49
