function isBalanced(string) {
  var parenOpen = 0;

  for (let i = 0; i < string.length; i++) {
    if (string[i] === '(') {
      parenOpen += 1;
    } else if (string[i] === ')') {
      parenOpen -= 1;
    }  

    if (parenOpen < 0) {
      return false;
    }
  }

  return parenOpen === 0;
}

console.log(isBalanced('What (is) this?'));        // true
console.log(isBalanced('What is) this?'));         // false
console.log(isBalanced('What (is this?'));         // false
console.log(isBalanced('((What) (is this))?'));    // true
console.log(isBalanced('((What)) (is this))?'));   // false
console.log(isBalanced('Hey!'));                   // true
console.log(isBalanced(')Hey!('));                 // false
console.log(isBalanced('What ((is))) up('));       // false
