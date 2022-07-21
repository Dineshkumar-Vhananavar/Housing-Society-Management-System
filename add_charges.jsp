<link rel="stylesheet" type="text/css" href="css/style.css">

<jsp:include page="admin_header.jsp"/>

<div class="main">

<%@page import="java.sql.*"%>
<%
	Class.forName("org.postgresql.Driver");

	Connection con = DriverManager.getConnection("jdbc:postgresql://localhost:5432/society","postgres","deepak123");

	ResultSet rs = con.createStatement().executeQuery("select * from charges");
	rs.next();
%>

<form method='post' action='update_charges.jsp'>
<table>
<tr>
	<td colspan=2 align='center'><h1>Add Charges</h1></td>
<tr>
<tr>
	<td><b>1BHK Charges:</b></td>
	<td><input type='text' name='one' value='<%=rs.getString(1)%>'></td>
</tr>
<tr>
	<td><b>2BHK Charges:</b></td>
	<td><input type='text' name='two' value='<%=rs.getString(2)%>'></td>
</tr>
<tr>
	<td><b>3BHK Charges:</b></td>
	<td><input type='text' name='three' value='<%=rs.getString(3)%>'></td>
</tr>
<tr>
	<td><b>Parking:</b></td>
	<td><input type='text' name='parking' value='<%=rs.getString(4)%>'></td>
</tr>
<tr>
	<td><b>Event Fund:</b></td>
	<td><input type='text' name='event' value='<%=rs.getString(5)%>'></td>
</tr>
<tr>
	<td><b>Sink Fund:</b></td>
	<td><input type='text' name='sink' value='<%=rs.getString(6)%>'></td>
</tr>
<tr>
	<td align='center'><input type='submit' value='EDIT' class='btn'></td>
	<td align='center'><input type='reset' value='CLEAR' class='btn'></td>
</tr>
</table>
</form>

</div>

<jsp:include page="footer.jsp"/>

