<!-- #include file="portal_Header_teacher.asp"-->
	
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
ID=Request.querystring("id")

if session("Department_ID")<>"" then 
	set Rs=server.createobject("ADODB.Recordset")
	Rs.open "select * from Student_Follow where ID="&ID&" " , Conn,1,2
	if not Rs.eof then
		Std_Civil_ID=rs("Std_Civil_ID")
		Class_Room_ID=rs("Class_Room_ID")
		Subject_id=rs("Subject_id")
		Employee_id=rs("Employee_id")
		Department_id=rs("Department_id")
		Follow_type=rs("Follow_type")
		Class_Degree=rs("Class_Degree")
		Exam_Degree=rs("Exam_Degree")
		sleeping=rs("sleeping")
		study_Tools=rs("study_Tools")
		not_care=rs("not_care")
		Get_out_of_Class=rs("Get_out_of_Class")
		Late_to_class=rs("Late_to_class")
		wrong_behavior=rs("wrong_behavior")
		refusal_instructions=rs("refusal_instructions")
		Class_Participation=rs("Class_Participation")
		Home_work=rs("Home_work")
		Absence=rs("Absence")
		Teamwork=rs("Teamwork")
		Preparing_lessons=rs("Preparing_lessons")
		share=rs("share")
		Responsiveness=rs("Responsiveness")
		Discussion=rs("Discussion")
		Flexibility=rs("Flexibility")
		care_learn=rs("care_learn")
		style=rs("style")
		Care_Study_Tools=rs("Care_Study_Tools")
		notes=rs("notes")
		report_file=rs("report_file")
		report_Date=rs("report_Date")
		Report_Day=rs("Report_Day")
		Report_month=rs("Report_month")
		Report_year=rs("Report_year")
		Event_Date=rs("Event_Date")
		Event_Day=rs("Event_Day")
		Event_Month=rs("Event_Month")
		Event_Year=rs("Event_Year")
	else
		response.write "<script>alert('Õ’· Œÿ√ ›Ì ⁄—÷ «·»Ì«‰« ')</script>"
	end if
	
	rs.close
	set rs=nothing
	
