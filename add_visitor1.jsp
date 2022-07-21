<link rel="stylesheet" type="text/css" href="css/style.css">

<jsp:include page="security_header.jsp"/>

<div class="main">

<%@page import="java.sql.*"%>
<%
	Class.forName("org.postgresql.Driver");

	Connection con = DriverManager.getConnection("jdbc:postgresql://localhost:5432/society","postgres","deepak123");

	String name = request.getParameter("name");
	String gender = request.getParameter("gender");
	String phone = request.getParameter("phone");
	String bldg = request.getParameter("bldg");
	String fno = request.getParameter("fno");
	String vno = request.getParameter("vno");
	PreparedStatement ps = con.prepareStatement("insert into visitor(visitor_name, visitor_gender,visitor_mobile, visit_to_blg, visit_to_fno,visit_to_Owner_name) values(?,?,?,?,?,?)");

	ps.setString(1,name);
	ps.setString(2,gender);
	ps.setString(3,phone);
	ps.setString(4,bldg);
	ps.setString(5,fno);
	ps.setString(6,vno);

	
	ps.executeUpdate();
%>

<center><h3>Visitor Details added successfully.</center>
</div>

<jsp:include page="footer.jsp"/>

