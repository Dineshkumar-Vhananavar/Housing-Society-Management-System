<%@page import="java.sql.*"%>
<%
	Class.forName("org.postgresql.Driver");

	Connection con = DriverManager.getConnection("jdbc:postgresql://localhost:5432/society","postgres","deepak123");

	String oid = request.getParameter("oid");
	String date = request.getParameter("date");

	con.createStatement().executeUpdate("update owner_payable set status='Paid' where owner_id="+oid+" and date_payable='"+date+"'");

	response.sendRedirect("calculate_maintenance.jsp");
%>
