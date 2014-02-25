$ ->
  $("nav").on "click", "a", (e) -> 
    $(this).parent("li").addClass("active").siblings().removeClass "active"
    # e.preventDefault()