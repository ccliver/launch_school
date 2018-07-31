var password = 'password';

for (var i = 0; i < 3; i++) {
  guess = prompt('Enter the password: ');

  if (guess === password) {
    console.log('You have successfully logged in.');
    break;
  }
}

console.log('You have been denied access.');
