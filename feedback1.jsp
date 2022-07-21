<link rel="stylesheet" type="text/css" href="css/style.css">

<jsp:include page="owner_header.jsp"/>

<div class="main">

<%@page import="java.sql.*"%>
<%
	Class.forName("org.postgresql.Driver");

	Connection con = DriverManager.getConnection("jdbc:postgresql://localhost:5432/society","postgres","deepak123");

	String oid = session.getAttribute("uid").toString();
	String fdate = request.getParameter("fdate");
	String msg = request.getParameter("msg");

	con.createStatement().executeUpdate("insert into feedback(feedback_date, feedback_msg, owner_id) values('"+fdate+"','"+msg+"',"+oid+")") ;
%>

</div>
<h2>Your feedback or Complaint is sent to the admin successfully.</h2>

</div>

<jsp:include page="footer.jsp"/>

