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
					<p align="right"><span lang="ar-kw">“Ì«—«  —∆Ì” «·ﬁ”„ 
					··„⁄·„Ì‰</span></div>
				
				<div class="RecordAdd"><form action="supervisor_visits_Admin_list.asp?start=1&ID=<%=request.querystring("id")%>&DeptName=<%=request.querystring("DeptNAme")%>" method="post" >
					
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
					
					<select size="1" name="SelectDepartment" class="select">
						<option Value="0" <%if request.form("SelectDepartment")=0 then%> selected <%end if%>>Ã„Ì⁄ «·√ﬁ”«„</option>
										<%									
										set Rssd=conn.execute("Select * from Departments")
										while not rssd.eof
										%>
														<option value="<%=rssd("Department_id")%>"  <%if rssd("Department_id")=cint(request.form("SelectDepartment")) then%> selected <%end if%>><%=Rssd("Department_Name")%></option>
										<%
											rssd.movenext
										wend
										set rssd=nothing
										%>
					</select>&nbsp;
					
					
					<input type="submit" value="≈—”«·" name="B1"> 						
					<span lang="en-us">&nbsp;&nbsp; </span> &nbsp;
				<%	
				id=request.Form("SelectDepartment")
				if id="" then
					id = request.querystring("id")
				end if
				%>
					<a target="_blank" href="supervisor_visits_Admin_list_Print.asp?ID=<%=id%>&smonth=<%=Request.form("SelectMonth")%>&smonth2=<%=Request.form("SelectMonth2")%>"><font size="3">ÿ»«⁄…</font></a></p>
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
				ii=1
				pageName="supervisor_visits_Admin_list.asp?q=0"
				
				
				SelectMonth=request.form("SelectMonth")
				SelectMonth2=request.form("SelectMonth2")
				if id="" then
					id=0
				end if
				if ID > 0 then
					if SelectMonth > 0 then
						if SelectMonth2 > 0 then
							sSql = "select * from supervisor_visits where Department_id = "& id &" and month_date between "& SelectMonth &" and "& SelectMonth2 &" order by visit_date,department_id"							
						else 
								sSql = "select * from supervisor_visits where Department_id = "& id &" and month_date="& SelectMonth &" order by visit_date,department_id"
						end if
					Else		
						sSql = "select * from supervisor_visits where Department_id = "& id &" order by visit_date,department_id"
					End if
				Else
					if SelectMonth > 0 then
						if SelectMonth2 > 0 then
						    	sSql = "select * from supervisor_visits where month_date between "& SelectMonth &" and "& SelectMonth2 &" order by visit_date,department_id"
						else
							sSql = "select * from supervisor_visits where month_date= "& SelectMonth &" order by visit_date,department_id"
						end if
					else
						sSql = "select * from supervisor_visits order by Department_ID, visit_date,department_id"
					End if
	 			End if
	 			
	 			'response.write ssql
	 			'response.end
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
									<td class="tdViewHead" width="7%" align="center">
									«·ﬁ”„</td>
									<td class="tdViewHead" width="5%" align="center">«· «—ÌŒ</td>
									<td class="tdViewHead" width="14%" align="center">
									<span lang="ar-kw">—ﬁ„ «·“Ì«—…</span></td>
									<td class="tdViewHead" width="11%" align="center">⁄‰Ê«‰ 
									«·œ—”</td>
									<td class="tdViewHead" width="10%" align="center">«”„ 
									«·„⁄·„</td>
									<td class="tdViewHead" width="10%" align="center">
									<span lang="ar-kw">«·’›</span></td>
									<td class="tdViewHead" width="10%" align="center">
									<span lang="ar-kw">«·„·›</span></td>
									<td class="tdViewHead" width="25%" align="center">„·«ÕŸ« </td>
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
									<td class="tdView" width="7%" align="center">
									<%									
										set Rssd=conn.execute("Select * from Departments where department_id="&rs("department_id")&"")
										if not rssd.eof then
										%>
													<%=Rssd("Department_Name")%>
										<%
											
										end if
										set rssd=nothing
										%>
									
									</td>
									
									<td class="tdView" width="5%" align="center">&nbsp;<%=rs("day_Date")&"/"&rs("Month_Date")&"/"&rs("year_Date")%></td>
									
									<td class="tdView" width="14%" align="center">&nbsp;<%=rs("visit_no")%></td>
									
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
									
									<td class="tdView" width="10%" align="center">
									<%
										set Rss=conn.execute("Select * from Class_Room where Class_Room_id="&rs("Class_room_id")&"")
										if not rss.eof then
											response.write rss("Class_room")
										end if
										Rss.close
									%>
</td>
									
									<td class="tdView" width="10%" align="center">
							<%if visit_file <> "" then%><a href="/visits_file/<%=rs("visit_file")%>"> Õ„Ì·</a><%End if%>
							
							</td>
									
									<td class="tdView" width="25%" align="center">&nbsp;<%=rs("visit_notes")%></td>
									
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