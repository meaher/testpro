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
					<p align=right><span lang="ar-kw">«·’ÕÌ›… «·”·ÊﬂÌ… ··’›
					</span><%=request.querystring("Class_Room")%><br>
				<a href="student_behavior_admin_Add.asp?Class_Room_id=<%=request.querystring("Class_Room_ID")%>&Class_room=<%=request.querystring("Class_room")%>">≈÷«›… ÃœÌœ</a></div>


				<div class="RecordAdd">
				<form action="Student_behavior_Admin_list.asp?start=1&Class_Room_ID=<%=Request.QueryString("Class_Room_id")%>&Class_Room=<%=Request.QueryString("Class_room")%>" method="post" >
					
								<!--	<input type="hidden" value="<%=PRODUCT_IMG1%>" name="txtHdnImg1">
									-->
						<input type="hidden" name="txtProcType" value="add">				
					<p><select size="1" name="SelectDay">
						<option Value="0">«Œ — «·ÌÊ„</option>
						<%for i=1 to 31%>
							<option Value="<%=i%>" <%if cint(request.form("SelectDay")) = i then%> selected <%End if%>><%=i%></option>
							
						<%next%>
					</select>
					<select size="1" name="SelectMonth">
						<option Value="0">«Œ — «·‘Â—</option>
						<%for i=1 to 12%>
							<option Value="<%=i%>" <%if cint(request.form("SelectMonth")) = i then%> selected <%End if%>><%=i%></option>
							
						<%next%>
					</select><select size="1" name="SelectStdCivilID">
						<option Value="0">«Œ — «·ÿ«·»</option>
										<%									
										set Rs=conn.execute("Select * from Students where Class_Room_id="&Request.queryString("Class_room_id")&"")
										while not rs.eof
										%>
														<option value="<%=rs("Std_Civil_id")%>" <%if Request.Form("SelectStdCivilID") = rs("std_civil_id") then%> selected <%End if%>><%=Rs("std_name")%></option>
										<%
											rs.movenext
										wend
										set rs=nothing
										%>
															</select>&nbsp;
					
					
					<input type="submit" value="≈—”«·" name="B1"> 						
					<span lang="en-us">&nbsp;&nbsp; </span> 						
				
					
				<!--		<a target="_blank" href="Students_Report_Admin_Print.asp?ID=<%=request.querystring("ID")%>&DeptName=<%=Request.querystring("DeptName")%>&sday=<%=Request.form("SelectDay")%>&smonth=<%=Request.form("SelectMonth")%>&EmployeeID=<%=Request.Form("SelectEmployee")%>">
					<font size="3">ÿ»«⁄…</font></a>
					-->
