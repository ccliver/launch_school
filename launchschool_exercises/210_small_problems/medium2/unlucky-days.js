/*
  Write a function that takes a year as an argument, and returns the number of 'Friday the 13ths' in that year. You may assume that the year is greater than 1752 (when the modern Gregorian Calendar was adopted by the United Kingdom). You may also assume that the same calendar will remain in use for the foreseeable future.
*/
function fridayThe13ths(year) {
  return [0,1,2,3,4,5,6,7,8,9,10,11].filter(function (month) {
    var date = new Date(year, month, 13);

    if (date.getDay() === 5) {
      return true;
    }
  }).length;
}

console.log(fridayThe13ths(1986));      // 1
console.log(fridayThe13ths(2015));      // 3
console.log(fridayThe13ths(2017));      // 2
