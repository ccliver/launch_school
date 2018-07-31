function splitString(string, delimiter) {
  var word = '';

  if (delimiter ===  undefined) {
    console.log('ERROR: no delimiter');
    return;
  }

  for (var i = 0; i < string.length; i++) {
    if (string[i] === delimiter) {
      console.log(word);
      word = '';
    } else {
      if (delimiter === '') {
        console.log(string[i]);
      } else {
        word += string[i]
      }
    }
  }

  if (word) {
    console.log(word);
  }
}

splitString('abc,123,hello world', ',');
// logs:
// abc
// 123
// hello world

splitString('hello');
// logs:
// ERROR: No delimiter

splitString('hello', '');
// logs:
// h
// e
// l
// l
// o

splitString('hello', ';');
// logs:
// hello

splitString(';hello;', ';');
// logs:
//  (this is a blank line)
// hello
