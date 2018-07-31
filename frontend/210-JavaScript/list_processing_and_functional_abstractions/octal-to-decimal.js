function octalToDecimal(numberString) {
  var decimalParts = numberString.split('').map(function (digitChar, index) {
    return Number(digitChar) * Math.pow(8, numberString.length - index - 1);
  });

  return decimalParts.reduce(function (sum, number) {
    return sum + number;
  });
}

console.log(octalToDecimal('1'));           // 1
console.log(octalToDecimal('10'));          // 8
console.log(octalToDecimal('130'));         // 88
console.log(octalToDecimal('17'));          // 15
console.log(octalToDecimal('2047'));        // 1063
console.log(octalToDecimal('011'));         // 9
