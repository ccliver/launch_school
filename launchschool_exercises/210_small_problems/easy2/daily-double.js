function crunch(str) {
  var lastSeen = str[0];
  var shrunkStr = str[0];

  if (str.length === 0) return '';

  for (var i = 1; i < str.length; i++) {

    if (str[i] === lastSeen) {
      continue;
    } else {
      shrunkStr += str[i];
      lastSeen = str[i];
    }
  }

  return shrunkStr;
}

console.log(crunch('ddaaiillyy ddoouubbllee'));    // "daily double"
console.log(crunch('4444abcabccba'));              // "4abcabcba"
console.log(crunch('ggggggggggggggg'));            // "g"
console.log(crunch('a'));                          // "a"
console.log(crunch(''));                           // ""
