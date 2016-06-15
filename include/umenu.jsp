<%
String uname = (String)session.getAttribute("u_name");
String uid = (String)session.getAttribute("u_id");

%>
<div id="ddblueblockmenu">
	  <div class="menutitle">&nbsp;Fleet Profiles</div>
		  <ul>
			<li><a href="do?MOD=BOK&ACT=Home">Home</a></li>
			<%
			if(uname != null) {
			%>
			<li><a href="do?MOD=BOK&ACT=Home">Welcome <%= uname %></a></li>
			<li><a href="do?MOD=BOK&ACT=uEdit">Edit Details</a></li>
			<li><a href="do?MOD=BOK&ACT=Logout">LogOut</a></li>
			<li><a href="do?MOD=BOK&ACT=bokUser">Booking Details</a></li>
			<%}else {%>
                        <li><a href=" admin.jsp">Admin Login</a></li>
			<li><a href="do?MOD=BOK&ACT=Reg">Register Now</a></li>
			<li><a href="do?MOD=BOK&ACT=Login">Login Now</a></li>
			<% } %>
			<li><a href="do?MOD=BOK&ACT=Car">Map Lookup</a></li>
			<li><a href="do?MOD=BOK&ACT=View&v=lux">Luxury Cars</a></li>
			<li><a href="do?MOD=BOK&ACT=View&v=exe">Executive Cars</a></li>
			<li><a href="do?MOD=BOK&ACT=View&v=muv">Pick up</a></li>
			<li><a href="do?MOD=BOK&ACT=View&v=eco">Economy Cars</a></li>
			<li><a href="do?MOD=BOK&ACT=View&v=mini">Mini Vans & Large Coaches</a></li>			
		  </ul>
	 	  <div class="menutitle">&nbsp;</div>	
	</div>
