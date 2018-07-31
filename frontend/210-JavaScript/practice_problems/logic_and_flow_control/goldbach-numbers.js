function isPrime(num) {
  if (num < 2) {
    return false;
  }

  for (var i = 2; i < num; i++) {
    if (num % i === 0) {
      return false;
    }
  }

  return true;
}

function checkGoldbach(num) {
  if (num % 2 === 1 || num < 4) {
    console.log('null');
    return;
  }

  var i;
  var j;
  for (i = 2; i < (num / 2); i += 1) {
    j = num - i;
    if (isPrime(i) && isPrime(j)) {
      console.log(i + ' ' + j);
    }
  }
}

checkGoldbach(3);
checkGoldbach(4);
checkGoldbach(12);
checkGoldbach(100);
