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
ID=Request.querystring("id")

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
		Managment_Notes=rs("Managment_Notes")
	else
		response.write "<script>alert('Õ’· Œÿ√ ›Ì ⁄—÷ «·»Ì«‰« ')</script>"
	end if
	
	rs.close
	set rs=nothing
	

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
					<span lang="ar-kw">„ «»⁄…</span>
					<span lang="ar-kw">«·ÿ«·»</span> <%=request.querystring("std_name")%> «·’›<%=request.querystring("Class_Room")%></div>
				
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
				
					<form action="student_Follow_Department_chk.asp" method="post" name="frmData" id="frmData" onsubmit="return ValidateData()"  enctype="multipart/form-data">
						<input type="hidden" name="txtProcType" value="edit">						
						<input type="hidden" name="ID" value="<%=request.querystring("ID")%>">	
						<input type="hidden" name="Class_room" value="<%=request.querystring("Class_Room")%>">						
						<input type="hidden" name="Class_room_id" value="<%=Class_room_id%>">		
						<input type="hidden" name="page" value="<%=request.querystring("page")%>">	
						<input type="hidden" name="Follow_type" value="<%=Follow_type%>">
						<input type="hidden" name="DeptID" value="<%=request.querystring("DeptID")%>">
						<input type="hidden" name="Dept_Name" value="<%=request.querystring("Dept_Name")%>">

				
				<table class="tblDataControl" cellpadding="3" cellspacing="0">
							<thead>
								<td colspan="2" class="tdHeadDataControl">
								&nbsp;</td>
							</thead>
							
							<tr>
								<td class="tdDataControlL" width="165">«”„ 
								«·ÿ«·»</td>
								<td class="tdDataControlR" width="74%">
																								
								
								
										<%
																	
											set Rs=conn.execute("Select * from Students where Std_Civil_ID='"&Std_Civil_ID&"'")
											if not rs.eof then
										%>
												<%=Rs("Std_Name")%>
										<%		
										Std_Name=Rs("Std_Name")			
											end if
										set rs=nothing
										%>
										
								
									</td>
							</tr>
							<tr>
								<td class="tdDataControlL" width="165">
								<span lang="ar-kw"> «—ÌŒ «·„ «»⁄…</span></td>
								<td class="tdDataControlR" width="74%">
								<%=Event_Day&"/"&Event_Month&"/"&Event_Year%></td>
							</tr>
							<tr>
								<td class="tdDataControlL" width="165">&nbsp;<span lang="ar-kw">«·ﬁ”„</span></td>
								<td class="tdDataControlR" width="74%">
																
								<%=Request.QueryString("DeptName")%>								</td>
							</tr>
							<tr>
								<td class="tdDataControlL" width="165">
								<span lang="ar-kw">«·„«œ…</span></td>
								<td class="tdDataControlR" width="74%">
																
								<%
																	
											set Rs=conn.execute("Select * from Subjects where Subject_ID="&Subject_ID&"")
											if not rs.eof then
										%>
												<%=Rs("Subject_Name")%>
										<%		
										'Std_Name=Rs("Std_Name")			
											end if
										set rs=nothing
										%>
								</td>
							</tr>
							<tr>
								<td class="tdDataControlL" width="165">
								<span lang="ar-kw">«”„ «·„⁄·„</span></td>
								<td class="tdDataControlR" width="74%">
																
								&nbsp;
										<%
											set Rss=conn.execute("Select * from Employees where Employee_ID="&Employee_ID&"")
											if not rss.eof then
										%>
												<%=Rss("Employee_Name")%>
										<%					
											end if
										set rss=nothing
										%>

								</td>
							</tr>
							<tr>
								<td class="tdDataControlL" width="165">&nbsp;<span lang="ar-kw">œ—Ã… 
								«·«⁄„«·</span></td>
								<td class="tdDataControlR" width="74%">
																
								<%=Class_Degree%>
								</td>
							</tr>
							<tr>
								<td class="tdDataControlL" width="165">&nbsp;<span lang="ar-kw">œ—Ã… 
								«·«Œ »«—</span></td>
								<td class="tdDataControlR" width="74%">
																
									<%=Exam_Degree%>
								
								
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
								<%if sleeping= "yes" then%> ‰⁄„<%end if%></td>
							</tr>
							<tr>
								<td class="tdDataControlL" width="165">⁄œ„ ≈Õ÷«— 
								«·√œÊ«  «·„œ—”Ì…</td>
								<td class="tdDataControlR" width="74%">
								 <%if study_Tools= "yes" then%> ‰⁄„<%end if%></td>
							</tr>
							<tr>
								<td class="tdDataControlL" width="165">⁄œ„ 
								«·«‰ »«Â </td>
								<td class="tdDataControlR" width="74%">
								<%if not_care= "yes" then%> ‰⁄„<%end if%></td>
							</tr>
							<tr>
								<td class="tdDataControlL" width="165">«·Œ—ÊÃ „‰ 
								«·›’· œÊ‰ «–‰</td>
								<td class="tdDataControlR" width="74%">
								 <%if Get_out_of_Class= "yes" then%> ‰⁄„<%end if%></td>
							</tr>
							<tr>
								<td class="tdDataControlL" width="165">«· √Œ— ⁄‰ 
								«·Õ’…</td>
								<td class="tdDataControlR" width="74%">
								<%if Late_to_class= "yes" then%> ‰⁄„<%end if%></td>
							</tr>
							<tr>
								<td class="tdDataControlL" width="165">”·Êﬂ ”Ì¡</td>
								<td class="tdDataControlR" width="74%">
								<%if wrong_behavior= "yes" then%> ‰⁄„<%end if%></td>
							</tr>
							<tr>
								<td class="tdDataControlL" width="165" height="26">⁄œ„ 
								«· ﬁÌœ »«· ⁄·Ì„« </td>
								<td class="tdDataControlR" width="74%" height="26">
								 <%if refusal_instructions= "yes" then%> ‰⁄„<%end if%></td>
							</tr>
							<tr>
								<td class="tdDataControlL" width="139">«·„‘«—ﬂ… 
								«·’›Ì…</td>
								<td class="tdDataControlR" width="84%">
								 <%if Class_Participation= "yes" then%> ‰⁄„<%end if%>
								</td>
							</tr>
							<tr>
								<td class="tdDataControlL" width="139">«·Ê«Ã»«  
								«·„‰“·Ì…</td>
								<td class="tdDataControlR" width="84%">
								 <%if Home_work= "yes" then%> ‰⁄„<%end if%>
								</td>
							</tr>
							<tr>
								<td class="tdDataControlL" width="139">ﬂÀ—… «·€Ì«»</td>
								<td class="tdDataControlR" width="84%">
								<%if Absence= "yes" then%> ‰⁄„<%end if%>
								</td>
							</tr>
							<tr>
								<td class="tdDataControlL" width="165">
								<span lang="ar-kw">«·«Ã—«¡ «·„ Œ–</span></td>
								<td class="tdDataControlR" width="74%">
									<%=notes%></td>
							</tr>
							<tr>
								<td class="tdDataControlL" width="165"> ﬁ—Ì— 
								Ê—ﬁÌ</td>
								<td class="tdDataControlR" width="74%">

									<%if Report_file <> "" then%><a href="/report_file/<%=Report_file%>">⁄—÷ «·„·›</a><%end if%></td>
							</tr>
					
									
										
											<tr>
								<td class="tdDataControlL" width="165" height="26">
								<span lang="ar-kw"> Ê’Ì«  —∆Ì” «·ﬁ”„</span></td>
								<td class="tdDataControlR" width="74%" height="26">
									&nbsp;<%=Managment_Notes%></td>
							</tr>
					
												<tr>
													<td class="tdDataControlL" width="165">&nbsp;</td>
													<td class="tdDataControlR" width="74%">
																		
													&nbsp;<a target="_blank" href="student_Follow_w_Department_print.asp?std_name=<%=std_name%>&id=<%=ID%>&Class_Room=<%=request.querystring("Class_Room")%>&subject_name=<%=request.querystring("subject_name")%>">ÿ»«⁄…</a>
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
					<span lang="ar-kw">„ «»⁄…</span>
					<span lang="ar-kw">«·ÿ«·»</span> <%=request.querystring("std_name")%> «·’›<%=request.querystring("Class_Room")%></div>
				
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
				
					<form action="student_Follow_Department_chk.asp" method="post" name="frmData" id="frmData" onsubmit="return ValidateData()"  enctype="multipart/form-data">
						<input type="hidden" name="txtProcType" value="edit">						
						<input type="hidden" name="ID" value="<%=request.querystring("ID")%>">	
						<input type="hidden" name="Class_room" value="<%=request.querystring("Class_Room")%>">						
						<input type="hidden" name="Class_room_id" value="<%=Class_room_id%>">		
						<input type="hidden" name="page" value="<%=request.querystring("page")%>">	
						<input type="hidden" name="Follow_type" value="<%=Follow_type%>">
						<input type="hidden" name="DeptID" value="<%=request.querystring("DeptID")%>">
						<input type="hidden" name="Dept_Name" value="<%=request.querystring("Dept_Name")%>">
						<table class="tblDataControl" cellpadding="3" cellspacing="0">
							<thead>
								<td colspan="2" class="tdHeadDataControl">
								&nbsp;</td>
							</thead>
							
							<tr>
								<td class="tdDataControlL" width="165">«”„ 
								«·ÿ«·»</td>
								<td class="tdDataControlR" width="74%">
																								
								
								
										<%
																	
											set Rs=conn.execute("Select * from Students where Std_Civil_ID='"&Std_Civil_ID&"'")
											if not rs.eof then
										%>
												<%=Rs("Std_Name")%>
										<%	
										Std_Name=Rs("Std_Name")				
											end if
										set rs=nothing
										%>
										
								
									</td>
							</tr>
							<tr>
								<td class="tdDataControlL" width="165">
								<span lang="ar-kw"> «—ÌŒ «·„ «»⁄…</span></td>
								<td class="tdDataControlR" width="74%">
								<%=Event_Day&"/"&Event_Month&"/"&Event_Year%></td>
							</tr>
							<tr>
								<td class="tdDataControlL" width="165">&nbsp;<span lang="ar-kw">«·ﬁ”„</span></td>
								<td class="tdDataControlR" width="74%">
																
								<%=Request.QueryString("DeptName")%>								</td>
							</tr>
							<tr>
								<td class="tdDataControlL" width="165">
								<span lang="ar-kw">«·„«œ…</span></td>
								<td class="tdDataControlR" width="74%">
																
								<%
																	
											set Rs=conn.execute("Select * from Subjects where Subject_ID="&Subject_ID&"")
											if not rs.eof then
										%>
												<%=Rs("Subject_Name")%>
										<%		
										'Std_Name=Rs("Std_Name")			
											end if
										set rs=nothing
										%>
								</td>
							</tr>
							<tr>
								<td class="tdDataControlL" width="165">
								<span lang="ar-kw">«”„ «·„⁄·„</span></td>
								<td class="tdDataControlR" width="74%">
																
								&nbsp;
										<%
											set Rss=conn.execute("Select * from Employees where Employee_ID="&Employee_ID&"")
											if not rss.eof then
										%>
												<%=Rss("Employee_Name")%>
										<%					
											end if
										set rss=nothing
										%>

								</td>
							</tr>
							<tr>
								<td class="tdDataControlL" width="165">&nbsp;<span lang="ar-kw">œ—Ã… 
								«·«⁄„«·</span></td>
								<td class="tdDataControlR" width="74%">
																
								<%=Class_Degree%>
								</td>
							</tr>
							<tr>
								<td class="tdDataControlL" width="165">&nbsp;<span lang="ar-kw">œ—Ã… 
								«·«Œ »«—</span></td>
								<td class="tdDataControlR" width="74%">
																
									<%=Exam_Degree%>
								
								
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
								<%if sleeping= "yes" then%> ‰⁄„<%end if%></td>
							</tr>
							<tr>
								<td class="tdDataControlL" width="165">⁄œ„ ≈Õ÷«— 
								«·√œÊ«  «·„œ—”Ì…</td>
								<td class="tdDataControlR" width="74%">
								 <%if study_Tools= "yes" then%> ‰⁄„<%end if%></td>
							</tr>
							<tr>
								<td class="tdDataControlL" width="165">⁄œ„ 
								«·«‰ »«Â </td>
								<td class="tdDataControlR" width="74%">
								<%if not_care= "yes" then%> ‰⁄„<%end if%></td>
							</tr>
							<tr>
								<td class="tdDataControlL" width="165">«·Œ—ÊÃ „‰ 
								«·›’· œÊ‰ «–‰</td>
								<td class="tdDataControlR" width="74%">
								 <%if Get_out_of_Class= "yes" then%> ‰⁄„<%end if%></td>
							</tr>
							<tr>
								<td class="tdDataControlL" width="165">«· √Œ— ⁄‰ 
								«·Õ’…</td>
								<td class="tdDataControlR" width="74%">
								<%if Late_to_class= "yes" then%> ‰⁄„<%end if%></td>
							</tr>
							<tr>
								<td class="tdDataControlL" width="165">”·Êﬂ ”Ì¡</td>
								<td class="tdDataControlR" width="74%">
								<%if wrong_behavior= "yes" then%> ‰⁄„<%end if%></td>
							</tr>
							<tr>
								<td class="tdDataControlL" width="165" height="26">⁄œ„ 
								«· ﬁÌœ »«· ⁄·Ì„« </td>
								<td class="tdDataControlR" width="74%" height="26">
								 <%if refusal_instructions= "yes" then%> ‰⁄„<%end if%></td>
							</tr>
							<tr>
								<td class="tdDataControlL" width="139">«·„‘«—ﬂ… 
								«·’›Ì…</td>
								<td class="tdDataControlR" width="84%">
								 <%if Class_Participation= "yes" then%> ‰⁄„<%end if%>
								</td>
							</tr>
							<tr>
								<td class="tdDataControlL" width="139">«·Ê«Ã»«  
								«·„‰“·Ì…</td>
								<td class="tdDataControlR" width="84%">
								 <%if Home_work= "yes" then%> ‰⁄„<%end if%>
								</td>
							</tr>
							<tr>
								<td class="tdDataControlL" width="139">ﬂÀ—… «·€Ì«»</td>
								<td class="tdDataControlR" width="84%">
								<%if Absence= "yes" then%> ‰⁄„<%end if%>
								</td>
							</tr>
							<tr>
								<td class="tdDataControlL" width="165">
								<span lang="ar-kw">«·«Ã—«¡ «·„ Œ–</span></td>
								<td class="tdDataControlR" width="74%">
									<%=notes%></td>
							</tr>
							<tr>
								<td class="tdDataControlL" width="165"> ﬁ—Ì— 
								Ê—ﬁÌ</td>
								<td class="tdDataControlR" width="74%">

									<%if Report_file <> "" then%><a href="/report_file/<%=Report_file%>">⁄—÷ «·„·›</a><%end if%></td>
							</tr>
					
									
										
											<tr>
								<td class="tdDataControlL" width="165" height="25">
								<span lang="ar-kw"> Ê’Ì«  —∆Ì” «·ﬁ”„</span></td>
								<td class="tdDataControlR" width="74%" height="25">
									&nbsp;<%=Managment_Notes%></td>
							</tr>
					
												<tr>
													<td class="tdDataControlL" width="165">&nbsp;</td>
													<td class="tdDataControlR" width="74%">
																		
													&nbsp;<a target="_blank" href="student_Follow_w_Department_print.asp?std_name=<%=std_name%>&id=<%=ID%>&Class_Room=<%=request.querystring("Class_Room")%>&subject_name=<%=request.querystring("subject_name")%>">ÿ»«⁄…</a></td>
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