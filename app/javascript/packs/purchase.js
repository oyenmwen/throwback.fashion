// esversion: 9
$(document).ready(function() {
  var items;
  const stored = localStorage.getItem('items');
  if (stored) {
    items = JSON.parse(stored);
  } else {
    items = [];
  }
  const user = JSON.parse(localStorage.getItem('user'));

  populateItems();

  function populateItems() {


      $("#first_name").val(user.first_name);
      $("#last_name").val(user.last_name);
      $("#email").val(user.email);
      $("#address").val(user.address);
      $("#address_two").val(user.address_two);
      $("#zip").val(user.zip);
      $("#state").val(user.state);
      $("#country").val(user.country);

      $("#items").empty();
      let subtotal = 0;
      let qty = 0;
      items.forEach(item => {
        qty += item.qty;
      });
      $('#quantity').empty();
      $('#quantity').append(`${qty}`);
      items.forEach(item => {
        const price = Number(item.price.substr(1)) * item.qty;
        subtotal += price;
        $('#items').append(`
          <li class="list-group-item d-flex justify-content-between checkout lh-condensed">
          <img src=${item.img}>
            <div class="mx-md-3">
              <h5 class="my-0">${item.title}</h5>
              <small class="text-muted">Size: ${item.size} | Quantity: ${item.qty} </small>
            </div>
            <span class="text-muted">${price.toFixed(2)}</span>
          </li>
          `);
      });
      $('#items').append(`
        <li class="list-group-item d-flex justify-content-between">
        <span>Total (USD)</span>
        <strong>$${subtotal.toFixed(2)}</strong>
      </li>`);
    }
});
