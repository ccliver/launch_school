/*
  Write a function that takes a string as an argument, and returns that string with every lowercase letter changed to uppercase and every uppercase letter changed to lowercase. Leave all other characters unchanged.
*/

function swapcase(str) {
  return str.split('').map(function (ch) {
    if (isUpper(ch)) {
      return ch.toLowerCase();
    } else if (isLower(ch)) {
      return ch.toUpperCase(ch);
    } else {
      return ch;
    }
  }).join('');
}

function isUpper(ch) {
  return /[A-Z]/.test(ch);
}

function isLower(ch) {
  return /[a-z]/.test(ch);
}

console.log(swapcase('CamelCase'));              // "cAMELcASE"
console.log(swapcase('Tonight on XYZ-TV'));      // "tONIGHT ON xyz-tv"
