<link rel="stylesheet" type="text/css" href="css/style.css">

<jsp:include page="owner_header.jsp"/>

<div class="main">

<%@page import="java.sql.*"%>
<%
	Class.forName("org.postgresql.Driver");

	Connection con = DriverManager.getConnection("jdbc:postgresql://localhost:5432/society","postgres","deepak123");

	String uid = session.getAttribute("uid").toString();

	String month = request.getParameter("month");
	String year = request.getParameter("year");	

	ResultSet rs = con.createStatement().executeQuery("select * from charges");
	rs.next();

	float one = rs.getFloat(1);
	float two = rs.getFloat(2);
	float three = rs.getFloat(3);
	float parking = rs.getFloat(4);
	float event = rs.getFloat(5);
	float sink = rs.getFloat(6);

	rs = con.createStatement().executeQuery("select owner.owner_id, owner_name, owner_blg, owner_flat_no, owner_flat_type, amt_payable, date_payable, status from owner, owner_payable where owner.owner_id = owner_payable.owner_id and extract(month from date_payable)="+month+" and extract(year from date_payable)="+year+" and owner.owner_id="+uid);

	rs.next();

	float man=0;

	if(rs.getString(5).equals("1BHK")) man=one;
	if(rs.getString(5).equals("2BHK")) man=two;
	if(rs.getString(5).equals("3BHK")) man=three;
%>

<table width='400px' border=1>
<tr>
	<td><b>Owner ID:</b></td>
	<td><%=rs.getString(1)%></td>
</tr>
<tr>
	<td><b>Name:</b></td>
	<td><%=rs.getString(2)%></td>
</tr>
<tr>
	<td><b>Building:</b></td>
	<td><%=rs.getString(3)%></td>
</tr>
<tr>
	<td><b>Flat No:</b></td>
	<td><%=rs.getString(4)%></td>
</tr>
<tr>
	<td><b>Flat Type:</b></td>
	<td><%=rs.getString(5)%></td>
</tr>
<tr>
	<td><b>Date Payable:</b></td>
	<td><%=rs.getString(7)%></td>
</tr>
<tr>
	<td><b>Status:</b></td>
	<td><%=rs.getString(8)%></td>
</tr>

<tr>
	<td><b>Maintenance:</b></td>
	<td><%=rs.getString(1)%></td>
</tr>
<tr>
	<td><b>Parking:</b></td>
	<td><%=parking%></td>
</tr>
<tr>
	<td><b>Event Fund:</b></td>
	<td><%=event%></td>
</tr>
<tr>
	<td><b>Sink Fund:</b></td>
	<td><%=sink%></td>
</tr>
<tr>
	<td><b>Amount:</b></td>
	<td><%=rs.getString(6)%></td>
</tr>
</table>

</div>

<jsp:include page="footer.jsp"/>

