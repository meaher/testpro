<!-- #include file="portal_Header_teacher.asp"-->

<%
set Conn=server.createobject("ADODB.Connection")
Conn.open ConnString

if session("Department_ID")<>"" then 

	ADMIN_ID=int(request.querystring("id"))

	set Conn=server.createobject("ADODB.Connection")
	Conn.open ConnString
	set Rs=server.createobject("ADODB.Recordset")
	Rs.open "select * from Employees where Employee_ID="&session("Employee_ID")&" " , Conn,1,2
	if not Rs.eof then
		Password=rs("Password")
		Employee_ID=rs("Employee_ID")
	else
		response.write "<script>alert('Õ’· Œÿ√ ›Ì ⁄—÷ «·»Ì«‰« ')</script>"
	end if
	
	rs.close
	set rs=nothing
	
end if
%>
<body style="text-align: center">
<table class=" w3-left w3-hide-large w3-hover-cyan w3-large w3-theme" border="0" width="100%" id="table1"  style="border-style: solid; background-color: #FFFFFF !important">
				<tr>
					<td>
						
					<table style="width: 98%" cellspacing="0" cellpadding="0">
						
							<tr>
								<td  valign="top" background="images/defaul8.gif">
										<!--#include file="Banner_mobile.asp"-->
								</td>
							</tr>
							<tr>
								<td style="height: 84px" valign="top" background="images/defaul8.gif">
									
					<div align="center">
					<table border="0" width="75%" cellspacing="0" cellpadding="0" dir="rtl">
			<tr>
				<td align="left">
				<font size="5" face="Akhbar MT" color="#0E0584">#<b>⁄Êœ…_»«· “«„</b></font></td>
				<td width="825">
				<img border="0" src="images/homud_Back.jpg" width="207" height="175"><p>&nbsp;</td>
			</tr>
		</table>
										</div>
				</td>
							</tr>
							<tr>
								<td style="height: 84px" valign="top" align="center" background="images/defaul8.gif">
	<table border="0" width="98%" cellspacing="0" cellpadding="0" dir="rtl">
			<tr>
				<td><!-- #include file="portal_menu_teacher.asp"-->				

				<p>&nbsp;</p>
				<p>&nbsp;</td>
				<td width="70%" valign="top">
								<!-- Start Contents -->
				
				<div align="center">
				
					<form action="Teacher_users_chk.asp" method="post" name="frmData" id="frmData" onsubmit="return ValidateData()"  enctype="multipart/form-data">
						<input type="hidden" name="txtEmployeeID" value="<%=Employee_ID%>">
						<input type="hidden" name="txtProcType" value="edit">
						
						<table width="98%" cellpadding="3" cellspacing="0" dir="rtl">
							<thead>
								<td colspan="2" class="tdHeadDataControl">
								 ⁄œÌ·</td>
							</thead>
							<tr>
								<td class="tdDataControlL">
								<p align="left">ﬂ·„… «·”—</td>
								<td class="tdDataControlR">
								<input value="<%=Password%>" type="text" name="txtpassword" class="textBox" onchange="ValidateData()"></td>
							</tr>
							<tr>
								<td class="tdDataControlL">&nbsp;</td>
								<td  class="tdDataControlR">
								<input type="submit" value="Õ›Ÿ «·»Ì«‰« " name="tbnSubmit" class="button">
								<input type="button" value="⁄ÊœÂ ··Œ·›" name="tbnBack" class="button" onclick="document.location='Teacher_portal_main.asp?start=1'"></td>
							</tr>
							</table>
					</form>
				</div>
				<!-- End Contents -->
				

				
</td>
			</tr>
		</table>										<p>&nbsp;</td>
							</tr>
							<tr>
								<td style="height: 84px" valign="bottom" align="center">
						<!--#include file="Footer_mobile.asp"-->

								</td>
							</tr>
						</table>
					</td>
					
				</tr>
			</table>


<table class="w3-hide-medium w3-hide-small" border="0" width="100%"  cellspacing="0" cellpadding="0" style="border-style: solid; background-color: #F9FCFF !important">
	<tr>
	<td>
										<!--#include file="Banner.asp"-->
	</td>
	</tr>
	<tr>
		<td align="center">
		<table border="0" width="100%" cellspacing="0" cellpadding="0" dir="rtl">
			<tr>
				<td align="left">
				<font size="6" face="Akhbar MT" color="#0E0584">#<b>⁄Êœ…_»«· “«„</b></font></td>
				<td width="825">
				<img border="0" src="images/homud_Back.jpg" width="207" height="175"><p>&nbsp;</td>
			</tr>
		</table>
		<table border="0" width="98%" cellspacing="0" cellpadding="0" dir="rtl">
			<tr>
				<td valign="top"><!-- #include file="portal_menu_teacher.asp"-->				
				</td>
				<td width="80%" valign="top">
				<!-- Start Contents -->
				
				<div align="center">
				
					<form action="Teacher_users_chk.asp" method="post" name="frmData" id="frmData" onsubmit="return ValidateData()"  enctype="multipart/form-data">
						<input type="hidden" name="txtEmployeeID" value="<%=Employee_ID%>">
						<input type="hidden" name="txtProcType" value="edit">
						
						<table width="98%" cellpadding="3" cellspacing="0" dir="rtl">
							<thead>
								<td colspan="2" class="tdHeadDataControl">
								 ⁄œÌ·</td>
							</thead>
							<tr>
								<td class="tdDataControlL">
								<p align="left">ﬂ·„… «·”—</td>
								<td class="tdDataControlR">
								<input value="<%=Password%>" type="text" name="txtpassword" class="textBox" onchange="ValidateData()"></td>
							</tr>
							<tr>
								<td class="tdDataControlL">&nbsp;</td>
								<td  class="tdDataControlR">
								<input type="submit" value="Õ›Ÿ «·»Ì«‰« " name="tbnSubmit" class="button">
								<input type="button" value="⁄ÊœÂ ··Œ·›" name="tbnBack" class="button" onclick="document.location='Teacher_portal_main.asp?start=1'"></td>
							</tr>
							</table>
					</form>
				</div>
				<!-- End Contents -->
				
</td>
			</tr>
		</table>
&nbsp;<p>&nbsp;</td>
	</tr>
	<tr>
		<td>
			<!--#include file="Footer.asp"-->
		</td>
	</tr>
</table>

</body>

</html>
<%
conn.close
set conn=nothing
%>