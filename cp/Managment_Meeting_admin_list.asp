<!-- #include file="portal_Header.asp"-->

<%
set Conn=server.createobject("ADODB.Connection")
Conn.open ConnString

if session("Department_ID")<>"" then 

	Employee_ID=int(request.querystring("id"))

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
			
				<div class="PageTitle">
					<p align=right><span lang="en-us">«Ã „«⁄« </span> «·≈œ«—…</div>
				
				<div class="RecordAdd">&nbsp;<a href="Managment_Meeting_admin_Add.asp">≈÷«›… ÃœÌœ</a></div>
								
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
				pageName="Managment_Meeting_admin_list.asp?q=0"

									
				sSql = "select * from Managment_meeting order by meeting_Date"
	 
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
									<td class="tdViewHead" width="15%"> «—ÌŒ 
									«·«Ã „«⁄</td>
									<td class="tdViewHead" width="18%">—ﬁ„ 
									«·«Ã „«⁄</td>
									<td class="tdViewHead" width="18%">⁄‰Ê«‰ 
									«·«Ã „«⁄</td>
									<td class="tdViewHead" width="16%">„·«ÕŸ« </td>
									<td class="tdViewHead" width="8%">«·„·›</td>
									<td align="center" class="tdViewHead">
									Õ–› </td>
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
									<td class="tdView" width="15%"><%=DAY(rs("meeting_Date"))&"/"&Month(rs("meeting_Date"))&"/"&Year(rs("meeting_Date"))%>
											
									</td>
									
									<td class="tdView" width="18%">&nbsp;<%=rs("meeting_no")%></td>
									
									<td class="tdView" width="18%">&nbsp;<%=rs("Meeting_Subject")%></td>
									
									<td class="tdView" width="16%">&nbsp;<%=rs("Meeting_notes")%></td>
									
									<td class="tdView" width="8%"><a href="/Managment_meets/<%=rs("meeting_file")%>"> Õ„Ì·</a></td>
									
									<td class="tdView" align="center" width="10%">
									<a href="Managment_Meeting_admin_delete.asp?meeting_id=<%=rs("meeting_ID")%>">
									Õ–›</a></td>
									<td class="tdView" align="center" width="7%">
									<a href="Managment_Meeting_admin_update.asp?meeting_id=<%=rs("meeting_ID")%>">
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
									<td colspan="5">&nbsp;</td>
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
					<p align=right><span lang="en-us">«Ã „«⁄« </span> «·≈œ«—…</div>
				
				<div class="RecordAdd">&nbsp;<a href="Managment_Meeting_admin_Add.asp">≈÷«›… ÃœÌœ</a></div>
								
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
				pageName="Managment_Meeting_admin_list.asp?q=0"

									
				sSql = "select * from Managment_meeting order by meeting_Date"
	 
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
									<td class="tdViewHead" width="15%"> «—ÌŒ 
									«·«Ã „«⁄</td>
									<td class="tdViewHead" width="18%">—ﬁ„ 
									«·«Ã „«⁄</td>
									<td class="tdViewHead" width="18%">⁄‰Ê«‰ 
									«·«Ã „«⁄</td>
									<td class="tdViewHead" width="16%">„·«ÕŸ« </td>
									<td class="tdViewHead" width="8%">«·„·›</td>
									<td align="center" class="tdViewHead">
									Õ–› </td>
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
									<td class="tdView" width="15%"><%=DAY(rs("meeting_Date"))&"/"&Month(rs("meeting_Date"))&"/"&Year(rs("meeting_Date"))%>
											
									</td>
									
									<td class="tdView" width="18%">&nbsp;<%=rs("meeting_no")%></td>
									
									<td class="tdView" width="18%">&nbsp;<%=rs("Meeting_Subject")%></td>
									
									<td class="tdView" width="16%">&nbsp;<%=rs("Meeting_notes")%></td>
									
									<td class="tdView" width="8%"><a href="/Managment_meets/<%=rs("meeting_file")%>"> Õ„Ì·</a></td>
									
									<td class="tdView" align="center" width="10%">
									<a href="Managment_Meeting_admin_delete.asp?meeting_id=<%=rs("meeting_ID")%>">
									Õ–›</a></td>
									<td class="tdView" align="center" width="7%">
									<a href="Managment_Meeting_admin_update.asp?meeting_id=<%=rs("meeting_ID")%>">
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
									<td colspan="5">&nbsp;</td>
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