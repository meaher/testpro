<!-- #include file="portal_Header.asp"-->
<%
set Conn=server.createobject("ADODB.Connection")
Conn.open ConnString
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
				<div align="center">
									<!-- Start Contents -->
			
				<div class="PageTitle">
					<p><span lang="en-us">«·√œ«—…</span></div>
				
				<!--<div class="RecordAdd"><a href="admin_add.asp">Add</a></div>-->
								
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
				pageName="admin_list.asp?q=0"
				sSql = "select * from ADMIN  order by ADMIN_ID"
				 
				Set rs = Server.CreateObject("ADODB.Recordset")
				set rsp = Server.CreateObject("ADODB.Recordset")

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
									<td class="tdViewHead">«”„ «·„ÊŸ›</td>
									<td class="tdViewHead">«·ﬁ”„</td>
									<td class="tdViewHead">«”„ «·œŒÊ·</td>
									<td class="tdViewHead">ﬂ·„… «·”—</td>
									<td align="center" class="tdViewHead">
									«·Ê’› «·ÊŸÌ›Ì</td>
									<td align="center" class="tdViewHead">
									<span lang="en-us">Edit</span></td>
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
									<td class="tdView">&nbsp;<%=rs("FullName")%></td>
									<td class="tdView">&nbsp;
									<%
									if rs("Department_ID") > 0 then
									rsp.open "select Department_Name from Departments where Department_ID="&rs("Department_ID")&"", conn, 1, 2
										if not rsp.eof then
											%>
											<%=rsp("Department_Name")%>
									
											<%
										Else
											response.write "„Â«„ «œ«—Ì…"
										End if
									rsp.close
									End if
									%>
									
									</td>
									<td class="tdView"><%=rs("ADMIN_USER")%></td>
									<td class="tdView"><%="*****"%></td>
									<td class="tdView" align="center" width="70">
									&nbsp;<%=rs("Position")%></td>
									<td class="tdView" align="center" width="50">
									<a href="admin_update.asp?id=<%=rs("ADMIN_ID")%>">
									<span lang="en-us">Edit</span></a></td>
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
									<td>&nbsp;</td>
									<td>&nbsp;</td>
									<td>&nbsp;</td>
									<% Next %>
								</tr>
								<% End If %>
							</table>
						</div>
				<% End If %>	
							
				<!-- #include file="portal_pagging.asp"-->

				<!-- End Contents -->

				</div></td>
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
			<div align="center">
									<!-- Start Contents -->
			
				<div class="PageTitle">
					<p><span lang="en-us">«·√œ«—…</span></div>
				
				<!--<div class="RecordAdd"><a href="admin_add.asp">Add</a></div>-->
								
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
				pageName="admin_list.asp?q=0"
				sSql = "select * from ADMIN  order by ADMIN_ID"
				 
				Set rs = Server.CreateObject("ADODB.Recordset")
				set rsp = Server.CreateObject("ADODB.Recordset")

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
									<td class="tdViewHead">«”„ «·„ÊŸ›</td>
									<td class="tdViewHead">«·ﬁ”„</td>
									<td class="tdViewHead">«”„ «·œŒÊ·</td>
									<td class="tdViewHead">ﬂ·„… «·”—</td>
									<td align="center" class="tdViewHead">
									«·Ê’› «·ÊŸÌ›Ì</td>
									<td align="center" class="tdViewHead">
									<span lang="en-us">Edit</span></td>
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
									<td class="tdView">&nbsp;<%=rs("FullName")%></td>
									<td class="tdView">&nbsp;
									<%
									if rs("Department_ID") > 0 then
									rsp.open "select Department_Name from Departments where Department_ID="&rs("Department_ID")&"", conn, 1, 2
										if not rsp.eof then
											%>
											<%=rsp("Department_Name")%>
									
											<%
										Else
											response.write "„Â«„ «œ«—Ì…"
										End if
									rsp.close
									End if
									%>
									
									</td>
									<td class="tdView"><%=rs("ADMIN_USER")%></td>
									<td class="tdView"><%="*****"%></td>
									<td class="tdView" align="center" width="70">
									&nbsp;<%=rs("Position")%></td>
									<td class="tdView" align="center" width="50">
									<a href="admin_update.asp?id=<%=rs("ADMIN_ID")%>">
									<span lang="en-us">Edit</span></a></td>
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
									<td>&nbsp;</td>
									<td>&nbsp;</td>
									<td>&nbsp;</td>
									<% Next %>
								</tr>
								<% End If %>
							</table>
						</div>
				<% End If %>	
							
				<!-- #include file="portal_pagging.asp"-->

				<!-- End Contents -->

				</div></td>
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