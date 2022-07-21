<%@page import="java.sql.*"%>
<%
	Class.forName("org.postgresql.Driver");

	Connection con = DriverManager.getConnection("jdbc:postgresql://localhost:5432/society","postgres","deepak123");

	int oid = Integer.parseInt(request.getParameter("oid"));
	
	con.createStatement().executeUpdate("delete from owner_payable where owner_id="+oid);

	con.createStatement().executeUpdate("delete  from  owner  where owner_id="+oid);

	response.sendRedirect("edit_member_details.jsp");
%>


