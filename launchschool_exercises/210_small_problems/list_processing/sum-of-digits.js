function sum(x) {
  var sum = 0;
  (x + '').split('').map(function (y) {
    sum += parseInt(y);
  });

  return sum;
}

console.log(sum(23));           // 5
console.log(sum(496));          // 19
console.log(sum(123456789));    // 45
