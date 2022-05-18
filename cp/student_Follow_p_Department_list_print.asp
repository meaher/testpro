<!-- #include file="portal_Header.asp"-->
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
		Managment_Notes=rs("Managment_Notes")
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
<html dir="rtl">

<head>
	<meta http-equiv="Content-Type" content="text/html; charset=windows-1256">
	<meta http-equiv="Content-Language" content="ar-kw">
	<title>Portal Control Panel</title>
	<link rel="stylesheet" type="text/css" href="styles/style.css">
			<script>
	window.print()
	</script>

</head>
<body style="background-color: #FFFFFF">
<div align="right">
<table border="0" width="89%">
						<tr>
							<td width="383">
							<p align="center">
							<b>
							<img border="0" src="images/1111.jpg" width="100" height="105" align="middle"></b></td>
							<td>&nbsp;</td>
							<td width="501" rowspan="2">
							<p align="center"><b><font face="Impact" size="5">Õ„Êœ «·Ã«»— «·’»«Õ «·À«‰ÊÌ…&nbsp; »‰Ì‰<br>
							&nbsp;„ «»⁄… «·ÿ·»… «·„ „Ì“Ì‰<br>
							<br></font>
														<br>
							</b></td>
							<td align="right" valign="top" width="48">&nbsp;</td>
							<td align="right" valign="top" width="142"><b><br>
							&nbsp;</b><p><b>«· «—ÌŒ: 		
								<%iDate=Day(DateAdd("h",11,now()))&"/"& month(DateAdd("h",11,now()))&"/"&year(DateAdd("h",11,now()))%>
								<%=iDate%>
								</b></td>
						</tr>
						<tr>
							<td width="383">
							<p align="center"><b><font size="3" face="Impact">Ê“«—… 
							«· —»Ì…<br>
							≈œ«—… «·‘ƒÊ‰ «· ⁄·Ì„Ì…<br>
							„‰ÿﬁ… «·›—Ê«‰Ì… «· ⁄·Ì„Ì…</font></b></td>
							<td>
							&nbsp;</td>
							<td width="48">&nbsp;</td>
							<td width="142">&nbsp;</td>
						</tr>
						
					</table>
</div>
<div align="center">
	<table class="tblMain" cellpadding="0" cellspacing="0" dir="rtl">

		<tr>
			<td valign="top" class="tdMain" width="932">
				<!-- Start Contents -->
			
				


				<div class="ErrMsg">
				<%
				if session("Errmsg")<> "" then 
					response.write  session("Errmsg")
					session("Errmsg")=""
				end if
				%>						
				</div>
				
				<%
				nDisplayRecs =500
				nRecRange = 15
				nRecPerRow = 1
				'pageName="Student_Follow_Õ_Department_list_Print.asp?q=0&id="&id=request.querystring("id")
				
				Eid=request.queryString("Eid")
				if Eid="" then
					Eid = 0
				end if
				if EID > 0 then		
						ssql="select * from student_Follow where Employee_id="&Eid&" and Follow_Type='1' and Department_ID="&request.querystring("ID")&" order by Class_Room_ID,Std_civil_id,Report_date desc"
				Else
						ssql="select * from student_Follow where Follow_Type='1' and Department_ID="&request.querystring("ID")&" order by Class_Room_ID,Std_civil_id,Report_date desc"
	 			End if
									

				Set rs = Server.CreateObject("ADODB.Recordset")
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
							<table cellspacing="0" cellpadding="3" class="tblView" width="955">
								<thead>
									<td class="tdViewHead" width="8%"> «—ÌŒ
									<span lang="ar-kw">«·„ «»⁄…</span></td>
									<td class="tdViewHead" width="14%">
									<span lang="ar-kw">«”„ «·ÿ«·»</span></td>
									<td class="tdViewHead" width="7%">
									<span lang="ar-kw">«·’›</span></td>
									<td class="tdViewHead" width="7%">
									<span lang="ar-kw">«”„ «·„⁄·„</span></td>
									<td class="tdViewHead" width="15%" align="center">
									<span lang="ar-kw"> Ê’Ì«  —∆Ì” «·ﬁ”„</span></td>
									<td class="tdViewHead" align="center">
									<span lang="ar-kw">„Ã«·«  «· „Ì“</span></td>
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
									<td class="tdView" width="8%"><%=DAY(rs("report_Date"))&"/"&Month(rs("report_Date"))&"/"&Year(rs("report_Date"))%>
											
									</td>
									
									<td class="tdView" width="14%">&nbsp;
										<%
											set Rss=conn.execute("Select * from Students where Std_Civil_ID='"&rs("Std_Civil_ID")&"'")
											if not rss.eof then
										%>
												<%=Rss("Std_Name")%>
										<%					
											std_name=Rss("std_name")
											end if
										set rss=nothing
										%>
									</td>
									
									<td class="tdView" width="7%">
									<%
											set Rss=conn.execute("Select * from Class_Room where Class_Room_ID="&rs("Class_Room_ID")&"")
											if not rss.eof then
										%>
												<%=Rss("Class_Room")%>
										<%			
												Class_Room=	Rss("Class_Room")	
											end if
										set rss=nothing
										%>

									
									</td>
									
									<td class="tdView" width="7%">&nbsp;
										<%
											set Rss=conn.execute("Select * from Employees where Employee_ID="&rs("Employee_ID")&"")
											if not rss.eof then
										%>
												<%=Rss("Employee_Name")%>
										<%					
											end if
										set rss=nothing
										%>
