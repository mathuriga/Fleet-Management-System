<%-- 
    Document   : checkDriveravilability
    Created on : 15-Jun-2016, 13:04:26
    Author     : Mathu
--%>

<html>
<head>
<title>Fleet Management System</title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
<link href="include/admin.css" rel="stylesheet" type="text/css">
<link href="include/menu.css" rel="stylesheet" type="text/css">
<link href="include/main.css" rel="stylesheet" type="text/css">
<link rel="STYLESHEET" type="text/css" href="include/calendar.css">
<script language="JavaScript" type="text/javascript" src="include/simplecalendar.js"></script>
<style type="text/css">
<!--
html,body{
    text-align: center;
    background-image: url(images/fleet.jpg);
}
.style1 {
	font-size: 16px;
	font-weight: bold;
	color: #000080;
}
.white{
color:#FFFFFF;
}
.style2 {color:  #b0cce9}

-->
</style>
</head>
<body>
<div class="">
<table width="1000" border="0" align="center" cellpadding="0" cellspacing="1" class="graybox">
  <tr>
    <td colspan="2">
	  <%@ include file="include/header.jsp" %>
	  </td>
  </tr>
  <tr>
    <td colspan="2"  bgcolor="#000080" style="height:30px;"><span class="style1">
      <marquee truespeed="truespeed">
	  <span class="style2">Fleet Management System </span>
      </marquee></span></td>
  </tr>
  <tr>
    <td width="20%" valign="top" bgcolor="#b0cce9" class="navArea"><p>&nbsp;</p>
     <%@ include  file="include/menu.jsp" %>
	  <p>&nbsp;</p>
      <p>&nbsp;</p>
      <p>&nbsp;</p>
      <p>&nbsp;</p>
	  <p>&nbsp;</p>
      <p>&nbsp;</p>
      <p>&nbsp;</p>
      <p>&nbsp;</p>
	  
    </td>

    <td width="80%" valign="top" class="contentArea"><table width="100%" border="0" cellspacing="0" cellpadding="20">
        <tr>
          <td>

 
 
<jsp:include page="driveravailability.jsp"/>
 </td>
        </tr>
      </table></td>
  </tr>
</table></div>
<p>&nbsp;</p>
<div class="white">
<p align="center">Copyright 2016  <b>130590J</b> - All Rights Reserved <br>
  <br>
  
</body>
</html>
