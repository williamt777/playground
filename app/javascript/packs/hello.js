
// add hello() to the webpack-test button
var button1 = document.getElementById("webpack-test");
if(button1 != null) {
  button1.addEventListener("click", () => hello("Baby Mira!"));
}

// say hello to someone
export function hello(name) {
  console.log('testing');
  alert("Hello " + name + "!");
}

/*
var button2 = document.getElementById("webpack-test2");
if(button2 != null) {
  button2.addEventListener("click", () => hello2("Matty O"));
}

// say hello to someone
export function hello2(name) {
  console.log('testing');
  alert("Hello " + name + "!");
}
*/
