// esversion: 9
$(document).ready(function() {
  var items;
  const stored = localStorage.getItem('items');
  if (stored) {
    items = JSON.parse(stored);
  } else {
    items = [];
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
