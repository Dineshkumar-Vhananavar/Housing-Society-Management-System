<link rel="stylesheet" type="text/css" href="css/style.css">

<jsp:include page="admin_header.jsp"/>

<div class="main">

<%@page import="java.sql.*"%>
<%
	Class.forName("org.postgresql.Driver");
	Connection con = DriverManager.getConnection("jdbc:postgresql://localhost:5432/society","postgres","deepak123");

	ResultSet rs = con.createStatement().executeQuery("select extract(month from current_date), extract(year from current_date)");
	rs.next();

	int m = rs.getInt(1);
	int y = rs.getInt(2);

	rs = con.createStatement().executeQuery("select * from charges");
	rs.next();

	float one = rs.getFloat(1);
	float two = rs.getFloat(2);
	float three = rs.getFloat(3);
	float parking = rs.getFloat(4);
	float event = rs.getFloat(5);
	float sink = rs.getFloat(6);

	rs = con.createStatement().executeQuery("select * from owner_payable where extract(month from date_payable)="+m+" and extract(year from date_payable)="+y);

	if(rs.next()){
%>
<h3>Charges for month <%=m%> of year <%=y%> already calculated.</h3>
<%
	}
	else{
		ResultSet rs1 = con.createStatement().executeQuery("select owner_id, owner_flat_type from owner");

		while(rs1.next()){
			float tot = parking + sink + event;
						
			if(rs1.getString(2).equals("1BHK")) tot+=one;
			if(rs1.getString(2).equals("2BHK")) tot+=two;
			if(rs1.getString(2).equals("3BHK")) tot+=three;
			
			con.createStatement().executeUpdate("insert into owner_payable values("+tot+",current_date,'Pending',"+rs1.getInt(1)+")");
		}
	}

	rs = con.createStatement().executeQuery("select owner.owner_id, owner_name, owner_blg, owner_flat_no, owner_flat_type, amt_payable, date_payable, status from owner, owner_payable where owner.owner_id=owner_payable.owner_id and extract(month from date_payable)="+m+" and extract(year from date_payable)="+y+" order by owner_id");
%>

<table width='100%'>
<tr style='color:white;background:black;'>
	<td style='padding:10px;'>Owner ID</td>
	<td>Name</td>
	<td>Building</td>
	<td>Flat No</td>
	<td>Type</td>
	<td>Amount</td>
	<td>Date</td>
	<td>Status</td>
	<td></td>
</tr>
<%
	while(rs.next()){
%>
<tr>
	<td style='padding:10px;'><%=rs.getString(1)%></td>
	<td><%=rs.getString(2)%></td>
	<td><%=rs.getString(3)%></td>
	<td><%=rs.getString(4)%></td>
	<td><%=rs.getString(5)%></td>
	<td><%=rs.getString(6)%></td>
	<td><%=rs.getString(7)%></td>
	<td><%=rs.getString(8)%></td>
	<td align='center'><a href='change_status.jsp?oid=<%=rs.getInt(1)%>&date=<%=rs.getString(7)%>' style='text-decoration:none;background:black;color:white;padding:5px;border-radius:5px;'>Change Status</a>
</tr>
<%
	}
%>
</table>
</tr>



</div>

<jsp:include page="footer.jsp"/>

