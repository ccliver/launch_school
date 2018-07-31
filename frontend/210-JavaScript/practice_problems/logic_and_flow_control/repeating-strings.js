function repeat(string, times) {
  var newString = '';

  if (typeof times !== 'number' || times < 0) {
    return undefined;
  }

  for (var i = 0; i < times; i++) {
    newString += string;
  }

  return newString;
}

console.log(repeat('abc', 1));       // "abc"
console.log(repeat('abc', 2));       // "abcabc"
console.log(repeat('abc', -1));      // undefined
console.log(repeat('abc', 0));       // ""
console.log(repeat('abc', 'a'));     // undefined
console.log(repeat('abc', false));   // undefined
console.log(repeat('abc', null));    // undefined
console.log(repeat('abc', '  '));    // undefined
