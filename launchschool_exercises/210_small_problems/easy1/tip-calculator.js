var bill = parseFloat(prompt('What is the bill? '));
var tip = parseFloat(prompt('What is the tip percentage? '));

console.log('The tip is $' + (bill * (tip * 0.01)));
console.log('The total is $' + (bill + (bill * (tip * 0.01))));