</p>
				</form>
				<br>
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
				nDisplayRecs =500
				nRecRange = 15
				nRecPerRow = 1
				pageName="student_behavior_admin_list.asp?q=0&id="&id=request.querystring("id")
				id=request.querystring("id")

			If Request.QueryString("Day")=1 then
				sSql = "select * from Sudent_behavior order by Class_Room_id, Behavior_ID"
	 		Else
	 			sday=Request.form("SelectDay")
	 			smonth=Request.form("SelectMonth")
				Class_Room_ID=Request.QueryString("Class_room_id")
				Std_civil_id = request.Form("selectStdCivilId")
				
	 			if sday <> 0 then
	 				if smonth <> 0 then
	 					if Std_civil_ID <> 0 then
								sSql = "select * from student_behavior where Std_civil_id='"& Std_Civil_id &"' and Class_Room_ID ="&Class_Room_ID&" and Report_day="&sDay&" and Report_Month="&smonth&" order by Department_ID,Std_civil_id,Report_date desc"
						Else
								sSql = "select * from student_behavior where  Class_Room_ID ="&Class_Room_ID&" and Report_day="&sDay&" and Report_Month="&smonth&" order by Department_ID,Std_civil_id,Report_date desc"
						End if		
					Else
						if Std_Civil_ID <> 0 then
							smonth= month(Date())
								sSql = "select * from student_behavior where Std_civil_id='"& Std_Civil_id &"' and Class_Room_ID="&Class_Room_ID&" and Report_day="&sDay&" and Report_Month="&smonth&" order by Department_ID,Std_civil_id,Report_date desc"
						Else
							smonth=month(Date())
								sSql = "select * from student_behavior where Class_Room_ID ="&Class_Room_ID&" and Report_day="&sDay&" and Report_Month="&smonth&" order by Department_ID,Std_civil_id,Report_date desc"
						End if		
					End if
				Elseif smonth <> 0 then
					if Std_civil_ID <> 0 then
							sSql = "select * from student_behavior where Std_civil_id='"& Std_Civil_id &"' and Class_Room_ID="&Class_Room_ID&" and Report_Month="&smonth&" order by Department_ID,Std_civil_id,Report_date desc"
					Else
							sSql = "select * from student_behavior where Class_Room_ID ="&Class_Room_ID&" and Report_Month="&smonth&" order by Department_ID,Std_civil_id,Report_date desc"
					End if
				ElseIF std_civil_ID <> 0 then
						sSql = "select * from student_behavior where Std_civil_id='"& Std_Civil_id &"' and Class_Room_ID ="&Class_Room_ID&" order by Department_ID,Std_civil_id,Report_date desc"
				Else 
					sSql = "select * from student_behavior where Class_Room_ID ="&Class_Room_ID&" order by Department_ID,Std_civil_id,Report_date desc"
				End if
			End if
				
				'	ssql="select * from student_behavior where class_Room_ID="&request.querystring("Class_room_ID")&" order by Department_ID,Std_civil_id,Report_date desc"
			
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
									<span lang="ar-kw">«· ﬁ—Ì—</span></td>
									<td class="tdViewHead" width="21%">
									<span lang="ar-kw">«”„ «·ÿ«·»</span></td>
									<td class="tdViewHead" width="9%">
									<span lang="ar-kw">«·ﬁ”„ «·⁄·„Ì</span></td>
									<td class="tdViewHead" width="21%" align="center">„·«ÕŸ« <span lang="ar-kw"> 
									«·≈œ«—…</span></td>
									<td class="tdViewHead" width="30%" align="center">«·„Œ«·›…</td>
									<td align="center" class="tdViewHead">
									<span lang="ar-kw">⁄—÷</span> </td>
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
									
									<td class="tdView" width="21%">&nbsp;
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
									
									<td class="tdView" width="9%">&nbsp;
										<%
										if rs("Department_ID")<>0 then
											set Rss=conn.execute("Select * from Departments where Department_ID="&rs("Department_ID")&"")
											if not rss.eof then
										%>
												<%=Rss("Department_Name")%>
										<%				
											else
												response.write "«·«‘—«›"	
											end if
										set rss=nothing
										Else
											response.write "«·«‘—«›"
										End if

										%>
</td>
									
									<td class="tdView" width="21%">
									<p align="center">&nbsp;<%=rs("Managment_Notes")%></td>
									
									<td class="tdView" width="30%">
									<table border="1" width="100%" style="border-collapse: collapse">
										<tr>
											<td align="center"> œŒÌ‰</td>
										<td align="center">«·‰Ê„</td>
										<td align="center">«·√œÊ«  </td>
										<td align="center">«·«‰ »«Â</td>
										<td align="center">Œ—ÊÃ</td>
										<td align="center"> √ŒÌ—</td>
										<td align="center">”·Êﬂ</td>
										<td align="center">«· ⁄·Ì„« </td>
									</tr>
									<tr>
										<td align="center">
								<%if rs("Smoking")= "yes" then%> ‰⁄„<%end if%></td>
										<td align="center">
								<%if rs("sleeping")= "yes" then%> ‰⁄„<%end if%></td>
										<td align="center">
								 <%if rs("study_Tools")= "yes" then%> ‰⁄„<%end if%></td>
										<td align="center">
								<%if rs("not_care")= "yes" then%> ‰⁄„<%end if%></td>
										<td align="center">
								 <%if rs("Get_out_of_Class")= "yes" then%> ‰⁄„<%end if%></td>
										<td align="center">
								<%if rs("Late_to_class")= "yes" then%> ‰⁄„<%end if%></td>
										<td align="center">
								<%if rs("wrong_behavior")= "yes" then%> ‰⁄„<%end if%></td>
										<td align="center">
								 <%if rs("refusal_instructions")= "yes" then%> ‰⁄„<%end if%></td>
									</tr>
								</table>
								</td>
									
									<td class="tdView" align="center" width="8%">
											<a href="student_behavior_Admin_update.asp?id=<%=rs("ID")%>&Class_Room=<%=request.querystring("Class_Room")%>&std_name=<%=std_name%>&page=0">
											«· ›«’Ì· Ê«·≈Ã—«¡</a>
									
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