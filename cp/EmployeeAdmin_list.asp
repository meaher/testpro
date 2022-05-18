<!-- #include file="portal_Header.asp"-->

<%
set Conn=server.createobject("ADODB.Connection")
Conn.open ConnString

if request.querystring("id")<>"" then 

	Depart_ID=int(request.querystring("id"))

	set Conn=server.createobject("ADODB.Connection")
	Conn.open ConnString
	set Rs=server.createobject("ADODB.Recordset")
	Rs.open "select * from Departments where Department_ID="&Depart_ID&" " , Conn,1,2
	if not Rs.eof then
		Department_Name=rs("Department_Name")
	else
		response.write "<script>alert('Õ’· Œÿ√ ›Ì ⁄—÷ «·»Ì«‰« ')</script>"
	end if
	
	rs.close
	set rs=nothing
	
end if

%>
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
			
				<%			
				DptID=Request.Form("SelectDepartment")	
				if DptID > 0 then					
					set Rss=conn.execute("Select * from Departments where Department_ID="&DptID&"")
					DeptName = Rss("Department_Name")
					Rss.close
					set rss=nothing
				Else
					DeptName="Ã„Ì⁄ «·«ﬁ”«„"
				End if
				%>

			
				<div class="PageTitle">
					<p style="text-align: left"><span lang="en-us"><%=request.querystring("DeptName")%></span></div>
				
				<div class="RecordAdd"> <%=DeptName%>
					<a href="Employee_View.asp?ID=<%=request.Form("SelectDepartment")%>&DeptName=<%=DeptName%>">«·„‘€Ê· «·›⁄·Ì</a></div>
							
	<form action="EmployeeAdmin_list.asp?start=1" method="post" >
					
					<input type="hidden" value="<%=request.querystring("id")%>" name="txtDepartmentID">
				
								<!--	<input type="hidden" value="<%=PRODUCT_IMG1%>" name="txtHdnImg1">
									-->
						<input type="hidden" name="txtProcType" value="add">				
					<p>&nbsp;<select size="1" name="SelectDepartment" class="select">
						<option Value="0">«Œ — «·ﬁ”„</option>
										<%									
										set Rss=conn.execute("Select * from Departments")
										while not rss.eof
										%>
														<option value="<%=rss("Department_id")%>"><%=Rss("Department_Name")%></option>
										<%
											rss.movenext
										wend
										set rss=nothing
										%>
															</select>&nbsp;
					
					
					<input type="submit" value="≈—”«·" name="B1"></p>
				</form>
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
				pageName="EmployeeAdmin_list.asp?q=0"
				id=request.Form("SelectDepartment")
				
				'response.write id
				'response.end
				if ID > 0 then		
					sSql = "select * from Employees where Department_ID ="&ID&" "
				Else
					sSql = "select * from Employees"	 				
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
									<td class="tdViewHead" width="15%">«”„ 
									«·„ÊŸ›</td>
									<td class="tdViewHead" width="18%">«·„”„Ï 
									«·ÊŸÌ›Ì</td>
									<td class="tdViewHead" width="12%">—ﬁ„ «·„·›</td>
									<td class="tdViewHead" width="11%">—ﬁ„ 
									«·Â« ›</td>
									<td class="tdViewHead" width="13%">«·»—Ìœ 
									«·«·ﬂ —Ê‰Ì</td>
									<td class="tdViewHead" width="13%" align="center">
									<span lang="ar-kw">Õ–›</span></td>
									<td class="tdViewHead" width="13%" align="center"> ⁄œÌ·</td>
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
									<td class="tdView" width="15%"><%=rs("Employee_Name")%>
											
									</td>
									
									<td class="tdView" width="18%">&nbsp;<%=rs("Position")%></td>
									
									<td class="tdView" width="12%"><%=rs("File_Number")%></td>
									<td class="tdView" width="11%">&nbsp;<%=rs("Employee_MOBILE")%></td>
								

									<td class="tdView" width="13%">
									<%=rs("Employee_EMAIL")%></td>
									

									<td class="tdView" width="13%" align="center">
									<a href="EmployeeAdmin_Delete.asp?id=<%=rs("Employee_ID")%>&DeptName=<%=Request.querystring("DeptName")%>">
									<span lang="en-us">Õ–›</span></a></td>
									

									<td class="tdView" width="13%" align="center">
									<a href="EmployeeAdmin_update.asp?id=<%=rs("Employee_ID")%>&DeptName=<%=Request.querystring("DeptName")%>">
									<span lang="en-us"> ⁄œÌ·</span></a></td>
									
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
			
				<%			
				DptID=Request.Form("SelectDepartment")	
				if DptID > 0 then					
					set Rss=conn.execute("Select * from Departments where Department_ID="&DptID&"")
					DeptName = Rss("Department_Name")
					Rss.close
					set rss=nothing
				Else
					DeptName="Ã„Ì⁄ «·«ﬁ”«„"
				End if
				%>

			
				<div class="PageTitle">
					<p style="text-align: left"><span lang="en-us"><%=request.querystring("DeptName")%></span></div>
				
				<div class="RecordAdd"> <%=DeptName%>
					<a href="Employee_View.asp?ID=<%=request.Form("SelectDepartment")%>&DeptName=<%=DeptName%>">«·„‘€Ê· «·›⁄·Ì</a></div>
							
	<form action="EmployeeAdmin_list.asp?start=1" method="post" >
					
					<input type="hidden" value="<%=request.querystring("id")%>" name="txtDepartmentID">
				
								<!--	<input type="hidden" value="<%=PRODUCT_IMG1%>" name="txtHdnImg1">
									-->
						<input type="hidden" name="txtProcType" value="add">				
					<p>&nbsp;<select size="1" name="SelectDepartment" class="select">
						<option Value="0">«Œ — «·ﬁ”„</option>
										<%									
										set Rss=conn.execute("Select * from Departments")
										while not rss.eof
										%>
														<option value="<%=rss("Department_id")%>"><%=Rss("Department_Name")%></option>
										<%
											rss.movenext
										wend
										set rss=nothing
										%>
															</select>&nbsp;
					
					
					<input type="submit" value="≈—”«·" name="B1"></p>
				</form>
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
				pageName="EmployeeAdmin_list.asp?q=0"
				id=request.Form("SelectDepartment")
				
				'response.write id
				'response.end
				if ID > 0 then		
					sSql = "select * from Employees where Department_ID ="&ID&" "
				Else
					sSql = "select * from Employees"	 				
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
									<td class="tdViewHead" width="15%">«”„ 
									«·„ÊŸ›</td>
									<td class="tdViewHead" width="18%">«·„”„Ï 
									«·ÊŸÌ›Ì</td>
									<td class="tdViewHead" width="12%">—ﬁ„ «·„·›</td>
									<td class="tdViewHead" width="11%">—ﬁ„ 
									«·Â« ›</td>
									<td class="tdViewHead" width="13%">«·»—Ìœ 
									«·«·ﬂ —Ê‰Ì</td>
									<td class="tdViewHead" width="13%" align="center">
									<span lang="ar-kw">Õ–›</span></td>
									<td class="tdViewHead" width="13%" align="center"> ⁄œÌ·</td>
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
									<td class="tdView" width="15%"><%=rs("Employee_Name")%>
											
									</td>
									
									<td class="tdView" width="18%">&nbsp;<%=rs("Position")%></td>
									
									<td class="tdView" width="12%"><%=rs("File_Number")%></td>
									<td class="tdView" width="11%">&nbsp;<%=rs("Employee_MOBILE")%></td>
								

									<td class="tdView" width="13%">
									<%=rs("Employee_EMAIL")%></td>
									

									<td class="tdView" width="13%" align="center">
									<a href="EmployeeAdmin_Delete.asp?id=<%=rs("Employee_ID")%>&DeptName=<%=Request.querystring("DeptName")%>">
									<span lang="en-us">Õ–›</span></a></td>
									

									<td class="tdView" width="13%" align="center">
									<a href="EmployeeAdmin_update.asp?id=<%=rs("Employee_ID")%>&DeptName=<%=Request.querystring("DeptName")%>">
									<span lang="en-us"> ⁄œÌ·</span></a></td>
									
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