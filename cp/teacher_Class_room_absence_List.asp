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
	<table border="0" width="95%" cellspacing="0" cellpadding="0" dir="rtl">
			<tr>
				<td valign="top"><!-- #include file="portal_menu_teacher.asp"-->				

				<p>&nbsp;</p>
				<p>&nbsp;</td>
				<td width="67%" valign="top">
				<!-- Start Contents -->
			
				<div class="PageTitle">
					<p align="right"><%=request.querystring("subject_name")%> «·’› <%=request.querystring("class_room")%></div>
				
				<div class="RecordAdd" style="width: 338px; height: 19px">
				<a href="teacher_Class_room_absence_add.asp?Class_id=<%=request.querystring("Class_ID")%>&subject_name=<%=request.querystring("subject_name")%>&subject_ID=<%=request.querystring("subject_id")%>&Class_room=<%=request.querystring("Class_room")%>"> ”ÃÌ· «·€Ì«»</a>&nbsp;
								|&nbsp;
								<a href="student_behavior_list.asp?Class_id=<%=request.querystring("Class_ID")%>&subject_name=<%=request.querystring("subject_name")%>&subject_ID=<%=request.querystring("subject_id")%>&Class_room=<%=request.querystring("Class_room")%>">
				«·’ÕÌ›… «·”·ÊﬂÌ…</a> &nbsp;<br>
&nbsp;<a href="student_Follow_P_list.asp?Class_id=<%=request.querystring("Class_ID")%>&subject_name=<%=request.querystring("subject_name")%>&subject_ID=<%=request.querystring("subject_id")%>&Class_room=<%=request.querystring("Class_room")%>">„ «»⁄… «·ÿ«·» «·„ „Ì“</a> &nbsp;|&nbsp;
				<a href="student_Follow_w_list.asp?Class_id=<%=request.querystring("Class_ID")%>&subject_name=<%=request.querystring("subject_name")%>&subject_ID=<%=request.querystring("subject_id")%>&Class_room=<%=request.querystring("Class_room")%>">
				„ «»⁄… «·ÿ«·» «·÷⁄Ì›</a></div>
	<br><font color="#FF0000">„·«ÕŸÂ : ›Ì Õ«· ⁄œ„ ÊÃÊœ €Ì«»<br>
