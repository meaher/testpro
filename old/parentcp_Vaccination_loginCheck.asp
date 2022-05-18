<%@ CodePage=1256 %>
<!-- #include file="db.asp" -->
<%
set Conn=server.createobject("ADODB.Connection")
Conn.open ConnString
%>
<html dir="rtl">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=windows-1256">
	<meta http-equiv="Content-Language" content="ar-kw">
	<title>Portal Control Panel</title>
	<link rel="stylesheet" type="text/css" href="cp/styles/style.css">
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
							<p align="left"><span lang="en-us">Parent Login</span></td>
						</tr>
						<tr>
							<td height="200" align="center">


								<%
								user=Trim(request.form("tUser"))
								'pass=Trim(request.form("tPass"))
								
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
								
								Sql="select * from students where std_Civil_ID='"&user&"'"
								Set rs = Server.CreateObject("ADODB.Recordset")
								rs.Open Sql, conn, 1, 2
								
								if rs.eof then
								%>
									<font color="#FF0000">حصل خطأ في الرقم المدني .</font></p>
								<%
								else
									
											Session.Timeout=90
											session("std_civil_ID")=rs("std_civil_ID")
											session("Std_Name")= rs("Std_Name")
											'session("Department_ID")= rs("Department_ID")
											rs.close
											set rs=nothing											
											conn.close
											set conn=nothing	
											
											response.redirect "parentcp_Vaccination_main.asp"										
									
								end if
								
								rs.close
								set rs=nothing
								
								%>
				
								<p><a href="javascript:history.go(-1)">عودة للخلف</a>

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