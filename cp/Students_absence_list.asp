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

if session("Department_ID")<>"" then 

	Employee_ID=int(request.querystring("id"))

	set Conn=server.createobject("ADODB.Connection")
	Conn.open ConnString
	set Rs=server.createobject("ADODB.Recordset")
	Rs.open "select * from Employees where Employee_ID="&Employee_ID&" " , Conn,1,2
	if not Rs.eof then
		Employee_ID=rs("Employee_ID")
		Employee_Name=rs("Employee_Name")
		File_Number=rs("File_Number")
		Employee_Mobile=rs("Employee_Mobile")
		Position=rs("Position")
		Employee_EMAIL=rs("Employee_EMAIL")
		Civil_ID=rs("Civil_ID")
		subject=rs("subject")
		Date_Start=rs("Date_Start")
		Certificate_description=rs("Certificate_description")
		Certificate_Type=rs("Certificate_Type")
		Certificate_Date=rs("Certificate_Date")
		Hiring_Date=rs("Hiring_Date")
		Teacher_Hiring_Date=rs("Teacher_Hiring_Date")
		Nationality=rs("Nationality")
		Career_Level=rs("Career_Level")
		Housing_Area=rs("Housing_Area")
		Employee_MOBILE2=rs("Employee_MOBILE2")
		
		
	else
		response.write "<script>alert('Õ’· Œÿ√ ›Ì ⁄—÷ «·»Ì«‰« ')</script>"
	end if
	
	rs.close
	set rs=nothing
	
end if%>
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
					<p><span lang="en-us"><%=request.querystring("DeptName")%></span></div>
				
				<div class="RecordAdd">&nbsp;
				
<form action="Students_absence_list.asp?start=1&ID=<%=request.querystring("id")%>&DeptName=<%=request.querystring("DeptNAme")%>" method="post" >
					
					<input type="hidden" value="<%=request.querystring("id")%>" name="txtDepartmentID">
				
								<!--	<input type="hidden" value="<%=PRODUCT_IMG1%>" name="txtHdnImg1">
									-->
						<input type="hidden" name="txtProcType" value="add">				
					<p><select size="1" name="SelectDay" class="select">
						<option Value="0">«Œ — «·ÌÊ„</option>
						<option Value="1">1</option>
						<option Value="2">2</option>
						<option Value="3">3</option>
						<option Value="4">4</option>
						<option Value="5">5</option>
						<option Value="6">6</option>
						<option Value="7">7</option>
						<option Value="8">8</option>
						<option Value="9">9</option>
						<option Value="10">10</option>
						<option Value="11">11</option>
						<option Value="12">12</option>
						<option Value="13">13</option>
						<option Value="14">14</option>
						<option Value="15">15</option>
						<option Value="16">16</option>
						<option Value="17">17</option>
						<option Value="18">18</option>
						<option Value="19">19</option>
						<option Value="20">20</option>
						<option Value="21">21</option>
						<option Value="22">22</option>
						<option Value="23">23</option>
						<option Value="24">24</option>
						<option Value="25">25</option>
						<option Value="26">26</option>
						<option Value="27">27</option>
						<option Value="28">28</option>
						<option Value="29">29</option>
						<option Value="30">30</option>
						<option Value="31">31</option>
					</select>
					<select size="1" name="SelectMonth" class="select">
						<option Value="0">«Œ — «·‘Â—</option>
						<option Value="1">1</option>
						<option Value="2">2</option>
						<option Value="3">3</option>
						<option Value="4">4</option>
						<option Value="5">5</option>
						<option Value="6">6</option>
						<option Value="7">7</option>
						<option Value="8">8</option>
						<option Value="9">9</option>
						<option Value="10">10</option>
						<option Value="11">11</option>
						<option Value="12">12</option>

					</select><select size="1" name="SelectEmployee" class="select">
						<option Value="0">«Œ — «”„ «·„ÊŸ›</option>
										<%									
										set Rs=conn.execute("Select * from Employees where Department_ID="&Request.QueryString("ID")&"")
										while not rs.eof
										%>
														<option value="<%=rs("Employee_ID")%>"><%=Rs("Employee_Name")%></option>
										<%
											rs.movenext
										wend
										set rs=nothing
										%>
															</select>&nbsp;
					
					
					<input type="submit" value="≈—”«·" name="B1"> 						
					<span lang="en-us">&nbsp;&nbsp; </span> 						
				
				<!--	
						<a target="_blank" href="Department_Print.asp?ID=<%=request.querystring("ID")%>&DeptName=<%=Request.querystring("DeptName")%>&sday=<%=Request.form("SelectDay")%>&smonth=<%=Request.form("SelectMonth")%>&EmployeeID=<%=Request.Form("SelectEmployee")%>">
					<font size="3">ÿ»«⁄…</font></a>
					-->
