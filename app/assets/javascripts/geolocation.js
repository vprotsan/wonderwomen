$(document).ready(function(){
    console.log("rest")
    navigator.geolocation.getCurrentPosition(
        function(position){
            var latitude  = position.coords.latitude;
            var longitude = position.coords.longitude;
            console.log("Latitude : "+latitude+" Longitude : "+longitude);

            $.ajax({
              method: "POST",
              url: "/products",
              data: { lat: latitude, long: longitude },
              dataType: "json",
              success: function(response, status){
                response["businesses"].forEach(function(item){
                  business = "<div class='item'>";
                  business += "<a href="+ item.url+ "><h4>" + item.name + "</h4></a>";
                  business += "<span>" +  item.rating + "</span>";
                  business += "<img src=" + item.image_url + " alt='" + item.name + "'>";
                  business += "<address><p>" + item.location.address1 + "</p>";
                  business += "<p>" + item.location.address3 + "</p>";
                  business += "<p>" + item.location.city + "</p>";
                  business += "<p>" + item.location.zip_code + "</p></address>";
                  $(".yelp-data").append(business);
                });
              }
            })
        },
        function(){
            alert("Geo Location not supported");
        }
    );
})
