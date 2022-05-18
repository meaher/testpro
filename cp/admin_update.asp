<!-- #include file="portal_Header.asp"-->

<%
set Conn=server.createobject("ADODB.Connection")
Conn.open ConnString

if request.querystring("id")<>"" then 

	ADMIN_ID=int(request.querystring("id"))

	set Conn=server.createobject("ADODB.Connection")
	Conn.open ConnString
	set Rs=server.createobject("ADODB.Recordset")
	Rs.open "select * from ADMIN where ADMIN_ID="&ADMIN_ID&" " , Conn,1,2
	if not Rs.eof then
		ADMIN_ID=rs("ADMIN_ID")
		ADMIN_USER=rs("ADMIN_USER")
		ADMIN_PWD=rs("ADMIN_PWD")
		ADMIN_LEVEL=rs("ADMIN_LEVEL")
		FullName=rs("FullName")
		Position=rs("Position")
		Note=rs("Note")
		Department_id=rs("Department_ID")
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
									
					<!-- #include file="Banner_Page_mob.asp"-->
				</td>
							</tr>
							<tr>
								<td style="height: 84px" valign="top" align="center" background="images/defaul8.gif">
	<table border="0" width="98%" cellspacing="0" cellpadding="0" dir="rtl">
			<tr>
				<td valign="top">
				<!-- #include file="portal_menu.asp"-->				
				<p>&nbsp;</p>
				<p>&nbsp;</td>
				<td width="70%" valign="top">
								<!-- Start Contents -->
				<p style="text-align: right"><a href="admin_list.asp?start=1">
					<span lang="en-us">«·«œ«—…</span></a> &gt;  ⁄œÌ·
				
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
					<form action="admin_chk.asp" method="post" name="frmData" id="frmData" onsubmit="return ValidateData()"  enctype="multipart/form-data">
						<input type="hidden" name="txtAdminID" value="<%=ADMIN_ID%>">
						<input type="hidden" name="txtProcType" value="edit">
						
						<table class="tblDataControl" cellpadding="3" cellspacing="0" dir="rtl">
							<thead>
								<td colspan="2" class="tdHeadDataControl">
								 ⁄œÌ·</td>
							</thead>
							<tr>
								<td class="tdDataControlL">«”„ «·œŒÊ·</td>
								<td class="tdDataControlR"><input  value="<%=ADMIN_USER%>" type="text" name="txtAdminUser" class="textBox" onchange="ValidateData()"></td>
							</tr>
							<tr>
								<td class="tdDataControlL">ﬂ·„… «·”—</td>
								<td class="tdDataControlR">
								<input value="<%=ADMIN_PWD%>" type="text" name="txtAdminPwd" class="textBox" onchange="ValidateData()"></td>
							</tr>
							<tr>
								<td class="tdDataControlL">«”„ «·„ÊŸ›</td>
								<td class="tdDataControlR">
								<input value="<%=FullName%>" type="text" name="txtFullName" class="textBox" onchange="ValidateData()"></td>
							</tr>
							<tr>
								<td class="tdDataControlL">«·„”„Ï «·ÊŸÌ›Ì</td>
								<td class="tdDataControlR">
								<input value="<%=Position%>" type="text" name="txtPosition" class="textBox" onchange="ValidateData()"></td>
							</tr>
							<tr>
								<td class="tdDataControlL">«·’·«ÕÌ« </td>
								<td class="tdDataControlR">
								<select size="1" name="SelectAdminLevel" class="select">
										<option value="1" <%if Admin_Level=1 then%> selected <%End if%>>’·«ÕÌ«  «·„œÌ—</option>
										<option value="2" <%if Admin_Level=2 then%> selected <%End if%>>’·«ÕÌ«  —∆Ì” ﬁ”„</option>
										<option value="3" <%if Admin_Level=3 then%> selected <%End if%>>’·«ÕÌ«  —∆Ì” ﬁ”„ «·Õ«”Ê»</option>
										<option value="4" <%if Admin_Level=4 then%> selected <%End if%>>’·«ÕÌ«  —∆Ì” —∆Ì” «·«‘—«› </option>
										<option value="5" <%if Admin_Level=5 then%> selected <%End if%>>’·«ÕÌ«  —∆Ì” ‘ƒÊ‰ «·ÿ·»…</option>
										<option value="6" <%if Admin_Level=6 then%> selected <%End if%>>’·«ÕÌ«  „‘—› Ã‰«Õ</option>
									</select></td>
							</tr>
							<tr>
								<td class="tdDataControlL">«·ﬁ”„</td>
								<td class="tdDataControlR">
								&nbsp;<%=Department_ID%></td>
							</tr>
							<tr>
								<td class="tdDataControlL">„·«ÕŸ« </td>
								<td class="tdDataControlR">
								<input value="<%=Note%>" type="text" name="txtNote" class="textBox" onchange="ValidateData()"></td>
							</tr>
							<tr>
								<td class="tdDataControlL">&nbsp;</td>
								<td>
								<input type="submit" value="Õ›Ÿ «·»Ì«‰« " name="tbnSubmit" class="button">
								<input type="button" value="⁄ÊœÂ ··Œ·›" name="tbnBack" class="button" onclick="document.location='admin_list.asp?start=1'"></td>
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
		<!-- #include file="Banner_page.asp"-->				
		<table border="0" width="98%" cellspacing="0" cellpadding="0" dir="rtl">
			<tr>
				<td valign="top">			
				<!-- #include file="portal_menu.asp"-->				
				</td>
				<td width="80%" valign="top">
							<!-- Start Contents -->
				<p style="text-align: right"><a href="admin_list.asp?start=1">
					<span lang="en-us">«·«œ«—…</span></a> &gt;  ⁄œÌ·
				
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
					<form action="admin_chk.asp" method="post" name="frmData" id="frmData" onsubmit="return ValidateData()"  enctype="multipart/form-data">
						<input type="hidden" name="txtAdminID" value="<%=ADMIN_ID%>">
						<input type="hidden" name="txtProcType" value="edit">
						
						<table class="tblDataControl" cellpadding="3" cellspacing="0" dir="rtl">
							<thead>
								<td colspan="2" class="tdHeadDataControl">
								 ⁄œÌ·</td>
							</thead>
							<tr>
								<td class="tdDataControlL">«”„ «·œŒÊ·</td>
								<td class="tdDataControlR"><input  value="<%=ADMIN_USER%>" type="text" name="txtAdminUser" class="textBox" onchange="ValidateData()"></td>
							</tr>
							<tr>
								<td class="tdDataControlL">ﬂ·„… «·”—</td>
								<td class="tdDataControlR">
								<input value="<%=ADMIN_PWD%>" type="text" name="txtAdminPwd" class="textBox" onchange="ValidateData()"></td>
							</tr>
							<tr>
								<td class="tdDataControlL">«”„ «·„ÊŸ›</td>
								<td class="tdDataControlR">
								<input value="<%=FullName%>" type="text" name="txtFullName" class="textBox" onchange="ValidateData()"></td>
							</tr>
							<tr>
								<td class="tdDataControlL">«·„”„Ï «·ÊŸÌ›Ì</td>
								<td class="tdDataControlR">
								<input value="<%=Position%>" type="text" name="txtPosition" class="textBox" onchange="ValidateData()"></td>
							</tr>
							<tr>
								<td class="tdDataControlL">«·’·«ÕÌ« </td>
								<td class="tdDataControlR">
								<select size="1" name="SelectAdminLevel" class="select">
										<option value="1" <%if Admin_Level=1 then%> selected <%End if%>>’·«ÕÌ«  «·„œÌ—</option>
										<option value="2" <%if Admin_Level=2 then%> selected <%End if%>>’·«ÕÌ«  —∆Ì” ﬁ”„</option>
										<option value="3" <%if Admin_Level=3 then%> selected <%End if%>>’·«ÕÌ«  —∆Ì” ﬁ”„ «·Õ«”Ê»</option>
										<option value="4" <%if Admin_Level=4 then%> selected <%End if%>>’·«ÕÌ«  —∆Ì” —∆Ì” «·«‘—«› </option>
										<option value="5" <%if Admin_Level=5 then%> selected <%End if%>>’·«ÕÌ«  —∆Ì” ‘ƒÊ‰ «·ÿ·»…</option>
										<option value="6" <%if Admin_Level=6 then%> selected <%End if%>>’·«ÕÌ«  „‘—› Ã‰«Õ</option>
									</select></td>
							</tr>
							<tr>
								<td class="tdDataControlL">«·ﬁ”„</td>
								<td class="tdDataControlR">
								&nbsp;<%=Department_ID%></td>
							</tr>
							<tr>
								<td class="tdDataControlL">„·«ÕŸ« </td>
								<td class="tdDataControlR">
								<input value="<%=Note%>" type="text" name="txtNote" class="textBox" onchange="ValidateData()"></td>
							</tr>
							<tr>
								<td class="tdDataControlL">&nbsp;</td>
								<td>
								<input type="submit" value="Õ›Ÿ «·»Ì«‰« " name="tbnSubmit" class="button">
								<input type="button" value="⁄ÊœÂ ··Œ·›" name="tbnBack" class="button" onclick="document.location='admin_list.asp?start=1'"></td>
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