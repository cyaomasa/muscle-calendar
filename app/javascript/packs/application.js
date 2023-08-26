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
  if ($('.checkbox:checked').length > 0) {
      $('.training-submit').prop('disabled', false);
    } else {
      // 全てのチェックボックスが空の場合
      $('.training-submit').prop('disabled', true);
    }
  $('.checkbox').on('change', function() {
    // どれか一つでもチェックがついていれば
    if ($('.checkbox:checked').length > 0) {
      $('.training-submit').prop('disabled', false);
    } else {
      // 全てのチェックボックスが空の場合
      $('.training-submit').prop('disabled', true);
    }
  });
});
});
