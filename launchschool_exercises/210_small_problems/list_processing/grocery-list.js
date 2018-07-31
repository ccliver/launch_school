/*
  Write a function that takes a grocery list (a two-dimensional array) with each element containing a fruit and a quantity, and returns a one-dimensional array of fruits, in which each fruit appears a number of times equal to its quantity.
*/

function buyFruit(fruitList) {
  var fruits = [];

  fruitList.forEach(function (fruit) {
    for (let i = 0; i < fruit[1]; i++) {
      fruits.push(fruit[0]);
    }
  });

  return fruits;
}

console.log(buyFruit([['apple', 3], ['orange', 1], ['banana', 2]]));
// returns ["apple", "apple", "apple", "orange", "banana", "banana"]
