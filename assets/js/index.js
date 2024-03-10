 var myIndex = 0;

 carousel();

 function carousel() {
   var i;
   var x = document.getElementsByClassName("mySlides");
   var dots = document.getElementsByClassName("dot");
   for (i = 0; i < x.length; i++) {
     x[i].style.display = "none";
   }
   myIndex++;
   if (myIndex > x.length) {
     myIndex = 1
   }
   x[myIndex - 1].style.display = "block";

   for (i = 0; i < x.length; i++) {
     dots[i].className = dots[i].className.replace(" act", "");
   }
   dots[myIndex - 1].className += " act";
   setTimeout(carousel, 4000); // Change image every 2 seconds
 }


 showSlides(myIndex);

 // Next/previous controls
 function plusSlides(n) {
   showSlides(myIndex += n);
 }

 // Thumbnail image controls
 function currentSlide(n) {
   showSlides(myIndex = n);
 }

 function showSlides(n) {
   var i;
   var slides = document.getElementsByClassName("mySlides");
   var dots = document.getElementsByClassName("dot");
   if (n > slides.length) {
     myIndex = 1
   }
   if (n < 1) {
     myIndex = slides.length
   }
   for (i = 0; i < slides.length; i++) {
     slides[i].style.display = "none";
   }
   for (i = 0; i < dots.length; i++) {
     dots[i].className = dots[i].className.replace(" act", "");
   }
   slides[myIndex - 1].style.display = "block";
   dots[myIndex - 1].className += " act";
 }


 priceformat();

 function priceformat() {
   var p = document.getElementsByClassName("pricef");
   for (var i = 0; i < p.length; i++) {
     p[i].innerText = pricef(p[i].innerText);
   }
   document.getElementsByClassName("price").innerText = p;
 }

 function pricef(price) {
   var p = price.toString();
   if (p.length < 3) {
     return p;
   } else {
     return pricef(p.substr(0, p.length - 3)) + "," + p.substr(p.length - 3);
   }
 }

 fire();

 function fire() {
   var top = document.getElementsByClassName("arr");

   for (var j = 0; j < top.length; j++) {
     if (top[j].getAttribute("src") == "images/top1.png") {
       top[j].setAttribute("src", "images/top2.png");
     } else {
       top[j].setAttribute("src", "images/top1.png");
     }
   }
   setTimeout(fire, 200);
 }


 $(function () {
   $(".goods_sofa").hover(function () {
     var id = $(this).attr("id").substr(5);
     $("#good" + id).attr("src", "images/star0" + id + ".png");
     $("#good" + id).width("70px");
     $("#good" + id).height("70px");
   }, function () {
     var id = $(this).attr("id").substr(5);
     $("#good" + id).attr("src", "images/good0" + id + ".png");
     $("#good" + id).width("70px");
     $("#good" + id).height("70px");
   });
 })


 //熱門商品
 filterSelection("all") // Execute the function and show all columns
 function filterSelection(c) {
   var x, i;
   x = document.getElementsByClassName("column");
   if (c == "all") c = "";
   for (i = 0; i < x.length; i++) {
     w3RemoveClass(x[i], "show");
     if (x[i].className.indexOf(c) > -1) w3AddClass(x[i],
       "show");
   }
 }
 // Show filtered elements
 function w3AddClass(element, name) {
   var i, arr1, arr2;
   arr1 = element.className.split(" ");
   arr2 = name.split(" ");
   for (i = 0; i < arr2.length; i++) {
     if (arr1.indexOf(arr2[i]) == -1) {
       element.className += " " + arr2[i];
     }
   }
 } //Hide elements that are not selected
 function w3RemoveClass(element, name) {
   var i, arr1, arr2;
   arr1 = element.className.split(" ");
   arr2 = name.split(" ");
   for (i = 0; i < arr2.length; i++) {
     while (arr1.indexOf(arr2[i]) > -1) {
       arr1.splice(arr1.indexOf(arr2[i]), 1);
     }
   }
   element.className = arr1.join(" ");
 }

 // Add active class to the current button (highlight it)
 var btnContainer = document.getElementById(" myBtnContainer");
 var btns = btnContainer.getElementsByClassName("btn");
 for (var i = 0; i < btns.length; i++) {
   btns[i].addEventListener("click", function () {
     var
       current = document.getElementsByClassName("actClick");
     current[0].className = current[0].className.replace(" actClick", "");
     this.className += " actClick";
   });
 }