// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

import Rails from "@rails/ujs"
import Turbolinks from "turbolinks"
import * as ActiveStorage from "@rails/activestorage"
import "channels"

Rails.start()
Turbolinks.start()
ActiveStorage.start()

//= require jquery
//= require jquery_ujs
//= require activestorage
//= require turbolinks
//= require jquery.jpostal
//= require_tree .
/*global $*/

$(function() {
  $(document).on('turbolinks:load', () => {
    $('#customer_postal_code').jpostal({
      postcode : [
        '#customer_postal_code'
      ],
      address: {
        "#customer_prefecture_code": "%3", // # 都道府県が入力される
        "#customer_address_city"   : "%4", // # 市区町村が入力される
        "#customer_address_street" : "%5%6%7" // # 町域と大口事務所の番地と名称が入力される
      }
    });
  });
});

$(function() {
  $(document).on('turbolinks:load', () => {
    $('#property_postal_code').jpostal({
      postcode : [
        '#property_postal_code'
      ],
      address: {
        "#property_prefecture_code": "%3", // # 都道府県が入力される
        "#property_address_city"   : "%4", // # 市区町村が入力される
        "#property_address_town"   : "%5", // # 町域が入力される
        "#property_address_street" : "%6%7" // # 大口事務所の番地と名称が入力される
      }
    });
  });
});


$(function() {
  $('.slider').slick({
    autoplay:true,
    autoplaySpeed:5000,
    dots: true,
  });

  $('.slick-dots li').on('mouseover', function() {
    $('.slider').slick('goTo', $(this).index());
  });
});