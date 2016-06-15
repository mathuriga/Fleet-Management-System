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
<h3><center>Employee and drivers should enter them shelves as a user<br/>

If You have already Registered as a user go to <a href="do?MOD=BOK&ACT=Login">Login In</a></center> </h3>
<form id="form1" name="form1" method="post" action="do?MOD=BOK&ACT=doReg">
  <table width="70%" border="0" align="center" cellpadding="5" cellspacing="2">
    <tr>
      <th colspan="5" scope="col"><div class="header">User Registration</div></th>
    </tr>
    <tr>
      <td width="20%">&nbsp;</td>
      <td width="29%">&nbsp;</td>
      <td width="2%">&nbsp;</td>
      <td width="29%">&nbsp;</td>
      <td width="20%">&nbsp;</td>
    </tr>
    <tr>
      <td>&nbsp;</td>
      <td>Name</td>
      <td>:</td>
      <td><label>
        <input name="Username" type="text" id="Username" />
      </label></td>
      <td>&nbsp;</td>
    </tr>
    <tr>
      <td>&nbsp;</td>
      <td>Password</td>
      <td>:</td>
      <td><input name="Password" type="password" id="Password" /></td>
      <td>&nbsp;</td>
    </tr>
    <tr>
      <td>&nbsp;</td>
      <td>Address</td>
      <td>:</td>
      <td><textarea name="Address" id="Address"></textarea></td>
      <td>&nbsp;</td>
    </tr>
    <tr>
      <td>&nbsp;</td>
      <td>City</td>
      <td>:</td>
      <td><input name="City" type="text" id="City" /></td>
      <td>&nbsp;</td>
    </tr>
    <tr>
      <td>&nbsp;</td>
      <td>State</td>
      <td>:</td>
      <td><input name="State" type="text" id="State" /></td>
      <td>&nbsp;</td>
    </tr>
    <tr>
      <td>&nbsp;</td>
      <td>Mobile No. </td>
      <td>:</td>
      <td><input name="MobileNo" type="text" id="MobileNo" /></td>
      <td>&nbsp;</td>
    </tr>
    <tr>
      <td>&nbsp;</td>
      <td>E-mail</td>
      <td>:</td>
      <td><input name="Email" type="text" id="Email" /></td>
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
      <td>&nbsp;</td>
      <td><label>
        <div align="right">
          <input type="reset" name="Submit2" value="Reset" />
        </div>
      </label></td>
      <td>&nbsp;</td>
      <td><label>
        <input name="Submit" type="submit" onclick="MM_validateForm('Username','','R','Password','','R','City','','R','State','','R','MobileNo','','R','Email','','RisEmail','Address','','R');return document.MM_returnValue" value="Register Now" />
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
      <td colspan="5"><div class="header">&nbsp;</div></td>
    </tr>
  </table>
</form>
