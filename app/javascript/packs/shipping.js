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

  function populateItems() {

      $("#items").empty();
      let subtotal = 0;
      let qty = 0;
      items.forEach(item => {
        qty += item.qty;
      });
      $('#quantity').append(`${qty}`);
      items.forEach(item => {
        const price = Number(item.price.substr(1)) * item.qty;
        subtotal += price;
        $('#items').append(`
          <li class="list-group-item d-flex justify-content-between lh-condensed">
            <div>
              <h6 class="my-0">${item.title}</h6>
              <small class="text-muted">Size: ${item.size} | Quantity: ${item.qty} </small>
            </div>
            <span class="text-muted">${price}</span>
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
