document.addEventListener("turbolinks:load", () => {

console.log("Hello from hello2.js");

// add hello() to the webpack-test button
var button1 = document.getElementById("webpack-test2");
if(button1 != null) {
  button1.addEventListener("click", () => hello2("Matty O"));
}

// say hello to someone
function hello2(name) {
  alert("Hello2 " + name + "!");
}

})
