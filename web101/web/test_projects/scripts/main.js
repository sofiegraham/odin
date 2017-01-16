var myImage = document.querySelector('img');

myImage.onclick = function() {
	var mySrc = myImage.getAttribute('src');
	if(mySrc === 'images/chick.jpg') {
		myImage.setAttribute ('src','images/chick2.jpg');
	} else {
		myImage.setAttribute ('src','images/chick.jpg');
	}
}

var myButton = document.querySelector('button');
var myHeading = document.querySelector('h1');

function setUserName() {
  var myName = prompt('Please enter your name.');
  localStorage.setItem('name', myName);
  myHeading.textContent = 'Do you like chickens ' + myName + '?';
}

if(!localStorage.getItem('name')) {
	setUserName();
} else {
	var storedName = localStorage.getItem('name');
	myHeading.textContent = 'Do you like chickens ' + storedName + '?';
}

myButton.onclick = function() {
	setUserName();
}