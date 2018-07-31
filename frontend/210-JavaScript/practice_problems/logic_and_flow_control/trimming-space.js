function trim(str) {
  var newStr = ''

  for (var i = 0; i < str.length; i++) {
    if (str[i] !== ' ') {
      newStr += str[i];
    }
  }

  return newStr;
}

console.log(trim('  abc  '));  // "abc"
console.log(trim('abc   '));   // "abc"
console.log(trim(' ab c'));    // "ab c"
console.log(trim(' a b  c'));  // "a b  c"
console.log(trim('      '));   // ""
console.log(trim(''));         // ""
