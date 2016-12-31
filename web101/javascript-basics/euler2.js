var fibonacci = [1,2];
var num1 = 1;
var num2 = 2;
var fib = 0;

while(fib < 4000000) {
  fib = num1 + num2;
  num1 = num2;
  num2 = fib;
  fibonacci.push(fib);
}

var answer = 0;

for(i = 0; fibonacci[i] < 4000000; i++) {
  if(fibonacci[i] % 2 === 0) {
    answer += fibonacci[i];
  }
}

console.log(answer);