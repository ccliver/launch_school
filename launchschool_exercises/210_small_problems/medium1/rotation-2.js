/*
  Write a function that rotates the last n digits of a number. For the rotation, rotate by one digit to the left, moving the first digit to the end.
*/

function rotateArray(arr) {
  if (! Array.isArray(arr)) {
    return undefined;
  }

  return arr.length === 0 ? [] : arr.slice(1).concat(arr[0]);
}

function rotateRightmostDigits(num, digits) {
  var firstPart = num.toString().slice(0, num.toString().length - digits);
  var secondPart = num.toString().slice(num.toString().length - digits);

  return parseInt(firstPart + rotateArray(secondPart.split('')).join(''));
}

console.log(rotateRightmostDigits(735291, 1));      // 735291
console.log(rotateRightmostDigits(735291, 2));      // 735219
console.log(rotateRightmostDigits(735291, 3));      // 735912
console.log(rotateRightmostDigits(735291, 4));      // 732915
console.log(rotateRightmostDigits(735291, 5));      // 752913

console.log(rotateRightmostDigits(735291, 6));      // 352917
