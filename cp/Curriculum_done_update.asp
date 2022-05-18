<!-- #include file="portal_Header.asp"-->
	
<head>
	<link type="text/css" rel="Stylesheet" href="style/jquery-ui.css" />
	<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.4.4/jquery.min.js" >
	</script>
	<script type="text/javascript" src="http://ajax.microsoft.com/ajax/jquery.ui/1.8.6/jquery-ui.min.js" >
	</script>
	<script type="text/javascript">
	$(function () {
	$("#date").datepicker();
	});
	$(function () {
	$("#date1").datepicker();
	});
	</script>
<%
set Conn=server.createobject("ADODB.Connection")
Conn.open ConnString
if session("Department_ID")<>"" then 

	Curric_ID=int(request.querystring("curric_id"))
	set Rs=server.createobject("ADODB.Recordset")
	Rs.open "select * from curriculum_done where ID="&Curric_ID&" " , Conn,1,2
	if not Rs.eof then
		Employee_ID=rs("Employee_ID")
		Department_ID=rs("Department_id")
		Curriculum_Date=rs("Curriculum_Date")
		Educational_level=rs("Educational_level")
		subject=rs("subject")
		done=rs("done")
		Status=rs("Status")
		notes=rs("notes")

		
	else
		response.write "<script>alert('Õ’· Œÿ√ ›Ì ⁄—÷ «·»Ì«‰« ')</script>"
	end if
	
	rs.close
	set rs=nothing
	
