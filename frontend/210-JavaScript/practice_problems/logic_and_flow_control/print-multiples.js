function logMultiples(num) {
  for (var i = 100; i != 0; i--) {
    if (i % num === 0 && i % 2 !== 0) {
      console.log(i);
    }
  }
}

logMultiples(17);
console.log('\n');
logMultiples(21);
