function substring(string, start, end) {
  var newStr = '';
  var actualStart;
  var actualEnd;

  if (start === end) {
    return '';
  }
  
  if (end < start) {
    actualStart = end;
    actualEnd = start;
  } else {
    actualStart = start;
    actualEnd = end;
  }

  if (actualStart < 0) {
    actualStart = 0;
  }

  if (actualEnd < 0) {
    actualEnd = 0;
  }

  if (end === undefined) {
    actualEnd = string.length;
  }

  if (typeof start !== 'number') {
    return string;
  }

  if (actualStart > string.length) {
    actualStart = string.length;
  }

  if (actualEnd > string.length) {
    actualEnd = string.length;
  }

  for (var i = actualStart; i < actualEnd; i++) {
    newStr += string[i];
  }

  return newStr;
}

var string = 'hello world';

console.log(substring(string, 2, 4));    // "ll"
console.log(substring(string, 4, 2));    // "ll"
console.log(substring(string, 0, -1));   // ""
console.log(substring(string, 2));       // "llo world"
console.log(substring(string, 'a'));     // "hello world"
console.log(substring(string, 8, 20));   // "rld"
