<%@ CodePage=1256 %>
<!-- #include file="portal_includes_teacher.asp" -->
<%
set Conn=server.createobject("ADODB.Connection")
Conn.open ConnString
Department_ID=Request.querystring("ID")
%>
<html dir="rtl">

<head>
	<meta http-equiv="Content-Type" content="text/html; charset=windows-1256">
	<meta http-equiv="Content-Language" content="ar-kw">
	<title>Portal Control Panel</title>
	<link rel="stylesheet" type="text/css" href="styles/style.css">
	<script src="js/nicEdit.js" type="text/javascript"></script>
	<script type="text/javascript">
	bkLib.onDomLoaded(function() {
		//new nicEditor({fullPanel : true}).panelInstance('txtDesc');
		//new nicEditor({fullPanel : true}).panelInstance('txtDescEN');
	});
	</script>			
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
				<!-- #include file="portal_menu_teacher.asp"-->				
			</td>
			<td valign="top" class="tdMain">
				<!-- Start Contents -->
				<div class="PageTitle">
					تسجيل غياب الصف <%=request.querystring("Class_Room")%></div>
				
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
					<form action="teacher_Class_room_absence_chk.asp" method="post" name="frmData" id="frmData" onsubmit="return ValidateData()"  enctype="multipart/form-data">
						<input type="hidden" name="txtProcType" value="add">						
						<input type="hidden" name="txtClass_room_ID" value="<%=request.querystring("Class_ID")%>">						
						<input type="hidden" name="txtClass_room" value="<%=request.querystring("Class_room")%>">						
						<input type="hidden" name="txtSubject_name" value="<%=request.querystring("Subject_name")%>">	
						<input type="hidden" name="txtSubject_id" value="<%=request.querystring("Subject_id")%>">	
						<input type="hidden" name="txtEmployee_ID" value="<%=session("Employee_ID")%>">						
						<table class="tblDataControl" cellpadding="3" cellspacing="0">
							<thead>
								<td colspan="3" class="tdHeadDataControl">
								اضافة</td>
							</thead>
							<tr>
								<td class="tdDataControlL" width="99">التاريخ </td>
								<td class="tdDataControlR" width="83%" colspan="2">
								&nbsp;<%=date%>
								
								</td>
							</tr>
							<tr>
								<td class="tdDataControlL" width="99">اسم المعلم</td>
								<td class="tdDataControlR" width="83%" colspan="2">
																
								
										<%									
										set Rs=conn.execute("Select * from Employees Where Employee_ID="&session("Employee_id")&"")

											response.write rs("Employee_Name")
											Department_id = rs("Department_id")
										set rs=nothing
										%>
										
								
									</td>
							</tr>
							<!--
							<tr>
								<td class="tdDataControlL" width="99">وقت الحصة</td>
								<td class="tdDataControlR" width="83%" colspan="2">
																
								<select size="1" name="txtLecture_Time_id" class="select">
										<%									
										set Rs=conn.execute("Select * from Lectures_Time")
										while not rs.eof
										%>
														<option value="<%=rs("Lecture_Time_id")%>"><%=Rs("Lecture_Time_name")%></option>
										<%
											rs.movenext
										wend
										rs.close
										%>
										
								
									</select></td>
							</tr>
							-->
							<tr>
								<td class="tdDataControlL" width="99">&nbsp;</td>
								<td class="tdDataControlR" width="83%" colspan="2">
								اسم الطالب<span lang="en-us"> </span></td>
							</tr>
					<%
					ii=1									
					set Rs=conn.execute("Select * from Students where Class_Room_id="&request.querystring("Class_id")&"")
					while not rs.eof
					
					%>
									
										
							<tr>
								<td class="tdDataControlL" width="99"><%=Rs("std_number")%></td>
								<td class="tdDataControlR" width="42%"><%=Rs("std_name")%> </td>
								<td class="tdDataControlR" width="41%">&nbsp;غائب<span lang="en-us">
								<input type="radio" name="TxtStd_Civil_id<%=ii%>" value="<%=Rs("Std_Civil_id")%>">
								</span></td>
							</tr>
					<%
						ii=ii+1
						rs.movenext
					wend
					set rs=nothing
					%>
							<tr>
								<td class="tdDataControlL" width="99">&nbsp;</td>
								<td class="tdDataControlR" width="83%" colspan="2">
								&nbsp;</td>
							</tr>
							<%
						
		'set Rstime=conn.execute("Select * from Lectures_time where Lecture_Start <= '"&FormatDateTime(DateAdd("h",11,now()),4)&"' and Lecture_End >= '"&FormatDateTime(DateAdd("h",11,now()),4)&"'")	
			'response.write "Select * from Lectures_time where Lecture_Start <= '"&FormatDateTime(DateAdd("h",11,now()),4)&"' and Lecture_End >= '"&FormatDateTime(DateAdd("h",11,now()),4)&"'"
			
			'if not RsTime.eof then
			'	Lecture_Time_ID = RsTime("Lecture_Time_ID")
			'Else
			'	Lecture_Time_ID = ""
			'End if
			'RsTime.close
			
			
			set Rstime=conn.execute("Select * from Lectures_time")	
				while not rstime.eof
					if rstime("Lecture_Start") <= FormatDateTime(DateAdd("h",11,now()),4) then
						if rstime("Lecture_End") >= FormatDateTime(DateAdd("h",11,now()),4) then
							Lecture_Time_ID = RsTime("Lecture_Time_ID")
						End if
					End if		
					rsTime.movenext
				wend
				Rstime.close
			response.write Lecture_Time_ID
			'response.end
			
			if Lecture_Time_ID <> "" then 
						response.write Lecture_Time_ID
								response.write "Select * from Lectures where Class_Room_id="&request.querystring("Class_id")&" and Lecture_Time_ID ="&Lecture_Time_ID&" and Employee_id="&session("Employee_id")&" and Lecture_Day = "& cint(Day(DateAdd("h",11,now()))) &" and Lecture_Month = "& cint(Month(DateAdd("h",11,now()))) &" and Lecture_Year = "&cint(Year(DateAdd("h",11,now())))&" "
								set Rs=conn.execute("Select * from Lectures where Class_Room_id="&request.querystring("Class_id")&" and Lecture_Time_ID ="&Lecture_Time_ID&" and Employee_id="&session("Employee_id")&" and Lecture_Day = "& cint(Day(DateAdd("h",11,now()))) &" and Lecture_Month = "& cint(Month(DateAdd("h",11,now()))) &" and Lecture_Year = "&cint(Year(DateAdd("h",11,now())))&" ")
								if not rs.eof then
										%>
											<%'check the lecture time%>
											<%
											response.write "Select * from Lectures_Time where Lecture_Time_ID ="&rs("Lecture_Time_ID")&" and  Lecture_Start <='"& FormatDateTime(DateAdd("h",11,now()),4) &"' and Lecture_Close >= '"& FormatDateTime(DateAdd("h",11,now()),4) &"' "
												set Rsl=conn.execute("Select * from Lectures_Time where Lecture_Time_ID ="&rs("Lecture_Time_ID")&" and Lecture_Start <='"& FormatDateTime(DateAdd("h",11,now()),4) &"' and Lecture_Close >= '"& FormatDateTime(DateAdd("h",11,now()),4) &"'  ")
											if not rsl.eof then
											%>
												<tr>
													<td class="tdDataControlL" width="99">&nbsp;</td>
													<td class="tdDataControlR" width="83%" colspan="2">
													<input type="hidden" name="txtLecture_Time_ID" value="<%=Rsl("Lecture_Time_ID")%>">	
													<input type="hidden" name="Department_ID" value="<%=Department_ID%>">	
													
													<input type="submit" value="إضافة" name="tbnSubmit" class="button">
													</td>
												</tr>
											<%End IF
											rsl.close
											%>
										<%
								Else
									set Rstime=conn.execute("Select * from Lectures_time where Lecture_Start <= '"&FormatDateTime(DateAdd("h",11,now()),4)&"' and Lecture_Close >= '"&FormatDateTime(DateAdd("h",11,now()),4)&"'")	
										'response.write "Select * from Lectures_time where Lecture_Start <= '"&FormatDateTime(DateAdd("h",11,now()),4)&"' and Lecture_End >= '"&FormatDateTime(DateAdd("h",11,now()),4)&"'"
										if not RsTime.eof then
											Lecture_Time_ID = RsTime("Lecture_Time_ID")
												set Rsv=conn.execute("Select * from Lectures where Class_Room_id="&request.querystring("Class_id")&" and Lecture_Time_ID ="&Lecture_Time_ID&" and Employee_id="&session("Employee_id")&" and Lecture_Day = "& cint(Day(DateAdd("h",11,now()))) &" and Lecture_Month = "& cint(Month(DateAdd("h",11,now()))) &" and Lecture_Year = "&cint(Year(DateAdd("h",11,now())))&" ")
												if not rsv.eof then
												%>
														<tr>
													<td class="tdDataControlL" width="99">&nbsp;</td>
													<td class="tdDataControlR" width="83%" colspan="2">
													<input type="hidden" name="txtLecture_Time_ID" value="<%=Rsl("Lecture_Time_ID")%>">	
													<input type="hidden" name="Department_ID" value="<%=Department_ID%>">	
													
													<input type="submit" value="إضافة" name="tbnSubmit" class="button">
													</td>
													</tr>
												<%
												End if
											Rsv.close
											%>

										'Else
										'	Lecture_Time_ID = ""
										<%
										End if
									RsTime.close

								end if
							rs.close
							
							%>
					<%Else%>
						<%="لا يوجد حصص الان"%>
					<%End if%>		
							</table>
					</form>
				</div>
				<!-- End Contents -->
			</td>
		</tr>
		<tr>
			<td colspan="2" align="center" height="10">
			
			</td>
		</tr>
		<tr>
			<td colspan="2" align="center">
			</td>
		</tr>
	</table>
</div>
				<!-- #include file="portal_footer.asp"-->

</body>
</html>
<%
conn.close
set conn=nothing
%>