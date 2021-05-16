
// console.log("Hello from hello2.js");

// add hello() to the webpack-test button
var button1 = document.getElementById("webpack-test2");
if(button1 != null) {
  button1.addEventListener("click", () => hello2("Matty O"));
}
else {
  console.log("Didn't find hello2 ID!");
}

// say hello to someone
export function hello2(name) {
  alert("ZZZ - Hello2 " + name + "!");
}
