<link rel="stylesheet" type="text/css" href="css/style.css">

<jsp:include page="admin_header.jsp"/>

<div class="main">

<%@page import="java.sql.*"%>
<%
	Class.forName("org.postgresql.Driver");

	Connection con = DriverManager.getConnection("jdbc:postgresql://localhost:5432/society","postgres","deepak123");

	ResultSet rs = con.createStatement().executeQuery("select *from owner order by owner_id");

	if(rs.next()){
%>
<table width='100%'>
<tr style='color:white;background:black;'>
	<td>Owner ID</td>
	<td>Name</td>
	<td>Gender</td>
	<td>DOB</td>
	<td>Mobile</td>
	<td>Email</td>
	<td>Bldg</td>
	<td>Flat</td>
	<td>Type</td>
	<td></td>
	<td></td>
</tr>
<%
		do{
%>
<tr>
	<td style='padding:15px;'><%=rs.getString(1)%></td>
	<td><%=rs.getString(3)%></td>
	<td><%=rs.getString(4)%></td>
	<td><%=rs.getString(5)%></td>
	<td><%=rs.getString(6)%></td>
	<td><%=rs.getString(7)%></td>
	<td><%=rs.getString(8)%></td>
	<td><%=rs.getString(9)%></td>
	<td><%=rs.getString(10)%></td>
	<td align='center'><a href='update_member.jsp?oid=<%=rs.getInt(1)%>' style='text-decoration:none;background:black;color:white;padding:5px;border-radius:5px;'>Edit</a></td>
	<td align='center'><a href='delete_member.jsp?oid=<%=rs.getInt(1)%>' style='text-decoration:none;background:black;color:white;padding:5px;border-radius:5px;'>Delete</a></td>
</tr>
<%
		}while(rs.next());
%>
</table>
<%
	}
	else{
%>
<h1>No data found.</h1>
<%
	}
%>

</div>

<jsp:include page="footer.jsp"/>

