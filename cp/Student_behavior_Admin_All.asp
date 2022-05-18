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
					<p align=right>  &nbsp;  <span lang="ar-kw">ﬂ«›… «·’Õ› «·”·ÊﬂÌ…</span></div>


				<div class="RecordAdd">
				
				<form action="student_behavior_Admin_all.asp?start=1" method="post" >
					
					<input type="hidden" value="<%=request.querystring("id")%>" name="txtDepartmentID">
				
								<!--	<input type="hidden" value="<%=PRODUCT_IMG1%>" name="txtHdnImg1">
									-->
						<input type="hidden" name="txtProcType" value="add">				
					<p><select size="1" name="SelectDay" class="select">
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
					</select> <select size="1" name="SelectClass" class="select">
						<option Value="0">«Œ — «·’› «·œ—«”Ì</option>
										<%									
										set Rs=conn.execute("Select * from Class_Room order by class_room_id asc")
										while not rs.eof
										%>
														<option value="<%=rs("Class_room_ID")%>" <%if cint(request.form("SelectClass")) = rs("Class_Room_id") then%> selected <%End if%>><%=Rs("Class_Room")%></option>
										<%
											rs.movenext
										wend
										set rs=nothing
										%>
															</select>&nbsp;
					
					
					<input type="submit" value="≈—”«·" name="B1"> 						
					<span lang="en-us">&nbsp;&nbsp; </span> 						
				
					
				
				<!--	<a target="_blank" href="student_behavior_admin_all_Print.asp?smonth=<%=Request.form("SelectMonth")%>&sDay=<%=Request.form("SelectDay")%>&SClass=<%=Request.form("SelectClass")%>"><font size="3">ÿ»«⁄…</font></a>
				-->
				</p>
				</form></div>
								
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

				

	 			'deptname=Request.form("txtDepartmentName")
	 			sday=Request.form("SelectDay")
	 			smonth=Request.form("SelectMonth")
				Class_Room_ID=Request.Form("SelectClass")
	 			if sday <> 0 then
	 				if smonth <> 0 then
	 					if Class_Room_ID <> 0 then
								sSql = "select * from student_behavior where Class_Room_ID ="&Class_Room_ID&" and Report_day="&sDay&" and Report_Month="&smonth&" order by Department_ID,Std_civil_id,Report_date"
						Else
							sSql = "select * from student_behavior where Report_day="&sDay&" and Report_Month="&smonth&" order by Department_ID,Std_civil_id,Report_date DESC"
						End if		
					Else
						if Class_Room_ID <> 0 then
							smonth= month(Date())
								sSql = "select * from student_behavior where Class_Room_ID="&Class_Room_ID&" and Report_day="&sDay&" and Report_Month="&smonth&" order by Department_ID,Std_civil_id,Report_date DESC"
						Else
							smonth=month(Date())
							sSql = "select * from student_behavior where Report_day="&sDay&" and Report_Month="&smonth&" order by Department_ID,Std_civil_id,Report_date DESC"
						End if		
					End if
				Elseif smonth <> 0 then
					if Class_Room_ID <> 0 then
							sSql = "select * from student_behavior where Class_Room_ID="&Class_Room_ID&" and Report_Month="&smonth&" order by Department_ID,Std_civil_id,Report_date DESC"
					Else
						sSql = "select * from student_behavior where Report_Month="&smonth&" order by Department_ID,Std_civil_id,Report_date DESC"
					End if
				ElseIF Class_Room_ID <> 0 then
					sSql = "select * from student_behavior where Class_Room_ID ="&Class_Room_ID&" order by Department_ID,Std_civil_id,Report_date DESC"
				Else 
					ssql = "select * from student_behavior order by Department_ID,Std_civil_id,Report_date desc"
				End if
				

						
			'	ssql="select * from student_behavior order by Department_ID,Std_civil_id,Report_date desc"
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
									<td class="tdViewHead" width="11%">
									<span lang="ar-kw">«”„ «·ÿ«·»</span></td>
									<td class="tdViewHead" width="10%">
									«·’›</td>
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
									
									<td class="tdView" width="11%">&nbsp;
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
									
									<td class="tdView" width="10%"><%
											set Rss=conn.execute("Select * from Class_Room where Class_Room_ID="&rs("Class_Room_ID")&"")
											if not rss.eof then
										%>
												<%=Rss("Class_Room")%>
										<%			
												Class_Room=	Rss("Class_Room")	
											end if
										set rss=nothing
										%></td>
									
									<td class="tdView" width="9%">&nbsp;
										<%
										if rs("Department_ID")<>0 then
											set Rss=conn.execute("Select * from Departments where Department_ID="&rs("Department_ID")&"")
											if not rss.eof then
										%>
												<%=Rss("Department_Name")%>
										<%					
											end if
										set rss=nothing
										Else
											response.write "«·«‘—«›"
										End if

										%>
</td>
									
									<td class="tdView" width="21%">&nbsp;<%=rs("Managment_Notes")%></td>
									
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
											<a href="student_behavior_Admin_update.asp?id=<%=rs("ID")%>&Class_Room=<%=Class_Room%>&std_name=<%=std_name%>&Page=2">
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
									<td colspan="7">&nbsp;</td>
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