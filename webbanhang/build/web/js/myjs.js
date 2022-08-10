
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
    