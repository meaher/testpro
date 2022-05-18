<%@ CodePage=1256 %>
<!-- #include file="portal_includes.asp" -->
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
	<table class="tblMain" cellpadding="0" cellspacing="0" dir="rtl">

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
				<p style="text-align: right"><a href="Depart_list.asp?start=1">إدارة أقسام المدرسة</a> &gt; إضافة
				
				<div align="center">
				
				<script>
				function ValidateData(){
				
					var txtAdminUser=	document.frmData.txtAdminUser.value;
					var txtAdminPwd= 	document.frmData.txtAdminPwd.value;
					var Validate=		true;
					//var ddlAdminLevel= 	document.frmData.ddlAdminLevel.options[document.frmData.ddlAdminLevel.options.selectedIndex].value
					
					if (txtAdminUser==""){
						document.frmData.txtAdminUser.style.borderColor="red"
						document.frmData.txtAdminUser.style.borderStyle="solid"
						document.frmData.txtAdminUser.style.borderWidth=2
						Validate=false;
					}
					else{
						document.frmData.txtAdminUser.style.clear	
						document.frmData.txtAdminUser.style.borderColor="lightgray"
						document.frmData.txtAdminUser.style.borderStyle="solid"
						document.frmData.txtAdminUser.style.borderWidth=1									
					}
						
					if (txtAdminPwd==""){
						document.frmData.txtAdminPwd.style.borderColor="red"
						document.frmData.txtAdminPwd.style.borderStyle="solid"
						document.frmData.txtAdminPwd.style.borderWidth=2
						Validate=false;
					}			
					else{
						document.frmData.txtAdminPwd.style.borderColor="lightgray"
						document.frmData.txtAdminPwd.style.borderStyle="solid"
						document.frmData.txtAdminPwd.style.borderWidth=1
					}
					
					if (Validate==false){
						return false;
					}

							
				}
				</script>
					<form action="Depart_chk.asp" method="post" name="frmData" id="frmData" onsubmit="return ValidateData()"  enctype="multipart/form-data">
						<input type="hidden" name="txtProcType" value="add">
						<table class="tblDataControl" cellpadding="3" cellspacing="0" dir="rtl">
							<thead>
								<td colspan="2" class="tdHeadDataControl">
								إضافة قسم جديد</td>
							</thead>
							<tr>
								<td class="tdDataControlL">اسم القسم</td>
								<td class="tdDataControlR">
								<input name="TxtDepartName" class="textBox" onchange="ValidateData()" size="20"></td>
							</tr>
							<tr>
								<td class="tdDataControlL">اسم المسؤول</td>
								<td class="tdDataControlR">
								<input name="TxtFullName" class="textBox" onchange="ValidateData()" size="20"></td>
							</tr>
							<tr>
								<td class="tdDataControlL">اسم الدخول</td>
								<td class="tdDataControlR">
								<input name="TxtAdminUser" class="textBox" onchange="ValidateData()" size="20"></td>
							</tr>
							<tr>
								<td class="tdDataControlL">كلمة السر</td>
								<td class="tdDataControlR">
								<input name="TxtAdminPWD" class="textBox" onchange="ValidateData()" size="20"></td>
							</tr>
							<tr>
								<td class="tdDataControlL">الصلاحيات</td>
								<td class="tdDataControlR">
								<select size="1" name="SelectAdminLevel" class="select">
										<option value="1">صلاحيات المدير</option>
										<option value="2">صلاحيات رئيس قسم</option>
									</select></td>
							</tr>
							<tr>
								<td class="tdDataControlL">&nbsp;</td>
								<td>
								<input type="submit" value="إضافة " name="tbnSubmit" class="button">
								<input type="button" value="عودة للخلف" name="tbnBack" class="button" onclick="document.location='Depart_list.asp?start=1'"></td>
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