</p>
				</form>					
				</div>
								
				<div class="ErrMsg">
				&nbsp;</div>
				<%
				nDisplayRecs =500
				nRecRange = 15
				nRecPerRow = 1
				pageName="Students_absence_list.asp.asp?q=0&id="&request.querystring("id")&""
				id=request.querystring("id")
				
			If Request.QueryString("Day")=1 then
				sSql = "select * from Sudents_absence where Department_ID ="&ID&" order by absence_ID DESC"
	 		Else
	 			id=Request.querystring("id")

	 			deptname=Request.form("txtDepartmentName")
	 			sday=Request.form("SelectDay")
	 			smonth=Request.form("SelectMonth")
				EmployeeID=Request.Form("SelectEmployee")
	 			if sday <> 0 then
	 				if smonth <> 0 then
	 					if EmployeeID <> 0 then
								sSql = "select * from Students_absence where Employee_ID="&EmployeeID&" and Department_ID ="&Request.Form("txtDepartmentID")&" and absence_day="&sDay&" and absence_Month="&smonth&" order by absence_id DESC"
						Else
								sSql = "select * from Students_absence where Department_ID ="&Request.Form("txtDepartmentID")&" and Absence_day="&sDay&" and Absence_Month="&smonth&" order by absence_ID DESC"
						End if		
					Else
						if EmployeeID <> 0 then
							smonth= month(Date())
								sSql = "select * from Students_absence where employee_ID="&EmployeeID&" and Department_ID ="&Request.Form("txtDepartmentID")&" and Absence_day="&sDay&" and Absence_Month="&smonth&" order by Absence_ID DESC"
						Else
								sSql = "select * from Students_absence where Department_ID ="&Request.Form("txtDepartmentID")&" and Absence_day="&sDay&" and Absence_Month="&smonth&" order by Absence_ID DESC"
						End if		
					End if
				Elseif smonth <> 0 then
					if Employeeid <> 0 then
						sSql = "select * from Stucents_absence where Employee_ID="&EmployeeID&" and Department_ID ="&ID&" and Absence_Month="&smonth&" order by Absence_ID DESC"
					Else
						sSql = "select * from Students_absence where Department_ID ="&ID&" and Absence_Month="&smonth&" order by Absence_ID DESC"
					End if
				ElseIF EmployeeID <> 0 then
					sSql = "select * from Students_absence where Employee_ID="&Employeeid&" and Department_ID ="&ID&" order by Absence_ID DESC"
				Else 
					sSql = "select * from Students_absence where Department_ID ="&ID&" order by Absence_ID DESC"
				End if
				
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
							<table cellspacing="0" cellpadding="3" class="tblView">
								<thead>
									<td class="tdViewHead" width="13%" dir="rtl"> «—ÌŒ «·€Ì«»</td>
									<td class="tdViewHead" width="11%" dir="rtl">
									«”„ «·„⁄·„</td>
									<td class="tdViewHead" width="10%" dir="rtl">
									«·Õ’…</td>
									<td class="tdViewHead" width="12%" dir="rtl">
									«·’›</td>
									<td class="tdViewHead" width="9%" dir="rtl">
									«”„ «·ÿ«·»</td>
									<td class="tdViewHead" width="12%" dir="rtl">«·—ﬁ„ 
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
									<td class="tdView" width="13%" dir="rtl"><%=rs("Absence_Day")&"/"&rs("Absence_month")&"/"&rs("Absence_year")%>
											
									</td>
									
									<td class="tdView" width="11%" dir="rtl">&nbsp;
									<%
										set Rss=conn.execute("Select * from Employees where Employee_id="&rs("Employee_id")&"")
										if not rss.eof then
											response.write rss("Employee_name")
										end if
										Rss.close
									%></td>
									
									<td class="tdView" width="10%" dir="rtl">&nbsp;<%=rs("Lecture_Time_ID")%></td>
									
									<td class="tdView" width="12%" dir="rtl">
									
									<%
										set Rss=conn.execute("Select * from Class_Room where Class_Room_id="&rs("Class_room_id")&"")
										if not rss.eof then
											response.write rss("Class_room")
										end if
										Rss.close
									%>
									
									</td>
									<td class="tdView" width="9%" dir="rtl">
									<p align="center">
									
									<%
										set Rss=conn.execute("Select * from Students where std_Civil_id='"&rs("std_Civil_id")&"'")
										if not rss.eof then
	
												response.write rss("std_name")
											
										Else
												response.write "·«ÌÊÃœ €Ì«»"
										End if
										Rss.close
									%>
																		
									</td>
								

									<td class="tdView" width="12%" dir="rtl">
									&nbsp;<%=rs("std_Civil_id")%></td>
									
									
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
					<p><span lang="en-us"><%=request.querystring("DeptName")%></span></div>
				
				<div class="RecordAdd">&nbsp;
				
