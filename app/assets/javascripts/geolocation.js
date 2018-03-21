$(document).ready(function(){
    console.log("rest")
    navigator.geolocation.getCurrentPosition(
        function(position){
            var latitude  = position.coords.latitude;
            var longitude = position.coords.longitude;
            console.log("Latitude : "+latitude+" Longitude : "+longitude);
            var csrf = $("#yelp-data").data("csrf");
            $.ajax({
              method: "POST",
              url: "/",
              data: { lat: latitude, long: longitude, authenticity_token: csrf },
              dataType: "json",
              success: function(response, status){
                console.log(response["businesses"].length);
                var five = response["businesses"].slice(0,3);
                console.log(five.length);
                five.forEach(function(item){
                  business = "<div class='item'>";
                  business += "<a href="+ item.url+ "><h4>" + item.name + "</h4></a>";
                  business += "<span>" +  item.rating + "</span>";
                  business += "<img src=" + item.image_url + " alt='" + item.name + "'>";
                  business += "<address><p>" + item.location.address1 + "</p>";
                  business += "<p>" + item.location.address3 + "</p>";
                  business += "<p>" + item.location.city + "</p>";
                  business += "<p>" + item.location.zip_code + "</p></address>";
                  $("#yelp-data").append(business);
                });
              }
            })
        },
        function(){
            alert("Geo Location not supported");
        }
    );
})
