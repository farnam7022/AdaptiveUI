<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="index.aspx.cs" Inherits="WebApplication1.index" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
   <meta charset="UTF-8"/>
       <title>Search Near by location</title>
        <script type="text/javascript" src="jquery.js"></script>
        <script type="text/javascript" src="http://maps.googleapis.com/maps/api/js?sensor=false&libraries=places&key=AIzaSyBmJaroD5yb2O8gqcqpxvlxZ1ox3wkO7Fg"></script>
        <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.2/jquery.min.js" type="text/javascript"></script>
        <link href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/css/bootstrap.min.css" rel="stylesheet" />
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/js/bootstrap.min.js"></script>
    <script type="text/javascript" src="http://www.google.com/jsapi"></script>

        <style type="text/css">
            #map {
                height: 400px;
                position: relative;
left: 2px;

                border: 1px solid #333;
                margin-top: 0.6em;
            }

             #obj {
                height: 400px;
                position: relative;


               
                margin-top: 0.6em;
            }

            .row {
  margin-left: 0px;
  margin-right: 0px;
}



        </style>

        <script type="text/javascript">
      /*    var val = [];var j=0;
            $(function(){
                $('.chkbox').click(function(){
                
                  $(':checkbox:checked').each(function(i){
                  val[i] = $(this).val(); ++j;});
                    /*
                    $(':checkbox').attr('checked',false);
                    $('#'+$(this).attr('id')).attr('checked',true);
                    search_types(map.getCenter());*/

                    $(function(){
    $('input[type=checkbox]').prop("checked", false);
});

                     var map;
            var infowindow;
            var markersArray = [];
            var pyrmont = new google.maps.LatLng(-41.27, 174.85);
            var marker;
            var geocoder = new google.maps.Geocoder();
            var infowindow = new google.maps.InfoWindow();
               
  var selectedItems = [];
   var type=[];
    var count = 0;
    selectedItems.length=0;

            function getMultipleCheckbox(inputdata) {
                type.length=0;selectedItems.length=0;
  console.log(type);
  count=0;
    for(var i=0;i<inputdata.length;i++) {
        if(inputdata[i].checked) {
            selectedItems[count] = inputdata[i].value;

            count++;
        }
    }
    console.log(selectedItems);
    for(var loop=0; loop< selectedItems.length; loop++) {
          type[loop] = selectedItems[loop];
        console.log(selectedItems[loop]);
    }
    console.log(type);
     search_types(map.getCenter());
    //showMap();
    return selectedItems;
   
}

            console.log(selectedItems);
var myStyles =[
    {
        featureType: "poi",
        elementType: "labels",
        stylers: [
              { visibility: "off" }
        ]
    }
];

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
            // var waypoints = [];   


           
            //var lat, lng;



 var zm = <%= Session["value2"]%>;
            var ft= '<%= Request.QueryString["value"] %>';
            var test=[];
