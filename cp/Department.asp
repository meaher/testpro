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
					<p style="text-align: Right"><span lang="en-us"><%=request.querystring("DeptName")%></span></div>
				
				<div class="RecordAdd"><a href="Department_add.asp?ID=<%=request.querystring("id")%>&DeptName=<%=request.querystring("DeptName")%>">≈÷«›… «·œÊ«„ «·ÌÊ„Ì</a>&nbsp;
			<div align=center>	<%
				if session("Errmsg")<> "" then 
					response.write  session("Errmsg")
					session("Errmsg")=""
				end if
				%></div>
<form action="Department.asp?start=1&ID=<%=request.querystring("id")%>&DeptName=<%=request.querystring("DeptNAme")%>" method="post" >
					
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
						<option Value="0" <%if request.form("SelectMonth")=0 then%> selected <%end if%>>«Œ — «·‘Â—</option>
						<option Value="1" <%if request.form("SelectMonth")=1 then%> selected <%end if%>>1</option>
						<option Value="2" <%if request.form("SelectMonth")=2 then%> selected <%end if%>>2</option>
						<option Value="3" <%if request.form("SelectMonth")=3 then%> selected <%end if%>>3</option>
						<option Value="4" <%if request.form("SelectMonth")=4 then%> selected <%end if%>>4</option>
						<option Value="5" <%if request.form("SelectMonth")=5 then%> selected <%end if%>>5</option>
						<option Value="6" <%if request.form("SelectMonth")=6 then%> selected <%end if%>>6</option>
						<option Value="7" <%if request.form("SelectMonth")=7 then%> selected <%end if%>>7</option>
						<option Value="8" <%if request.form("SelectMonth")=8 then%> selected <%end if%>>8</option>
						<option Value="9" <%if request.form("SelectMonth")=9 then%> selected <%end if%>>9</option>
						<option Value="10" <%if request.form("SelectMonth")=10 then%> selected <%end if%>>10</option>
						<option Value="11" <%if request.form("SelectMonth")=11 then%> selected <%end if%>>11</option>
						<option Value="12" <%if request.form("SelectMonth")=12 then%> selected <%end if%>>12</option>

					</select><select size="1" name="SelectEmployee" class="select">
						<option Value="0">«Œ — «”„ «·„ÊŸ›</option>
										<%									
										set Rs=conn.execute("Select * from Employees where Department_ID="&Request.QueryString("ID")&"")
										while not rs.eof
										%>
														<option value="<%=rs("Employee_ID")%>"   <%if rs("Employee_id")=cint(request.form("SelectEmployee")) then%> selected <%end if%>><%=Rs("Employee_Name")%></option>
										<%
											rs.movenext
										wend
										set rs=nothing
										%>
															</select>&nbsp;
					
					
					<input type="submit" value="≈—”«·" name="B1"> 						
					<span lang="en-us">&nbsp;&nbsp; </span> 						<a target="_blank" href="Department_Print.asp?ID=<%=request.querystring("ID")%>&DeptName=<%=Request.querystring("DeptName")%>&sday=<%=Request.form("SelectDay")%>&smonth=<%=Request.form("SelectMonth")%>&EmployeeID=<%=Request.Form("SelectEmployee")%>">
					<font size="3">ÿ»«⁄…</font></a>
