<%@ CodePage=1256 %>
<!-- #include file="portal_db.asp" -->
<%
set Conn = server.createobject("ADODB.Connection")
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
			<td align="center">
			
				<script>
				function checkLoginData(){
					var UserLogin=document.fLoginData.tUser.value
					var PassLogin=document.fLoginData.tPass.value
					
					if (UserLogin== "" || UserLogin==null){
						alert("Pleas dont leave User Name field empty")					
						document.fLoginData.tUser.focus()
						return false
						}
					else if(PassLogin== "" || PassLogin==null){
						alert("Pleas dont leave password field empty")					
						document.fLoginData.tPass.focus()
						return false

						}								
				}
				</script>		
				<form action="teacher_loginCheck.asp" method=post onsubmit="return checkLoginData()" name="fLoginData">
				<div align="center">
					<table border="0" cellpadding="0" cellspacing="0" width="688" style="border: 1px solid #999999; padding-left: 4px; padding-right: 4px; padding-top: 1px; padding-bottom: 1px" bgcolor="#FFFFFF">
						<tr>
							<td height="35">
							<p align="left"><b>نظام المعلم</b></td>
						</tr>
						<tr>
							<td height="200" align="center">
							
								<table border="0" width="600" cellspacing="0" cellpadding="2" dir="ltr">
									<tr>
										<td align="right" width="200">&nbsp;</td>
										<td>&nbsp;</td>
									</tr>
									<tr>
										<td align="left">
										<p align="right">
										<span style="font-size: 8pt">اسم الدخول</span><span style="font-size: 8pt" lang="en-us">:</span></td>
										<td>
										<input type="text" name="tUser" size="30"></td>
									</tr>
									<tr>
										<td align="left">
										<p align="right">
										<span style="font-size: 8pt">كلمة السر</span><span style="font-size: 8pt" lang="en-us">:</span></td>
										<td>
										<input type="password" name="tPass" size="30"></td>
									</tr>
									<tr>
										<td align="right">&nbsp;</td>
										<td>
										<input type="submit" value="دخول" name="B2"></td>
									</tr>
									<tr>
										<td align="right">&nbsp;</td>
										<td>
										&nbsp;</td>
									</tr>
									</table>
							
							
							
							
							
							
							</td>
						</tr>
						<tr>
							<td>
							&nbsp;</td>
						</tr>
					</table>
				</div>

				</form>
			
			
			</td>
		</tr>
	</table>
</div>
</body>
</html>
<%
conn.close
set conn=nothing
%>