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

    // var httpRequest;
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
     }

     const data = {
       user: user,
       items: items
     };

     $.ajax({
       url:"/checkout/payment",
       type: "POST",
       data: data,
       dataType: "json",
       success: function(){},
       error: function(){}
     });
       // makeRequest("checkout/payment",user);
     });

      // function makeRequest(url, user) {
      //   httpRequest = new XMLHttpRequest();
      //
      //   if (!httpRequest) {
      //     alert('Giving up :( Cannot create an XMLHTTP instance');
      //     return false;
      //   }
      //
      //   httpRequest.onreadystatechange = alertContents;
      //   httpRequest.open('POST', url);
      //   httpRequest.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded');
      //   httpRequest.send('user=' + encodeURIComponent(user), 'items=' + encodeURIComponent(items));
      // }
      //
      // function alertContents() {
      //   if (httpRequest.readyState === XMLHttpRequest.DONE) {
      //     if (httpRequest.status === 200) {
      //       alert(httpRequest.responseText);
      //     } else {
      //       alert('There was a problem with the request.');
      //     }
      //   }
      // }














});
