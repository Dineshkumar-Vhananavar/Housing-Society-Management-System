<link rel="stylesheet" type="text/css" href="css/style.css">

<body class='bg'>

<jsp:include page="header.jsp"/>

<div class='article'>

	<form method='post' action='login.jsp'>
	<table width='40%' align='center' class='tab'>
	<tr>
		<td colspan=2 align='center'><img src="images/img_avatar2.png" alt="Avatar" class="avatar"></td>
		</tr>
	<tr>
		<td colspan=2 align='center'><input type="text" placeholder="Enter User Name" name="uname" required></td>
	</tr>
	<tr>
		<td colspan=2 align='center'><input type="password" placeholder="Enter Password" name="pwd" required></td>
	</tr>
	<tr>
		<td colspan=2 align='center'>
		<select name='utype' required>
		<option value=''>Select User Type</option>
		<option value='Admin'>Admin</option>
		<option value='Owner'>Owner</option>
		<option value='Security'>Security</option>

		
		</select>
		</td>
	</tr>
	<tr>
		<td colspan=2 align='center'><button type="submit">Login</button></td>
	</tr>
	</table>
	</form>
</div>

<jsp:include page="footer.jsp"/>
</body>
