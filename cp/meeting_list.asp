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
					<p align=right><span lang="en-us">«Ã „«⁄«  <%=request.querystring("DeptName")%> </span></div>
				
				<div class="RecordAdd">&nbsp;<a href="meeting_Add.asp?ID=<%=request.querystring("ID")%>&DeptName=<%=request.querystring("DeptName")%>">≈÷«›… ÃœÌœ</a></div>
								
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
				pageName="meeting_list.asp?q=0&id="&id=request.querystring("id")
				id=request.querystring("id")

									
				sSql = "select * from meeting where Department_ID ="&ID&" "
	 
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
									<td class="tdViewHead" width="12%">„·«ÕŸ« </td>
									<td class="tdViewHead" width="12%">«·„·›</td>
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
									<td class="tdView" width="15%"><%=DAY(rs("meeting_Date"))&"/"&Month(rs("meeting_Date"))&"/"&Year(rs("meeting_Date"))%>
											
									</td>
									
									<td class="tdView" width="18%">&nbsp;<%=rs("meeting_no")%></td>
									
									<td class="tdView" width="18%">&nbsp;<%=rs("Meeting_Subject")%></td>
									
									<td class="tdView" width="12%">&nbsp;<%=rs("Meeting_notes")%></td>
									
									<td class="tdView" width="12%"><a href="/meets/<%=rs("meeting_file")%>"> Õ„Ì·</a></td>
									
									<td class="tdView" align="center" width="10%">
									<a href="meeting_delete.asp?meeting_id=<%=rs("meeting_ID")%>&DeptName=<%=Request.querystring("DeptName")%>">
									Õ–›</a></td>
									<td class="tdView" align="center" width="7%">
									<a href="meeting_update.asp?meeting_id=<%=rs("meeting_ID")%>&DeptName=<%=Request.querystring("DeptName")%>">
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
					<p align=right><span lang="en-us">«Ã „«⁄«  <%=request.querystring("DeptName")%> </span></div>
				
				<div class="RecordAdd">&nbsp;<a href="meeting_Add.asp?ID=<%=request.querystring("ID")%>&DeptName=<%=request.querystring("DeptName")%>">≈÷«›… ÃœÌœ</a></div>
								
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
				pageName="meeting_list.asp?q=0&id="&id=request.querystring("id")
				id=request.querystring("id")

									
				sSql = "select * from meeting where Department_ID ="&ID&" "
	 
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
									<td class="tdViewHead" width="12%">„·«ÕŸ« </td>
									<td class="tdViewHead" width="12%">«·„·›</td>
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
									<td class="tdView" width="15%"><%=DAY(rs("meeting_Date"))&"/"&Month(rs("meeting_Date"))&"/"&Year(rs("meeting_Date"))%>
											
									</td>
									
									<td class="tdView" width="18%">&nbsp;<%=rs("meeting_no")%></td>
									
									<td class="tdView" width="18%">&nbsp;<%=rs("Meeting_Subject")%></td>
									
									<td class="tdView" width="12%">&nbsp;<%=rs("Meeting_notes")%></td>
									
									<td class="tdView" width="12%"><a href="/meets/<%=rs("meeting_file")%>"> Õ„Ì·</a></td>
									
									<td class="tdView" align="center" width="10%">
									<a href="meeting_delete.asp?meeting_id=<%=rs("meeting_ID")%>&DeptName=<%=Request.querystring("DeptName")%>">
									Õ–›</a></td>
									<td class="tdView" align="center" width="7%">
									<a href="meeting_update.asp?meeting_id=<%=rs("meeting_ID")%>&DeptName=<%=Request.querystring("DeptName")%>">
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