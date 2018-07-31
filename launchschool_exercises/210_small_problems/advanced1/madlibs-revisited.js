/*
  Let's build another program using madlibs. We made a similar program in the Easy exercises, but this time the requirements are a bit different.

  Build a madlibs program that takes a text template as input, plugs in a selection of randomized nouns, verbs, adjectives, and adverbs into that text, and then returns it. You can build your lists of nouns, verbs, adjectives, and adverbs directly into your program. Your program should read this text and, for each line, place random words of the appropriate types into the text and return the result.

  The challenge of this program isn't just about writing your solution—it's about choosing the structure of the text template. Choose the right way to structure your template and this problem becomes much easier. Consequently, this exercise is a bit more open-ended since the input is also something that you'll be defining.

  Examples:

  Note: The quotes in the example strings returned by the madlibs function are only shown for emphasis. These quotes are not present in the actual output strings. The words in quotes come from the list of texts and it is the madlibs function that puts them in.
*/

function madlibs(template) {
  const ADJECTIVES = ['quick', 'lazy', 'sleepy', 'noisy', 'hungry'];
  const NOUNS = ['fox', 'dog', 'head', 'leg', 'tail'];
  const VERBS = ['jumps', 'lifts', 'bites', 'licks', 'pats'];
  const ADVERBS = ['easily', 'lazily', 'noisily', 'excitedly'];


  return template.split(/\b/).map(function (word) {
    if (word === 'ADJECTIVE') {
      return ADJECTIVES[Math.floor(Math.random() * ADJECTIVES.length)];
    }

    if (word === 'NOUN') {
      return NOUNS[Math.floor(Math.random() * NOUNS.length)];
    }

    if (word === 'VERB') {
      return VERBS[Math.floor(Math.random() * VERBS.length)];
    }

    if (word === 'ADVERB') {
      return ADVERBS[Math.floor(Math.random() * ADVERBS.length)];
    }

    return word;
  }).join('');
}

var template1 = 'The ADJECTIVE brown NOUN ADVERB VERB the ADJECTIVE yellow NOUN, who ADVERB VERB his NOUN and looks around.'
console.log(madlibs(template1));
