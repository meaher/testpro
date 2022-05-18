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
					<p align="right">ÃœÊ· «·Õ’’</div>
				
				<div class="RecordAdd">
				<form action="Lectures.asp?start=1" method="post" >
					
					<input type="hidden" value="<%=request.querystring("id")%>" name="txtDepartmentID">
				
								<!--	<input type="hidden" value="<%=PRODUCT_IMG1%>" name="txtHdnImg1">
									-->
					<p>
					<select size="1" name="SelectDay" class="select">
						<option Value="0">«Œ — «·ÌÊ„</option>
						<%for i=1 to 31%>
							<option Value="<%=i%>" <%if cint(request.form("SelectDay")) = i then%> selected <%End if%>><%=i%></option>
							
						<%next%>
					</select>
					<select size="1" name="SelectMonth" class="select">
						<option Value="0">«Œ — «·‘Â—</option>
						<%for i=1 to 12%>
							<option Value="<%=i%>" <%if cint(request.form("SelectMonth")) = i then%> selected <%End if%>><%=i%></option>
							
						<%next%>
					</select>
					&nbsp;
					<select size="1" name="SelectDepartment" class="select">
						<option Value="0">Ã„Ì⁄ «·√ﬁ”«„</option>
										<%									
										set Rssd=conn.execute("Select * from Departments")
										while not rssd.eof
										%>
											<option value="<%=rssd("Department_id")%>" <%if cint(request.form("SelectDepartment")) = rssd("Department_id") then%> selected <%End if%>><%=Rssd("Department_Name")%></option>
										<%
											rssd.movenext
										wend
										set rssd=nothing
										%>
					</select>&nbsp;
					
					
					<input type="submit" value="≈—”«·" name="B1"><font size="3">
					<a target="_blank" href="lectures_Print.asp?SDepartment=<%=Request.form("SelectDepartment")%>&smonth=<%=Request.form("SelectMonth")%>&sDay=<%=Request.form("SelectDay")%>">ÿ»«⁄…</a></font></p>
				</form>
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
				nDisplayRecs =50
				nRecRange = 15
				nRecPerRow = 1
				pageName="Lectures.asp?q=0"
				
			'	id=request.Form("SelectDepartment")
			'	if id="" then
			'		id = request.querystring("id")
			'	end if
				
			'	if ID > 0 then		
			'		sSql = "select * from Lectures where Department_id = "& id &" order by Lecture_date"
			'	Else
			'		sSql = "select * from Lectures order by Department_ID, Lecture_date"
	 		'	End if

					

	 			sday=Request.form("SelectDay")
	 			smonth=Request.form("SelectMonth")
				Department_id = request.Form("SelectDepartment")
	 			if sday <> 0 then
	 				if smonth <> 0 then
	 					if Department_id <> 0 then
								sSql = "select * from Lectures where Department_id ="& Department_id &" and Lecture_day="&sDay&" and Lecture_Month="&smonth&" order by  Lecture_date desc, Department_ID, Lecture_Time_id, employee_id "
						Else
							sSql = "select * from Lectures where Lecture_day="&sDay&" and Lecture_Month="&smonth&" order by  Lecture_date desc, Department_id,Lecture_Time_id, employee_id "
						End if		
					Else
						if Department_id <> 0 then
							smonth= month(Date())
								sSql = "select * from Lectures where Department_id="& Department_id &" and Lecture_day="&sDay&" and Lecture_Month="&smonth&" order by  Lecture_date desc, Department_ID, Lecture_Time_id, employee_id "
						Else
							smonth=month(Date())
								sSql = "select * from Lectures where Lecture_day="&sDay&" and Lecture_Month="&smonth&" order by  Lecture_date desc, Department_ID, Lecture_Time_id, employee_id "
						End if		
					End if
				Elseif smonth <> 0 then
					if Department_id <> 0 then
							sSql = "select * from Lectures where Department_id="&Department_ID&" and Lecture_Month="&smonth&" order by  Lecture_date desc, Department_ID, Lecture_Time_id, employee_id "
					Else
							sSql = "select * from Lectures where Lecture_Month="&smonth&" order by  Lecture_date desc, Department_ID, Lecture_Time_id, employee_id "
					End if
				ElseIF Department_id <> 0 then
					sSql = "select * from Lectures where Department_ID ="&Department_ID&" order by  Lecture_date desc, Department_ID, Lecture_Time_id, employee_id "
				Else 
					sSql = "select * from Lectures order by  Lecture_date desc, Department_ID, Lecture_Time_id, employee_id "
				End if
				
				
				'response.write sSql 
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
									<td class="tdViewHead" width="19%">
									<span lang="en-us">&nbsp;</span> «—ÌŒ «·Õ’…</td>
									<td class="tdViewHead" width="12%">«·’›</td>
									<td class="tdViewHead" width="18%">«·ﬁ”„</td>
									<td class="tdViewHead" width="16%">«”„ 
									«·„⁄·„</td>
									<td class="tdViewHead" width="11%">Êﬁ  «·Õ’…</td>
									<td class="tdViewHead" width="22%">«·—ﬁ„ 
									«·„œ‰Ì</td>
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
									<td class="tdView" width="19%"><%=(WeekdayName(weekday(rs("Lecture_Date"))))%> - <%=DAY(rs("Lecture_Date"))&"/"&Month(rs("Lecture_Date"))&"/"&Year(rs("Lecture_Date"))%>
											
									</td>
									
									<td class="tdView" width="12%">
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
									
									<td class="tdView" width="18%">
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
											response.write rss("Employee_Name")
											Civil_id = rss("Civil_id")
										rss.close
									%>

									
									</td>
									
									<td class="tdView" width="11%">&nbsp;
									
										<%
										DeptSql = "select * from Lectures_Time where Lecture_Time_id="&rs("Lecture_Time_ID")&" "
										rss.open DeptSql,conn, 1, 2
											response.write rss("Lecture_Time_Name")
										rss.close
									%>

									
									</td>
									
									<td class="tdView" width="22%">&nbsp;<%=civil_id%></td>
									
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