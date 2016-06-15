<style type="text/css">
<!--
.miles {
background-position:center;
background-color:#D29C1A;
font-size:14px;
}
-->
</style>
<script src="http://maps.google.com/maps?file=api&amp;v=2&amp;sensor=true_or_false&amp;key=ABQIAAAAoHM8pz-43OqZkNZnTO6iOBSBpEJMvDeVXGvLDvx25sRDM-khzhSTUMtgo_3O8aBbB3prpdlz_kfkrg" type="text/javascript"></script>
<script src="epoly.js" type="text/javascript"></script>


<div id="logo"><a href="#/index.html"></a></div>
	  <table id="main" border="0" cellpadding="0" cellspacing="0" width="600"> 
      <tbody><tr> 
        <td id="leftside" valign="top"> <div id="map" style="width: 600px; height: 400px; border:#990000 solid 2px;"></div>
          <br>
          <br>
<div id="controls">
 <form onSubmit="start();return false" action="#">
  <table width="539" border="0" align="center">
    <tr>
      <td colspan="3" bgcolor="#D29C1A">&nbsp;</td>
    </tr>
    <tr>
      <td>&nbsp;</td>
      <td>&nbsp;</td>
      <td>&nbsp;</td>
    </tr>
    <tr>
      <td width="226"><div align="right"><strong>Start Point </strong></div></td>
      <td width="13"><div align="center"><strong>:</strong></div></td>
      <td width="286"><label>
        <input size="40" maxlength="30" id="startpoint" value="Bambalapitiya,Colombo" type="text">
      </label></td>
    </tr>
    <tr>
      <td><div align="right"><strong>End Point </strong></div></td>
      <td><div align="center"><strong>:</strong></div></td>
      <td><label>
       <input size="40" maxlength="30" id="endpoint" value="Moratuwa" type="text">
      </label></td>
    </tr>
    <tr>
      <td colspan="2">&nbsp;</td>
      <td>&nbsp;</td>
    </tr>
    <tr>
      <td colspan="2"><label>
        <div align="right">
          <input type="reset" name="Submit2" value="Reset" />
        </div>
      </label></td>
      <td><label>
        <input type="submit" name="Submit" value="Start Travelling" />
      </label></td>
    </tr>
    <tr>
      <td>&nbsp;</td>
      <td>&nbsp;</td>
      <td>&nbsp;</td>
    </tr>
    <tr>
      <td colspan="3" bgcolor="#D29C1A">&nbsp;</td>
      </tr>
  </table>
</form>
</div>
<div class="miles">
<font color="#FF0000"><center>
 <div id="step">&nbsp;</div>
    <div id="distance">Miles: 0.00</div>
						</center></font></div>									
        </p></td>
        <td bordercolor="#FFFFFF" id="rightside" valign="top">&nbsp;</td> 
      </tr> 
    </tbody></table> 
    
	
	  <p class="small">&nbsp;</p>
	  <font size="1"> 
 </font><p align="center"><!--WEBBOT bot="Script" startspan PREVIEW="Site Meter" -->
</p><font size="1"> 
 
</font>
 <script type="text/javascript">
    //<![CDATA[
    if (GBrowserIsCompatible()) {
 
      var map = new GMap2(document.getElementById("map"));
      map.addControl(new GMapTypeControl());
      map.setCenter(new GLatLng(21.005035, 75.561218), 10);
      var dirn = new GDirections();
      var step = 5; // metres
      var tick = 100; // milliseconds
      var poly;
      var eol;
      var car = new GIcon();
          car.image="caricon.png"
          car.iconSize=new GSize(32,18);
          car.iconAnchor=new GPoint(16,9);
      var marker;
      var k=0;
      var stepnum=0;
      var speed = "";   

      function animate(d) {
        if (d>eol) {
          document.getElementById("step").innerHTML = "<b>Trip completed<\/b>";
          document.getElementById("distance").innerHTML =  "Miles: "+(d/1609.344).toFixed(2);
          return;
        }
        var p = poly.GetPointAtDistance(d);
        if (k++>=180/step) {
          map.panTo(p);
          k=0;
        }
        marker.setPoint(p);
        document.getElementById("distance").innerHTML =  "Miles: "+(d/1609.344).toFixed(2)+speed;
        if (stepnum+1 < dirn.getRoute(0).getNumSteps()) {
          if (dirn.getRoute(0).getStep(stepnum).getPolylineIndex() < poly.GetIndexAtDistance(d)) {
            stepnum++;
            var steptext = dirn.getRoute(0).getStep(stepnum).getDescriptionHtml();
            document.getElementById("step").innerHTML = "<b>Next:<\/b> "+steptext;
            var stepdist = dirn.getRoute(0).getStep(stepnum-1).getDistance().meters;
            var steptime = dirn.getRoute(0).getStep(stepnum-1).getDuration().seconds;
            var stepspeed = ((stepdist/steptime) * 2.24).toFixed(0);
            step = stepspeed/2.5;
            speed = "<br>Current speed: " + stepspeed +" mph";
          }
        } else {
          if (dirn.getRoute(0).getStep(stepnum).getPolylineIndex() < poly.GetIndexAtDistance(d)) {
            document.getElementById("step").innerHTML = "<b>Next: Arrive at your destination<\/b>";
          }
        }
        setTimeout("animate("+(d+step)+")", tick);
      }

      GEvent.addListener(dirn,"load", function() {
        document.getElementById("controls").style.display="none";
        poly=dirn.getPolyline();
        eol=poly.Distance();
        map.setCenter(poly.getVertex(0),17);
        map.addOverlay(new GMarker(poly.getVertex(0),G_START_ICON));
        map.addOverlay(new GMarker(poly.getVertex(poly.getVertexCount()-1),G_END_ICON));
        marker = new GMarker(poly.getVertex(0),{icon:car});
        map.addOverlay(marker);
        var steptext = dirn.getRoute(0).getStep(stepnum).getDescriptionHtml();
        document.getElementById("step").innerHTML = steptext;
        setTimeout("animate(0)",2000);  // Allow time for the initial map display
      });

      GEvent.addListener(dirn,"error", function() {
        alert("Location(s) not recognised. Code: "+dirn.getStatus().code);
      });

      function start() {
        var startpoint = document.getElementById("startpoint").value;
        var endpoint = document.getElementById("endpoint").value;
        dirn.loadFromWaypoints([startpoint,endpoint],{getPolyline:true,getSteps:true});
      }

    }

    //]]>
    </script>