<form action="Students_absence_list.asp?start=1&ID=<%=request.querystring("id")%>&DeptName=<%=request.querystring("DeptNAme")%>" method="post" >
					
					<input type="hidden" value="<%=request.querystring("id")%>" name="txtDepartmentID">
				
								<!--	<input type="hidden" value="<%=PRODUCT_IMG1%>" name="txtHdnImg1">
									-->
						<input type="hidden" name="txtProcType" value="add">				
					<p><select size="1" name="SelectDay" class="select">
						<option Value="0">«Œ — «·ÌÊ„</option>
						<option Value="1">1</option>
						<option Value="2">2</option>
						<option Value="3">3</option>
						<option Value="4">4</option>
						<option Value="5">5</option>
						<option Value="6">6</option>
						<option Value="7">7</option>
						<option Value="8">8</option>
						<option Value="9">9</option>
						<option Value="10">10</option>
						<option Value="11">11</option>
						<option Value="12">12</option>
						<option Value="13">13</option>
						<option Value="14">14</option>
						<option Value="15">15</option>
						<option Value="16">16</option>
						<option Value="17">17</option>
						<option Value="18">18</option>
						<option Value="19">19</option>
						<option Value="20">20</option>
						<option Value="21">21</option>
						<option Value="22">22</option>
						<option Value="23">23</option>
						<option Value="24">24</option>
						<option Value="25">25</option>
						<option Value="26">26</option>
						<option Value="27">27</option>
						<option Value="28">28</option>
						<option Value="29">29</option>
						<option Value="30">30</option>
						<option Value="31">31</option>
					</select>
					<select size="1" name="SelectMonth" class="select">
						<option Value="0">«Œ — «·‘Â—</option>
						<option Value="1">1</option>
						<option Value="2">2</option>
						<option Value="3">3</option>
						<option Value="4">4</option>
						<option Value="5">5</option>
						<option Value="6">6</option>
						<option Value="7">7</option>
						<option Value="8">8</option>
						<option Value="9">9</option>
						<option Value="10">10</option>
						<option Value="11">11</option>
						<option Value="12">12</option>

					</select><select size="1" name="SelectEmployee" class="select">
						<option Value="0">«Œ — «”„ «·„ÊŸ›</option>
										<%									
										set Rs=conn.execute("Select * from Employees where Department_ID="&Request.QueryString("ID")&"")
										while not rs.eof
										%>
														<option value="<%=rs("Employee_ID")%>"><%=Rs("Employee_Name")%></option>
										<%
											rs.movenext
										wend
										set rs=nothing
										%>
															</select>&nbsp;
					
					
					<input type="submit" value="≈—”«·" name="B1"> 						
					<span lang="en-us">&nbsp;&nbsp; </span> 						
				
				<!--	
						<a target="_blank" href="Department_Print.asp?ID=<%=request.querystring("ID")%>&DeptName=<%=Request.querystring("DeptName")%>&sday=<%=Request.form("SelectDay")%>&smonth=<%=Request.form("SelectMonth")%>&EmployeeID=<%=Request.Form("SelectEmployee")%>">
					<font size="3">ÿ»«⁄…</font></a>
					-->
