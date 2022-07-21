<link rel="stylesheet" type="text/css" href="css/style.css">

<jsp:include page="owner_header.jsp"/>

<div class="main">

<%@page import="java.sql.*"%>
<%
	Class.forName("org.postgresql.Driver");

	Connection con = DriverManager.getConnection("jdbc:postgresql://localhost:5432/society","postgres","deepak123");

	ResultSet rs = con.createStatement().executeQuery("select current_date");
	rs.next();
	String fdate = rs.getString(1);
%>

<form method='post' action='feedback1.jsp'>
<table width='50%'>
<tr>
	<td colspan=2 align='center'><h2>FEEDBACK OR COMPLAINT</h2></td>
</tr>
<tr>
	<td><b>Date:</b></td>
	<td><input type='text' name='fdate' value='<%=fdate%>' readOnly></td>
</tr>
<tr>
	<td><b>Feedback or Complaint:</b></td>
	<td>
	<textarea rows=4 cols=50 name='msg' required></textarea>
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

