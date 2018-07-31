/*
To look at the steps of this problem solving approach in depth, we will work through a problem and see how to apply each step in the process. The problem we will look at compares software version numbers.

While version numbers often appear to be decimal numbers, they are, in fact, a convenient notation for a more complicated number system. The following are all legal version numbers:

1
1.0
1.2
3.2.3
3.0.0
4.2.3.0

Write a function that takes any two version numbers in this format and compares them, with the result of this comparison showing whether the first is less than, equal to, or greater than the second version:

- If version1 > version2, we should return 1.
- If version1 < version2, we should return -1.
- If version1 === version2, we should return 0.
- If either version number contains characters other than digits and the . character, we should return null.

Here is an example of version number ordering:
0.1 < 1 = 1.0 < 1.1 < 1.2 = 1.2.0.0 < 1.18.2 < 13.37
*/

/*
- return null if either variable contains characters other than [0-9.]
- compare each digit of version1 to its corresponding digit in version2. missing digits === 0:
  - if the digit from version1 is greater return 1
  - if the digit from version2 is greater return -1
  - if they are equal keep iterating
- return 0 if 1 or -1 were not returned during the comparison
*/

function compareVersions(version1, version2) {
  var digits1 = version1.split(/\./);
  var digits2 = version2.split(/\./);

  if (version1.match(/[^0-9.]/) || version2.match(/[^0-9.]/)) {
    return null;
  }

  for (let i = 0; i < digits1.length; i++) {
    if (digits1[i] === undefined) {
      digits1[i] = '0';
    }
    if (digits2[i] === undefined) {
      digits2[i] = '0';
    }

    if (digits1[i] > digits2[i]) {
      return 1;
    }

    if (digits1[i] < digits2[i]) {
      return -1
    }
  }

  return 0;
}

console.log(compareVersions('testversion', '1.3.2')); // null
console.log(compareVersions('1', '2')); // -1
console.log(compareVersions('1.0', '2.0')); // -1
console.log(compareVersions('3.4.7', '3.4.7')); // 0
console.log(compareVersions('6.8.0.1', '6.8.0.2')); // -1
console.log(compareVersions('1.2.3', '1.2')); // 1
console.log(compareVersions('6.31.6.3.8', '6.31.6.3.8')); // 0
console.log(compareVersions('6.31.6.3.8', '6.31.7.3.8')); // 0

console.log();
console.log(compareVersions('1', '1'));            // 0
console.log(compareVersions('1.1', '1.0'));        // 1
console.log(compareVersions('2.3.4', '2.3.5'));    // -1
console.log(compareVersions('1.a', '1'));          // null
console.log(compareVersions('.1', '1'));           // null
console.log(compareVersions('1.', '2'));           // null
console.log(compareVersions('1..0', '2.0'));       // null
console.log(compareVersions('1.0', '1.0.0'));      // 0
console.log(compareVersions('1.0.0', '1.1'));      // -1
console.log(compareVersions('1.0', '1.0.5'));      // -1
