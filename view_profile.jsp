<link rel="stylesheet" type="text/css" href="css/style.css">

<jsp:include page="owner_header.jsp"/>

<div class="main">

<%@page import="java.sql.*"%>
<%
	Class.forName("org.postgresql.Driver");

	Connection con = DriverManager.getConnection("jdbc:postgresql://localhost:5432/society","postgres","deepak123");

	String uid = session.getAttribute("uid").toString();

	ResultSet rs = con.createStatement().executeQuery("select * from owner where owner_id="+uid);
	rs.next();
%>

<form method='post' action='update_profile.jsp'>
<table width='50%'>
<tr>
	<td colspan=2 align='center'><h2>OWNER DETAILS</h2></td>
</tr>
<tr>
	<td><b>Owner ID:</b></td>
	<td><input type='text' name='oid' value='<%=rs.getString(1)%>' readOnly></td>
</tr>
<tr>
	<td><b>Password:</b></td>
	<td><input type='text' name='pwd' value='<%=rs.getString(2)%>' required></td>
</tr>
<tr>
	<td><b>Owner Name:</b></td>
	<td><input type='text' name='name' value='<%=rs.getString(3)%>' readOnly></td>
</tr>
<tr>
	<td><b>Gender:</b></td>
	<td><input type='text' name='gender' value='<%=rs.getString(4)%>' readOnly></td>
</tr>
<tr>
	<td><b>Birth Date:</b></td>
	<td><input type='text' name='bdate' value='<%=rs.getString(5)%>' readOnly>(YYYY-MM-DD)</td>
</tr>
<tr>
	<td><b>Mobile:</b></td>
	<td><input type='text' name='phone' value='<%=rs.getString(6)%>' readOnly>(10 digits)</td>
</tr>
<tr>
	<td><b>Email:</b></td>
	<td><input type='text' name='email' value='<%=rs.getString(7)%>' readOnly></td>
</tr>
<tr>
	<td><b>Building:</b></td>
	<td><input type='text' name='bldg' value='<%=rs.getString(8)%>' readOnly></td>
</tr>
<tr>
	<td><b>Flat:</b></td>
	<td><input type='number' name='fno' min=1 max=2000 value='<%=rs.getString(9)%>' readOnly></td>
</tr>
<tr>
	<td><b>Type:</b></td>
	<td><input type='text' name='bldg' value='<%=rs.getString(10)%>' readOnly></td>
</tr>
<tr>
	<td align='center'><input type='submit' value='CHANGE PASSWORD' class='btn'></td>
	<td align='center'><input type='reset' value='CLEAR' class='btn'></td>
</tr>
</table>
</form>

</div>

<jsp:include page="footer.jsp"/>