function initialize() {

   
    console.log(zm);
    console.log(ft);
    console.log("start");
    var latlng2;
    var test=ft.split(',');
    console.log(test);
    navigator.geolocation.getCurrentPosition(function (position) {
        var latlng3 = new google.maps.LatLng(position.coords.latitude, position.coords.longitude);
            map = new google.maps.Map(document.getElementById('map'), {
                
                center: new google.maps.LatLng(position.coords.latitude, position.coords.longitude),
                zoom: zm,
                styles: myStyles
            });

            var request2;
            console.log("here");
            if(test.length=2){
                request2 = {
                    location: latlng3,
                    radius: 2000,
                    types: [test[0],test[1]]
                };}

            if(test.length=1){
                request2 = {
                    location: latlng3,
                    radius: 2000,
                    types: [test[0]]
                };}
           
            console.log(request2);
            var service2 = new google.maps.places.PlacesService(map);
            service2.search(request2, function(results, status) {
                map.setZoom(zm);
               
                if (status == google.maps.places.PlacesServiceStatus.OK) {
                   
                    for (var i = 0; i < results.length; i++) {
                       
                        results[i].html_attributions='';
                        createMarker2(results[i],icon);
                    }
                }
            });
            
        });
    /*------------------------------------------------------------------------------------------------------------*/
    
    /*zoomChangeListener = google.maps.event.addListener(map,'zoom_changed',function (event) {
        zoomChangeBoundsListener = google.maps.event.addListener(map,'bounds_changed',function (event) {  
            console.log(map.get_bounds());
            google.maps.event.removeListener(zoomChangeBoundsListener);
            var z=map.getZoom();
            document.getElementById('z2').innerHTML =z;
            console.log(z);
        });
    });*/

    setInterval(function(){ 
    var z=map.getZoom();
    document.getElementById('z').value =z;
    document.getElementById('zoom').innerHTML = z;

    }, 10);


    function createMarker2(place,icon) {
       
        var placeLoc = place.geometry.location;
        var marker = new google.maps.Marker({
            map: map,
            position: place.geometry.location,
            icon: icon,
            visible:true  
                    
        });



                
        markersArray.push(marker);
        google.maps.event.addListener(marker, 'click', function() {
            infowindow.setContent("<b>Name:</b>"+place.name+"<br><b>Address:</b>"+place.vicinity);
            infowindow.open(map, this);
        });
               
    }
         
    icon = "bank.png";
    /*---------------------------------------------------------------------------------------------------------------*/
  
               //infowindow = new google.maps.InfoWindow();
                //document.getElementById('directionsPanel').innerHTML='';
               // search_types();

               google.maps.event.addDomListener(window, "resize", function() {
               
   var center2=new google.maps.LatLng(-41.27,174.85);
   google.maps.event.trigger(map, "resize");
   map.setCenter(center2); 
   console.log(center2);
});

/* var input = document.getElementById('pac-input');
  var searchBox = new google.maps.places.SearchBox(input);
 map.controls[google.maps.ControlPosition.TOP_LEFT].push(input);

  // Bias the SearchBox results towards current map's viewport.
 map.addListener('bounds_changed', function() {
    searchBox.setBounds(map.getBounds());
  });*/

               zoomChangeListener = google.maps.event.addListener(map,'zoom_changed',function (event) {
                   zoomChangeBoundsListener = google.maps.event.addListener(map,'bounds_changed',function (event) {  
                       console.log(map.get_bounds());
                       google.maps.event.removeListener(zoomChangeBoundsListener);
                   });
               });



    /*
                   google.maps.event.addDomListener(map, 'zoom_changed', function () {
                       console.log("-----------------------------------------------------------------------"); 
                       google.maps.event.removeListener(eventListener);
                       var z=map.getZoom();
                       document.getElementById('z2').innerHTML =z;
                       console.log(z);
                  
                   });*/


               /*map.addListener('zoom_changed', function() {
                   var z=map.getZoom();
                   document.getElementById('z2').innerHTML =z;
                   console.log(z);
               });

               /*google.maps.event.addListener(map, 'zoom_changed', function() {
                   
                   var z=map.getZoom();
                   document.getElementById('z2').innerHTML =z;
                   console.log(z);
               });*/

google.maps.event.addListener(map,'center_changed',function() { checkBounds(); });

   var allowedBounds = new google.maps.LatLngBounds(
     new google.maps.LatLng(-41.5,174.5),
    new google.maps.LatLng(-41.20, 175));

  function checkBounds() {    
    if(! allowedBounds.contains(map.getCenter())) {
      var C = map.getCenter();
      var X = C.lng();
      var Y = C.lat();

      var maxX = allowedBounds.getNorthEast().lng();
      var maxY = allowedBounds.getNorthEast().lat();
      var minX = allowedBounds.getSouthWest().lng();
      var minY = allowedBounds.getSouthWest().lat();

      if (X < minX) {X = minX;}
      if (X > maxX) {X = maxX;}
      if (Y < minY) {Y = minY;}
      if (Y > maxY) {Y = maxY;}

      map.setCenter(new google.maps.LatLng(Y,X));
    }
}

 
               }

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////





            function createMarker(place,icon) {
                var placeLoc = place.geometry.location;
                var marker = new google.maps.Marker({
                    map: map,
                    position: place.geometry.location,
                    icon: icon,
                    visible:true  
                    
                });



                
                markersArray.push(marker);
                google.maps.event.addListener(marker, 'click', function() {
                    infowindow.setContent("<b>Name:</b>"+place.name+"<br><b>Address:</b>"+place.vicinity);
                    infowindow.open(map, this);
                });
               
            }
            var source="";
            var dest='';
            
            function search_types(latLng){
                clearOverlays(); 
              var icon=[];
                if(!latLng){
                    var latLng = pyrmont;
                }

               
  icon = "bank.png";
      

              /*  $('.chkbox:checked').each(function() {
               type =val;
                var icon = "images/"+type+".png"; });
                console.log(val);
	console.log(type);*/

     
console.log(type);
                var request = {
                    location: latLng,
                    radius: 2000,
                    types: [type[0],type[1]] //e.g. school, restaurant,bank,bar,city_hall,gym,night_club,park,zoo
                };
                  
                console.log(request);
                var tp;
                
                if(type.length==1) {     tp=[type[0]]; console.log(tp);}
                else{ tp=[type[0],type[1]];
                console.log(tp);}
                document.getElementById("tp").value =tp;
                console.log(tp);
             

                var service = new google.maps.places.PlacesService(map);
                service.search(request, function(results, status) {
                    map.setZoom(zm);
                    if (status == google.maps.places.PlacesServiceStatus.OK) {
                        for (var i = 0; i < results.length; i++) {
                            results[i].html_attributions='';
                            createMarker(results[i],icon);
                        }
                    }
                });
                
             }
            
            
            // Deletes all markers in the array by removing references to them
            function clearOverlays() {
                if (markersArray) {
                    for (i in markersArray) {
                        markersArray[i].setVisible(false)
                    }
                    //markersArray.length = 0;
                }
            }
            google.maps.event.addDomListener(window, 'load', initialize);
            
            function clearMarkers(){
                $('#show_btn').show();
                $('#hide_btn').hide();
                clearOverlays()
            }
            function showMarkers(){
                $('#show_btn').hide();
                $('#hide_btn').show();
                if (markersArray) {
                    for (i in markersArray) {
                        markersArray[i].setVisible(true)
                    }
                     
                }
            }
            
            function showMap(){
                
               
                document.getElementById("z").value =z;
                var imageUrl = 'http://chart.apis.google.com/chart?cht=mm&chs=24x32&chco=FFFFFF,008CFF,000000&ext=.png';
                var markerImage = new google.maps.MarkerImage(imageUrl,new google.maps.Size(24, 32));
                var input_addr=$('#address').val();
                geocoder.geocode({address: input_addr}, function(results, status) {
                    if (status == google.maps.GeocoderStatus.OK) {
                        var latitude = results[0].geometry.location.lat();
                        var longitude = results[0].geometry.location.lng();
                        var latlng = new google.maps.LatLng(latitude, longitude);
                        if (results[0]) {
                            map.setZoom(14);
                            map.setCenter(latlng);
                            marker = new google.maps.Marker({
                                position: latlng, 
                                map: map,
                                icon: markerImage,
                                draggable: true 
                                
                            }); 
                            $('#btn').hide();
                            $('#latitude,#longitude').show();
                            $('#address').val(results[0].formatted_address);
                            $('#latitude').val(marker.getPosition().lat());
                            $('#longitude').val(marker.getPosition().lng());
                            infowindow.setContent(results[0].formatted_address);
                            infowindow.open(map, marker);
                            search_types(marker.getPosition());
                            google.maps.event.addListener(marker, 'click', function() {
                                infowindow.open(map,marker);
                                
                            });
                        
                        
                            google.maps.event.addListener(marker, 'dragend', function() {
                              
                                geocoder.geocode({'latLng': marker.getPosition()}, function(results, status) {
                                    if (status == google.maps.GeocoderStatus.OK) {
                                        if (results[0]) {
                                            $('#btn').hide();
                                            $('#latitude,#longitude').show();
                                            $('#address').val(results[0].formatted_address);
                                            $('#latitude').val(marker.getPosition().lat());
                                            $('#longitude').val(marker.getPosition().lng());
                                        }
                                        
                                        infowindow.setContent(results[0].formatted_address);
                                        var centralLatLng = marker.getPosition();
                                        search_types(centralLatLng);
                                        infowindow.open(map, marker);
                                    }
                                });
                            });
                            
                        
                        } else {
                            alert("No results found");
                        }
                    } else {
                        alert("Geocoder failed due to: " + status);
                    }
                });
                
            }   
           
        </script>