</p>
				</form>					
				</div>
								
				<div class="ErrMsg">
				&nbsp;		</div>
				<%
				nDisplayRecs =500
				nRecRange = 15
				nRecPerRow = 1
				pageName="Department.asp?q=0&id="&request.querystring("id")&""
				id=request.querystring("id")
				
			If Request.QueryString("Day")=1 then
				sSql = "select * from Work_Day where Department_ID ="&ID&" order by work_ID DeSC"
	 		Else
	 			id=Request.querystring("id")

	 			deptname=Request.form("txtDepartmentName")
	 			sday=Request.form("SelectDay")
	 			smonth=Request.form("SelectMonth")
				EmployeeID=Request.Form("SelectEmployee")
	 			if sday <> 0 then
	 				if smonth <> 0 then
	 					if EmployeeID <> 0 then
								sSql = "select * from Work_Day where Employee_ID="&EmployeeID&" and Department_ID ="&Request.Form("txtDepartmentID")&" and Work_day="&sDay&" and Work_Month="&smonth&" order by work_ID DESC"
						Else
									sSql = "select * from Work_Day where Department_ID ="&Request.Form("txtDepartmentID")&" and Work_day="&sDay&" and Work_Month="&smonth&" order by work_ID DESC"
						End if		
					Else
						if EmployeeID <> 0 then
							smonth= month(Date())
								sSql = "select * from Work_Day where employee_ID="&EmployeeID&" and Department_ID ="&Request.Form("txtDepartmentID")&" and Work_day="&sDay&" and Work_Month="&smonth&" order by work_ID DESC"
						Else
								sSql = "select * from Work_Day where Department_ID ="&Request.Form("txtDepartmentID")&" and Work_day="&sDay&" and Work_Month="&smonth&" order by work_Date DESC"
						End if		
					End if
				Elseif smonth <> 0 then
					if Employeeid <> 0 then
						sSql = "select * from Work_Day where Employee_ID="&EmployeeID&" and Department_ID ="&ID&" and Work_Month="&smonth&" order by work_Date DESC"
					Else
						sSql = "select * from Work_Day where Department_ID ="&ID&" and Work_Month="&smonth&" order by work_Date DESC"
					End if
				ElseIF EmployeeID <> 0 then
					sSql = "select * from Work_Day where Employee_ID="&Employeeid&" and Department_ID ="&ID&" order by work_Date DESC"
				Else 
					sSql = "select * from Work_Day where Department_ID ="&ID&" order by work_ID DESC"
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
						<br>
							<table cellspacing="0" cellpadding="3" class="tblView">
								<thead>
									<td class="tdViewHead" width="13%" dir="rtl">«· «—ÌŒ</td>
									<td class="tdViewHead" width="21%" dir="rtl">«”„ 
									«·„ÊŸ›</td>
									<td class="tdViewHead" width="12%" dir="rtl">«·ﬁ”„</td>
									<td class="tdViewHead" width="11%" dir="rtl">«·Õ÷Ê—</td>
									<td class="tdViewHead" width="9%" dir="rtl">«·«‰’—«›</td>
									<td class="tdViewHead" width="12%" dir="rtl">
									≈–‰ ’»«ÕÌ</td>
									<td align="center" class="tdViewHead" dir="rtl">
									≈–‰ „”«∆Ì</td>
									<td align="center" class="tdViewHead" dir="rtl">
								<%if session("ADMIN_LEVEL")=1 then%>
									Õ–›
									<%End if%>
									</td>
									<td align="center" class="tdViewHead" dir="rtl">
									 ⁄œÌ·</td>
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
									<td class="tdView" width="13%" dir="rtl"><%=rs("Work_Day")&"/"&rs("Work_month")&"/"&rs("Work_year")%>
											
									</td>
									
									<td class="tdView" width="21%" dir="rtl">&nbsp;<%=rs("Employee_Name")%></td>
									
									<td class="tdView" width="12%" dir="rtl"><%=Request.querystring("DeptName")%></td>
									<td class="tdView" width="11%" dir="rtl">
									<p align="center"><%If rs("leave_in")=true then%>&#8730;<%End if%></td>
								

									<td class="tdView" width="9%" dir="rtl">
									<%If rs("leave_out")=true then%>&#8730;<%End if%>
									</td>
									
									<td class="tdView" width="12%" dir="rtl">
									&nbsp;<%If rs("Morning_Permission")=true then%>≈–‰ ’»«ÕÌ<%End if%></td>
									<td class="tdView" align="center" width="10%" dir="rtl">&nbsp;
									<%If rs("Evening_Permission")=true then%>≈–‰ „”«∆Ì<%End if%></td>
									<td class="tdView" align="center" width="7%" dir="rtl">
								<%if session("ADMIN_LEVEL")=1 then%>
									<a href="Department_delete.asp?id=<%=rs("Work_ID")%>&DeptName=<%=Request.querystring("DeptName")%>">
									<span lang="en-us">Õ–›</span></a>
								<%End if%>
									</td>
									<td class="tdView" align="center" width="7%" dir="rtl">
									<%if rs("work_Day")=Day(DateAdd("h",11,now())) and rs("work_month")=month(DateAdd("h",11,now())) and rs("work_year")=Year(DateAdd("h",11,now())) then%>
									<a href="Department_update.asp?id=<%=rs("Work_ID")%>&DeptName=<%=Request.querystring("DeptName")%>">
									<span lang="en-us"> ⁄œ»·</span></a>
									<%End if%>
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