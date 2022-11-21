//= require jquery3
//= require popper
//= require bootstrap

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
  $(document).on('turbolinks:load', () => {
    $('#form_land_percel_collection_property_postal_code').jpostal({
      postcode : [
        '#form_land_percel_collection_property_postal_code'
      ],
      address: {
        "#form_land_percel_collection_property_prefecture_code": "%3", // # 都道府県が入力される
        "#form_land_percel_collection_property_address_city"   : "%4", // # 市区町村が入力される
        "#form_land_percel_collection_property_address_town"   : "%5", // # 町域が入力される
        "#form_land_percel_collection_property_address_street" : "%6%7" // # 大口事務所の番地と名称が入力される
      }
    });
  });
});



$(function() {
  $('.slider').slick({
    autoplay:true,
    autoplaySpeed:4000,
    dots: true,
  });

  $('.slick-dots li').on('mouseover', function() {
    $('.slider').slick('goTo', $(this).index());
  });
});