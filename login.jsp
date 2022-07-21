<%@page import="java.sql.*"%>
<%
	Class.forName("org.postgresql.Driver");

	Connection con = DriverManager.getConnection("jdbc:postgresql://localhost:5432/society","postgres","deepak123");

	String uid = request.getParameter("uname");
	String upass = request.getParameter("pwd");
	String utype = request.getParameter("utype");

	if(utype.equals("Owner")){
		PreparedStatement ps = con.prepareStatement("select * from owner where owner_id=? and owner_pwd=?");

		ps.setInt(1, Integer.parseInt(uid));
		ps.setString(2, upass);
	
		ResultSet rs = ps.executeQuery();

		if(rs.next()){
			session.setAttribute("uid",uid);
			session.setAttribute("uname",rs.getString(3));
			response.sendRedirect("owner_home.jsp");
		}
		else{
			response.sendRedirect("err.jsp");
		}
	}

	

	if(utype.equals("Admin")){
		PreparedStatement ps = con.prepareStatement("select * from admin where admin_id=? and admin_pwd=?");

		ps.setString(1, uid);
		ps.setString(2, upass);
	
		ResultSet rs = ps.executeQuery();

		if(rs.next()){
			session.setAttribute("aid",uid);
			session.setAttribute("aname",rs.getString(3));
			response.sendRedirect("admin_home.jsp");
		}
		else{
			response.sendRedirect("err.jsp");
		}
	}

	if(utype.equals("Security")){
		PreparedStatement ps = con.prepareStatement("select * from Security where security_id=? and security_pwd=?");

		ps.setString(1, uid);
		ps.setString(2, upass);
	
		ResultSet rs = ps.executeQuery();

		if(rs.next()){
			session.setAttribute("aid",uid);
			session.setAttribute("aname",rs.getString(3));
			response.sendRedirect("security_home.jsp");
		}
		else{
			response.sendRedirect("err.jsp");
		}
	}

%>
