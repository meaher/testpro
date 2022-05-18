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


%>
</head>

<body style="text-align: center">



<table border="0" width="100%"  cellspacing="0" cellpadding="0" style="border-style: solid; background-color: #F9FCFF !important">
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
					<p align="right">ÃœÊ· Õ’’ <%=request.querystring("DeptName")%><span lang="en-us">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					</span><a href="Teachers_Class_Room_list.asp?DeptName=<%=request.querystring("DeptName")%>&id=<%=request.querystring("id")%>">
					 Ê“Ì⁄ «·„⁄·„Ì‰ ⁄·Ï «·›’Ê·</a></div>
				
				<div class="RecordAdd">
				&nbsp;</div>
											<div class="RecordAdd">&nbsp;<a href="Lectures_Add.asp?id=<%=request.querystring("id")%>&DeptName=<%=request.querystring("DeptName")%>">≈÷«›… ÃœÌœ</a><span lang="en-us">&nbsp;&nbsp;
												</span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
												</div>
	
				<div class="ErrMsg">
				<%
				if session("Errmsg")<> "" then 
					response.write  session("Errmsg")
					session("Errmsg")=""
				end if
				%>						
				</div>
				
				<%
				nDisplayRecs =50000
				nRecRange = 15
				nRecPerRow = 1
				pageName="Lectures_list.asp?q=0"
				
				id=request.Form("SelectDepartment")
				if id="" then
					id = request.querystring("id")
				end if
				
				if ID > 0 then		
					sSql = "select * from Lectures where Department_id = "& id &" order by  Lecture_date desc, employee_id"
				Else
					sSql = "select * from Lectures where Department_id="& request.querystring("id") &" order by  Lecture_date desc, employee_id"
	 			End if

									
	 
				Set rs = Server.CreateObject("ADODB.Recordset")
				Set rss = Server.CreateObject("ADODB.Recordset")
				Set rsSub = Server.CreateObject("ADODB.Recordset")
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
									<td class="tdViewHead" width="17%">
									<span lang="en-us">&nbsp;</span> «—ÌŒ «·Õ’…</td>
									<td class="tdViewHead" width="14%">«·’›</td>
									<td class="tdViewHead" width="14%">«·ﬁ”„</td>
									<td class="tdViewHead" width="16%">«”„ 
									«·„⁄·„</td>
									<td class="tdViewHead" width="13%">Êﬁ  «·Õ’…</td>
									<td class="tdViewHead" width="10%">«”„ 
									«·„«œ…</td>
									<td class="tdViewHead" width="6%"> ⁄œÌ·</td>
									<td class="tdViewHead" width="5%">Õ–›</td>
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
									<td class="tdView" width="17%"><%=(WeekdayName(weekday(rs("Lecture_Date"))))%> - <%=DAY(rs("Lecture_Date"))&"/"&Month(rs("Lecture_Date"))&"/"&Year(rs("Lecture_Date"))%>
											
									</td>
									
									<td class="tdView" width="14%">
									&nbsp;<%
										DeptSql = "select * from Class_room where Class_room_id="&rs("Class_room_id")&" "
										rss.open DeptSql,conn, 1, 2
										IF NOT RSS.EOF THEN
											response.write  rss("Class_Room")
										ELSE
											response.write "·« ÌÊÃœ »Ì«‰« "
										END IF
										rss.close
									%></td>
									
									<td class="tdView" width="14%">
									<%
										DeptSql = "select * from Departments where Department_id="&rs("Department_ID")&" "
										rss.open DeptSql,conn, 1, 2
											response.write "ﬁ”„ " & rss("Department_Name")
										rss.close
									%>
									
									</td>
									
									<td class="tdView" width="16%">&nbsp;
									
									<%
										DeptSql = "select * from Employees where Employee_id="&rs("Employee_ID")&" "
										rss.open DeptSql,conn, 1, 2
										if not rss.eof then
											response.write rss("Employee_Name")
										Else
											response.write " „ Õ–› „⁄·Ê„«  «·„⁄·„"
										End if
										rss.close
									%>

									
									</td>
									
									<td class="tdView" width="13%">&nbsp;
									
										<%
										DeptSql = "select * from Lectures_Time where Lecture_Time_id="&rs("Lecture_Time_ID")&" "
										rss.open DeptSql,conn, 1, 2
											response.write rss("Lecture_Time_Name")
										rss.close
									%>

									
									</td>
									
									<td class="tdView" width="10%">&nbsp;
										<%
										SubjSql = "select * from Subjects where Subject_id="&rs("Subject_ID")&" "
										rssub.open subjSql,conn, 1, 2
										if not rssub.eof then
											response.write rssub("Subject_name")
										End if
										rssub.close
									%>
									
									</td>
									
								<% If (nRecActual Mod nRecPerRow = 0) Or (nRecPerRow < 2) Then %>
																	
									<td class="tdView" align="center" width="6%">
									<a href="Lectures_update.asp?Lecture_id=<%=rs("Lecture_ID")%>&DeptName=<%=Request.querystring("DeptName")%>&DeptID=<%=Request.querystring("ID")%>">
									 ⁄œÌ·</a></td>
									<td class="tdView" align="center" width="7%">
									<a href="Lectures_Delete.asp?Lecture_id=<%=rs("Lecture_ID")%>&DeptName=<%=Request.querystring("DeptName")%>&DeptID=<%=Request.querystring("ID")%>">
									Õ–›</a></td>
								</tr>
								<% 
									End If 
									End If
									rs.MoveNext
								Loop
								%>
								<% If (nRecActual Mod nRecPerRow) <> 0 Then
									For i = 1 to (nRecPerRow - nRecActual Mod nRecPerRow) %>
									<td colspan="8">&nbsp;</td>
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