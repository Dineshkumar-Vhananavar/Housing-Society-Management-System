<link rel="stylesheet" type="text/css" href="css/style.css">

<script>
function validateDate(inputText)
{
	dateformat = /^\d{4}\-(0[1-9]|1[012])\-(0[1-9]|[12][0-9]|3[01])$/;
  
	if(inputText.match(dateformat))
  	{
		pdate = inputText.split('-');
		yy = parseInt(pdate[0]);
  		mm  = parseInt(pdate[1]);
  		dd = parseInt(pdate[2]);
		
		ListofDays = [31,28,31,30,31,30,31,31,30,31,30,31];
  		if (mm==1 || mm>2)
  		{
  			if(dd>ListofDays[mm-1])
  			{
				return false;
  			}
  		}
  		if (mm==2)
  		{
  			lyear = false;
  			if((yy % 4 == 0 && yy % 100 != 0) || (yy % 400!=0)) 
  			{
  				lyear = true;
  			}
  			if((lyear==false) && (dd>=29))
  			{
				return false;
 			}
  			if((lyear==true) && (dd>29))
  			{
				return false;
  			}
  		}
		return true;
  	}
  	else
  	{
		return false;
  	}
}

function validateForm() {

	x = document.forms["myForm"]["bdate"];
  	if (!validateDate(x.value)) {
		
    		alert("Invalid birth date");
		x.focus();
    		return false;
  	}

	x = document.forms["myForm"]["phone"];
  	if (!x.value.match(/^\d{10}$/)) {
    		alert("Invalid phone");
		x.focus();
    		return false;
  	}

	x = document.forms["myForm"]["email"];
  	if (!x.value.match(/^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,3})+$/)) {
    		alert("Invalid email");
		x.focus();
    		return false;
  	}

	return true;
} 
</script>


<jsp:include page="admin_header.jsp"/>

<div class="main">

<form method='post' action='add_member1.jsp' name='myForm' onsubmit='return validateForm()'>
<table width='50%'>
<tr>
	<td colspan=2 align='center'><h2>OWNER DETAILS</h2></td>
</tr>
<tr>
	<td><b>Owner Name:</b></td>
	<td><input type='text' name='name' required></td>
</tr>
<tr>
	<td><b>Gender:</b></td>
	<td>
	<select name='gender' required>
	<option value=''>Select Gender</option>
	<option value='Male'>Male</option>
	<option value='Female'>Female</option>
	</select>
	</td>
</tr>
<tr>
	<td><b>Birth Date:</b></td>
	<td><input type='text' name='bdate' required>(YYYY-MM-DD)</td>
</tr>
<tr>
	<td><b>Mobile:</b></td>
	<td><input type='text' name='phone' required>(10 digits)</td>
</tr>
<tr>
	<td><b>Email:</b></td>
	<td><input type='text' name='email' required></td>
</tr>
<tr>
	<td><b>Building:</b></td>
	<td><input type='text' name='bldg' required></td>
</tr>
<tr>
	<td><b>Flat:</b></td>
	<td><input type='number' name='fno' min=1 max=2000 required></td>
</tr>
<tr>
	<td><b>Type:</b></td>
	<td>
	<select name='ftype' required>
	<option value=''>Select Flat Type</option>
	<option value='1BHK'>1BHK</option>
	<option value='2BHK'>2BHK</option>
	<option value='3BHK'>3BHK</option>
	</select>
	</td>
</tr>
<tr>
	<td align='center'><input type='submit' value='ADD' class='btn'></td>
	<td align='center'><input type='reset' value='CLEAR' class='btn'></td>
</tr>
</table>
</form>


</div>

<jsp:include page="footer.jsp"/>

