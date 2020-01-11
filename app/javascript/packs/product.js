$(document).ready(function() {
  var items;
  const stored = localStorage.getItem('items');
  if (stored) {
    items = JSON.parse(stored);
  } else {
    items = [];
  }
  // populateItems();
  function addItems() {
    let found = false;

    if (items.length > 0) {
      items.forEach(e => {
        if (e.title.trim() == $('#product-title').text().trim() && e.size.trim() == $('#size').val().trim()) {
          e.qty += 1;
          found = true;
        }
      });
    }
    if (!found) {
      items.push({
        title: $('#product-title').text(),
        price: $('#product-price').text(),
        size: $('#size').val(),
        qty: 1
      });
    }
    localStorage.setItem('items', JSON.stringify(items));
  }


  // function populateItems() {
  //   if (items.length === 0) {
  //     $('#empty-info').show();
  //   } else {
  //     $('#empty-info').hide();
  //     $("#items").empty();
  //     items.forEach(item => {
  //       $('#items').append("<p class='text-dark stuff'><span class='text-primary'>" + item.qty + "</span>" + " " + item.title + " " + item.size + "</p>");
  //     });
  //   }
  // }

  $('#add-item').on("click", () => {
    addItems();
    // populateItems();
  });









  // populateItems();
  // $('#add-item').on("click", () => {
  //   addItems();
  //   populateItems();
  // });
  //
  // $('#cart').on("click", () => {
  //   togglePages();
  // });
  //
  //
  // $('#clear').on("click", () => {
  //   items = [];
  //   $("#items").empty();
  //   populateItems();
  //   localStorage.setItem('items', JSON.stringify("[]"));
  // });
  //
  // function addItems() {
  //   items.push({
  //     item: $('#item').val(),
  //     qty: $('#qty').val()
  //   });
  //   localStorage.setItem('items', JSON.stringify(items));
  // }
  //
  // function populateItems() {
  //   if (items.length === 0) {
  //     $('#empty-info').show();
  //     $('#info').hide();
  //   } else {
  //     $('#empty-info').hide();
  //     $('#info').show();
  //     $("#items").empty();
  //     items.forEach(item => {
  //       $('#items').append("<p class='text-dark stuff'><span class='text-primary'>" + item.qty + "</span>" + " " + item.item + "</p>");
  //     });
  // }
  // }


});
