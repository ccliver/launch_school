function rot13(str) {
  var convertedStr = '';
  var asciiCode;

  for (var i = 0; i < str.length; i++) {
    asciiCode = str[i].charCodeAt(0);

    if (asciiCode >= 65 && asciiCode <= 90) {
      if (asciiCode + 13 > 90) {
        convertedStr += String.fromCharCode(asciiCode - 13);
      } else {
        convertedStr += String.fromCharCode(asciiCode + 13);
      }
    } else if (asciiCode >= 97 && asciiCode <= 122) {
      if (asciiCode + 13 > 122) {
        convertedStr += String.fromCharCode(asciiCode - 13);
      } else {
        convertedStr += String.fromCharCode(asciiCode + 13);
      }
    } else {
      convertedStr += str[i];
    }
  }

  return convertedStr;
}

console.log(rot13('Teachers open the door, but you must enter by yourself.'));
console.log(rot13(rot13('Teachers open the door, but you must enter by yourself.')));
