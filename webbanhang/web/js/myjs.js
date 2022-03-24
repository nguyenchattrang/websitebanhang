feather.replace();

function a() {
    var inputLeft = document.getElementById("input-left");

    var a = document.getElementById("min");

    a.innerHTML = inputLeft.value;

}
function b() {
    var inputRight = document.getElementById("input-right");
    var b = document.getElementById("max");
    b.innerHTML = inputRight.value;
}
function changePic(imgs) {
    // Get the expanded image
    var expandImg = document.getElementById("expandedImg");
    // Get the image text
    // Use the same src in the expanded image as the image being clicked on from the grid
    expandImg.src = imgs.src;
    // Use the value of the alt attribute of the clickable image as text inside the expanded image
    // Show the container element (hidden with CSS)
}

const ratingStars = [...document.getElementsByClassName("rating__star")];
const ratingResult = document.querySelector(".rating__result");

printRatingResult(ratingResult);

function executeRating(stars, result) {
    const starClassActive = "rating__star fas fa-star";
    const starClassUnactive = "rating__star far fa-star";
    const starsLength = stars.length;
    let i;
    stars.map((star) => {
        star.onclick = () => {
            i = stars.indexOf(star);

            if (star.className.indexOf(starClassUnactive) !== -1) {
                printRatingResult(result, i + 1);
                for (i; i >= 0; --i)
                    stars[i].className = starClassActive;
            } else {
                printRatingResult(result, i);
                for (i; i < starsLength; ++i)
                    stars[i].className = starClassUnactive;
            }
        };
    });
}

function printRatingResult(result, num = 0) {
    result.textContent = `${num}/5`;
}

executeRating(ratingStars, ratingResult);

// var a = document.getElementById("subcategory").getElementsByTagName('div');
//        function Filter(){
//           
//             var a = document.getElementsByClassName("subcategory");
//            var b="";
//            for(let i=0;i<a.length;i++)
//            {
//                          if(a[i].checked==true)
//                {
//                   if(b==="") b += 'subcategory_id='+(i+1);
//                   else
//                  b += ' or subcategory_id='+(i+1);
//                }
//            }
//            console.log(b);
//
//
//$.ajax({
//    url: "Filter",
//    type: 'POST',
//    data:{ amount:b},
//    async: true,
//    success: function(response) {
//var row = document.getElementById("content");
//row.innerHTML+=content;
//    }
//});
//            }


function pager(x, y, z, v,t) {
    var c=window.location.href;
    var a = document.getElementById(x);
    if(t==""){
    if (y > 1)
        a.innerHTML += '<a href="order?page=1">First</a>   ';

    
      for(var i=v;i>=1;i--)
    {
        if(y-i>1)
    a.innerHTML += '<a href="?page='+(y-i)+'">'+(y-i)+'</a>   ';
  }  
        a.innerHTML+=(y)+'   ';
    for(var i=1;i<=v;i++)
    {
        if(i+y<z)
    a.innerHTML += '<a href="?page='+(y+i)+'">'+(y+i)+'</a>   ';
  }
  
    if (y < z)
        a.innerHTML += '<a href="?page=' + z + '">Last</a>   ';
}
    if(t!=""){
    if (y > 1)
        a.innerHTML += '<a href="order'+t+'&page=1">First</a>   ';

    
      for(var i=v;i>=1;i--)
    {
        if(y-i>1)
    a.innerHTML += '<a href="'+t+'&page='+(y-i)+'">'+(y-i)+'</a>   ';
  }  
        a.innerHTML+=(y)+'   ';
    for(var i=1;i<=v;i++)
    {
        if(i+y<z)
    a.innerHTML += '<a href="'+t+'&page='+(y+i)+'">'+(y+i)+'</a>   ';
  }
  
    if (y < z)
        a.innerHTML += '<a href="'+t+'&page=' + z + '">Last</a>   ';
}
console.log(Z);
    console.log(t);
    console.log(window.location.href);
    console.log(window.location.pathname);
    console.log(window.location.hash);
}
    