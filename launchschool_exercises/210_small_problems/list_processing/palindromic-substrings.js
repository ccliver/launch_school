/*
  Write a function that returns a list of all substrings of a string that are palindromic. That is, each substring must consist of the same sequence of characters forwards as backwards. The substrings in the returned list should be sorted by their order of appearance in the input string. Duplicate substrings should be included multiple times.
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

function palindromes(str) {
  return substrings(str).filter(x => x === x.split('').reverse().join('') && x.length > 1);
}

console.log(palindromes('abcd'));       // []
console.log(palindromes('madam'));      // [ "madam", "ada" ]

console.log(palindromes('hello-madam-did-madam-goodbye'));
// returns
[ "ll", "-madam-", "-madam-did-madam-", "madam", "madam-did-madam", "ada",
  "adam-did-mada", "dam-did-mad", "am-did-ma", "m-did-m", "-did-", "did",
  "-madam-", "madam", "ada", "oo" ]

console.log(palindromes('knitting cassettes'));
// returns
[ "nittin", "itti", "tt", "ss", "settes", "ette", "tt" ]
