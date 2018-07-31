var studentScores = {
  student1: {
    id: 123456789,
    scores: {
      exams: [90, 95, 100, 80],
      exercises: [20, 15, 10, 19, 15],
    },
  },
  student2: {
    id: 123456799,
    scores: {
      exams: [50, 70, 90, 100],
      exercises: [0, 15, 20, 15, 15],
    },
  },
  student3: {
    id: 123457789,
    scores: {
      exams: [88, 87, 88, 89],
      exercises: [10, 20, 10, 19, 18],
    },
  },
  student4: {
    id: 112233445,
    scores: {
      exams: [100, 100, 100, 100],
      exercises: [10, 15, 10, 10, 15],
    },
  },
  student5: {
    id: 112233446,
    scores: {
      exams: [50, 80, 60, 90],
      exercises: [10, 0, 10, 10, 0],
    },
  },
};


function generateClassRecordSummary(scores) {
  var summary = {
    studentGrades: [],
    exams: []
  };

  Object.keys(scores).forEach(function (student) {
    var examAvg = getExamAverage(scores[student].scores.exams);
    var exerciseScore = getExerciseScore(scores[student].scores);
    var weightedGrade = Math.round((examAvg * 0.65) + (exerciseScore * 0.35));
    var examStats = {};

    examStats.average = scores[student].scores.exams.reduce(
      function (accumulator, nextScore) {
        return accumulator += nextScore;
    }) / 4;

    summary.studentGrades.push(weightedGrade + 
      " (" + getLetterGrade(weightedGrade) + ")");
  });

  summary.exams = getExamSummary(Object.keys(scores).map(function (student) {
    return scores[student].scores.exams;
  }));

  return summary;
}

function getExamAverage(examScores) {
  return Math.round(examScores.reduce(function (accumulator, grade) {
    return accumulator += grade;
  }) / 4);
}

function getExerciseScore(scores) {
  return scores.exercises.reduce(function (accumulator, nextScore) {
    return accumulator += nextScore;
  });
}

function getLetterGrade(grade) {
  if (grade >= 93) {
    return "A";
  } else if (grade >= 85 && grade <= 92) {
    return "B";
  } else if (grade >= 77 && grade <= 84) {
    return "C";
  } else if (grade >= 69 && grade <= 76) {
    return "D";
  } else if (grade >= 60 && grade <= 68) {
    return "E";
  } else if (grade < 60) {
    return "F";
  }
}

function getExamSummary(scores) {
  var examSummary = [];

  for (let i = 0; i < scores[0].length; i++) {
    examSummary.push({
      average: getAverageOfAllExams(scores, i),
      minimum: getMinimumOfAllExams(scores, i),
      maximum: getMaximumOfAllExams(scores, i),
    });
  }

  return examSummary;
}

function getAverageOfAllExams(scores, examNumber) {
  return scores.map(x => x[examNumber]).reduce(
    (accumulator, currentValue) => accumulator + currentValue
  ) / 5;
}

function getMinimumOfAllExams(scores, examNumber) {
  return scores.map(x => x[examNumber]).reduce(
    (min, currentValue) => currentValue < min ? currentValue : min
  );
}

function getMaximumOfAllExams(scores, examNumber) {
  return scores.map(x => x[examNumber]).reduce(
    (min, currentValue) => currentValue > min ? currentValue : min
  );
}


console.log(generateClassRecordSummary(studentScores));

// expected output:
/*{
  studentGrades: [ "87 (B)", "73 (D)", "84 (C)", "86 (B)", "56 (F)" ],
  exams: [
    { average: 75.6, minimum: 50, maximum: 100 },
    { average: 86.4, minimum: 70, maximum: 100 },
    { average: 87.6, minimum: 60, maximum: 100 },
    { average: 91.8, minimum: 80, maximum: 100 },
  ],
}*/
