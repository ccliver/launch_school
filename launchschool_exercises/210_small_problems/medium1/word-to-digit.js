/*
  Write a function that takes a sentence string as an argument, and returns that string with every occurrence of a "number word" — 'zero', 'one', 'two', 'three', 'four', 'five', 'six', 'seven', 'eight', 'nine' — converted to its corresponding digit character.
*/

function wordToDigit(str) {
  return str.replace(/\bone\b/g, '1').
            replace(/\btwo\b/g, '2').
            replace(/\bthree\b/g, '3').
            replace(/\bfour\b/g, '4').
            replace(/\bfive\b/g, '5').
            replace(/\bsix\b/g, '6').
            replace(/\bseven\b/g, '7').
            replace(/\beight\b/g, '8').
            replace(/\bnine\b/g, '9');
}

console.log(wordToDigit('Please call me at five five five one two three four. Thanks.'));
// "Please call me at 5 5 5 1 2 3 4. Thanks."