end if

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
				<!-- #include file="portal_menu_teacher.asp"-->				
				<p>&nbsp;</p>
				<p>&nbsp;</td>
				<td width="70%" valign="top">
				<!-- Start Contents -->
				<div class="PageTitle">
					<span lang="ar-kw"> ⁄œÌ·</span> «·„ «»⁄… «·’› <%=request.querystring("Class_Room")%></div>
				
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
				
					<form action="student_Follow_chk.asp" method="post" name="frmData" id="frmData" onsubmit="return ValidateData()"  enctype="multipart/form-data">
						<input type="hidden" name="txtProcType" value="edit">						
						<input type="hidden" name="ID" value="<%=request.querystring("ID")%>">	
						<input type="hidden" name="Class_room" value="<%=request.querystring("Class_Room")%>">						
						<input type="hidden" name="subject_name" value="<%=request.querystring("subject_name")%>">
						<input type="hidden" name="Follow_type" value="<%=Follow_type%>">						
						<table class="tblDataControl" cellpadding="3" cellspacing="0">
							<thead>
								<td colspan="2" class="tdHeadDataControl">
								&nbsp;</td>
							</thead>
							
							<tr>
								<td class="tdDataControlL" width="165">«”„ 
								«·ÿ«·»</td>
								<td class="tdDataControlR" width="74%">
																								
								
								<select size="1" name="Std_Civil_ID" class="select">
								
										<%
																	
											set Rs=conn.execute("Select * from Students where Class_Room_id="&Class_Room_id&"")
											while not rs.eof
										%>
														<option value="<%=rs("Std_Civil_ID")%>" <%if rs("Std_Civil_ID")=Std_Civil_ID then%> selected <%End if%>><%=Rs("Std_Name")%> </option>
										<%					
											rs.movenext
											wend
										set rs=nothing
										%>
										
								
									</select></td>
							</tr>
							<tr>
								<td class="tdDataControlL" width="165">
								<span lang="ar-kw"> «—ÌŒ «·„ «»⁄…</span></td>
								<td class="tdDataControlR" width="74%">
								<input  id="date" type="text" name="Event_Date" class="textBox" value="<%=Event_month&"/"&Event_day&"/"&Event_Year%>">mm/dd/yyyy</td>
							</tr>
					
									
										
											<tr>
								<td class="tdDataControlL" width="165">&nbsp;<span lang="ar-kw">œ—Ã… 
								«·«⁄„«·</span></td>
								<td class="tdDataControlR" width="74%">
																
								<select size="1" name="Class_Degree" class="select">
									<option value="<%=Class_Degree%>"><%=Class_Degree%></option>
									<%for i=1 to 29%>
														<option value="<%=i%>"><%=i%></option>
														<option value="<%=i%>.5"><%=i%>.5</option>
														
									<%next%>
										<option value="30">30</option>
									</select>
								
								</td>
							</tr>
							<tr>
								<td class="tdDataControlL" width="165">&nbsp;<span lang="ar-kw">œ—Ã… 
								«·«Œ »«—</span></td>
								<td class="tdDataControlR" width="74%">
																
									<select size="1" name="Exam_Degree" class="select">
									<option value="<%=Exam_Degree%>"><%=Exam_Degree%></option>
									<%for i=1 to 69%>
														<option value="<%=i%>"><%=i%></option>
														<option value="<%=i%>.5"><%=i%>.5</option>
														
									<%next%>
										<option value="70">70</option>
									</select>
								
								
								</td>
							</tr>
					
									
										
											<tr>
								<td class="tdDataControlL" width="165">&nbsp;</td>
								<td class="tdDataControlR" width="74%">
																
								&nbsp;</td>
							</tr>
					
									
										
							<tr>
								<td class="tdDataControlL" width="165">«·‰Ê„ 
								√À‰«¡ «·Õ’…</td>
								<td class="tdDataControlR" width="74%">
								<input type="checkbox" name="sleeping" value="yes" <%if sleeping= "yes" then%> checked<%end if%>></td>
							</tr>
							<tr>
								<td class="tdDataControlL" width="165">⁄œ„ ≈Õ÷«— 
								«·√œÊ«  «·„œ—”Ì…</td>
								<td class="tdDataControlR" width="74%">
								<input type="checkbox" name="study_Tools" value="yes" <%if study_Tools= "yes" then%> checked<%end if%>></td>
							</tr>
							<tr>
								<td class="tdDataControlL" width="165">⁄œ„ 
								«·«‰ »«Â </td>
								<td class="tdDataControlR" width="74%">
								<input type="checkbox" name="not_care" value="yes" <%if not_care= "yes" then%> checked<%end if%>></td>
							</tr>
							<tr>
								<td class="tdDataControlL" width="165">«·Œ—ÊÃ „‰ 
								«·›’· œÊ‰ «–‰</td>
								<td class="tdDataControlR" width="74%">
								<input type="checkbox" name="Get_out_of_Class" value="yes" <%if Get_out_of_Class= "yes" then%> checked<%end if%>></td>
							</tr>
							<tr>
								<td class="tdDataControlL" width="165">«· √Œ— ⁄‰ 
								«·Õ’…</td>
								<td class="tdDataControlR" width="74%">
								<input type="checkbox" name="Late_to_class" value="yes" <%if Late_to_class= "yes" then%> checked<%end if%>></td>
							</tr>
							<tr>
								<td class="tdDataControlL" width="165">”·Êﬂ ”Ì¡</td>
								<td class="tdDataControlR" width="74%">
								<input type="checkbox" name="wrong_behavior" value="yes" <%if wrong_behavior= "yes" then%> checked<%end if%>></td>
							</tr>
							<tr>
								<td class="tdDataControlL" width="165">⁄œ„ 
								«· ﬁÌœ »«· ⁄·Ì„« </td>
								<td class="tdDataControlR" width="74%">
								<input type="checkbox" name="refusal_instructions" value="yes" <%if refusal_instructions= "yes" then%> checked<%end if%>></td>
							</tr>
							<tr>
								<td class="tdDataControlL" width="139">«·„‘«—ﬂ… 
								«·’›Ì…</td>
								<td class="tdDataControlR" width="84%">
								<input type="checkbox" name="Class_Participation" value="yes" <%if Class_Participation= "yes" then%> checked<%end if%>></td>
							</tr>
							<tr>
								<td class="tdDataControlL" width="139">«·Ê«Ã»«  
								«·„‰“·Ì…</td>
								<td class="tdDataControlR" width="84%">
								<input type="checkbox" name="Home_work" value="yes" <%if Home_work= "yes" then%> checked<%end if%>></td>
							</tr>
							<tr>
								<td class="tdDataControlL" width="139">ﬂÀ—… «·€Ì«»</td>
								<td class="tdDataControlR" width="84%">
								<input type="checkbox" name="Absence" value="yes" <%if Absence= "yes" then%> checked<%end if%>></td>
							</tr>
							<tr>
								<td class="tdDataControlL" width="165">
								<span lang="ar-kw">«·≈Ã—«¡ «·„ Œ–</span></td>
								<td class="tdDataControlR" width="74%">
									<textarea name="notes" id="txtDescEN" rows="5" cols="35"><%=notes%></textarea></td>
							</tr>
							<tr>
								<td class="tdDataControlL" width="165">—›⁄  ﬁ—Ì— 
								Ê—ﬁÌ</td>
								<td class="tdDataControlR" width="74%">
									<input type="hidden" value="<%=Report_file%>" name="txtHdnImg">

								<input type=file  name="txtImg" class="textBox" size="35"><%if Report_file <> "" then%><a href="/report_file/<%=Report_file%>">⁄—÷ 
									«·„·›</a><%end if%></td>
							</tr>
					
									
										
											<tr>
								<td class="tdDataControlL" width="165">&nbsp;</td>
								<td class="tdDataControlR" width="74%">
								&nbsp;</td>
							</tr>
					
												<tr>
													<td class="tdDataControlL" width="165">&nbsp;</td>
													<td class="tdDataControlR" width="74%">
																		
													<input type="submit" value=" ⁄œÌ· «·»Ì«‰« " name="tbnSubmit" class="button">
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
				<!-- #include file="portal_menu_teacher.asp"-->				
				</td>
				<td width="80%" valign="top">
				<!-- Start Contents -->
				<div class="PageTitle">
					<span lang="ar-kw"> ⁄œÌ·</span> «·„ «»⁄… «·’› <%=request.querystring("Class_Room")%></div>
				
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
				
					<form action="student_Follow_chk.asp" method="post" name="frmData" id="frmData" onsubmit="return ValidateData()"  enctype="multipart/form-data">
						<input type="hidden" name="txtProcType" value="edit">						
						<input type="hidden" name="ID" value="<%=request.querystring("ID")%>">	
						<input type="hidden" name="Class_room" value="<%=request.querystring("Class_Room")%>">						
						<input type="hidden" name="subject_name" value="<%=request.querystring("subject_name")%>">
						<input type="hidden" name="Follow_type" value="<%=Follow_type%>">						
						<table class="tblDataControl" cellpadding="3" cellspacing="0">
							<thead>
								<td colspan="2" class="tdHeadDataControl">
								&nbsp;</td>
							</thead>
							
							<tr>
								<td class="tdDataControlL" width="165">«”„ 
								«·ÿ«·»</td>
								<td class="tdDataControlR" width="74%">
																								
								
								<select size="1" name="Std_Civil_ID" class="select">
								
										<%
																	
											set Rs=conn.execute("Select * from Students where Class_Room_id="&Class_Room_id&"")
											while not rs.eof
										%>
														<option value="<%=rs("Std_Civil_ID")%>" <%if rs("Std_Civil_ID")=Std_Civil_ID then%> selected <%End if%>><%=Rs("Std_Name")%> </option>
										<%					
											rs.movenext
											wend
										set rs=nothing
										%>
										
								
									</select></td>
							</tr>
							<tr>
								<td class="tdDataControlL" width="165">
								<span lang="ar-kw"> «—ÌŒ «·„ «»⁄…</span></td>
								<td class="tdDataControlR" width="74%">
								<input  id="date1" type="text" name="Event_Date" class="textBox" value="<%=Event_month&"/"&Event_day&"/"&Event_Year%>">mm/dd/yyyy</td>
							</tr>
					
									
										
											<tr>
								<td class="tdDataControlL" width="165">&nbsp;<span lang="ar-kw">œ—Ã… 
								«·«⁄„«·</span></td>
								<td class="tdDataControlR" width="74%">
																
								<select size="1" name="Class_Degree" class="select">
									<option value="<%=Class_Degree%>"><%=Class_Degree%></option>
									<%for i=1 to 29%>
														<option value="<%=i%>"><%=i%></option>
														<option value="<%=i%>.5"><%=i%>.5</option>
														
									<%next%>
										<option value="30">30</option>
									</select>
								
								</td>
							</tr>
							<tr>
								<td class="tdDataControlL" width="165">&nbsp;<span lang="ar-kw">œ—Ã… 
								«·«Œ »«—</span></td>
								<td class="tdDataControlR" width="74%">
																
									<select size="1" name="Exam_Degree" class="select">
									<option value="<%=Exam_Degree%>"><%=Exam_Degree%></option>
									<%for i=1 to 69%>
														<option value="<%=i%>"><%=i%></option>
														<option value="<%=i%>.5"><%=i%>.5</option>
														
									<%next%>
										<option value="70">70</option>
									</select>
								</td>
							</tr>
					
									
										
											<tr>
								<td class="tdDataControlL" width="165">&nbsp;</td>
								<td class="tdDataControlR" width="74%">
																
								&nbsp;</td>
							</tr>
					
									
										
							<tr>
								<td class="tdDataControlL" width="165">«·‰Ê„ 
								√À‰«¡ «·Õ’…</td>
								<td class="tdDataControlR" width="74%">
								<input type="checkbox" name="sleeping" value="yes" <%if sleeping= "yes" then%> checked<%end if%>></td>
							</tr>
							<tr>
								<td class="tdDataControlL" width="165">⁄œ„ ≈Õ÷«— 
								«·√œÊ«  «·„œ—”Ì…</td>
								<td class="tdDataControlR" width="74%">
								<input type="checkbox" name="study_Tools" value="yes" <%if study_Tools= "yes" then%> checked<%end if%>></td>
							</tr>
							<tr>
								<td class="tdDataControlL" width="165">⁄œ„ 
								«·«‰ »«Â </td>
								<td class="tdDataControlR" width="74%">
								<input type="checkbox" name="not_care" value="yes" <%if not_care= "yes" then%> checked<%end if%>></td>
							</tr>
							<tr>
								<td class="tdDataControlL" width="165">«·Œ—ÊÃ „‰ 
								«·›’· œÊ‰ «–‰</td>
								<td class="tdDataControlR" width="74%">
								<input type="checkbox" name="Get_out_of_Class" value="yes" <%if Get_out_of_Class= "yes" then%> checked<%end if%>></td>
							</tr>
							<tr>
								<td class="tdDataControlL" width="165">«· √Œ— ⁄‰ 
								«·Õ’…</td>
								<td class="tdDataControlR" width="74%">
								<input type="checkbox" name="Late_to_class" value="yes" <%if Late_to_class= "yes" then%> checked<%end if%>></td>
							</tr>
							<tr>
								<td class="tdDataControlL" width="165">”·Êﬂ ”Ì¡</td>
								<td class="tdDataControlR" width="74%">
								<input type="checkbox" name="wrong_behavior" value="yes" <%if wrong_behavior= "yes" then%> checked<%end if%>></td>
							</tr>
							<tr>
								<td class="tdDataControlL" width="165">⁄œ„ 
								«· ﬁÌœ »«· ⁄·Ì„« </td>
								<td class="tdDataControlR" width="74%">
								<input type="checkbox" name="refusal_instructions" value="yes" <%if refusal_instructions= "yes" then%> checked<%end if%>></td>
							</tr>
							<tr>
								<td class="tdDataControlL" width="139">«·„‘«—ﬂ… 
								«·’›Ì…</td>
								<td class="tdDataControlR" width="84%">
								<input type="checkbox" name="Class_Participation" value="yes" <%if Class_Participation= "yes" then%> checked<%end if%>></td>
							</tr>
							<tr>
								<td class="tdDataControlL" width="139">«·Ê«Ã»«  
								«·„‰“·Ì…</td>
								<td class="tdDataControlR" width="84%">
								<input type="checkbox" name="Home_work" value="yes" <%if Home_work= "yes" then%> checked<%end if%>></td>
							</tr>
							<tr>
								<td class="tdDataControlL" width="139">ﬂÀ—… «·€Ì«»</td>
								<td class="tdDataControlR" width="84%">
								<input type="checkbox" name="Absence" value="yes" <%if Absence= "yes" then%> checked<%end if%>></td>
							</tr>
							<tr>
								<td class="tdDataControlL" width="165">
								<span lang="ar-kw">«·≈Ã—«¡ «·„ Œ–</span></td>
								<td class="tdDataControlR" width="74%">
									<textarea class="textarea" name="notes" id="txtDescEN" rows="5" cols="90%"><%=notes%></textarea></td>
							</tr>
							<tr>
								<td class="tdDataControlL" width="165">—›⁄  ﬁ—Ì— 
								Ê—ﬁÌ</td>
								<td class="tdDataControlR" width="74%">
									<input type="hidden" value="<%=Report_file%>" name="txtHdnImg">

								<input type=file  name="txtImg" class="textBox" size="35"><%if Report_file <> "" then%><a href="/report_file/<%=Report_file%>">⁄—÷ 
									«·„·›</a><%end if%></td>
							</tr>
					
									
										
											<tr>
								<td class="tdDataControlL" width="165">&nbsp;</td>
								<td class="tdDataControlR" width="74%">
								&nbsp;</td>
							</tr>
					
												<tr>
													<td class="tdDataControlL" width="165">&nbsp;</td>
													<td class="tdDataControlR" width="74%">
																		
													<input type="submit" value=" ⁄œÌ· «·»Ì«‰« " name="tbnSubmit" class="button">
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