/*
  Write a function that takes a string, and returns an object containing the following three properties:

  the percentage of characters in the string that are lowercase letters
  the percentage of characters that are uppercase letters
  the percentage of characters that are neither
  You may assume that the string will always contain at least one character.
*/

function letterPercentages(str) {
  var letterCounts = {
    lowercase: 0,
    uppercase: 0,
    neither:   0
  }

  str.split('').forEach(function (ch) {
    if (/[a-z]/.test(ch)) {
      letterCounts.lowercase += 1;
    } else if (/[A-Z]/.test(ch)) {
      letterCounts.uppercase += 1;
    } else {
      letterCounts.neither += 1;
    }
  });

  return {
    lowercase: (letterCounts.lowercase / str.length * 100).toFixed(2),
    uppercase: (letterCounts.uppercase / str.length * 100).toFixed(2),
    neither:   (letterCounts.neither / str.length * 100).toFixed(2)
  }
}

console.log(letterPercentages('abCdef 123'));
// { lowercase: "50.00", uppercase: "10.00", neither: "40.00" }

console.log(letterPercentages('AbCd +Ef'));
// { lowercase: "37.50", uppercase: "37.50", neither: "25.00" }

console.log(letterPercentages('123'));
// { lowercase: "0.00", uppercase: "0.00", neither: "100.00" }
