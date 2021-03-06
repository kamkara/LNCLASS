// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

require("@rails/ujs").start()
require("turbolinks").start()
require("@rails/activestorage").start()
require("channels")
    // application.js
require("trix")
require("@rails/actiontext")

// import font-awesome
import "@fortawesome/fontawesome-free/js/all";
// requires section
//= require jquery

// Uncomment to copy all static images under ../images to the output folder and reference
// them with the image_pack_tag helper in views (e.g <%= image_pack_tag 'rails.png' %>)
// or the `imagePath` JavaScript helper below.
//


import "../css/application.css"
const images = require.context('../images', true)
const imagePath = (name) => images(name, true)


document.addEventListener('turbolinks:load', () => {
    // google analytics load

    //rich text editor
    document.addEventListener('click', () => {
        let element = event.target.closest('.text-content')
        if (!element) return;

        element.classList.add('d-none')
        element.nextElementSibling.classList.remove('d-none')
    })

    document.addEventListener('click', () => {
        if (!event.target.matches('.cancel')) return;

        event.preventDefault();

        let element = event.target.closest('.form-content')

        element.classList.add('d-none')
        element.previousElementSibling.classList.remove('d-none')
    })
})