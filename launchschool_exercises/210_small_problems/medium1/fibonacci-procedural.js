// Rewrite your recursive fibonacci function so that it computes its results without using recursion.

function fibonacci(nth) {
  var previousTwo = [1, 1];
  var i;

  for (i = 3; i <= nth; i += 1) {
    previousTwo = [previousTwo[1], previousTwo[0] + previousTwo[1]];
  }

  return previousTwo[1];
}

console.log(fibonacci(20));       // 6765
console.log(fibonacci(50));       // 12586269025
console.log(fibonacci(100));      // 354224848179261915075
