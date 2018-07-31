function totalArea(arr) {
  // return arr.map(x => x[0] * x[1]).reduce((accumulator, currentValue) => accumulator + currentValue);

  var areas = arr.map(function (element) {
    return element[0] * element[1];
  });

  return areas.reduce(function (accumulator, currentValue) {
    return accumulator += currentValue;
  });
}

function totalSquareArea(arr) {
  // return arr.filter(x => x[0] === x[1] ? true : false ).map(x => x[0] * x[1]).reduce((accumulator, currentValue) => accumulator + currentValue);

  var squares = arr.filter(function (element) {
    if (element[0] === element[1]) {
      return true;
    } else {
      return false;
    }
  });

  var areas = squares.map(function (element) {
    return element[0] * element[1];
  });

  return areas.reduce(function (accumulator, currentValue) {
    return accumulator += currentValue;
  });
}

var rectangles = [[3, 4], [6, 6], [1, 8], [9, 9], [2, 2]];

console.log(totalArea(rectangles));    // 141

rectangles = [[3, 4], [6, 6], [1, 8], [9, 9], [2, 2]];
console.log(totalSquareArea(rectangles));    // 121
