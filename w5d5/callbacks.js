function thing(){
  console.log('Hello World')
}

// window.setTimeout(() => alert("HAMMERTIME"), 5000)


function hammerTime(time) {
  setTimeout(() => alert(`${time} is HAMMERTIME`), time)
}

const readline = require('readline');

const reader = readline.createInterface({
  input: process.stdin,
  output: process.stdout
});

function teaAndBiscuits () {
  let tea, biscuits;
  reader.question('Would you like some tea?', (response) => {
    tea = response;
    console.log(`You replied ${tea}`);
    reader.question('Would you like some biscuits?', (response) => {
      biscuits = response;
      console.log(`You replied ${biscuits}`);
    });
  });

  const firstRes = (tea === 'yes') ? 'do' : 'don\'t';
  const secondRes = (biscuits === 'yes') ? 'do' : 'don\'t';
  console.log(`So you ${firstRes} want tea and you ${secondRes} want biscuits.`);
  reader.close();
}
