<link rel="stylesheet" type="text/css" href="css/style.css">

<jsp:include page="admin_header.jsp"/>

<div class="main">

<%@page import="java.sql.*"%>
<%
	Class.forName("org.postgresql.Driver");

	Connection con = DriverManager.getConnection("jdbc:postgresql://localhost:5432/society","postgres","deepak123");

	String one = request.getParameter("one");
	String two = request.getParameter("two");
	String three = request.getParameter("three");
	String parking = request.getParameter("parking");
	String event = request.getParameter("event");
	String sink = request.getParameter("sink");

	con.createStatement().executeUpdate("update charges set one_bhk="+one+",two_bhk="+two+",three_bhk="+three+",parking="+parking+",event_fund="+event+",sink_fund="+sink);
%>

</div>
<h2>Charges updated successfully.</h2>

<jsp:include page="footer.jsp"/>

