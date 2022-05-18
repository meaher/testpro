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
					€Ì«» «·’›<%=request.queryString("Class_room")%> »«· ›«’Ì·</div>
				
				<div class="RecordAdd"><form action="Students_absence_Admin_Details.asp?start=1&Class_Room_ID=<%=Request.QueryString("Class_Room_id")%>&Class_Room=<%=Request.QueryString("Class_room")%>" method="post" >
					
					<input type="hidden" value="<%=request.querystring("Class_Romm_id")%>" name="txtDepartmentID">
				
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
					</select><select size="1" name="SelectStdCivilID" class="select">
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
				
					
				<!--		<a target="_blank" href="Students_absence_Admin_Print.asp?ID=<%=request.querystring("ID")%>&DeptName=<%=Request.querystring("DeptName")%>&sday=<%=Request.form("SelectDay")%>&smonth=<%=Request.form("SelectMonth")%>&EmployeeID=<%=Request.Form("SelectEmployee")%>">
					<font size="3">ÿ»«⁄…</font></a>
					-->
					<a target="_blank" href="Students_absence_admin_Details_Print.asp?Class_Room_ID=<%=Request.QueryString("Class_Room_id")%>&Class_room=<%=request.querystring("Class_room")%>&smonth=<%=Request.form("SelectMonth")%>&sDay=<%=Request.form("SelectDay")%>&SelectStdCivilID=<%=Request.form("SelectStdCivilID")%>"><font size="3">ÿ»«⁄…</font></a></p>
				</form>					
				</div>
								
				<div class="ErrMsg">
				<font color="red"><%=session("ErrMsg")%></font>
				<%session("ErrMsg")=""%>
				</div>
				<%
				nDisplayRecs =500
				nRecRange = 15
				nRecPerRow = 1
				pageName="Students_absence_Admin_Details.asp.asp?q=0"
				
				
			If Request.QueryString("Day")=1 then
				sSql = "select * from Sudents_absence order by Class_Room_id, absence_ID"
	 		Else

	 			'deptname=Request.form("txtDepartmentName")
	 			sday=Request.form("SelectDay")
	 			smonth=Request.form("SelectMonth")
				Class_Room_ID=Request.QueryString("Class_room_id")
				Std_civil_id = request.Form("selectStdCivilId")
	 			if sday <> 0 then
	 				if smonth <> 0 then
	 					if Std_civil_ID <> 0 then
								sSql = "select * from Students_absence where Std_civil_id='"& Std_Civil_id &"' and Class_Room_ID ="&Class_Room_ID&" and absence_day="&sDay&" and absence_Month="&smonth&" order by Class_Room_ID, absence_id DESC"
						Else
								sSql = "select * from Students_absence where  Class_Room_ID ="&Class_Room_ID&" and Absence_day="&sDay&" and Absence_Month="&smonth&" order by Class_Room_ID, absence_ID DESC"
						End if		
					Else
						if Std_Civil_ID <> 0 then
							smonth= month(Date())
								sSql = "select * from Students_absence where Std_civil_id='"& Std_Civil_id &"' and Class_Room_ID="&Class_Room_ID&" and Absence_day="&sDay&" and Absence_Month="&smonth&" order by Class_Room_ID, Absence_ID DESC"
						Else
							smonth=month(Date())
								sSql = "select * from Students_absence where Class_Room_ID ="&Class_Room_ID&" and Absence_day="&sDay&" and Absence_Month="&smonth&" order by Absence_ID DESC"
						End if		
					End if
				Elseif smonth <> 0 then
					if Std_civil_ID <> 0 then
							sSql = "select * from Students_absence where Std_civil_id='"& Std_Civil_id &"' and Class_Room_ID="&Class_Room_ID&" and Absence_Month="&smonth&" order by Class_Room_ID, Absence_ID DESC"
					Else
						sSql = "select * from Students_absence where Class_Room_ID ="&Class_Room_ID&" and Absence_Month="&smonth&" order by Class_Room_ID, Absence_ID DESC"
					End if
				ElseIF std_civil_ID <> 0 then
					sSql = "select * from Students_absence where Std_civil_id='"& Std_Civil_id &"' and Class_Room_ID ="&Class_Room_ID&" order by Class_Room_ID, Absence_ID DESC"
				Else 
					sSql = "select * from Students_absence where Class_Room_ID ="&Class_Room_ID&" order by Class_Room_ID, Absence_ID DESC"
				End if
				
	 		End if
				Set rs = Server.CreateObject("ADODB.Recordset")
				rs.CursorLocation = 3
				'response.write sSql 
				'response.end				
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
									<td class="tdViewHead" width="7%" dir="rtl"> «—ÌŒ «·€Ì«»</td>
									<td class="tdViewHead" width="6%" dir="rtl">«·Õ’…</td>
									<td class="tdViewHead" width="7%" dir="rtl">
									«·’›</td>
									<td class="tdViewHead" width="18%" dir="rtl">
									«”„ «·„⁄·„</td>
									<td class="tdViewHead" width="19%" dir="rtl">
									«”„ «·ÿ«·»</td>
									<td class="tdViewHead" width="16%" dir="rtl">
																		«·—ﬁ„ 
									«·„œ‰Ì</td>
									<td class="tdViewHead" width="6%" dir="rtl">
									«·ﬁ”„ «·⁄·„Ì</td>
									<td class="tdViewHead" width="6%" dir="rtl">
									ÿ—Ìﬁ… «·«œŒ«·</td>
									<td class="tdViewHead" width="10%" dir="rtl">
									&nbsp;</td>
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
									<td class="tdView" width="7%" dir="rtl"><%=rs("Absence_Day")&"/"&rs("Absence_month")&"/"&rs("Absence_year")%>
											
									</td>
									
									<td class="tdView" width="6%" dir="rtl">&nbsp;<%=rs("Lecture_Time_ID")%></td>
									
									<td class="tdView" width="7%" dir="rtl">
									
									<%
										set Rss=conn.execute("Select * from Class_Room where Class_Room_id="&rs("Class_room_id")&"")
										if not rss.eof then
											response.write rss("Class_room")
										end if
										Rss.close
									%>
									
									</td>
									
									<td class="tdView" width="18%" dir="rtl">&nbsp;
									<%
										set Rss=conn.execute("Select * from Employees where Employee_id="&rs("Employee_id")&"")
										if not rss.eof then
											response.write rss("Employee_name")
										end if
										Rss.close
									%></td>
									
									<td class="tdView" width="19%" dir="rtl">
									
									<p align="center">
									
									<%
										set Rss=conn.execute("Select * from Students where std_Civil_id='"&rs("std_Civil_id")&"'")
										if not rss.eof then
											response.write rss("std_name")
										Else
												response.write "·« €«∆»"
										end if
										Rss.close
									%>
																		
									</td>
									<td class="tdView" width="16%" dir="rtl">
									&nbsp;<%=rs("std_Civil_id")%></td>
								

									<td class="tdView" width="6%" dir="rtl">
									&nbsp;
									<%
										set Rss=conn.execute("Select * from Departments where Department_id="&rs("Department_id")&"")
										if not rss.eof then
											response.write rss("Department_name")
										end if
										Rss.close
									%></td>
									
									
								<% If (nRecActual Mod nRecPerRow = 0) Or (nRecPerRow < 2) Then %>
																

									<td class="tdView" width="6%" dir="rtl">
									<%
									if rs("Managment")="yes" then
										response.write "«·≈œ«—…"
									Else
										response.write "„⁄·„ «·’›"
									End if
									%></td>
									
									
									<td class="tdView" width="10%" dir="rtl">
											<%if session("ADMIN_LEVEL")=4 or session("ADMIN_LEVEL")=1 or session("ADMIN_LEVEL")=3 then%>			
															<a href="Students_absence_Admin_Details_chk.asp?id=<%=rs("Absence_ID")%>&Class_Room_id=<%=rs("Class_room_id")%>&Class_Room=<%=Request.queryString("Class_Room")%>&start=1">
																	Õ–› „‰ «·€Ì«»</a>
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
									<td colspan="9">&nbsp;</td>
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