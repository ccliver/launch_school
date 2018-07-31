/*
  Write a function that returns a list of all substrings of a string. Order the returned list by where in the string the substring begins. This means that all substrings that start at position 0 should come first, then all substrings that start at position 1, and so on. Since multiple substrings will occur at each position, return the substrings at a given position from shortest to longest.
*/

function substringsAtStart(str) {
  var strings = [];
  var chars = str.split('');

  for (let i = 0; i < chars.length; i++) {
    strings.push(chars.slice(0, i + 1).reduce((acc, curr) => acc += curr));
  }

  return strings;
}

function substrings(str) {
  var strings = [];

  for (let i = 0; i < str.length; i++) {
    strings = strings.concat(substringsAtStart(str.slice(i, str.length)));
  }

  return strings;
}

console.log(substrings('abcde'));

// returns
[ "a", "ab", "abc", "abcd", "abcde",
  "b", "bc", "bcd", "bcde",
  "c", "cd", "cde",
  "d", "de",
  "e" ]