&nbsp;Ì—ÃÏ  ”ÃÌ· ·«€«∆» „‰ Œ·«·  ”ÃÌ· «·€Ì«»</font>
				<div class="ErrMsg">
				<b>
				<%
				if session("Errmsg")<> "" then 
					response.write  session("Errmsg")
					session("Errmsg")=""
				end if
				%>						
				</b></div>
				
				<%
				nDisplayRecs =50000
				nRecRange = 15
				nRecPerRow = 1
				pageName="Teacher_Class_Room_List.asp?q=0"
				
				id=request.Form("SelectDepartment")
				if id="" then
					id = request.querystring("id")
				end if
				
				ssql="select * from students_absence where class_Room_ID="&request.querystring("Class_ID")&" and Subject_id="&request.querystring("subject_id")&" and Employee_ID="&session("Employee_ID")&" order by Absence_Date desc"
									
	 
				Set rs = Server.CreateObject("ADODB.Recordset")
				Set rss = Server.CreateObject("ADODB.Recordset")
				rs.CursorLocation = 3
				rs.Open sSql , conn, 1, 2
				
				nTotalRecs = rs.RecordCount
				If nDisplayRecs <= 0 Then ' Display All Records
					nDisplayRecs = nTotalRecs
				End If
				nStartRec = 1
				SetUpStartRec() 
				%>
				
				<% If nTotalRecs > 0 Then %>
						<div>
							<table cellspacing="0" cellpadding="3" class="tblView" width="95%">
								<thead>
									<td class="tdViewHead" width="9%">
									 «—ÌŒ «·€Ì«»</td>
									<td class="tdViewHead" width="27%">«”„ 
									«·ÿ«·»</td>
									<td class="tdViewHead" width="15%">«·Õ’…</td>
									<td class="tdViewHead" width="26%">«·—ﬁ„ 
									«·„œ‰Ì</td>
									<td class="tdViewHead" width="15%">&nbsp;</td>
									</thead>
								<%
								If CLng(nStartRec) > CLng(nTotalRecs) Then
									nStartRec = nTotalRecs
								End If
								
								nStopRec = nStartRec + nDisplayRecs - 1
								
								nRecCount = nStartRec - 1
								If Not rs.Eof Then
									rs.MoveFirst
									rs.Move nStartRec - 1
								End If
								nRecActual = 0
								Do While (Not rs.Eof) And (nRecCount < nStopRec)
									nRecCount = nRecCount + 1
									If CLng(nRecCount) >= CLng(nStartRec) Then
										nRecActual = nRecActual + 1
								%>
								<%	If (nRecActual Mod nRecPerRow = 1) OR (nRecPerRow < 2) Then %>
									
								<%	if className="tdViewChangeF" then className="tdViewChangeS" else className="tdViewChangeF" end if %>
								
								<tr  id="trRow" class="<%=className%>">
								<% End If %>
									<td class="tdView" width="9%">&nbsp;<%=Day(rs("Absence_Date"))&"/"&month(rs("Absence_Date"))&"/"&year(rs("Absence_Date"))%></td>
									
									<td class="tdView" width="27%">
									&nbsp;<%
									rss.Open "select * from Students where std_civil_id='"&rs("std_civil_id")&"'" , conn, 1, 2
									if not rss.eof then
										if rss("std_name")<>"" then
											response.write rss("std_name")
										Else
											response.write "«”„ «·ÿ«·» €Ì— „”Ã·"
										End if
									Elseif rs("std_civil_id")="xxxx" then
										Response.Write("·« ÌÊÃœ €Ì«»")
									Else
										Response.Write(" „ ‘ÿ» «·ÿ«·»")
									End if
									rss.close
									%></td>
									
									<td class="tdView" width="15%">
									&nbsp;<%=rs("Lecture_Time_ID")%></td>
									
									<td class="tdView" width="26%">
									<%
											response.write rs("std_Civil_ID")
									%>
									
									</td>
									
								<% If (nRecActual Mod nRecPerRow = 0) Or (nRecPerRow < 2) Then %>
																	
									<td class="tdView" width="15%">
									
							<%
											
							set Rstime=conn.execute("Select * from Lectures_time where Lecture_Start <= '"&FormatDateTime(DateAdd("h",10,now()),4)&"' and Lecture_Close >= '"&FormatDateTime(DateAdd("h",10,now()),4)&"'")	
								'response.write "Select * from Lectures_time where Lecture_Start <= '"&FormatDateTime(DateAdd("h",10,now()),4)&"' and Lecture_Close >= '"&FormatDateTime(DateAdd("h",10,now()),4)&"'"
								
								if not RsTime.eof then
									Lecture_Time_ID = RsTime("Lecture_Time_ID")
								Else
									Lecture_Time_ID = ""
								End if
								RsTime.close

								if Lecture_Time_ID <> "" then 
											'response.write Lecture_Time_ID
													'response.write "Select * from Lectures where Class_Room_id="&request.querystring("Class_id")&" and Lecture_Time_ID ="&Lecture_Time_ID&" and Employee_id="&session("Employee_id")&" and Lecture_Day = "& cint(Day(DateAdd("h",10,now()))) &" and Lecture_Month = "& cint(Month(DateAdd("h",10,now()))) &" and Lecture_Year = "&cint(Year(DateAdd("h",10,now())))&" "
													set Rsv=conn.execute("Select * from Lectures where Class_Room_id="&request.querystring("Class_id")&" and Lecture_Time_ID ="&Lecture_Time_ID&" and Employee_id="&session("Employee_id")&" and Lecture_Day = "& cint(Day(DateAdd("h",10,now()))) &" and Lecture_Month = "& cint(Month(DateAdd("h",10,now()))) &" and Lecture_Year = "&cint(Year(DateAdd("h",10,now())))&" ")
													if not rsv.eof then
												%>
													<%'check the lecture time%>
													<%
														'response.write "Select * from Lectures_Time where Lecture_Time_ID ="&rs("Lecture_Time_ID")&" and  Lecture_Start <='"& FormatDateTime(DateAdd("h",10,now()),4) &"' and Lecture_Close >= '"& FormatDateTime(DateAdd("h",10,now()),4) &"' "
														set Rsl=conn.execute("Select * from Lectures_Time where Lecture_Time_ID ="&rsv("Lecture_Time_ID")&" and Lecture_Start <='"& FormatDateTime(DateAdd("h",10,now()),4) &"' and Lecture_Close >= '"& FormatDateTime(DateAdd("h",10,now()),4) &"'  ")
													if not rsl.eof then
													%>
														<%if rs("Absence_Day") = cint(Day(DateAdd("h",10,now()))) and rs("Absence_Month") = cint(Month(DateAdd("h",10,now()))) and rs("Absence_Year") = cint(Year(DateAdd("h",10,now()))) then%>
														<%if rs("std_Civil_ID")<>"xxxx" then%>	
															 <a href="teacher_Class_room_absence_chk.asp?Employee_id=<%=session("Employee_ID")%>&Lecture_Time_ID=<%=rs("Lecture_Time_ID")%>&id=<%=rs("Absence_ID")%>&Class_id=<%=Request.queryString("Class_ID")%>&subject_id=<%=Request.queryString("subject_ID")%>&subject_Name=<%=Request.queryString("Subject_name")%>&Class_room=<%=Request.queryString("Class_room")%>&start=1">
																	Õ–› „‰ «·€Ì«»</a>
														<%Else%>
															 <a href="teacher_Class_room_absence_chk.asp?std_Civil_id=x&Lecture_Time_ID=<%=rs("Lecture_Time_ID")%>&id=<%=rs("Absence_ID")%>&Class_id=<%=Request.queryString("Class_ID")%>&subject_id=<%=Request.queryString("subject_ID")%>&subject_Name=<%=Request.queryString("Subject_name")%>&Class_room=<%=Request.queryString("Class_room")%>&start=1">
																	Õ–› „‰ «·€Ì«»</a>
														<%End if%>
													<%End if%>	
														
													<%End IF
													rsl.close
													%>
												<%
												end if
												rsv.close
												
												%>
										<%Else%>
											
										<%End if%>
														
														
									
							</td>
									
								</tr>
								<% 
									End If 
									End If
									rs.MoveNext
								Loop
								%>
								<% If (nRecActual Mod nRecPerRow) <> 0 Then
									For i = 1 to (nRecPerRow - nRecActual Mod nRecPerRow) %>
									<td colspan="5">&nbsp;</td>
									<% Next %>
								</tr>
								<% End If %>
							</table>
						</div>
				<% End If %>	
							
				<!-- #include file="portal_pagging.asp"-->

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
					<p align="right"><%=request.querystring("subject_name")%> «·’› <%=request.querystring("class_room")%></div>
				
				<div class="RecordAdd" style="width: 972px; height: 19px">
				<a href="teacher_Class_room_absence_add.asp?Class_id=<%=request.querystring("Class_ID")%>&subject_name=<%=request.querystring("subject_name")%>&subject_ID=<%=request.querystring("subject_id")%>&Class_room=<%=request.querystring("Class_room")%>"> ”ÃÌ· «·€Ì«»</a>&nbsp;
								|&nbsp;
								<a href="student_behavior_list.asp?Class_id=<%=request.querystring("Class_ID")%>&subject_name=<%=request.querystring("subject_name")%>&subject_ID=<%=request.querystring("subject_id")%>&Class_room=<%=request.querystring("Class_room")%>">
				«·’ÕÌ›… «·”·ÊﬂÌ…</a> &nbsp;|&nbsp;
				<a href="student_Follow_P_list.asp?Class_id=<%=request.querystring("Class_ID")%>&subject_name=<%=request.querystring("subject_name")%>&subject_ID=<%=request.querystring("subject_id")%>&Class_room=<%=request.querystring("Class_room")%>">„ «»⁄… «·ÿ«·» «·„ „Ì“</a> &nbsp;|&nbsp;
				<a href="student_Follow_w_list.asp?Class_id=<%=request.querystring("Class_ID")%>&subject_name=<%=request.querystring("subject_name")%>&subject_ID=<%=request.querystring("subject_id")%>&Class_room=<%=request.querystring("Class_room")%>">
				„ «»⁄… «·ÿ«·» «·÷⁄Ì›</a></div>
	
				<div class="ErrMsg">
				<b>
				<%
				if session("Errmsg")<> "" then 
					response.write  session("Errmsg")
					session("Errmsg")=""
				end if
				%>						
				<font color="#FF0000">„·«ÕŸÂ : ›Ì Õ«· ⁄œ„ ÊÃÊœ €Ì«» Ì—ÃÏ  ”ÃÌ· 
				·«€«∆» „‰ Œ·«·  ”ÃÌ· «·€Ì«»</font></b></div>
				
				<%
				nDisplayRecs =50000
				nRecRange = 15
				nRecPerRow = 1
				pageName="Teacher_Class_Room_List.asp?q=0"
				
				id=request.Form("SelectDepartment")
				if id="" then
					id = request.querystring("id")
				end if
				
				ssql="select * from students_absence where class_Room_ID="&request.querystring("Class_ID")&" and Subject_id="&request.querystring("subject_id")&" and Employee_ID="&session("Employee_ID")&"  order by Absence_Date desc"
									
	 
				Set rs = Server.CreateObject("ADODB.Recordset")
				Set rss = Server.CreateObject("ADODB.Recordset")
				rs.CursorLocation = 3
				rs.Open sSql , conn, 1, 2
				
				nTotalRecs = rs.RecordCount
				If nDisplayRecs <= 0 Then ' Display All Records
					nDisplayRecs = nTotalRecs
				End If
				nStartRec = 1
				SetUpStartRec() 
				%>
				
				<% If nTotalRecs > 0 Then %>
						<div>
							<table cellspacing="0" cellpadding="3" class="tblView">
								<thead>
									<td class="tdViewHead" width="9%">
									 «—ÌŒ «·€Ì«»</td>
									<td class="tdViewHead" width="27%">«”„ 
									«·ÿ«·»</td>
									<td class="tdViewHead" width="15%">«·Õ’…</td>
									<td class="tdViewHead" width="26%">«·—ﬁ„ 
									«·„œ‰Ì</td>
									<td class="tdViewHead" width="15%">&nbsp;</td>
									</thead>
								<%
								If CLng(nStartRec) > CLng(nTotalRecs) Then
									nStartRec = nTotalRecs
								End If
								
								nStopRec = nStartRec + nDisplayRecs - 1
								
								nRecCount = nStartRec - 1
								If Not rs.Eof Then
									rs.MoveFirst
									rs.Move nStartRec - 1
								End If
								nRecActual = 0
								Do While (Not rs.Eof) And (nRecCount < nStopRec)
									nRecCount = nRecCount + 1
									If CLng(nRecCount) >= CLng(nStartRec) Then
										nRecActual = nRecActual + 1
								%>
								<%	If (nRecActual Mod nRecPerRow = 1) OR (nRecPerRow < 2) Then %>
									
								<%	if className="tdViewChangeF" then className="tdViewChangeS" else className="tdViewChangeF" end if %>
								
								<tr  id="trRow" class="<%=className%>">
								<% End If %>
									<td class="tdView" width="9%">&nbsp;<%=Day(rs("Absence_Date"))&"/"&month(rs("Absence_Date"))&"/"&year(rs("Absence_Date"))%></td>
									
									<td class="tdView" width="27%">
									&nbsp;<%
									rss.Open "select * from Students where std_civil_id='"&rs("std_civil_id")&"'" , conn, 1, 2
									if not rss.eof then
										if rss("std_name")<>"" then
											response.write rss("std_name")
										Else
											response.write "«”„ «·ÿ«·» €Ì— „”Ã·"
										End if
									Elseif rs("std_civil_id")="xxxx" then
										Response.Write("·« ÌÊÃœ €Ì«»")
									Else
										Response.Write(" „ ‘ÿ» «·ÿ«·»")
									End if
									rss.close
									%></td>
									
									<td class="tdView" width="15%">
									&nbsp;<%=rs("Lecture_Time_ID")%></td>
									
									<td class="tdView" width="26%">
									<%
											response.write rs("std_Civil_ID")
									%>
									
									</td>
									
								<% If (nRecActual Mod nRecPerRow = 0) Or (nRecPerRow < 2) Then %>
																	
									<td class="tdView" width="15%">
									
							<%
											
							set Rstime=conn.execute("Select * from Lectures_time where Lecture_Start <= '"&FormatDateTime(DateAdd("h",10,now()),4)&"' and Lecture_Close >= '"&FormatDateTime(DateAdd("h",10,now()),4)&"'")	
								'response.write "Select * from Lectures_time where Lecture_Start <= '"&FormatDateTime(DateAdd("h",10,now()),4)&"' and Lecture_Close >= '"&FormatDateTime(DateAdd("h",10,now()),4)&"'"
								
								if not RsTime.eof then
									Lecture_Time_ID = RsTime("Lecture_Time_ID")
								Else
									Lecture_Time_ID = ""
								End if
								RsTime.close

								if Lecture_Time_ID <> "" then 
											'response.write Lecture_Time_ID
													'response.write "Select * from Lectures where Class_Room_id="&request.querystring("Class_id")&" and Lecture_Time_ID ="&Lecture_Time_ID&" and Employee_id="&session("Employee_id")&" and Lecture_Day = "& cint(Day(DateAdd("h",10,now()))) &" and Lecture_Month = "& cint(Month(DateAdd("h",10,now()))) &" and Lecture_Year = "&cint(Year(DateAdd("h",10,now())))&" "
													set Rsv=conn.execute("Select * from Lectures where Class_Room_id="&request.querystring("Class_id")&" and Lecture_Time_ID ="&Lecture_Time_ID&" and Employee_id="&session("Employee_id")&" and Lecture_Day = "& cint(Day(DateAdd("h",10,now()))) &" and Lecture_Month = "& cint(Month(DateAdd("h",10,now()))) &" and Lecture_Year = "&cint(Year(DateAdd("h",10,now())))&" ")
												
												if not rsv.eof then
												%>
													<%'check the lecture time%>
													<%
														'response.write "Select * from Lectures_Time where Lecture_Time_ID ="&rs("Lecture_Time_ID")&" and  Lecture_Start <='"& FormatDateTime(DateAdd("h",10,now()),4) &"' and Lecture_Close >= '"& FormatDateTime(DateAdd("h",10,now()),4) &"' "
														set Rsl=conn.execute("Select * from Lectures_Time where Lecture_Time_ID ="&rsv("Lecture_Time_ID")&" and Lecture_Start <='"& FormatDateTime(DateAdd("h",10,now()),4) &"' and Lecture_Close >= '"& FormatDateTime(DateAdd("h",10,now()),4) &"'  ")
												
													if not rsl.eof then
													%>
														<%if rs("Absence_Day") = cint(Day(DateAdd("h",10,now()))) and rs("Absence_Month") = cint(Month(DateAdd("h",10,now()))) and rs("Absence_Year") = cint(Year(DateAdd("h",10,now()))) then%>
														<%if rs("std_Civil_ID")<>"xxxx" then%>	
															 <a href="teacher_Class_room_absence_chk.asp?Employee_id=<%=session("Employee_ID")%>&Lecture_Time_ID=<%=rs("Lecture_Time_ID")%>&id=<%=rs("Absence_ID")%>&Class_id=<%=Request.queryString("Class_ID")%>&subject_id=<%=Request.queryString("subject_ID")%>&subject_Name=<%=Request.queryString("Subject_name")%>&Class_room=<%=Request.queryString("Class_room")%>&start=1">
																	Õ–› „‰ «·€Ì«»</a>
														<%Else%>
															 <a href="teacher_Class_room_absence_chk.asp?std_Civil_id=x&Lecture_Time_ID=<%=rs("Lecture_Time_ID")%>&id=<%=rs("Absence_ID")%>&Class_id=<%=Request.queryString("Class_ID")%>&subject_id=<%=Request.queryString("subject_ID")%>&subject_Name=<%=Request.queryString("Subject_name")%>&Class_room=<%=Request.queryString("Class_room")%>&start=1">
																	Õ–› „‰ «·€Ì«»</a>
														<%End if%>
													<%End if%>	
														
													<%End IF
													rsl.close
													%>
												<%
												end if
												rsv.close
												
												%>
										<%Else%>
											
										<%End if%>
														
														
									
							</td>
									
								</tr>
								<% 
									End If 
									End If
									rs.MoveNext
								Loop
								%>
								<% If (nRecActual Mod nRecPerRow) <> 0 Then
									For i = 1 to (nRecPerRow - nRecActual Mod nRecPerRow) %>
									<td colspan="5">&nbsp;</td>
									<% Next %>
								</tr>
								<% End If %>
							</table>
						</div>
				<% End If %>	
							
				<!-- #include file="portal_pagging.asp"-->

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