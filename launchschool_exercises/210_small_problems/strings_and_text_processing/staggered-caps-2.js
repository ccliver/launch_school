//Modify the function from the previous exercise so that it ignores non-alphabetic characters when determining whether a letter should be upper or lower case. Non-alphabetic characters should still be included in the output string, but should not be counted when determining the appropriate case.

function staggeredCase(str) {
  var even = true;

  return str.split('').map(function (ch) {
    if (/[a-zA-Z]/.test(ch)) {
      if (even) {
        even = false
        return ch.toUpperCase();
      } else {
        even = true;
        return ch.toLowerCase();
      }
    } else {
      return ch;
    }
  }).join('');
}

console.log(staggeredCase('I Love Launch School!'));        // "I lOvE lAuNcH sChOoL!"
console.log(staggeredCase('ALL CAPS'));                     // "AlL cApS"
console.log(staggeredCase('ignore 77 the 444 numbers'));    // "IgNoRe 77 ThE 444 nUmBeRs"
