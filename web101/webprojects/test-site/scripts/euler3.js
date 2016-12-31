var question = 65413195;
var primeNumbers = [];

for(i = (question-1); i > 1; i--) {
  if(question % i === 0){
    primeNumbers.unshift(i);
  }
}

var num1 = 0;

for(i = 0; i < primeNumbers.length; i++) {
  if(question % primeNumbers[num1] === 0){
    question = question/primeNumbers[num1];
    if(question === 1) {
      console.log(primeNumbers[num1]);
    }
  }
  else {
    num1++;
  }
}
