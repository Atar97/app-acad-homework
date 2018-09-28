const madLib = function(verb, adj, noun) {
  return `We shall ${verb.toUpperCase()} the ${adj.toUpperCase()} ${noun.toUpperCase()}`;
}

// console.log(madLib('make', 'best', 'guac'))

const isSubstring = function(string, sub) {
  for(i = 0; i < string.length; i++) {
    if (string.substring(i, i + sub.length) === sub) {
      return true;
    }
  }
  return false
}

const fizzBuzz = function(array) {
  for(i = 0; i < array.length; i++) {

  }
}

function secret() {
  let thing = 'stuff'
  if (true) {
    let thing
    console.log(thing)
    thing = 'guy'
  }
  console.log(thing)
}

secret()