</td>
									
									<td class="tdView" width="15%">&nbsp;<%=rs("Managment_Notes")%></td>
									
									<td class="tdView" width="47%">
									<table border="1" width="100%" style="border-collapse: collapse">
										<tr>
											<td><span lang="ar-kw">
											<font size="2">«·⁄„· «·Ã„«⁄Ì</font></span></td>
										<td><font size="2"> Õ÷Ì— «·œ—Ê”</font></td>
										<td><font size="2">«·„‘«—ﬂ… </font> </td>
										<td><font size="2">”—⁄… «·«” Ã«»…</font></td>
										<td><font size="2">«·„—Ê‰…</font></td>
										<td><font size="2">«·Õ—’ ⁄·Ï «· ⁄·„</font></td>
										<td><font size="2">«·„ŸÂ—</font></td>
										<td><font size="2">«·„Õ«›Ÿ… ⁄·Ï «·√œÊ« </font></td>
									</tr>
									<tr>
										<td>
								<%if rs("Teamwork")= "yes" then%> ‰⁄„<%end if%></td>
										<td>
								<%if rs("Preparing_lessons")= "yes" then%> ‰⁄„<%end if%></td>
										<td>
								 <%if rs("share")= "yes" then%> ‰⁄„<%end if%></td>
										<td>
								<%if rs("Responsiveness")= "yes" then%> ‰⁄„<%end if%></td>
										<td>
								 <%if rs("Flexibility")= "yes" then%> ‰⁄„<%end if%></td>
										<td>
								<%if rs("care_learn")= "yes" then%> ‰⁄„<%end if%></td>
										<td>
								<%if rs("style")= "yes" then%> ‰⁄„<%end if%></td>
										<td>
								 <%if rs("Care_Study_Tools")= "yes" then%> ‰⁄„<%end if%></td>
									</tr>
								</table>
								</td>
									
								<% If (nRecActual Mod nRecPerRow = 0) Or (nRecPerRow < 2) Then %>
																	
									</tr>
								<% 
									End If 
									End If
									rs.MoveNext
								Loop
								%>
								<% If (nRecActual Mod nRecPerRow) <> 0 Then
									For i = 1 to (nRecPerRow - nRecActual Mod nRecPerRow) %>
									<td colspan="6">&nbsp;</td>
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
</div>
<table border="0" width="89%">
							<tr>
								<td width="489">&nbsp;</td>
								<td>&nbsp;</td>
								<td width="319">&nbsp;</td>
							</tr>
							<tr>
								<td width="489">
								<p align="center"><b>
								<font size="4" face="Impact">—∆Ì” «·ﬁ”„</font></b></td>
								<td>
								<p align="center">&nbsp;</td>
								<td width="319">
								<p align="center"><b>
								<font size="4" face="Impact">„œÌ— «·„œ—”…</font></b></td>
							</tr>
							<tr>
								<td width="489"><br>
								<br>
&nbsp;</td>
								<td>&nbsp;</td>
								<td width="319">&nbsp;</td>
							</tr>
						</table>
</body>
</html>
<%
conn.close
set conn=nothing
%>