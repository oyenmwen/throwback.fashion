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
      $('#quantity').empty();
      $('#quantity').append(`${qty}`);
      items.forEach(item => {
        const price = Number(item.price.substr(1)) * item.qty;
        subtotal += price;
        $('#items').append(`
          <li class="list-group-item d-flex justify-content-between checkout lh-condensed">
          <img  src=${item.img}>
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
    $("#submit").click(()=>{
      const user = {
       first_name : $("#first_name").val(),
       last_name : $("#last_name").val(),
       email : $("#email").val(),
       address : $("#address").val(),
       address_two : $("#address_two").val(),
       zip : $("#zip").val(),
       state : $("#state").val(),
       country : $("#country").val()
     };

     localStorage.setItem('user', JSON.stringify(user));

     const data = {
       user: user,
       items: items
     };
     $.ajax({
       url:"/save",
       type: "POST",
       data: data,
       dataType: "data",
       success: ()=>{
         window.location.replace("/checkout/purchase");
          },
       error: ()=>{console.log("fail");}
     });
});

});