</p>
				</form>					
				</div>
								
				<div class="ErrMsg">
				&nbsp;</div>
				<%
				nDisplayRecs =500
				nRecRange = 15
				nRecPerRow = 1
				pageName="Students_absence_list.asp.asp?q=0&id="&request.querystring("id")&""
				id=request.querystring("id")
				
			If Request.QueryString("Day")=1 then
				sSql = "select * from Sudents_absence where Department_ID ="&ID&" order by absence_ID DESC"
	 		Else
	 			id=Request.querystring("id")

	 			deptname=Request.form("txtDepartmentName")
	 			sday=Request.form("SelectDay")
	 			smonth=Request.form("SelectMonth")
				EmployeeID=Request.Form("SelectEmployee")
	 			if sday <> 0 then
	 				if smonth <> 0 then
	 					if EmployeeID <> 0 then
								sSql = "select * from Students_absence where Employee_ID="&EmployeeID&" and Department_ID ="&Request.Form("txtDepartmentID")&" and absence_day="&sDay&" and absence_Month="&smonth&" order by absence_id DESC"
						Else
								sSql = "select * from Students_absence where Department_ID ="&Request.Form("txtDepartmentID")&" and Absence_day="&sDay&" and Absence_Month="&smonth&" order by absence_ID DESC"
						End if		
					Else
						if EmployeeID <> 0 then
							smonth= month(Date())
								sSql = "select * from Students_absence where employee_ID="&EmployeeID&" and Department_ID ="&Request.Form("txtDepartmentID")&" and Absence_day="&sDay&" and Absence_Month="&smonth&" order by Absence_ID DESC"
						Else
								sSql = "select * from Students_absence where Department_ID ="&Request.Form("txtDepartmentID")&" and Absence_day="&sDay&" and Absence_Month="&smonth&" order by Absence_ID DESC"
						End if		
					End if
				Elseif smonth <> 0 then
					if Employeeid <> 0 then
						sSql = "select * from Stucents_absence where Employee_ID="&EmployeeID&" and Department_ID ="&ID&" and Absence_Month="&smonth&" order by Absence_ID DESC"
					Else
						sSql = "select * from Students_absence where Department_ID ="&ID&" and Absence_Month="&smonth&" order by Absence_ID DESC"
					End if
				ElseIF EmployeeID <> 0 then
					sSql = "select * from Students_absence where Employee_ID="&Employeeid&" and Department_ID ="&ID&" order by Absence_ID DESC"
				Else 
					sSql = "select * from Students_absence where Department_ID ="&ID&" order by Absence_ID DESC"
				End if
				
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
							<table cellspacing="0" cellpadding="3" class="tblView">
								<thead>
									<td class="tdViewHead" width="13%" dir="rtl"> «—ÌŒ «·€Ì«»</td>
									<td class="tdViewHead" width="11%" dir="rtl">
									«”„ «·„⁄·„</td>
									<td class="tdViewHead" width="10%" dir="rtl">
									«·Õ’…</td>
									<td class="tdViewHead" width="12%" dir="rtl">
									«·’›</td>
									<td class="tdViewHead" width="9%" dir="rtl">
									«”„ «·ÿ«·»</td>
									<td class="tdViewHead" width="12%" dir="rtl">«·—ﬁ„ 
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
									<td class="tdView" width="13%" dir="rtl"><%=rs("Absence_Day")&"/"&rs("Absence_month")&"/"&rs("Absence_year")%>
											
									</td>
									
									<td class="tdView" width="11%" dir="rtl">&nbsp;
									<%
										set Rss=conn.execute("Select * from Employees where Employee_id="&rs("Employee_id")&"")
										if not rss.eof then
											response.write rss("Employee_name")
										end if
										Rss.close
									%></td>
									
									<td class="tdView" width="10%" dir="rtl">&nbsp;<%=rs("Lecture_Time_ID")%></td>
									
									<td class="tdView" width="12%" dir="rtl">
									
									<%
										set Rss=conn.execute("Select * from Class_Room where Class_Room_id="&rs("Class_room_id")&"")
										if not rss.eof then
											response.write rss("Class_room")
										end if
										Rss.close
									%>
									
									</td>
									<td class="tdView" width="9%" dir="rtl">
									<p align="center">
									
									<%
										set Rss=conn.execute("Select * from Students where std_Civil_id='"&rs("std_Civil_id")&"'")
										if not rss.eof then
	
												response.write rss("std_name")
											
										Else
												response.write "·«ÌÊÃœ €Ì«»"
										End if
										Rss.close
									%>
																		
									</td>
								

									<td class="tdView" width="12%" dir="rtl">
									&nbsp;<%=rs("std_Civil_id")%></td>
									
									
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