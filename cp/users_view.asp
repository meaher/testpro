<%@ CodePage=1256 %>
<!-- #include file="portal_includes.asp" -->
<%
set Conn=server.createobject("ADODB.Connection")
Conn.open ConnString

if request.querystring("id")<>"" then 

	USER_ID=int(request.querystring("id"))

	set Conn=server.createobject("ADODB.Connection")
	Conn.open ConnString
	set Rs=server.createobject("ADODB.Recordset")
	Rs.open "select * from USERS where USER_ID="&USER_ID&" " , Conn,1,2
	if not Rs.eof then
		USER_ID=rs("USER_ID")
		USER_NAME=rs("USER_NAME")
		USER_PWD=rs("USER_PWD")
		USER_FNAME=rs("USER_FNAME")
		USER_LNAME=rs("USER_LNAME")
		USER_EMAIL=rs("USER_EMAIL")
		USER_CITY=rs("USER_CITY")
		USER_ADDRESS=rs("USER_ADDRESS")
		USER_DATE=rs("USER_DATE")
		USER_MOBILE=rs("USER_MOBILE")
	else
		response.write "<script>alert('حصل خطأ في عرض البيانات')</script>"
	end if
	
	rs.close
	set rs=nothing
	
end if
%>
<html dir="ltr">

<head>
	<meta http-equiv="Content-Type" content="text/html; charset=windows-1256">
	<meta http-equiv="Content-Language" content="ar-kw">
	<title>Portal Control Panel</title>
	<link rel="stylesheet" type="text/css" href="styles/style.css">
</head>
<body>

<div align="center">
	<table class="tblMain" cellpadding="0" cellspacing="0">

		<tr>
			<td colspan="2" align="center" class="tdMainHeader">
				<!-- #include file="portal_header.asp"-->
			</td>
		</tr>
		<tr>
			<td class="tdMainMenu" valign="top">
				<!-- #include file="portal_menu.asp"-->				
			</td>
			<td valign="top" class="tdMain">
				<!-- Start Contents -->
				<div class="PageTitle">
					<p style="text-align: left">
					<a href="users_list.asp?start=1"><span lang="en-us">Users</span></a> 
					&gt; <span lang="en-us">View</span>/<span lang="en-us">Delete</span></div>
				
				<div align="center">

					<form action="users_chk.asp" method="post" name="frmData" id="frmData"  enctype="multipart/form-data">
						<input type="hidden" name="txtAdminID" value="<%=USER_ID%>">
						<input type="hidden" name="txtProcType" value="delete">
						
						<table class="tblDataControl" cellpadding="3" cellspacing="0">
							<thead>
								<td colspan="2" class="tdHeadDataControl">
								<span lang="en-us">View / Delete</span></td>
							</thead>
							<tr>
								<td class="tdDataControlL"><span lang="en-us">
								Name:</span></td>
								<td class="tdDataControlR"><%=USER_FNAME & USER_LNAME%></td>
							</tr>
							<tr>
								<td class="tdDataControlL"><span lang="en-us">
								Email:</span></td>
								<td class="tdDataControlR"><%=USER_EMAIL%></td>
							</tr>
							<tr>
								<td class="tdDataControlL"><span lang="en-us">Mobile:</span></td>
								<td class="tdDataControlR"><%=USER_MOBILE%></td>
							</tr>
							<tr>
								<td class="tdDataControlL"><span lang="en-us">City:</span></td>
								<td class="tdDataControlR"><%=USER_CITY%></td>
							</tr>
							<tr>
								<td class="tdDataControlL"><span lang="en-us">Date:</span></td>
								<td class="tdDataControlR"><%=USER_DATE%></td>
							</tr>
							<tr>
								<td class="tdDataControlL"><span lang="en-us">Address:</span></td>
								<td class="tdDataControlR"><%=USER_ADDRESS%></td>
							</tr>
							<tr>
								<td class="tdDataControlL"><span lang="en-us">
								Username:</span></td>
								<td class="tdDataControlR"><%=USER_NAME%></td>
							</tr>
							<tr>
								<td class="tdDataControlL"><span lang="en-us">Password:</span></td>
								<td class="tdDataControlR"><%=USER_PWD%></td>
							</tr>
							<tr>
								<td class="tdDataControlL">&nbsp;</td>
								<td class="tdDataControlR">
									<input type="button" value="Delete Data" name="tbnSubmit" class="button" onclick="if(confirm('هل أنت متأكد من حذف البيانات؟')){document.frmData.submit()}">
								<input type="button" value="Back" name="tbnBack" class="button" onclick="document.location='users_list.asp?start=1'"></td>
							</tr>
							</table>
					</form>
				</div>
				<!-- End Contents -->
			</td>
		</tr>
		<tr>
			<td colspan="2" align="center">
				<!-- #include file="portal_footer.asp"-->
			</td>
		</tr>
		<tr>
			<td colspan="2" align="center" height="10"></td>
		</tr>
	</table>
</div>
</body>
</html>
<%
conn.close
set conn=nothing
%>