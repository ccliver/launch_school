function triangle(size) {
  var output = '';

  for (var i = 1; i <= size; i++) {
    for (var j = 0; j < size - i; j++) {
      output += ' ';
    }

    for (j = size - i; j < size; j++) {
      output += '*';
    }
    
    console.log(output);
    output = '';
  }
}

triangle(5);
triangle(9);
