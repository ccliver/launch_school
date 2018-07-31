score1 = prompt('Enter score 1: ');
score2 = prompt('Enter score 2: ');
score3 = prompt('Enter score 3: ');
average = (score1 + score2 + score3) / 3)

if (average >= 90) {
 console.log('Based on the average of your 3 scores your letter grade is "A".')
} else if (average < 90 && average >= 70) {
 console.log('Based on the average of your 3 scores your letter grade is "B".')
} else if (average < 70 && average >= 50) {
 console.log('Based on the average of your 3 scores your letter grade is "C".')
} else {
 console.log('Based on the average of your 3 scores your letter grade is "F".')
}
