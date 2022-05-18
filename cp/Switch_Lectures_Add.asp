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
	<script type="text/javascript">
	$(function () {
	$("#date2").datepicker();
	});
	$(function () {
	$("#date3").datepicker();
	});
	</script>
<%
set Conn=server.createobject("ADODB.Connection")
Conn.open ConnString
Department_ID=Request.querystring("ID")
%>
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
				<div class="PageTitle">
					<p>
					 »œÌ· «·Õ’’ &gt; «÷«›…</div>
				<div class="ErrMsg">
				<%
				if session("Errmsg")<> "" then 
					response.write  session("Errmsg")
					session("Errmsg")=""
				end if
				%>						
				</div>
				<div align="center">
				
				<script>
				function ValidateData(){
				/*
					var txtGroupAr=	document.frmData.txtGroupAr.value;
					var txtTitle= document.frmData.txtTitle.value;
					var txtImg= 	document.frmData.txtImg.value;
					var Validate=	true;
					
					
					if (txtGroupAr==""){
						document.frmData.txtGroupAr.style.borderColor="red"
						document.frmData.txtGroupAr.style.borderStyle="solid"
						document.frmData.txtGroupAr.style.borderWidth=2
						Validate=false;
					}
					else{
						document.frmData.txtGroupAr.style.clear	
						document.frmData.txtGroupAr.style.borderColor="lightgray"
						document.frmData.txtGroupAr.style.borderStyle="solid"
						document.frmData.txtGroupAr.style.borderWidth=1									
					}
						
					if (txtTitle==""){
						document.frmData.txtTitle.style.borderColor="red"
						document.frmData.txtTitle.style.borderStyle="solid"
						document.frmData.txtTitle.style.borderWidth=2
						Validate=false;
					}			
					else{
						document.frmData.txtTitle.style.borderColor="lightgray"
						document.frmData.txtTitle.style.borderStyle="solid"
						document.frmData.txtTitle.style.borderWidth=1
					}
					
					
					if (txtImg==""){
						document.frmData.txtImg.style.borderColor="red"
						document.frmData.txtImg.style.borderStyle="solid"
						document.frmData.txtImg.style.borderWidth=2
						Validate=false;
					}			
					else{
						document.frmData.txtImg.style.borderColor="lightgray"
						document.frmData.txtImg.style.borderStyle="solid"
						document.frmData.txtImg.style.borderWidth=1
					}					
					
					if (Validate==false){
						return false;
					}
					*/
					var Validate=	true;
				}
				</script>
					<form action="Switch_Lectures_chk.asp" method="post" name="frmData" id="frmData" onsubmit="return ValidateData()"  enctype="multipart/form-data">
						<input type="hidden" name="txtProcType" value="add">						
						<input type="hidden" name="First_Department_id" value="<%=Department_id%>">						
						<table class="tblDataControl" cellpadding="3" cellspacing="0">
							<thead>
								<td colspan="2" class="tdHeadDataControl">
								«÷«›…</td>
							</thead>
							<tr>
								<td class="tdDataControlL">«· «—ÌŒ</td>
								<td class="tdDataControlR">
								&nbsp;<%=DAY(Date())&"/"&Month(Date())&"/"&Year(Date())%></td>
							</tr>
							<tr>
								<td class="tdDataControlL">«·„«œ…</td>
								<td class="tdDataControlR">
								
						<select size="1" name="First_Subject_ID" class="select">
							<option Value="0">«Œ — «·„«œ…</option>
										<%									
										set Rssd=conn.execute("Select * from Subjects where Department_ID="&Department_id&"")
										while not rssd.eof
										%>
														<option value="<%=rssd("Subject_id")%>"><%=Rssd("Subject_Name")%></option>
										<%
											rssd.movenext
										wend
										set rssd=nothing
										%>
						</select>
								</td>
							</tr>
							<tr>
								<td class="tdDataControlL">«·„⁄·„</td>
								<td class="tdDataControlR">
																						
								
								<select size="1" name="First_Employee_ID" class="select">
										<%									
										set Rs=conn.execute("Select * from Employees Where Department_ID="&Request.Querystring("id")&"")
										while not rs.eof
										%>
														<option value="<%=rs("Employee_ID")%>"><%=Rs("Employee_Name")%></option>
										<%
											Employee_Name= rs("Employee_Name")
											rs.movenext
										wend
										set rs=nothing
										%>
										
								
									</select></td>
							</tr>
							<tr>
								<td class="tdDataControlL">«·’›</td>
								<td class="tdDataControlR">
																								
								<select size="1" name="First_Class_room_id" class="select">
										<%									
										set Rs=conn.execute("Select * from Class_room order by class_room_id asc")
										while not rs.eof
										%>
														<option value="<%=rs("Class_room_id")%>"><%=Rs("Class_room")%></option>
										<%
											rs.movenext
										wend
										set rs=nothing
										%>
										
								
									</select></td>
							</tr>
							<tr>
								<td class="tdDataControlL"> «—ÌŒ «·Õ’…</td>
								<td class="tdDataControlR">
								<input  id="date" type="text" name="First_Lecture_Date" class="textBox"></td>
							</tr>
							<tr>
								<td class="tdDataControlL">«·Õ’…</td>
								<td class="tdDataControlR">
																								
								<select size="1" name="First_Lecture_Time_id" class="select">
										<%									
										set Rs=conn.execute("Select * from Lectures_Time")
										while not rs.eof
										%>
														<option value="<%=rs("Lecture_Time_id")%>"><%=Rs("Lecture_Time_name")%></option>
										<%
											rs.movenext
										wend
										set rs=nothing
										%>
										
								
									</select></td>
							</tr>
							<tr>
								<td class="tdDataControlL">&nbsp;</td>
								<td class="tdDataControlR">
								&nbsp;</td>
							</tr>
							<tr>
								<td class="tdDataControlL">«·ﬁ”„ «·„Œ«ÿ»</td>
								<td class="tdDataControlR">
					<select size="1" name="Second_Department_id" class="select">
						<option Value="0">«Œ — «·ﬁ”„</option>
										<%									
										set Rssd=conn.execute("Select * from Departments where Department_Type='B'")
										while not rssd.eof
										%>
														<option value="<%=rssd("Department_id")%>"><%=Rssd("Department_Name")%></option>
										<%
											rssd.movenext
										wend
										set rssd=nothing
										%>
					</select>
								</td>
							</tr>
							<tr>
								<td class="tdDataControlL">«·„«œ…</td>
								<td class="tdDataControlR">
																														
								
								<select size="1" name="Second_Subject_ID" class="select">
							<option Value="0">«Œ — «·„«œ…</option>
										<%									
										set Rssd=conn.execute("Select * from Subjects Order By Department_ID Asc")
										while not rssd.eof
										%>
											<%
												set Rsdd=conn.execute("Select * from Departments where Department_id="&Rssd("Department_id")&" Order By Department_ID Asc")
													if not Rsdd.eof then
														Dept_name=Rsdd("Department_name")
													End if
												set rsdd=nothing
											%>
												
														<option value="<%=rssd("Subject_id")%>"><%=Rssd("Subject_Name")%>--<%=Dept_name%></option>
											
										<%
											rssd.movenext
										wend
										set rssd=nothing
										%>
						</select></td>
							</tr>
							<tr>
								<td class="tdDataControlL">«·„⁄·„</td>
								<td class="tdDataControlR">
																														
								
								<select size="1" name="Second_Employee_ID" class="select">
										<%									
										set Rs=conn.execute("Select * from Employees order by Department_id")
										while not rs.eof
										%>
											<%
												set Rsdd=conn.execute("Select * from Departments where Department_id="&Rs("Department_id")&"")
													if not Rsdd.eof then
														Dept_name=Rsdd("Department_name")
													End if
												set rsdd=nothing
											%>

														<option value="<%=rs("Employee_ID")%>"><%=Rs("Employee_Name")%>--<%=Dept_name%></option>
										<%
											rs.movenext
										wend
										set rs=nothing
										%>
										
								
									</select></td>
							</tr>
							<tr>
								<td class="tdDataControlL"> «—ÌŒ «·Õ’…</td>
								<td class="tdDataControlR">
								<input  id="date1" type="text" name="Second_Lecture_Date" class="textBox"></td>
							</tr>
							<tr>
								<td class="tdDataControlL">«·Õ’…</td>
								<td class="tdDataControlR">
																																
								<select size="1" name="Second_Lecture_Time_id" class="select">
										<%									
										set Rs=conn.execute("Select * from Lectures_Time")
										while not rs.eof
										%>
														<option value="<%=rs("Lecture_Time_id")%>"><%=Rs("Lecture_Time_name")%></option>
										<%
											rs.movenext
										wend
										set rs=nothing
										%>
										
								
									</select></td>
							</tr>
							<tr>
								<td class="tdDataControlL">&nbsp;</td>
								<td class="tdDataControlR">
								<input type="submit" value="≈÷«›…" name="tbnSubmit" class="button">
								</td>
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
				<div class="PageTitle">
					<p>
					 »œÌ· «·Õ’’ &gt; «÷«›…</div>
				<div class="ErrMsg">
				<%
				if session("Errmsg")<> "" then 
					response.write  session("Errmsg")
					session("Errmsg")=""
				end if
				%>						
				</div>
				<div align="center">
				
				<script>
				function ValidateData(){
				/*
					var txtGroupAr=	document.frmData.txtGroupAr.value;
					var txtTitle= document.frmData.txtTitle.value;
					var txtImg= 	document.frmData.txtImg.value;
					var Validate=	true;
					
					
					if (txtGroupAr==""){
						document.frmData.txtGroupAr.style.borderColor="red"
						document.frmData.txtGroupAr.style.borderStyle="solid"
						document.frmData.txtGroupAr.style.borderWidth=2
						Validate=false;
					}
					else{
						document.frmData.txtGroupAr.style.clear	
						document.frmData.txtGroupAr.style.borderColor="lightgray"
						document.frmData.txtGroupAr.style.borderStyle="solid"
						document.frmData.txtGroupAr.style.borderWidth=1									
					}
						
					if (txtTitle==""){
						document.frmData.txtTitle.style.borderColor="red"
						document.frmData.txtTitle.style.borderStyle="solid"
						document.frmData.txtTitle.style.borderWidth=2
						Validate=false;
					}			
					else{
						document.frmData.txtTitle.style.borderColor="lightgray"
						document.frmData.txtTitle.style.borderStyle="solid"
						document.frmData.txtTitle.style.borderWidth=1
					}
					
					
					if (txtImg==""){
						document.frmData.txtImg.style.borderColor="red"
						document.frmData.txtImg.style.borderStyle="solid"
						document.frmData.txtImg.style.borderWidth=2
						Validate=false;
					}			
					else{
						document.frmData.txtImg.style.borderColor="lightgray"
						document.frmData.txtImg.style.borderStyle="solid"
						document.frmData.txtImg.style.borderWidth=1
					}					
					
					if (Validate==false){
						return false;
					}
					*/
					var Validate=	true;
				}
				</script>
					<form action="Switch_Lectures_chk.asp" method="post" name="frmData" id="frmData" onsubmit="return ValidateData()"  enctype="multipart/form-data">
						<input type="hidden" name="txtProcType" value="add">						
						<input type="hidden" name="First_Department_id" value="<%=Department_id%>">						
						<table class="tblDataControl" cellpadding="3" cellspacing="0">
							<thead>
								<td colspan="2" class="tdHeadDataControl">
								«÷«›…</td>
							</thead>
							<tr>
								<td class="tdDataControlL">«· «—ÌŒ</td>
								<td class="tdDataControlR">
								&nbsp;<%=DAY(Date())&"/"&Month(Date())&"/"&Year(Date())%></td>
							</tr>
							<tr>
								<td class="tdDataControlL">«·„«œ…</td>
								<td class="tdDataControlR">
								
						<select size="1" name="First_Subject_ID" class="select">
							<option Value="0">«Œ — «·„«œ…</option>
										<%									
										set Rssd=conn.execute("Select * from Subjects where Department_ID="&Department_id&"")
										while not rssd.eof
										%>
														<option value="<%=rssd("Subject_id")%>"><%=Rssd("Subject_Name")%></option>
										<%
											rssd.movenext
										wend
										set rssd=nothing
										%>
						</select>
								</td>
							</tr>
							<tr>
								<td class="tdDataControlL">«·„⁄·„</td>
								<td class="tdDataControlR">
																						
								
								<select size="1" name="First_Employee_ID" class="select">
										<%									
										set Rs=conn.execute("Select * from Employees Where Department_ID="&Request.Querystring("id")&"")
										while not rs.eof
										%>
														<option value="<%=rs("Employee_ID")%>"><%=Rs("Employee_Name")%></option>
										<%
											Employee_Name= rs("Employee_Name")
											rs.movenext
										wend
										set rs=nothing
										%>
										
								
									</select></td>
							</tr>
							<tr>
								<td class="tdDataControlL">«·’›</td>
								<td class="tdDataControlR">
																								
								<select size="1" name="First_Class_room_id" class="select">
										<%									
										set Rs=conn.execute("Select * from Class_room order by class_room_id asc")
										while not rs.eof
										%>
														<option value="<%=rs("Class_room_id")%>"><%=Rs("Class_room")%></option>
										<%
											rs.movenext
										wend
										set rs=nothing
										%>
										
								
									</select></td>
							</tr>
							<tr>
								<td class="tdDataControlL"> «—ÌŒ «·Õ’…</td>
								<td class="tdDataControlR">
								<input  id="date2" type="text" name="First_Lecture_Date" class="textBox"></td>
							</tr>
							<tr>
								<td class="tdDataControlL">«·Õ’…</td>
								<td class="tdDataControlR">
																								
								<select size="1" name="First_Lecture_Time_id" class="select">
										<%									
										set Rs=conn.execute("Select * from Lectures_Time")
										while not rs.eof
										%>
														<option value="<%=rs("Lecture_Time_id")%>"><%=Rs("Lecture_Time_name")%></option>
										<%
											rs.movenext
										wend
										set rs=nothing
										%>
										
								
									</select></td>
							</tr>
							<tr>
								<td class="tdDataControlL">&nbsp;</td>
								<td class="tdDataControlR">
								&nbsp;</td>
							</tr>
							<tr>
								<td class="tdDataControlL">«·ﬁ”„ «·„Œ«ÿ»</td>
								<td class="tdDataControlR">
					<select size="1" name="Second_Department_id" class="select">
						<option Value="0">«Œ — «·ﬁ”„</option>
										<%									
										set Rssd=conn.execute("Select * from Departments where Department_Type='B'")
										while not rssd.eof
										%>
														<option value="<%=rssd("Department_id")%>"><%=Rssd("Department_Name")%></option>
										<%
											rssd.movenext
										wend
										set rssd=nothing
										%>
					</select>
								</td>
							</tr>
							<tr>
								<td class="tdDataControlL">«·„«œ…</td>
								<td class="tdDataControlR">
																														
								
								<select size="1" name="Second_Subject_ID" class="select">
							<option Value="0">«Œ — «·„«œ…</option>
										<%									
										set Rssd=conn.execute("Select * from Subjects Order By Department_ID Asc")
										while not rssd.eof
										%>
											<%
												set Rsdd=conn.execute("Select * from Departments where Department_id="&Rssd("Department_id")&" Order By Department_ID Asc")
													if not Rsdd.eof then
														Dept_name=Rsdd("Department_name")
													End if
												set rsdd=nothing
											%>
												
														<option value="<%=rssd("Subject_id")%>"><%=Rssd("Subject_Name")%>--<%=Dept_name%></option>
											
										<%
											rssd.movenext
										wend
										set rssd=nothing
										%>
						</select></td>
							</tr>
							<tr>
								<td class="tdDataControlL">«·„⁄·„</td>
								<td class="tdDataControlR">
																														
								
								<select size="1" name="Second_Employee_ID" class="select">
										<%									
										set Rs=conn.execute("Select * from Employees order by Department_id")
										while not rs.eof
										%>
											<%
												set Rsdd=conn.execute("Select * from Departments where Department_id="&Rs("Department_id")&"")
													if not Rsdd.eof then
														Dept_name=Rsdd("Department_name")
													End if
												set rsdd=nothing
											%>

														<option value="<%=rs("Employee_ID")%>"><%=Rs("Employee_Name")%>--<%=Dept_name%></option>
										<%
											rs.movenext
										wend
										set rs=nothing
										%>
										
								
									</select></td>
							</tr>
							<tr>
								<td class="tdDataControlL"> «—ÌŒ «·Õ’…</td>
								<td class="tdDataControlR">
								<input  id="date3" type="text" name="Second_Lecture_Date" class="textBox"></td>
							</tr>
							<tr>
								<td class="tdDataControlL">«·Õ’…</td>
								<td class="tdDataControlR">
																																
								<select size="1" name="Second_Lecture_Time_id" class="select">
										<%									
										set Rs=conn.execute("Select * from Lectures_Time")
										while not rs.eof
										%>
														<option value="<%=rs("Lecture_Time_id")%>"><%=Rs("Lecture_Time_name")%></option>
										<%
											rs.movenext
										wend
										set rs=nothing
										%>
										
								
									</select></td>
							</tr>
							<tr>
								<td class="tdDataControlL">&nbsp;</td>
								<td class="tdDataControlR">
								<input type="submit" value="≈÷«›…" name="tbnSubmit" class="button">
								</td>
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