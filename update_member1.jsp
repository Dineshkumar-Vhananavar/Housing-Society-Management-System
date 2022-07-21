<%@page import="java.sql.*"%>
<%
	Class.forName("org.postgresql.Driver");

	Connection con = DriverManager.getConnection("jdbc:postgresql://localhost:5432/society","postgres","deepak123");

	int oid = Integer.parseInt(request.getParameter("oid"));
	String name = request.getParameter("name");
	String gender = request.getParameter("gender");
	String bdate = request.getParameter("bdate");
	String phone = request.getParameter("phone");
	String email = request.getParameter("email");
	String bldg = request.getParameter("bldg");
	String fno = request.getParameter("fno");
	String ftype = request.getParameter("ftype");

	PreparedStatement ps = con.prepareStatement("update owner set owner_name=?, owner_gender=?, owner_dob=?, owner_mobile=?, owner_email=?, owner_blg=?, owner_flat_no=?, owner_flat_type=? where owner_id=?");

	ps.setString(1,name);
	ps.setString(2,gender);
	ps.setDate(3,Date.valueOf(bdate));
	ps.setString(4,phone);
	ps.setString(5,email);
	ps.setString(6,bldg);
	ps.setString(7,fno);
	ps.setString(8,ftype);
	ps.setInt(9,oid);

	ps.executeUpdate();

	response.sendRedirect("edit_member_details.jsp");
%>


