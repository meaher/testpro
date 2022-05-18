<!-- #include file="portal_Header_teacher.asp"-->

<%
set Conn=server.createobject("ADODB.Connection")
Conn.open ConnString
Department_ID=Request.querystring("ID")
i=1
y=1
%>
<body style="text-align: center">
<table class=" w3-left w3-hide-large w3-hover-cyan w3-large w3-theme" border="0" width="110%" id="table1"  style="border-style: solid; background-color: #FFFFFF !important">
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
				<td valign="top"><!-- #include file="portal_menu_teacher.asp"-->				

				<p>&nbsp;</p>
				<p>&nbsp;</td>
				<td width="70%" valign="top">
				<!-- Start Contents -->
				<div class="PageTitle">
					 ”ÃÌ· €Ì«» «·’› <%=request.querystring("Class_Room")%></div>
				
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
								<td colspan="4" class="tdHeadDataControl">
								«÷«›…</td>
							</thead>
							<tr>
								<td class="tdDataControlL" width="99" colspan="2">«· «—ÌŒ </td>
								<td class="tdDataControlR" width="83%" colspan="2">
								&nbsp;<%=Day(DateAdd("h",10,now()))&"/"& month(DateAdd("h",10,now()))&"/"&year(DateAdd("h",10,now()))%>
								
								</td>
							</tr>
							<tr>
								<td class="tdDataControlL" width="99" colspan="2">
								<span lang="ar-kw">«·”«⁄…</span></td>
								<td class="tdDataControlR" width="83%" colspan="2">
									<%=FormatDateTime(DateAdd("h",10,now()),4)%>
								</td>
							</tr>
							<tr>
								<td class="tdDataControlL" width="99" colspan="2">«”„ «·„⁄·„</td>
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
								<td class="tdDataControlL" width="99">Êﬁ  «·Õ’…</td>
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
								<td class="tdDataControlL" width="50">„</td>
								<td class="tdDataControlL" width="49">
								&nbsp;</td>
								<td class="tdDataControlR" width="83%" colspan="2">
								«”„ «·ÿ«·»<span lang="en-us"> </span></td>
							</tr>
					<%
					ii=1									
					set Rs=conn.execute("Select * from Students where Class_Room_id="&request.querystring("Class_id")&" ORDER BY STD_NUMBER ASC")
					while not rs.eof
					
					%>
									
										
							<tr>
								<td class="tdDataControlL" width="50"><%=i%><%i=i+1%></td>
								<td class="tdDataControlL" width="49">&nbsp;</td>
								<td class="tdDataControlR" width="42%" dir="rtl"><%=Rs("std_name")%> </td>
								<td class="tdDataControlR" width="41%" dir="rtl">
								&nbsp;<span lang="en-us"><input type="checkbox" name="TxtStd_Civil_id<%=ii%>" value="<%=Rs("Std_Civil_id")%>"></span> 
								€«∆»</td>
							</tr>
					<%
						ii=ii+1
						rs.movenext
					wend
					set rs=nothing
					%>
							<tr>
								<td class="tdDataControlL" width="99" colspan="2"></td>
								<td class="tdDataControlR" width="83%" colspan="2"> 
								<b><font color="#FF0000">&nbsp;·« €«∆»</font></b><span lang="en-us"><font color="#FF0000"><b>
								</b>
								
								<input type="checkbox" name="TxtStd_Civil_id" value="xxxx">
								<b>
								</b></font>
								</span> </td>
							</tr>
							<tr>
								<td class="tdDataControlL" width="99" colspan="2">&nbsp;</td>
								<td class="tdDataControlR" width="83%" colspan="2">
								&nbsp;</td>
							</tr>
							<%
						
		'set Rstime=conn.execute("Select * from Lectures_time where Lecture_Start <= '"&FormatDateTime(DateAdd("h",10,now()),4)&"' and Lecture_End >= '"&FormatDateTime(DateAdd("h",10,now()),4)&"'")	
			'response.write "Select * from Lectures_time where Lecture_Start <= '"&FormatDateTime(DateAdd("h",10,now()),4)&"' and Lecture_End >= '"&FormatDateTime(DateAdd("h",10,now()),4)&"'"
			
			'if not RsTime.eof then
			'	Lecture_Time_ID = RsTime("Lecture_Time_ID")
			'Else
			'	Lecture_Time_ID = ""
			'End if
			'RsTime.close
			
			
			set Rstime=conn.execute("Select * from Lectures_time")	
				while not rstime.eof
					if rstime("Lecture_Start") <= FormatDateTime(DateAdd("h",10,now()),4) then
						if rstime("Lecture_Close") >= FormatDateTime(DateAdd("h",10,now()),4) then
							Lecture_Time_ID = RsTime("Lecture_Time_ID")
						End if
					End if		
					rsTime.movenext
				wend
				Rstime.close
			'response.write FormatDateTime(DateAdd("h",10,now()),4)
			'response.end
			
			if Lecture_Time_ID <> "" then 
						'response.write Lecture_Time_ID
							'	response.write "Select * from Lectures where Class_Room_id="&request.querystring("Class_id")&" and Lecture_Time_ID ="&Lecture_Time_ID&" and Employee_id="&session("Employee_id")&" and Lecture_Day = "& cint(Day(DateAdd("h",10,now()))) &" and Lecture_Month = "& cint(Month(DateAdd("h",10,now()))) &" and Lecture_Year = "&cint(Year(DateAdd("h",10,now())))&" "
								set Rs=conn.execute("Select * from Lectures where Subject_id="&request.querystring("Subject_id")&" and Class_Room_id="&request.querystring("Class_id")&" and Lecture_Time_ID ="&Lecture_Time_ID&" and Employee_id="&session("Employee_id")&" and Lecture_Day = "& cint(Day(DateAdd("h",10,now()))) &" and Lecture_Month = "& cint(Month(DateAdd("h",10,now()))) &" and Lecture_Year = "&cint(Year(DateAdd("h",10,now())))&" ")
								if not rs.eof then
										%>
											<%'check the lecture time%>
											<%
									'		response.write "Select * from Lectures_Time where Lecture_Time_ID ="&rs("Lecture_Time_ID")&" and  Lecture_Start <='"& FormatDateTime(DateAdd("h",10,now()),4) &"' and Lecture_Close >= '"& FormatDateTime(DateAdd("h",10,now()),4) &"' "
												set Rsl=conn.execute("Select * from Lectures_Time where Lecture_Time_ID ="&rs("Lecture_Time_ID")&" and Lecture_Start <='"& FormatDateTime(DateAdd("h",10,now()),4) &"' and Lecture_Close >= '"& FormatDateTime(DateAdd("h",10,now()),4) &"'  ")
											if not rsl.eof then
											%>
												<tr>
													<td class="tdDataControlL" width="99" colspan="2">&nbsp;</td>
													<td class="tdDataControlR" width="83%" colspan="2">
													<input type="hidden" name="txtLecture_Time_ID" value="<%=Rsl("Lecture_Time_ID")%>">	
													<input type="hidden" name="Department_ID" value="<%=Department_ID%>">	
													
													<input type="submit" value="«—”«·" name="tbnSubmit" class="button">
													</td>
												</tr>
											<%End IF
											rsl.close
											%>
										<%
								Else
										set Rsv=conn.execute("Select * from Lectures where Class_Room_id="&request.querystring("Class_id")&" and Lecture_Time_ID ="&Lecture_Time_ID - 1&" and Employee_id="&session("Employee_id")&" and Lecture_Day = "& cint(Day(DateAdd("h",10,now()))) &" and Lecture_Month = "& cint(Month(DateAdd("h",10,now()))) &" and Lecture_Year = "&cint(Year(DateAdd("h",10,now())))&" ")
										if not rsv.eof then
											'response.write "«·Õ’… «·”«»ﬁ…"
										End if
								end if
							rs.close
							
							%>
					<%Else%>
						<%
						'response.write"·« ÌÊÃœ Õ’’ «·«‰"
						%>
					<%End if%>		
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


