<link rel="stylesheet" type="text/css" href="css/style.css">

<jsp:include page="owner_header.jsp"/>

<div class="main">

<form method='post' action='view_bill1.jsp'>
<table width='50%'>
<tr>
	<td colspan=2 align='center'><h2>VIEW BILL</h2></td>
</tr>
<tr>
	<td><b>Month:</b></td>
	<td>
	<select name='month' required>
	<option value=''>Select Month</option>
	<option value=1>Jan</option>
	<option value=2>Feb</option>
	<option value=3>Mar</option>
	<option value=4>Apr</option>
	<option value=5>May</option>
	<option value=6>Jun</option>
	<option value=7>Jul</option>
	<option value=8>Aug</option>
	<option value=9>Sep</option>
	<option value=10>Oct</option>
	<option value=11>Nov</option>
	<option value=12>Dec</option>
	</td>
</tr>
<tr>
	<td><b>Year:</b></td>
	<td>
	<select name='year' required>
	<option value=''>Select Year</option>
<%
	int n = new java.util.Date().getYear()+1900;
	for(int i=2000; i<=n; i++){
%>
	<option value=<%=i%>><%=i%></option>
<%
	}
%>
	</select>
	</td>
</tr>
<tr>
	<td align='center'><input type='submit' value='SUBMIT' class='btn'></td>
	<td align='center'><input type='reset' value='CLEAR' class='btn'></td>
</tr>
</table>
</form>

</div>

<jsp:include page="footer.jsp"/>

	