// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

require("@rails/ujs").start()
require("turbolinks").start()
//require("@rails/activestorage").start()
require("channels")

// BOOTSTRAP
//require("bootstrap")
import bootstrap from "bootstrap"

document.addEventListener("turbolinks:load", () => {
  $('[data-toggle="tooltip"]').tooltip()
  $('[data-toggle="popover"]').popover()
})

// FLATPICKR - js is here; CSS is in the layouts/application file
import flatpickr from "flatpickr"

// Each flatpickr usage is customized using a CSS ID linked to this js
document.addEventListener("turbolinks:load", () => {
  /* User: new/edit form */
  flatpickr("#party-date", {
    altInput: true,
    altFormat: "D M j, Y",
    dateFormat: "Y-m-d",
  });

  /* User: new/edit form */
  flatpickr("#party-time", {
    altInput: true,
    altFormat: "h:i K",
    dateFormat: "H:i",
    enableTime: true,
    noCalendar: true,
    defaultHour: 9,
    defaultMinute: 0
  });

  /* User: new/edit form */
  flatpickr("#check-date", {
    altInput: true,
    altFormat: "D M j, Y",
    dateFormat: "Y-m-d",
  });

})

require("custom/hello2")

// TESTING!

// Flatpickr CSS is in app/assets/stylesheets/application.css
//require("flatpickr/dist/flatpickr.css")

// CHART.JS
//require("chart.js")

//import Chart from "chart.js";
//import Chart from "chart.js"


// Uncomment to copy all static images under ../images to the output folder and reference
// them with the image_pack_tag helper in views (e.g <%= image_pack_tag 'rails.png' %>)
// or the `imagePath` JavaScript helper below.
//
// const images = require.context('../images', true)
// const imagePath = (name) => images(name, true)
