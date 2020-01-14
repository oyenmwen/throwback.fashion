$(document).ready(function() {
  var items;
  const stored = localStorage.getItem('items');
  if (stored) {
    items = JSON.parse(stored);
  } else {
    items = [];
  }
  function addItems() {
    let found = false;

    if (items.length > 0) {
      items.forEach(e => {
        if (e.title.trim() == $('#product-title').text().trim() && e.size.trim() == $('#size').val().trim()) {
          if(e.qty<11){
          e.qty += 1;
          found = true;
        }
        }
      });
    }
    if (!found) {
      items.push({
        title: $('#product-title').text(),
        img:$("#product-image").attr('src'),
        price: $('#product-price').text(),
        size: $('#size').val(),
        qty: 1
      });
    }
    localStorage.setItem('items', JSON.stringify(items));
  }

  $('#add-item').on("click", () => {
    addItems();
  });

  // $('#clear').on("click", () => {
  //   items = [];
  //   $("#items").empty();
  //   populateItems();
  //   localStorage.setItem('items', JSON.stringify("[]"));
  // });
  //
});
