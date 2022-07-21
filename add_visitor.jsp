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

	

	x = document.forms["myForm"]["phone"];
  	if (!x.value.match(/^\d{10}$/)) {
    		alert("Invalid phone");
		x.focus();
    		return false;
  	}


	return true;
} 
</script>


<jsp:include page="security_header.jsp"/>

<div class="main">

<form method='post' action='add_visitor1.jsp' name='myForm' onsubmit='return validateForm()'>
<table width='50%'>
<tr>
	<td colspan=2 align='center'><h2>VISITOR DETAILS</h2></td>
</tr>
<tr>
	<td><b>Visitor Name:</b></td>
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
	<td><b>Mobile:</b></td>
	<td><input type='text' name='phone' required>(10 digits)</td>
</tr>

<tr>
	<td><b>Owner Name:</b></td>
	<td><input type='text' name='name' required></td>
</tr>

<tr>
	<td><b>Building wing:</b></td>
	<td><input type='text' name='bldg' required></td>
</tr>
<tr>
	<td><b>Flat No:</b></td>
	<td><input type='number' name='fno' min=1 max=2000 required></td>
</tr>
<tr>
	<td><b>Vehicle No:</b></td>
	<td><input type='text' name='vno' required></td>

<tr>
	<td align='center'><input type='submit' value='ADD' class='btn'></td>
	<td align='center'><input type='reset' value='CLEAR' class='btn'></td>
</tr>
</table>
</form>


</div>

<jsp:include page="footer.jsp"/>

