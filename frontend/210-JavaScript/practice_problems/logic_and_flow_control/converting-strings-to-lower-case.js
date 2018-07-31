function toLower(ch) {
  asciiNumeric = ch.charCodeAt(0);

  if (asciiNumeric >= 65 && asciiNumeric <= 90) {
    asciiNumeric += 32;
    return String.fromCharCode(asciiNumeric);
  } else {
    return ch;
  }
}

function toLowerCase(string) {
  var convertedString = ''

  for (var i = 0; i < string.length; i++) {
    convertedString += toLower(string[i]);
  }

  return convertedString
}

console.log(toLowerCase('ALPHABET'));    // "alphabet"
console.log(toLowerCase('123'));         // "123"
console.log(toLowerCase('abcDEF'));      // "abcdef"
