function anagram(word, list) {
  return list.filter(function (nextWord) {
    if (nextWord.split('').sort().join('') === word.split('').sort().join('')) {
      return true;
    } else {
      return false;
    }
  })
}

console.log(anagram('listen', ['enlists', 'google', 'inlets', 'banana']));  // [ "inlets" ]
console.log(anagram('listen', ['enlist', 'google', 'inlets', 'banana']));   // [ "enlist", "inlets" ]