<table class="w3-hide-medium w3-hide-small" border="0" width="110%"  cellspacing="0" cellpadding="0" style="border-style: solid; background-color: #F9FCFF !important">
	<tr>
	<td>
										<!--#include file="Banner.asp"-->
	</td>
	</tr>
	<tr>
		<td align="center">
		<table border="0" width="110%" cellspacing="0" cellpadding="0" dir="rtl">
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
				<div class="PageTitle">
					 ”ÃÌ· €Ì«» «·’› <%=request.querystring("Class_Room")%></div>
				
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
								<td colspan="4" class="tdHeadDataControl">
								«÷«›…</td>
							</thead>
							<tr>
								<td class="tdDataControlL" width="99" colspan="2">«· «—ÌŒ </td>
								<td class="tdDataControlR" width="83%" colspan="2">
								&nbsp;<%=Day(DateAdd("h",10,now()))&"/"& month(DateAdd("h",10,now()))&"/"&year(DateAdd("h",10,now()))%>
								
								</td>
							</tr>
							<tr>
								<td class="tdDataControlL" width="99" colspan="2">
								<span lang="ar-kw">«·”«⁄…</span></td>
								<td class="tdDataControlR" width="83%" colspan="2">
									<%=FormatDateTime(DateAdd("h",10,now()),4)%>
								</td>
							</tr>
							<tr>
								<td class="tdDataControlL" width="99" colspan="2">«”„ «·„⁄·„</td>
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
								<td class="tdDataControlL" width="99">Êﬁ  «·Õ’…</td>
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
								<td class="tdDataControlL" width="50">
								<span lang="ar-kw">„</span></td>
								<td class="tdDataControlL" width="49">
								&nbsp;</td>
								<td class="tdDataControlR" width="83%" colspan="2">
								«”„ «·ÿ«·»<span lang="en-us"> </span></td>
							</tr>
					<%
					ii=1									
					set Rs=conn.execute("Select * from Students where Class_Room_id="&request.querystring("Class_id")&" ORDER BY STD_NUMBER ASC")
					while not rs.eof
					
					%>
									
										
							<tr>
								<td class="tdDataControlL" width="50"><%=y%><%y=y+1%></td>
								<td class="tdDataControlL" width="49">&nbsp;</td>
								<td class="tdDataControlR" width="42%"><%=Rs("std_name")%> </td>
								<td class="tdDataControlR" width="41%">&nbsp;€«∆»<span lang="en-us">
								<!--<input type="radio" name="TxtStd_Civil_id<%=ii%>" value="<%=Rs("Std_Civil_id")%>">-->
								<input type="checkbox" name="TxtStd_Civil_id<%=ii%>" value="<%=Rs("Std_Civil_id")%>"></span></td>
							</tr>
					<%
						ii=ii+1
						rs.movenext
					wend
					set rs=nothing
					%>
							<tr>
								<td class="tdDataControlL" width="99" colspan="2"></td>
								<td class="tdDataControlR" width="83%" colspan="2"> 
								<b><font color="#FF0000">&nbsp;·« €«∆»</font></b><span lang="en-us"><font color="#FF0000"><b>
								</b>
								
								<input type="checkbox" name="TxtStd_Civil_id" value="xxxx">
								<b>
								</b></font>
								</span> </td>
							</tr>
							<tr>
								<td class="tdDataControlL" width="99" colspan="2">&nbsp;</td>
								<td class="tdDataControlR" width="83%" colspan="2">
								&nbsp;</td>
							</tr>
							<%
						
		'set Rstime=conn.execute("Select * from Lectures_time where Lecture_Start <= '"&FormatDateTime(DateAdd("h",10,now()),4)&"' and Lecture_End >= '"&FormatDateTime(DateAdd("h",10,now()),4)&"'")	
			'response.write "Select * from Lectures_time where Lecture_Start <= '"&FormatDateTime(DateAdd("h",10,now()),4)&"' and Lecture_End >= '"&FormatDateTime(DateAdd("h",10,now()),4)&"'"
			
			'if not RsTime.eof then
			'	Lecture_Time_ID = RsTime("Lecture_Time_ID")
			'Else
			'	Lecture_Time_ID = ""
			'End if
			'RsTime.close
			
			
			set Rstime=conn.execute("Select * from Lectures_time")	
				while not rstime.eof
					if rstime("Lecture_Start") <= FormatDateTime(DateAdd("h",10,now()),4) then
						if rstime("Lecture_Close") >= FormatDateTime(DateAdd("h",10,now()),4) then
							Lecture_Time_ID = RsTime("Lecture_Time_ID")
						End if
					End if		
					rsTime.movenext
				wend
				Rstime.close
			'response.write FormatDateTime(DateAdd("h",10,now()),4)
			'response.end
			
			if Lecture_Time_ID <> "" then 
						'response.write Lecture_Time_ID
							'	response.write "Select * from Lectures where Class_Room_id="&request.querystring("Class_id")&" and Lecture_Time_ID ="&Lecture_Time_ID&" and Employee_id="&session("Employee_id")&" and Lecture_Day = "& cint(Day(DateAdd("h",10,now()))) &" and Lecture_Month = "& cint(Month(DateAdd("h",10,now()))) &" and Lecture_Year = "&cint(Year(DateAdd("h",10,now())))&" "
								set Rs=conn.execute("Select * from Lectures where Subject_id="&request.querystring("Subject_id")&" and Class_Room_id="&request.querystring("Class_id")&" and Lecture_Time_ID ="&Lecture_Time_ID&" and Employee_id="&session("Employee_id")&" and Lecture_Day = "& cint(Day(DateAdd("h",10,now()))) &" and Lecture_Month = "& cint(Month(DateAdd("h",10,now()))) &" and Lecture_Year = "&cint(Year(DateAdd("h",10,now())))&" ")
								if not rs.eof then
										%>
											<%'check the lecture time%>
											<%
										'	response.write "Select * from Lectures_Time where Lecture_Time_ID ="&rs("Lecture_Time_ID")&" and  Lecture_Start <='"& FormatDateTime(DateAdd("h",10,now()),4) &"' and Lecture_Close >= '"& FormatDateTime(DateAdd("h",10,now()),4) &"' "
												set Rsl=conn.execute("Select * from Lectures_Time where Lecture_Time_ID ="&rs("Lecture_Time_ID")&" and Lecture_Start <='"& FormatDateTime(DateAdd("h",10,now()),4) &"' and Lecture_Close >= '"& FormatDateTime(DateAdd("h",10,now()),4) &"'  ")
											if not rsl.eof then
											%>
												<tr>
													<td class="tdDataControlL" width="99" colspan="2">&nbsp;</td>
													<td class="tdDataControlR" width="83%" colspan="2">
													<input type="hidden" name="txtLecture_Time_ID" value="<%=Rsl("Lecture_Time_ID")%>">	
													<input type="hidden" name="Department_ID" value="<%=Department_ID%>">	
													
													<input type="submit" value="«—”«·" name="tbnSubmit" class="button">
													</td>
												</tr>
											<%End IF
											rsl.close
											%>
										<%
								Else
										set Rsv=conn.execute("Select * from Lectures where Class_Room_id="&request.querystring("Class_id")&" and Lecture_Time_ID ="&Lecture_Time_ID - 1&" and Employee_id="&session("Employee_id")&" and Lecture_Day = "& cint(Day(DateAdd("h",10,now()))) &" and Lecture_Month = "& cint(Month(DateAdd("h",10,now()))) &" and Lecture_Year = "&cint(Year(DateAdd("h",10,now())))&" ")
										if not rsv.eof then
											'response.write "«·Õ’… «·”«»ﬁ…"
										End if
								end if
							rs.close
							
							%>
					<%Else%>
						<%
						'response.write"·« ÌÊÃœ Õ’’ «·«‰"
						%>
					<%End if%>		
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