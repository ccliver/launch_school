function stringy(x) {
  var output = '1';

  for (var i = 2; i <= x; i++) {
    if (i % 2 === 0) {
      output += '0';
    } else {
      output += '1';
    }
  }

  return output;
}

console.log(stringy(6));    // "101010"
console.log(stringy(9));    // "101010101"
console.log(stringy(4));    // "1010"
console.log(stringy(7));    // "1010101"
