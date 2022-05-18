<%@ CodePage=1256%>
<!-- #include file="db.asp" -->
<%
set Conn=server.createobject("ADODB.Connection")
Conn.open ConnString
%>
<html dir="rtl">

<head>
<meta http-equiv="Content-Language" content="ar-kw">
<title>ترقبوا مهرجان السباعيات الرياضي</title>
	<link rel="stylesheet" type="text/css" href="styles/style.css">
<style>
<!--

.auto-style1 {
	text-align: center;
}
.auto-style2 {
	font-size: xx-large;
}
-->
</style>
	<link rel="stylesheet" type="text/css" href="styles/style.css">

<meta http-equiv="Content-Type" content="text/html; charset=windows-1256">
</head>

<body>
<%
		Sql="select * from students where std_Civil_ID='"&session("std_civil_id")&"'"
		Set rs = Server.CreateObject("ADODB.Recordset")
		rs.Open Sql, conn, 1, 2
		
		if not rs.eof then
			Std_Number=rs("Std_Number")
			std_name=rs("std_name")
			std_civil_id=rs("std_civil_id")
			Class_Room_ID=rs("Class_Room_ID")
		Else
			response.redirect "parentcp_Vacination.asp"
		End if	
		rs.close	
%>
<div align="center">
	<table bgcolor="#FFFFFF" border="0" width="900" id="table1" cellspacing="0" cellpadding="0">
		<tr>
			<td bgcolor="#0A308F" height="7"></td>
		</tr>
		<tr>
			<td>
			<table border="0" width="100%" id="table2" cellspacing="0" cellpadding="0">
				<tr>
					<td width="142" valign="top">
			<!--#include file="Right.asp"-->
					</td>
					<td valign="top">
					<!--#include file="Banner.asp"-->
					<table border="0" width="100%" id="table4" cellspacing="0" cellpadding="0">
						<tr>
							<td colspan="3" valign="top">
														<table border="0" width="98%" id="table7" cellspacing="0" cellpadding="0">
								<tr>
									<td colspan="2" align="center">
									<table border="0" width="97%" id="table8" cellspacing="0" cellpadding="0">
										<tr>
											<td width="8">
											<img src="images/el-ameed_36.gif" width="8" height="9" alt=""></td>
											<td background="images/el-ameed_35.gif">
											</td>
											<td width="8">
											<img src="images/el-ameed_32.gif" width="8" height="9" alt=""></td>
										</tr>
										<tr>
											<td width="8" background="images/el-ameed_40.gif">&nbsp;</td>
											<td class="auto-style1">
											<p style="text-align: right">
			<font size="3">
			<img src="images/el-ameed_42.gif" width="22" height="22" alt=""></font><span lang="en-us"><font size="3">
			</font>
			</span><font size="3">نظام معلومات التطعيم الطالب<span lang="en-us">:</span> <%=std_name%>			
			</font>
			<p style="text-align: right"><font color="#FF0000">&nbsp;<%=session("ErrMsg")%></font>
											<p>
											
					<form action="Parentcp_Vaccination_chk.asp" method="post" name="frmData" id="frmData" onsubmit="return ValidateData()"  enctype="multipart/form-data">
						<input type="hidden" name="txtProcType" value="add">						
						<input type="hidden" name="std_civil_id" value="<%=std_civil_id%>">	
						<input type="hidden" name="Class_Room_ID" value="<%=Class_Room_ID%>">	
											

											<table cellspacing="0" cellpadding="3" class="tblView">
								<thead>
									<td class="tdViewHead" width="23%" dir="rtl">
																		الرقم 
									المدني</td>
									<td class="tdViewHead" width="18%" dir="rtl">
									اسم الطالب</td>
									<td class="tdViewHead" width="3%" dir="rtl">
																		&nbsp;</td>
									<td class="tdViewHead" width="11%" dir="rtl">
																		&nbsp;</td>
									<td class="tdViewHead" width="3%" dir="rtl">
									&nbsp;</td>
									<td class="tdViewHead" width="12%" dir="rtl">
									&nbsp;</td>
									<td class="tdViewHead" width="3%" dir="rtl">
									&nbsp;</td>
									<td class="tdViewHead" width="10%" dir="rtl">
									&nbsp;</td>
									<td class="tdViewHead" width="3%" dir="rtl">
									&nbsp;</td>
									<td class="tdViewHead" width="7%" dir="rtl">
									&nbsp;</td>
									</thead>

								<tr  id="trRow" class="<%=className%>">
								
									<td class="tdView" width="23%" dir="rtl">
									&nbsp;<%=std_Civil_id%></td>
									
									<td class="tdView" width="18%" dir="rtl">
									
									<p align="right">
									<%=std_Name%>
																		
									</td>
									
									<td class="tdView" width="14%" dir="rtl" colspan="2">
									<input type="radio" name="Vaccination" value="0" >&nbsp;لم يطعم</td>
								
									<td class="tdView" width="15%" dir="rtl" colspan="2">
									<input type="radio" name="Vaccination" value="1">									تطعيم واحد</td>
									
									
									<td class="tdView" width="13%" dir="rtl" colspan="2">
														
																	<input type="radio" name="Vaccination" value="2">تطعيمين</td>
									
									
									<td class="tdView" width="10%" dir="rtl" colspan="2">
														
																	<input type="radio" name="Vaccination" value="3" >معفي</td>
									
									
								</tr>
									<td>شهادة التطعيم أو الإعفاء:</td>
									<td colspan="3">&nbsp;<input type=file  name="txtImg" class="textBox" size="35"</td>
									<td>&nbsp;</td>
									<td>&nbsp;</td>
									<td>&nbsp;</td>
									<td>&nbsp;</td>
									<td>&nbsp;</td>
									<td>&nbsp;</td>
								</tr>
								<tr>
									<td>&nbsp;</td>
									<td colspan="3">
										<input type="submit" value="ارسال" name="B2"><td>&nbsp;</td>
									<td>&nbsp;</td>
									<td>&nbsp;</td>
									<td>&nbsp;</td>
									<td>&nbsp;</td>
									<td>&nbsp;</td>
								</tr>
								</table>
						</form>		
								
								
								
								</td>
											<td width="8" background="images/el-ameed_38.gif">&nbsp;</td>
										</tr>
										<tr>
											<td width="8">
											<img src="images/el-ameed_577.gif" width="8" height="9" alt=""></td>
											<td background="images/el-ameed_55.gif">
											</td>
											<td width="8">
											<img src="images/el-ameed_54.gif" width="8" height="9" alt=""></td>
										</tr>
									</table>
									</td>
								</tr>
								<tr>
									<td>&nbsp;</td>
									<td>&nbsp;</td>
								</tr>
								<tr>
									<td>&nbsp;</td>
									<td>&nbsp;</td>
								</tr>
							</table>
							</td>
						</tr>
					</table>
					</td>
				</tr>
			</table>
			</td>
		</tr>
		<tr>
			<td>
		<!--#include file="Footer.asp"-->
			</td>
		</tr>
	</table>
</div>

</body>

</html>