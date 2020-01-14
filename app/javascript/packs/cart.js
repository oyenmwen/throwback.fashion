// esversion: 9
$(document).ready(function() {
  var items;
  const stored = localStorage.getItem('items');
  if (stored) {
    items = JSON.parse(stored);
  } else {
    items = [];
  }
  populateItems();

  $('.qty').change(function() {
    let zeroes = false;
    const size = $(this).closest(".row").find(".size").text();
    const title = $(this).closest(".row").find(".title").text();
    if ($(this).val() == '0') {
      $(this).closest('.row').empty();
      zeroes = true;
    }
    items.forEach(e => {
      if (e.title.trim() == title.trim() && e.size.trim() == size.trim()) {
        e.qty = Number($(this).val());
      }
      console.log($(this).val());
    });
    if (zeroes) {
      deleteItems();
    }
    localStorage.setItem('items', JSON.stringify(items));
    location.reload();

  });

  function deleteItems() {
    let temp = [];
    items.forEach(e => {
      if (e.qty != 0) {
        temp.push(e);
      }
    });
    items = temp;
  }

  function populateItems() {
    if (items.length === 0) {
      $('#empty-info').show();
      $('#sub-info').hide();

    } else {
      $('#empty-info').hide();
      $("#items").empty();
      $("#sub-info").show();
      let subtotal = 0;
      items.forEach(item => {
        const price = Number(item.price.substr(1)) * item.qty;
        subtotal += price;
        let options = "";
        for (i = 0; i < 11; i++) {
          if (i == item.qty) {
            options += `<option selected="selected" value="${i}">${i}</option>`;
          } else {
            options += `<option value="${i}">${i}</option>`;
          }
        }
        $('#items').append(`
          <hr>
          <div class="row text-center">
          <div class="col col-md-2 col-12">
          <img src="/assets/${item.title}.png"/>
          </div>
          <div class="col col-md-2 mt-md-5 col-12 title">
          ${item.title}
          </div>
          <div class="col col-md-1 mt-md-5 col-12 size">
          ${item.size}
          </div>
          <div class="col col-md-1 ml-2 mt-md-5 col-12">
          <select class="qty" name="qty">
          ${options}
          </select>
          </div>
          <div class="col col-md-1 mt-md-5 price col-12">
          $${price.toFixed(2)}
          </div>
          </div>
          `);
      });
      $('#items').append(`<hr>`);
      $('.subtotal, #subtotal').empty();
      $('#subtotal , .subtotal').append(`$${subtotal.toFixed(2)}`);

    }
  }
});
