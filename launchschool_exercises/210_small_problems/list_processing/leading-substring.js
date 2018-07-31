/*
  Write a function that takes a string argument, and returns a list of all substrings that start from the beginning of the string, ordered from shortest to longest.
*/

function substringsAtStart(str) {
  var strings = [];
  var chars = str.split('');

  for (let i = 0; i < chars.length; i++) {
    strings.push(chars.slice(0, i + 1).reduce((acc, curr) => acc += curr));
  }

  return strings;
}

console.log(substringsAtStart('abc'));      // ["a", "ab", "abc"]
console.log(substringsAtStart('a'));        // ["a"]
console.log(substringsAtStart('xyzzy'));    // ["x", "xy", "xyz", "xyzz", "xyzzy"]
