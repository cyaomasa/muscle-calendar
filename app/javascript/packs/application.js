// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

import Rails from "@rails/ujs"
import Turbolinks from "turbolinks"
import * as ActiveStorage from "@rails/activestorage"
import "channels"

import "jquery";
import "popper.js";
import "bootstrap";
import "../stylesheets/application";
import "../stylesheets/simple_calendar";

Rails.start()
Turbolinks.start()
ActiveStorage.start()

//スライド表示
/*global $*/
$(document).on('turbolinks:load', function() {
$(function() {
  $('.slider').slick({
    prevArrow: '<i class="fas fa-arrow-alt-circle-left"></i>',
    nextArrow: '<i class="fas fa-arrow-alt-circle-right"></i>',
    dots:true
  })
});
});
