<!-- #include file="portal_Header_teacher.asp"-->
	
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
				<!-- #include file="portal_menu_teacher.asp"-->				
				</td>
				<td width="80%" valign="top">
				<!-- Start Contents -->
			
				<div class="PageTitle">
					<p align=right><span lang="ar-kw">„ «»⁄… «·ÿ«·» «·„„Ì“ ··’›
					</span><%=request.querystring("Class_Room")%></div>


				<div class="RecordAdd">&nbsp;<a href="student_Follow_P_Add.asp?Class_id=<%=request.querystring("Class_ID")%>&subject_name=<%=request.querystring("subject_name")%>&subject_ID=<%=request.querystring("subject_id")%>&Class_room=<%=request.querystring("Class_room")%>">≈÷«›… ÃœÌœ</a></div>
								
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
				pageName="student_Follow_P_list.asp?q=0&id="&id=request.querystring("id")
				id=request.querystring("id")

									
					ssql="select * from student_Follow where Follow_Type='1' and class_Room_ID="&request.querystring("Class_ID")&" and Subject_id="&request.querystring("subject_id")&" and Employee_ID="&session("Employee_ID")&""

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
									<span lang="ar-kw">«· ﬁ—Ì—</span></td>
									<td class="tdViewHead" width="18%">
									<span lang="ar-kw">«”„ «·ÿ«·»</span></td>
									<td class="tdViewHead" width="12%">
									<span lang="ar-kw">«·’›</span></td>
									<td class="tdViewHead" width="19%"> Ê’Ì«  
									—∆Ì” «·ﬁ”„</td>
									<td class="tdViewHead" width="8%">«·„·›</td>
									<td class="tdViewHead" width="11%">
									<span lang="ar-kw">⁄—÷ «·»Ì«‰« </span></td>
									<td align="center" class="tdViewHead">
									<span lang="ar-kw"> ⁄œÌ·</span></td>
									<td align="center" class="tdViewHead">
									Õ–› </td>
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
									<td class="tdView" width="15%"><%=rs("report_day")&"/"&rs("report_month")&"/"&rs("report_year")%>
											
									</td>
									
									<td class="tdView" width="18%">&nbsp;
										<%
											set Rss=conn.execute("Select * from Students where Std_Civil_ID='"&rs("Std_Civil_ID")&"'")
											if not rss.eof then
										%>
												<%=Rss("Std_Name")%>
										<%					
											end if
										set rss=nothing
										%>
									</td>
									
									<td class="tdView" width="12%">&nbsp;<%=request.querystring("Class_Room")%></td>
									
									<td class="tdView" width="19%">&nbsp;<%=rs("Managment_Notes")%></td>
									
									<td class="tdView" width="8%">
									<%if rs("Report_file") <> "" then%><a href="/report_file/<%=rs("Report_file")%>">⁄—÷ 
									«·„·›</a>
									<%end if%>
									
									</td>
									
									<td class="tdView" width="11%">
									
											<a href="student_Follow_P_View.asp?id=<%=rs("ID")%>&Class_Room=<%=request.querystring("Class_Room")%>&subject_name=<%=request.querystring("subject_name")%>">
										⁄—÷ «·»Ì«‰« </a>
										
									</td>
									
									<td class="tdView" align="center" width="5%">
									
									<a href="student_Follow_P_update.asp?id=<%=rs("ID")%>&Class_Room=<%=request.querystring("Class_Room")%>&subject_name=<%=request.querystring("subject_name")%>">
											 ⁄œÌ·</a>
									
																		
									</td>
									<td class="tdView" align="center" width="8%">
										<a href="student_Follow_P_delete.asp?id=<%=rs("ID")%>&Class_Room=<%=request.querystring("Class_Room")%>&subject_name=<%=request.querystring("subject_name")%>">Õ–›</a>
										
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