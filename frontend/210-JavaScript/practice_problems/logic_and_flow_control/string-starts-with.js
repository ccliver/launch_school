function startsWith(string, searchString) {
  var match = false;

  if (searchString == '') {
    return true;
  }

  for (var i = 0; i < searchString.length; i++) {
    if (string[i] === searchString[i]) {
      match = true;
    } else {
      match = false;
    }
  }

  return match;
}

var str = 'We put comprehension and mastery above all else';
console.log(startsWith(str, 'We'));              // true
console.log(startsWith(str, 'We put'));          // true
console.log(startsWith(str, ''));                // true
console.log(startsWith(str, 'put'));             // false

var longerString = 'We put comprehension and mastery above all else!';
console.log(startsWith(str, longerString));      // false
