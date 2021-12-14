// # Place all the behaviors and hooks related to the matching controller here.
// # All this logic will automatically be available in application.js.
// # You can use CoffeeScript in this file: http://coffeescript.org/

alert("hello")
//  $(".post-like").on("click",function(){
    alert("hello")
    var post_id =$(this).data("id");
    $.ajax({
      url: "/post/like"+post_id,
      method: "get"

    }).done(function(response){
      console.log(response);
    })

