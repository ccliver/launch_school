/*
You have a bank of switches before you, numbered from 1 to n. Every switch is connected to exactly one light that is initially off. You walk down the row of switches and toggle every one of them. You walk back to the beginning of the row and start another pass. On this second pass, you toggle switches 2, 4, 6, and so on. On the third pass, you go back to the beginning again, this time toggling switches 3, 6, 9, and so on. You continue to repeat this process until you have gone through n repetitions.

Write a program that takes one argument—the total number of switches—and returns an array of the lights that are on after n repetitions.
*/

/*
input: total number of switches, 1..n
output: array containing the number of each switch in the on position

- create array of n switches initially on, set to false
- create a flag variable, turnOff and set it to true

- set all switches to on, true, now the start switch is switch 2 (index 1)

- starting at the switch 2 iterate through all switches recording current switch in variable startSwitch
  - starting at variable startSwitch iterate through i -> n
    - if i is a multiple of startSwitch flip it
  - increment startSwitch by one to move to the next starting switch

- iterate through the array of switches using forEach and include the index variable
  - if the element is true
    - push index + 1 onto the array of on switches

- return on switches array

*/

function lightsOn(switches) {
  var allSwitches = Array(switches);
  var onSwitches = [];

  for (let i = 0; i < allSwitches.length; i++) {
    allSwitches[i] = true;
  }

  for (let startSwitch = 1; startSwitch < allSwitches.length; startSwitch++) {
    for (let i = startSwitch; i < allSwitches.length; i++) {
      if ((i + 1) % startSwitch === 0) {
        allSwitches[i] = !allSwitches[i];
      }
    }
  }

  allSwitches.forEach(function (currSwitch, index) {
    if (currSwitch === true) {
      onSwitches.push(index + 1);
    }
  });

  return onSwitches;
}

console.log(lightsOn(5));        // [1, 4]
// Detailed result of each round for `5` lights
// Round 1: all lights are on
// Round 2: lights 2 and 4 are now off;     1, 3, and 5 are on
// Round 3: lights 2, 3, and 4 are now off; 1 and 5 are on
// Round 4: lights 2 and 3 are now off;     1, 4, and 5 are on
// Round 5: lights 2, 3, and 5 are now off; 1 and 4 are on

console.log(lightsOn(100));      // [1, 4, 9, 16, 25, 36, 49, 64, 81, 100]