end if%>
</head>

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
				<p style="text-align: right">				 ⁄œÌ· «·»Ì«‰«  &gt;
				
				<div align="center">
				
				<script>
				function ValidateData(){
				
					var txtCivil_ID=	document.frmData.txtCivil_id.value;
					var txtAdminPwd= 	document.frmData.txtAdminPwd.value;
					var Validate=		true;
					//var ddlAdminLevel= 	document.frmData.ddlAdminLevel.options[document.frmData.ddlAdminLevel.options.selectedIndex].value
					
					if (txtCivil_id==""){
						document.frmData.txtCivil_id.style.borderColor="red"
						document.frmData.txtCivil_id.style.borderStyle="solid"
						document.frmData.txtCivil_id.style.borderWidth=2
						Validate=false;
					}
					else{
						document.frmData.txtCivil_id.style.clear	
						document.frmData.txtCivil_id.style.borderColor="lightgray"
						document.frmData.txtCivil_id.style.borderStyle="solid"
						document.frmData.txtCivil_id.style.borderWidth=1									
					}
						
					
					if (Validate==false){
						return false;
					}

							
				}
				</script>
					<form action="Curriculum_done_chk.asp" method="post" name="frmData" id="frmData" onsubmit="return ValidateData()"  enctype="multipart/form-data">
						<input type="hidden" name="txtID" value="<%=Curric_ID%>">
						<input type="hidden" name="txthdnDptID" value="<%=Department_ID%>">
						<input type="hidden" name="txtProcType" value="edit">
						
						<table class="tblDataControl" cellpadding="3" cellspacing="0" dir="rtl">
							<thead>
								<td colspan="2" class="tdHeadDataControl">
								 ⁄œÌ·</td>
							</thead>
							<tr>
								<td class="tdDataControlL">«·’›</td>
								<td class="tdDataControlR">
																
								<select size="1" name="txtEducational_level" class="select">
										<%									
										set Rs=conn.execute("Select * from Class_room")
										while not rs.eof
										%>
														<option value="<%=rs("Class_room")%>" <%if rs("class_room")=Educational_level then%> selected <%End if%>><%=Rs("Class_room")%></option>
										<%
											rs.movenext
										wend
										set rs=nothing
										%>
										
								
									</select>
								
								</td>
							</tr>
							<tr>
								<td class="tdDataControlL">⁄‰Ê«‰ «·œ—”</td>
								<td class="tdDataControlR">
								<input type="text" name="txtSubject" value="<%=subject%>" class="textBox"></td>
							</tr>
							<tr>
								<td class="tdDataControlL">«”„ «·„⁄·„</td>
								<td class="tdDataControlR">
									<select size="1" name="txtEmployee_ID" class="select">
										<%									
										set Rrs=conn.execute("Select * from Employees where Department_ID="&Department_ID&"")
										while not rrs.eof
										%>
														<option value="<%=rrs("Employee_ID")%>" <%if Employee_ID=rrs("Employee_ID") then%> selected<%End if%>><%=Rrs("Employee_Name")%></option>
										<%
											Employee_Name= rrs("Employee_Name")
											rrs.movenext
										wend
										set rrs=nothing
										%>
										
								
									</select></td>
							</tr>
							<tr>
								<td class="tdDataControlL">«·Õ«·…</td>
								<td class="tdDataControlR">
									<select size="1" name="txtStatus" class="select">
										
														<option value="„ ›ﬁ" <%if status="„ ›ﬁ" then%> selected<%end if%>>„ ›ﬁ</option>
														<option value="„ √Œ—" <%if status="„ √Œ—" then%> selected<%end if%>>„ √Œ—</option>
									
								
									</select></td>
							</tr>
							<tr>
								<td class="tdDataControlL"> „ «· œ—Ì”</td>
								<td class="tdDataControlR">
								<input type="checkbox" name="CDone" value="ON" <%if done="ON" then%> checked<%end if%>></td>
							</tr>
							<tr>
								<td class="tdDataControlL"> «—ÌŒ </td>
								<td class="tdDataControlR">
								<input  id="date" type="text" name="txtCurriculum_Date" value="<%=Curriculum_Date%>" class="textBox"></td>
							</tr>
							<tr>
								<td class="tdDataControlL" valign="top">
								„·«ÕŸ« </td>
								<td class="tdDataControlR">
									<textarea name="txtnotes" id="txtDescEN" rows="3" cols="20"><%=notes%></textarea></td>
							</tr>
							<tr>
								<td class="tdDataControlL">&nbsp;</td>
								<td>
								<input type="submit" value="Õ›Ÿ «·»Ì«‰« " name="tbnSubmit" class="button"> </td>
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
				<p style="text-align: right">				 ⁄œÌ· «·»Ì«‰«  &gt;
				
				<div align="center">
				
				<script>
				function ValidateData(){
				
					var txtCivil_ID=	document.frmData.txtCivil_id.value;
					var txtAdminPwd= 	document.frmData.txtAdminPwd.value;
					var Validate=		true;
					//var ddlAdminLevel= 	document.frmData.ddlAdminLevel.options[document.frmData.ddlAdminLevel.options.selectedIndex].value
					
					if (txtCivil_id==""){
						document.frmData.txtCivil_id.style.borderColor="red"
						document.frmData.txtCivil_id.style.borderStyle="solid"
						document.frmData.txtCivil_id.style.borderWidth=2
						Validate=false;
					}
					else{
						document.frmData.txtCivil_id.style.clear	
						document.frmData.txtCivil_id.style.borderColor="lightgray"
						document.frmData.txtCivil_id.style.borderStyle="solid"
						document.frmData.txtCivil_id.style.borderWidth=1									
					}
						
					
					if (Validate==false){
						return false;
					}

							
				}
				</script>
					<form action="Curriculum_done_chk.asp" method="post" name="frmData" id="frmData" onsubmit="return ValidateData()"  enctype="multipart/form-data">
						<input type="hidden" name="txtID" value="<%=Curric_ID%>">
						<input type="hidden" name="txthdnDptID" value="<%=Department_ID%>">
						<input type="hidden" name="txtProcType" value="edit">
						
						<table class="tblDataControl" cellpadding="3" cellspacing="0" dir="rtl">
							<thead>
								<td colspan="2" class="tdHeadDataControl">
								 ⁄œÌ·</td>
							</thead>
							<tr>
								<td class="tdDataControlL">«·’›</td>
								<td class="tdDataControlR">
																
								<select size="1" name="txtEducational_level0" class="select">
										<%									
										set Rs=conn.execute("Select * from Class_room")
										while not rs.eof
										%>
														<option value="<%=rs("Class_room")%>" <%if rs("class_room")=Educational_level then%> selected <%End if%>><%=Rs("Class_room")%></option>
										<%
											rs.movenext
										wend
										set rs=nothing
										%>
										
								
									</select>
								
								</td>
							</tr>
							<tr>
								<td class="tdDataControlL">⁄‰Ê«‰ «·œ—”</td>
								<td class="tdDataControlR">
								<input type="text" name="txtSubject" value="<%=subject%>" class="textBox"></td>
							</tr>
							<tr>
								<td class="tdDataControlL">«”„ «·„⁄·„</td>
								<td class="tdDataControlR">
									<select size="1" name="txtEmployee_ID" class="select">
										<%									
										set Rrs=conn.execute("Select * from Employees where Department_ID="&Department_ID&"")
										while not rrs.eof
										%>
														<option value="<%=rrs("Employee_ID")%>" <%if Employee_ID=rrs("Employee_ID") then%> selected<%End if%>><%=Rrs("Employee_Name")%></option>
										<%
											Employee_Name= rrs("Employee_Name")
											rrs.movenext
										wend
										set rrs=nothing
										%>
										
								
									</select></td>
							</tr>
							<tr>
								<td class="tdDataControlL">«·Õ«·…</td>
								<td class="tdDataControlR">
									<select size="1" name="txtStatus" class="select">
										
														<option value="„ ›ﬁ" <%if status="„ ›ﬁ" then%> selected<%end if%>>„ ›ﬁ</option>
														<option value="„ √Œ—" <%if status="„ √Œ—" then%> selected<%end if%>>„ √Œ—</option>
									
								
									</select></td>
							</tr>
							<tr>
								<td class="tdDataControlL"> „ «· œ—Ì”</td>
								<td class="tdDataControlR">
								<input type="checkbox" name="CDone" value="ON" <%if done="ON" then%> checked<%end if%>></td>
							</tr>
							<tr>
								<td class="tdDataControlL"> «—ÌŒ </td>
								<td class="tdDataControlR">
								<input  id="date1" type="text" name="txtCurriculum_Date" value="<%=Curriculum_Date%>" class="textBox"></td>
							</tr>
							<tr>
								<td class="tdDataControlL" valign="top">
								„·«ÕŸ« </td>
								<td class="tdDataControlR">
									<textarea class="textarea" name="txtnotes" id="txtDescEN" rows="1" cols="20"><%=notes%></textarea></td>
							</tr>
							<tr>
								<td class="tdDataControlL">&nbsp;</td>
								<td>
								<input type="submit" value="Õ›Ÿ «·»Ì«‰« " name="tbnSubmit" class="button"> </td>
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