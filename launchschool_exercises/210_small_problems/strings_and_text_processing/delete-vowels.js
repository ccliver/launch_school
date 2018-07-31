// Write a function that takes an array of strings, and returns an array of the same strings values without the vowels (a, e, i, o, u).

function removeVowels(arr) {
  return arr.map(x => x.replace(/[aeiouAEIOU]/g, ''));
}

console.log(removeVowels(['abcdefghijklmnopqrstuvwxyz']));         // ["bcdfghjklmnpqrstvwxyz"]
console.log(removeVowels(['green', 'YELLOW', 'black', 'white']));  // ["grn", "YLLW", "blck", "wht"]
console.log(removeVowels(['ABC', 'AEIOU', 'XYZ']));                // ["BC", "", "XYZ"]
