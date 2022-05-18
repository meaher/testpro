<%@ CodePage=1256 %>
<!-- #include file="portal_db.asp" -->
<%
set Conn=server.createobject("ADODB.Connection")
Conn.open ConnString
%>
<html dir="rtl">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=windows-1256">
	<meta http-equiv="Content-Language" content="ar-kw">
	<title>Portal Control Panel</title>
	<link rel="stylesheet" type="text/css" href="styles/style.css">
</head>
<body>
<div align="center">
	<table border="0" cellpadding="0" cellspacing="0" width="100%" height="100%">
		<tr>
			<td>&nbsp;</td>
			<td>&nbsp;</td>
			<td>&nbsp;</td>
		</tr>
		<tr>
			<td>&nbsp;</td>
			<td align="center">
			
				<div align="center">
					<table border="0" cellpadding="0" cellspacing="0" width="688" style="border: 1px solid #999999; padding-left: 4px; padding-right: 4px; padding-top: 1px; padding-bottom: 1px" bgcolor="#FFFFFF">
						<tr>
							<td height="35">
							<p align="left"><span lang="en-us">Teacher Login</span></td>
						</tr>
						<tr>
							<td height="200" align="center">


								<%
								user=Trim(request.form("tUser"))
								pass=Trim(request.form("tPass"))
								
								user= replace (user, "'", "_")
								user= replace (user, "/", "_")
								user= replace (user, "\", "_")
								user= replace (user, "%", "_")
								user= replace (user, "$", "_")
								user= replace (user, "&", "_")
								user= replace (user, "(", "_")
								user= replace (user, ")", "_")
								user= replace (user, "[", "_")
								user= replace (user, "]", "_")
								user= replace (user, "-", "_")
								user= replace (user, ".", "_")
								user= replace (user, ">", "_")
								user= replace (user, "<", "_")
								user= replace (user, " ", "_")
								
								pass= replace (pass, "'", "_")
								pass= replace (pass, "/", "_")
								pass= replace (pass, "\", "_")
								pass= replace (pass, "%", "_")
								pass= replace (pass, "$", "_")
								pass= replace (pass, "&", "_")
								pass= replace (pass, "(", "_")
								pass= replace (pass, ")", "_")
								pass= replace (pass, "[", "_")
								pass= replace (pass, "]", "_")
								pass= replace (pass, "-", "_")
								pass= replace (pass, ".", "_")
								pass= replace (pass, ">", "_")
								pass= replace (pass, "<", "_")
								pass= replace (pass, " ", "_")								
								
								Sql="select * from Employees where Civil_ID='"&user&"'"
								Set rs = Server.CreateObject("ADODB.Recordset")
								rs.Open Sql, conn, 1, 2
								
								if rs.eof then
								%>
									<font color="#FF0000">Wrong User Name .</font></p>
								<%
								else
									if not rs("Password")= pass then 
								%>
									<font color="#FF0000">Wrong Password</font></p>
								<%
									else
											Session.Timeout=90
											session("Employee_ID")=rs("Employee_ID")
											'session("ADMIN_LEVEL")= rs("ADMIN_LEVEL")
											session("Department_ID")= rs("Department_ID")
											rs.close
											set rs=nothing											
											conn.close
											set conn=nothing	
										'response.end	
											response.redirect "portal_main_teacher.asp"										
									end if
								end if
								
								rs.close
								set rs=nothing
								
								%>
				
								<p><a href="javascript:history.go(-1)">Go Back</a>

							</td>
						</tr>
						<tr>
							<td>
							&nbsp;</td>
						</tr>
					</table>
				</div>
			</td>
			<td>&nbsp;</td>
		</tr>
		<tr>
			<td>&nbsp;</td>
			<td align="center">&nbsp;</td>
			<td>&nbsp;</td>
		</tr>
	</table>
</div>
</body>
</html>
<%
conn.close
set conn=nothing
%>