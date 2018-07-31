/*
A collection of spelling blocks has two letters per block, as shown in this list:

B:O   X:K   D:Q   C:P   N:A
G:T   R:E   F:S   J:W   H:U
V:I   L:Y   Z:M

This limits the words you can spell with the blocks to only those words that do not use both letters from any given block. You can also only use each block once.

Write a function that takes a word string as an argument, and returns true if the word can be spelled using the set of blocks, or false otherwise. You can consider the letters to be case-insensitive when you apply the rules.
*/

/*
  input: word that should be treated as case-insensitive
  output: true if it can be spelled with the blocks, false otherwise

  - convert input to lowercase
  - split input word into characters
  - iterate through the array of characters
    - record each character in an array
    - if the character already exists in the array return false
  - if the characters in the array adhere to the block rules return true otherwise return false
*/

function isBlockWord(word) {
  var charactersSeen = [];
  var characters = word.toLowerCase().split('');
  var blocks = ['BO', 'XK', 'DQ', 'CP', 'NA', 'GT', 'RE', 'FS', 'JW', 'HU', 'VI', 'LY', 'ZM'];

  for (let i = 0; i < characters.length; i++) {
    if (charactersSeen.includes(characters[i])) {
      return false;
    }

    charactersSeen.push(characters[i]);
  }

  for (let i = 0; i < charactersSeen.length; i++) {
    let index = charactersSeen.findIndex
  }

  return true
}

console.log(isBlockWord('AAAA'));       // false
console.log(isBlockWord('BATCH'));      // true
console.log(isBlockWord('BUTCH'));      // false
console.log(isBlockWord('jest'));       // true
console.log(isBlockWord('HAPPEN'));     // false
console.log(isBlockWord('PiNe'));       // true
