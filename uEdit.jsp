<%@ page contentType="text/html; charset=iso-8859-1" language="java" import="java.sql.*,
																			 java.util.*,
																			 net.vehicle.*" errorPage="" %>
<%
int id = Integer.parseInt((String)session.getAttribute("u_id"));
ArrayList all = VehicleCommon.viewUserDetails(id);
//int size = all.size();
//System.out.print(all+""+size);
%>
<script type="text/JavaScript">
<!--
function MM_findObj(n, d) { //v4.01
  var p,i,x;  if(!d) d=document; if((p=n.indexOf("?"))>0&&parent.frames.length) {
    d=parent.frames[n.substring(p+1)].document; n=n.substring(0,p);}
  if(!(x=d[n])&&d.all) x=d.all[n]; for (i=0;!x&&i<d.forms.length;i++) x=d.forms[i][n];
  for(i=0;!x&&d.layers&&i<d.layers.length;i++) x=MM_findObj(n,d.layers[i].document);
  if(!x && d.getElementById) x=d.getElementById(n); return x;
}

function MM_validateForm() { //v4.0
  var i,p,q,nm,test,num,min,max,errors='',args=MM_validateForm.arguments;
  for (i=0; i<(args.length-2); i+=3) { test=args[i+2]; val=MM_findObj(args[i]);
    if (val) { nm=val.name; if ((val=val.value)!="") {
      if (test.indexOf('isEmail')!=-1) { p=val.indexOf('@');
        if (p<1 || p==(val.length-1)) errors+='- '+nm+' must contain an e-mail address.\n';
      } else if (test!='R') { num = parseFloat(val);
        if (isNaN(val)) errors+='- '+nm+' must contain a number.\n';
        if (test.indexOf('inRange') != -1) { p=test.indexOf(':');
          min=test.substring(8,p); max=test.substring(p+1);
          if (num<min || max<num) errors+='- '+nm+' must contain a number between '+min+' and '+max+'.\n';
    } } } else if (test.charAt(0) == 'R') errors += '- '+nm+' is required.\n'; }
  } if (errors) alert('The following error(s) occurred:\n'+errors);
  document.MM_returnValue = (errors == '');
}
//-->
</script>

<form id="form1" name="form1" method="post" action="do?MOD=BOK&ACT=doEdit">
  <table width="60%" border="0" align="center" cellpadding="5" cellspacing="2">
    <tr>
      <th colspan="5" scope="col"><div class="header">Edit Details</div></th>
    </tr>
    <tr>
      <td width="11%">&nbsp;</td>
      <td width="29%">User Name </td>
      <td width="2%">:</td>
      <td width="38%"><label>
        <input name="Username" type="text" id="Username" value="<%=(String)all.get(0)%>" />
      </label></td>
      <td width="20%">&nbsp;</td>
    </tr>
    <tr>
      <td>&nbsp;</td>
      <td>Password</td>
      <td>:</td>
      <td><label>
        <input name="Password" type="text" id="Password" value="<%=(String)all.get(1)%>" />
      </label></td>
      <td>&nbsp;</td>
    </tr>
    <tr>
      <td>&nbsp;</td>
      <td>Address</td>
      <td>:</td>
      <td><label>
        <input name="Address" type="text" id="Address"  value="<%=(String)all.get(2)%>" size="30"/>
      </label></td>
      <td>&nbsp;</td>
    </tr>
    <tr>
      <td>&nbsp;</td>
      <td>City</td>
      <td>:</td>
      <td><input name="City" type="text" id="City"  value="<%=(String)all.get(3)%>"/></td>
      <td>&nbsp;</td>
    </tr>
    <tr>
      <td>&nbsp;</td>
      <td>State</td>
      <td>:</td>
      <td><input name="State" type="text" id="State"  value="<%=(String)all.get(4)%>"/></td>
      <td>&nbsp;</td>
    </tr>
    <tr>
      <td>&nbsp;</td>
      <td>Mobile No. </td>
      <td>:</td>
      <td><input name="Mobile" type="text" id="Mobile" value="<%=(String)all.get(5)%>" /></td>
      <td>&nbsp;</td>
    </tr>
    <tr>
      <td>&nbsp;</td>
      <td>Email</td>
      <td>:</td>
      <td><label>
        <input name="Email" type="text" id="Email" value="<%=(String)all.get(6)%>" />
      </label></td>
      <td>&nbsp;</td>
    </tr>
    <tr>
      <td>&nbsp;</td>
      <td><label>
        <div align="right">
          <input type="reset" name="Submit2" value="Reset" />
        </div>
      </label></td>
      <td colspan="2"><label>
        <input name="Submit" type="submit" onclick="MM_validateForm('Username','','R','Password','','R','Address','','R','City','','R','State','','R','Mobile','','R','Email','','RisEmail');return document.MM_returnValue" value="User Edit" />
      </label></td>
      <td>&nbsp;</td>
    </tr>
    <tr>
      <td>&nbsp;</td>
      <td>&nbsp;</td>
      <td>&nbsp;</td>
      <td>&nbsp;</td>
      <td>&nbsp;</td>
    </tr>
    <tr>
      <td colspan="5">&nbsp;</td>
    </tr>
  </table>
</form>
