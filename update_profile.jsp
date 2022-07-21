<link rel="stylesheet" type="text/css" href="css/style.css">

<jsp:include page="owner_header.jsp"/>

<div class="main">

<%@page import="java.sql.*"%>
<%
	Class.forName("org.postgresql.Driver");

	Connection con = DriverManager.getConnection("jdbc:postgresql://localhost:5432/society","postgres","deepak123");

	String oid = request.getParameter("oid");
	String pwd = request.getParameter("pwd");

	con.createStatement().executeUpdate("update owner set owner_pwd='"+pwd+"' where owner_id="+oid);
%>

</div>
<h2>Password changed successfully</h2>

<jsp:include page="footer.jsp"/>

