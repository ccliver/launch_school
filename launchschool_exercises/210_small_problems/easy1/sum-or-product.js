var x = parseInt(prompt('Please enter an integer greater than 0: '));
var op = prompt('Enter "s" to compute the sum, or "p" to compute the product. ');

var total = 1;
for (var i = 2; i <= x; i++) {
  if (op === 's') {
    total += i;
  } else {
    total *= i;
  }
} 

if (op === 's') {
  console.log('The sum of the integers between 1 and ' + x + 'is ' + total + '.');
} else {
    console.log('The product of the integers between 1 and ' + x + 'is ' + total + '.');
}