</head>
<body>
    <form id="form1" runat="server">
   
        <div class="row">
        <div class="col-md-12" style="margin-top:20px">
            
             
            <button id="outbutton" type="button" onServerClick="outbutton_OnClick" runat="server">Log out</button>
       <asp:HiddenField ID="tp" runat="server" />
      <asp:HiddenField ID="z" runat="server" />
           <label id="zoom" style="margin-left:20px">zoom</label>
        </div>
    </div>
 <div class="row" style="margin-top:100px">

  <div class="col-md-8" id="map" ></div>
        <div class="col-md-4" id="obj">
         <div style="margin-top:2em; margin-left:2em">
            <table border="0" cellspacing="0" cellpadding="3" style="width:300px">
                <tr>
                    <td> <input type="checkbox" name="mytype" class="chkbox" id="school"  value="school" /><label for="school">&nbsp;School</label><br/></td>
                    <td><input type="checkbox" name="mytype" class="chkbox" id="restaurant"  value="restaurant"/><label for="restaurant" >&nbsp;Restaurant</label></td>
                </tr>
                <tr>
                    <td> <input type="checkbox" name="mytype" class="chkbox"  id="hospital"  value="hospital"/><label for="hospital" >&nbsp;Hospital</label></td>
                    <td><input type="checkbox" name="mytype"  class="chkbox" id="bus_station"  value="bus_station"/><label for="bus_station" >&nbsp;Bus Stop</label></td>
                </tr>
                <tr>
                    <td><input type="checkbox" name="mytype"  class="chkbox" id="park"  value="park"/><label for="park" >&nbsp;Park</label></td>
                    <td><input type="checkbox" name="mytype"  class="chkbox" id="bank"  value="bank"/><label for="bank" >&nbsp;Bank</label></td>
                </tr>
                <tr>
                    <td><input type="checkbox" name="mytype"  class="chkbox" id="bar"  value="bar"/><label for="bar" >&nbsp; Bar</label></td>
                    <td><input type="checkbox" name="mytype"  class="chkbox" id="movie_theater"  value="movie_theater"/><label for="movie_theater" >&nbsp;Movie Theater</label></td>
                </tr>
                <tr>
                    <td><input type="checkbox" name="mytype"  class="chkbox" id="night_club"  value="night_club"/><label for="night_club" > &nbsp;Night Club</label></td>
                    <td><input type="checkbox" name="mytype"  class="chkbox" id="zoo"  value="zoo"/><label for="zoo" >&nbsp; Zoo</label><br/></td>
                </tr>

                <tr>
                    <td><input type="checkbox" name="mytype"  class="chkbox" id="gym"  value="gym"/><label for="gym" > &nbsp;Gym</label></td>
                    <td><input type="checkbox" name="mytype"  class="chkbox" id="atm"  value="atm"/><label for="atm" > &nbsp;ATM</label></td>
                </tr>
                <tr>
                    <td><input type="checkbox" name="mytype"  class="chkbox" id="spa"  value="spa"/><label for="spa" > &nbsp;Spaa</label></td>

                </tr>
            </table>

           

<input type="button" value="add" onclick="getMultipleCheckbox(this.form.mytype);"/>
</div>


        </div>
     
       
        <br/>
        
       
      </div>
       <!-- <input type="button"  id="hide_btn" value="hide markers" onClick="clearMarkers();" />-->
        <input type="button" id="show_btn" value="show  markers" OnClick="showMarkers();" style="display:none;" />

    </form>
</body>
</html>
