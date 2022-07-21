<link rel="stylesheet" type="text/css" href="css/style.css">

<jsp:include page="admin_header.jsp"/>

<div class="main">

<%@page import="java.sql.*"%>
<%
	Class.forName("org.postgresql.Driver");

	Connection con = DriverManager.getConnection("jdbc:postgresql://localhost:5432/society","postgres","deepak123");

        int pwd = (int)(Math.random()*9000)+1000;
	String name = request.getParameter("name");
	String gender = request.getParameter("gender");
	String bdate = request.getParameter("bdate");
	String phone = request.getParameter("phone");
	String email = request.getParameter("email");
	String bldg = request.getParameter("bldg");
	String fno = request.getParameter("fno");
	String ftype = request.getParameter("ftype");

	PreparedStatement ps = con.prepareStatement("insert into owner(owner_pwd, owner_name, owner_gender, owner_dob, owner_mobile, owner_email, owner_blg, owner_flat_no, owner_flat_type) values(?,?,?,?,?,?,?,?,?)");

	ps.setString(1,Integer.toString(pwd));
	ps.setString(2,name);
	ps.setString(3,gender);
	ps.setDate(4,Date.valueOf(bdate));
	ps.setString(5,phone);
	ps.setString(6,email);
	ps.setString(7,bldg);
	ps.setString(8,fno);
	ps.setString(9,ftype);

	ps.executeUpdate();
%>

<center><h3>Member added successfully.</center>
</div>

<jsp:include page="footer.jsp"/>

