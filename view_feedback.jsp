<link rel="stylesheet" type="text/css" href="css/style.css">

<jsp:include page="admin_header.jsp"/>

<div class="main">

<%@page import="java.sql.*"%>
<%
	Class.forName("org.postgresql.Driver");

	Connection con = DriverManager.getConnection("jdbc:postgresql://localhost:5432/society","postgres","deepak123");

	ResultSet rs = con.createStatement().executeQuery("select feedback_id,feedback_date,feedback_msg,owner_name from owner,feedback where owner.owner_id = feedback.owner_id order by feedback_id");

	if(rs.next()){
%>
<table width='100%'>
<tr style='color:white;background:black;'>
	<td>Feedback ID</td>
	<td>Date</td>
	<td>Feedback</td>
	<td>Owner</td>
</tr>
<%
		do{
%>
<tr>
	<td style='padding:15px;'><%=rs.getString(1)%></td>
	<td><%=rs.getString(2)%></td>
	<td><%=rs.getString(3)%></td>
	<td><%=rs.getString(4)%></td>
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

