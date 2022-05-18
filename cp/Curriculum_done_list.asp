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
					<p align=right>„« ﬁÿ⁄ „‰ «·„‰ÂÃ<span lang="en-us"> </span></div>
				
				<div class="RecordAdd"><a href="Curriculum_done_Add.asp?ID=<%=request.querystring("ID")%>&DeptName=<%=request.querystring("DeptName")%>">≈÷«›… ÃœÌœ</a>
				<form action="Curriculum_done_list.asp?start=1&ID=<%=request.querystring("id")%>&DeptName=<%=request.querystring("DeptNAme")%>" method="post" >
					
					<input type="hidden" value="<%=request.querystring("id")%>" name="txtDepartmentID">
				
								<!--	<input type="hidden" value="<%=PRODUCT_IMG1%>" name="txtHdnImg1">
									-->
						<input type="hidden" name="txtProcType" value="add">				
					<p>&nbsp;<select size="1" name="SelectMonth" class="select">
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

					</select> ≈·Ï <select size="1" name="SelectMonth2" class="select">
						<option Value="0" <%if request.form("SelectMonth2")=0 then%> selected <%end if%>>«Œ — «·‘Â—</option>
						<option Value="1" <%if request.form("SelectMonth2")=1 then%> selected <%end if%>>1</option>
						<option Value="2" <%if request.form("SelectMonth2")=2 then%> selected <%end if%>>2</option>
						<option Value="3" <%if request.form("SelectMonth2")=3 then%> selected <%end if%>>3</option>
						<option Value="4" <%if request.form("SelectMonth2")=4 then%> selected <%end if%>>4</option>
						<option Value="5" <%if request.form("SelectMonth2")=5 then%> selected <%end if%>>5</option>
						<option Value="6" <%if request.form("SelectMonth2")=6 then%> selected <%end if%>>6</option>
						<option Value="7" <%if request.form("SelectMonth2")=7 then%> selected <%end if%>>7</option>
						<option Value="8" <%if request.form("SelectMonth2")=8 then%> selected <%end if%>>8</option>
						<option Value="9" <%if request.form("SelectMonth2")=9 then%> selected <%end if%>>9</option>
						<option Value="10" <%if request.form("SelectMonth2")=10 then%> selected <%end if%>>10</option>
						<option Value="11" <%if request.form("SelectMonth2")=11 then%> selected <%end if%>>11</option>
						<option Value="12" <%if request.form("SelectMonth2")=12 then%> selected <%end if%>>12</option>

					</select>
					
					<select size="1" name="SelectEmployeeID" class="select">
						<option Value="0" <%if request.form("SelectEmployeeID")=0 then%> selected <%end if%>>Ã„Ì⁄ «·„⁄·„Ì‰</option>
										<%									
										set Rssd=conn.execute("Select * from Employees where Department_id="&Request.querystring("id")&"")
										while not rssd.eof
										%>
														<option value="<%=rssd("Employee_id")%>"  <%if rssd("Employee_id")=cint(request.form("SelectEmployeeID")) then%> selected <%end if%>><%=Rssd("Employee_Name")%></option>
										<%
											rssd.movenext
										wend
										set rssd=nothing
										%>
					</select>&nbsp;
					
					
					<input type="submit" value="≈—”«·" name="B1"> 						
					<span lang="en-us">&nbsp;&nbsp; </span> &nbsp;
				<%	
				Employeeid=request.Form("SelectEmployeeId")
				if Employeeid="" then
					Employeeid = 0
				end if
				%>
					<a target="_blank" href="Curriculum_done_list_Print.asp?EmployeeID=<%=EmployeeID%>&ID=<%=session("Department_id")%>&smonth=<%=Request.form("SelectMonth")%>&smonth2=<%=Request.form("SelectMonth2")%>"><font size="3">ÿ»«⁄…</font></a></p>
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
				nDisplayRecs =500
				nRecRange = 15
				nRecPerRow = 1
					ii=1
				pageName="curriculum_done_list.asp?q=0&id="&request.querystring("id")
				id=request.querystring("id")
				SelectMonth=request.form("SelectMonth")
				SelectMonth2=request.form("SelectMonth2")
				
				'EmployeeID=request.form("SelectEmployeeID")
				if EmployeeID > 0 then
					if SelectMonth > 0 then
						if SelectMonth2 > 0 then
							sSql = "select * from Curriculum_done where Employee_id="&EmployeeID &" and Department_id = "& id &" and Curriculum_Month between "& SelectMonth &" and "& SelectMonth2 &" order by Curriculum_date,Educational_level"							
						else 
								sSql = "select * from Curriculum_done where Employee_id="&EmployeeID &" and Department_id = "& id &" and Curriculum_Month="& SelectMonth &" order by Curriculum_date,Educational_level"
						end if
					Else		
						sSql = "select * from Curriculum_done where Employee_id="&EmployeeID &" and Department_id = "& id &" order by Curriculum_date,Educational_level"
					End if
				Else
					if SelectMonth > 0 then
						if SelectMonth2 > 0 then
						    	sSql = "select * from Curriculum_done where Department_id = "& id &" and Curriculum_Month between "& SelectMonth &" and "& SelectMonth2 &" order by Curriculum_date,Educational_level"
						else
							sSql = "select * from Curriculum_done where Department_id = "& id &" and Curriculum_Month= "& SelectMonth &" order by Curriculum_date,Educational_level"
						end if
					else
						sSql = "select * from Curriculum_done where Department_id = "& id &" order by Department_ID, Curriculum_date,Educational_level"
					End if
	 			End if
	 			

									
				'sSql = "select * from Curriculum_done where Department_ID ="&ID&" "
	 
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
									<td class="tdViewHead" width="4%" align="center">&nbsp;</td>
									<td class="tdViewHead" width="8%" align="center">«· «—ÌŒ</td>
									<td class="tdViewHead" width="14%" align="center">«·„—Õ·… 
									«·œ—«”Ì…</td>
									<td class="tdViewHead" width="11%" align="center">⁄‰Ê«‰ 
									«·œ—”</td>
									<td class="tdViewHead" width="10%" align="center">«”„ 
									«·„⁄·„</td>
									<td class="tdViewHead" width="10%" align="center">
									„ ›ﬁ</td>
									<td class="tdViewHead" width="10%" align="center"> „ 
									«· œ—Ì”</td>
									<td class="tdViewHead" width="25%" align="center">„·«ÕŸ« </td>
									<td align="center" class="tdViewHead">
									Õ–› «·»Ì«‰« </td>
									<td align="center" class="tdViewHead">
									 ⁄œÌ· </td>
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
									<td class="tdView" width="4%" align="center">&nbsp;</td>
									
									<td class="tdView" width="8%" align="center">&nbsp;<%=DAY(rs("Curriculum_Date"))&"/"&Month(rs("Curriculum_Date"))&"/"&Year(rs("Curriculum_Date"))%></td>
									
									<td class="tdView" width="14%" align="center">&nbsp;<%=rs("Educational_level")%></td>
									
									<td class="tdView" width="11%" align="center">&nbsp;<%=rs("Subject")%></td>
									
									<td class="tdView" width="10%" align="center">&nbsp;
									<%
													Set rss = Server.CreateObject("ADODB.Recordset")
													rss.open "select employee_name from employees where employee_id="&rs("Employee_ID")&"",conn,2,1
									if not rss.eof then
									%>
									<%=rss("Employee_Name")%>
									<%end if
									rss.close
									set rss=nothing
									%>
									
									</td>
									
									<td class="tdView" width="10%" align="center">&nbsp;<%=rs("Status")%></td>
									
									<td class="tdView" width="10%" align="center">
							 <%if rs("done")="ON" then%>
								  „ «· œ—Ì”
							<%Else%>
								·„ Ì „
							 <%end if%></td>
									
									<td class="tdView" width="25%" align="center">&nbsp;<%=rs("notes")%></td>
									
									<td class="tdView" align="center" width="10%">
									<a href="curriculum_done_delete.asp?curric_id=<%=rs("ID")%>&DeptName=<%=Request.querystring("DeptName")%>">
									Õ–›</a></td>
									<td class="tdView" align="center" width="7%">
									<a href="curriculum_done_update.asp?curric_id=<%=rs("ID")%>&DeptName=<%=Request.querystring("DeptName")%>">
									 ⁄œÌ·</a></td>
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
					<p align=right>„« ﬁÿ⁄ „‰ «·„‰ÂÃ<span lang="en-us"> </span></div>
				
				<div class="RecordAdd"><a href="Curriculum_done_Add.asp?ID=<%=request.querystring("ID")%>&DeptName=<%=request.querystring("DeptName")%>">≈÷«›… ÃœÌœ</a>
				<form action="Curriculum_done_list.asp?start=1&ID=<%=request.querystring("id")%>&DeptName=<%=request.querystring("DeptNAme")%>" method="post" >
					
					<input type="hidden" value="<%=request.querystring("id")%>" name="txtDepartmentID">
				
								<!--	<input type="hidden" value="<%=PRODUCT_IMG1%>" name="txtHdnImg1">
									-->
						<input type="hidden" name="txtProcType" value="add">				
					<p>&nbsp;<select size="1" name="SelectMonth" class="select">
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

					</select> ≈·Ï <select size="1" name="SelectMonth2" class="select">
						<option Value="0" <%if request.form("SelectMonth2")=0 then%> selected <%end if%>>«Œ — «·‘Â—</option>
						<option Value="1" <%if request.form("SelectMonth2")=1 then%> selected <%end if%>>1</option>
						<option Value="2" <%if request.form("SelectMonth2")=2 then%> selected <%end if%>>2</option>
						<option Value="3" <%if request.form("SelectMonth2")=3 then%> selected <%end if%>>3</option>
						<option Value="4" <%if request.form("SelectMonth2")=4 then%> selected <%end if%>>4</option>
						<option Value="5" <%if request.form("SelectMonth2")=5 then%> selected <%end if%>>5</option>
						<option Value="6" <%if request.form("SelectMonth2")=6 then%> selected <%end if%>>6</option>
						<option Value="7" <%if request.form("SelectMonth2")=7 then%> selected <%end if%>>7</option>
						<option Value="8" <%if request.form("SelectMonth2")=8 then%> selected <%end if%>>8</option>
						<option Value="9" <%if request.form("SelectMonth2")=9 then%> selected <%end if%>>9</option>
						<option Value="10" <%if request.form("SelectMonth2")=10 then%> selected <%end if%>>10</option>
						<option Value="11" <%if request.form("SelectMonth2")=11 then%> selected <%end if%>>11</option>
						<option Value="12" <%if request.form("SelectMonth2")=12 then%> selected <%end if%>>12</option>

					</select>
					
					<select size="1" name="SelectEmployeeID" class="select">
						<option Value="0" <%if request.form("SelectEmployeeID")=0 then%> selected <%end if%>>Ã„Ì⁄ «·„⁄·„Ì‰</option>
										<%									
										set Rssd=conn.execute("Select * from Employees where Department_id="&Request.querystring("id")&"")
										while not rssd.eof
										%>
														<option value="<%=rssd("Employee_id")%>"  <%if rssd("Employee_id")=cint(request.form("SelectEmployeeID")) then%> selected <%end if%>><%=Rssd("Employee_Name")%></option>
										<%
											rssd.movenext
										wend
										set rssd=nothing
										%>
					</select>
					
					
					<input type="submit" value="≈—”«·" name="B1"> 						
				 
				<%	
				Employeeid=request.Form("SelectEmployeeId")
				if Employeeid="" then
					Employeeid = 0
				end if
				%>
					<a target="_blank" href="Curriculum_done_list_Print.asp?EmployeeID=<%=EmployeeID%>&ID=<%=session("Department_id")%>&smonth=<%=Request.form("SelectMonth")%>&smonth2=<%=Request.form("SelectMonth2")%>"><font size="3">ÿ»«⁄…</font></a></p>
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
					ii=1
				pageName="curriculum_done_list.asp?q=0&id="&request.querystring("id")
				id=request.querystring("id")
				SelectMonth=request.form("SelectMonth")
				SelectMonth2=request.form("SelectMonth2")
				
				'EmployeeID=request.form("SelectEmployeeID")
				if EmployeeID > 0 then
					if SelectMonth > 0 then
						if SelectMonth2 > 0 then
							sSql = "select * from Curriculum_done where Employee_id="&EmployeeID &" and Department_id = "& id &" and Curriculum_Month between "& SelectMonth &" and "& SelectMonth2 &" order by Curriculum_date,Educational_level"							
						else 
								sSql = "select * from Curriculum_done where Employee_id="&EmployeeID &" and Department_id = "& id &" and Curriculum_Month="& SelectMonth &" order by Curriculum_date,Educational_level"
						end if
					Else		
						sSql = "select * from Curriculum_done where Employee_id="&EmployeeID &" and Department_id = "& id &" order by Curriculum_date,Educational_level"
					End if
				Else
					if SelectMonth > 0 then
						if SelectMonth2 > 0 then
						    	sSql = "select * from Curriculum_done where Department_id = "& id &" and Curriculum_Month between "& SelectMonth &" and "& SelectMonth2 &" order by Curriculum_date,Educational_level"
						else
							sSql = "select * from Curriculum_done where Department_id = "& id &" and Curriculum_Month= "& SelectMonth &" order by Curriculum_date,Educational_level"
						end if
					else
						sSql = "select * from Curriculum_done where Department_id = "& id &" order by Department_ID, Curriculum_date,Educational_level"
					End if
	 			End if
	 			

									
				'sSql = "select * from Curriculum_done where Department_ID ="&ID&" "
	 
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
									<td class="tdViewHead" width="4%" align="center">&nbsp;</td>
									<td class="tdViewHead" width="8%" align="center">«· «—ÌŒ</td>
									<td class="tdViewHead" width="14%" align="center">«·„—Õ·… 
									«·œ—«”Ì…</td>
									<td class="tdViewHead" width="11%" align="center">⁄‰Ê«‰ 
									«·œ—”</td>
									<td class="tdViewHead" width="10%" align="center">«”„ 
									«·„⁄·„</td>
									<td class="tdViewHead" width="10%" align="center">
									„ ›ﬁ</td>
									<td class="tdViewHead" width="10%" align="center"> „ 
									«· œ—Ì”</td>
									<td class="tdViewHead" width="25%" align="center">„·«ÕŸ« </td>
									<td align="center" class="tdViewHead">
									Õ–› «·»Ì«‰« </td>
									<td align="center" class="tdViewHead">
									 ⁄œÌ· </td>
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
									<td class="tdView" width="4%" align="center">&nbsp;</td>
									
									<td class="tdView" width="8%" align="center">&nbsp;<%=DAY(rs("Curriculum_Date"))&"/"&Month(rs("Curriculum_Date"))&"/"&Year(rs("Curriculum_Date"))%></td>
									
									<td class="tdView" width="14%" align="center">&nbsp;<%=rs("Educational_level")%></td>
									
									<td class="tdView" width="11%" align="center">&nbsp;<%=rs("Subject")%></td>
									
									<td class="tdView" width="10%" align="center">&nbsp;
									<%
													Set rss = Server.CreateObject("ADODB.Recordset")
													rss.open "select employee_name from employees where employee_id="&rs("Employee_ID")&"",conn,2,1
									if not rss.eof then
									%>
									<%=rss("Employee_Name")%>
									<%end if
									rss.close
									set rss=nothing
									%>
									
									</td>
									
									<td class="tdView" width="10%" align="center">&nbsp;<%=rs("Status")%></td>
									
									<td class="tdView" width="10%" align="center">
							 <%if rs("done")="ON" then%>
								  „ «· œ—Ì”
							<%Else%>
								·„ Ì „
							 <%end if%></td>
									
									<td class="tdView" width="25%" align="center">&nbsp;<%=rs("notes")%></td>
									
									<td class="tdView" align="center" width="10%">
									<a href="curriculum_done_delete.asp?curric_id=<%=rs("ID")%>&DeptName=<%=Request.querystring("DeptName")%>">
									Õ–›</a></td>
									<td class="tdView" align="center" width="7%">
									<a href="curriculum_done_update.asp?curric_id=<%=rs("ID")%>&DeptName=<%=Request.querystring("DeptName")%>">
									 ⁄œÌ·</a></td>
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