function indexOf(firstString, secondString) {
  for (var i = 0; i < firstString.length; i++) {
    if (firstString[i] === secondString[0]) {
      matched = true;

      for (j = 0; j < secondString.length; j++) {
        if (firstString[i + j] === secondString[j]) {
          matched = true;
        } else {
          matched = false;
        }
      }

      if (matched) {
        return i;
      }
    }
  }

  return -1;
}

function lastIndexOf(firstString, secondString) {
}

console.log(indexOf('Some strings', 's'));                      // 5
console.log(indexOf('Blue Whale', 'Whale'));                    // 5
console.log(indexOf('Blue Whale', 'Blute'));                    // -1
console.log(indexOf('Blue Whale', 'leB'));                      // -1

console.log(lastIndexOf('Some strings', 's'));                  // 11
console.log(lastIndexOf('Blue Whale, Killer Whale', 'Whale'));  // 19
console.log(lastIndexOf('Blue Whale, Killer Whale', 'all'));    // -1
