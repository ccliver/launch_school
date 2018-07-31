function substr(string, start, length) {
  var newStr = '';
  var startIndex;
  var actualLength;

  start < 0 ? startIndex = string.length + start : startIndex = start;
  length > string.length ? actualLength = string.length - startIndex : actualLength = length;

  for (var i = 0; i < actualLength; i++) {
    newStr += string[startIndex + i];    
  }

  return newStr;
}

var string = 'hello world';

console.log(substr(string, 2, 4));      // "llo "
console.log(substr(string, -3, 2));     // "rl"
console.log(substr(string, 8, 20));     // "rld"
console.log(substr(string, 0, -20));    // ""
console.log(substr(string, 0, 0));      // ""
