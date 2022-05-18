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
	<script type="text/javascript">
	$(function () {
	$("#date2").datepicker();
	});
	$(function () {
	$("#date3").datepicker();
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
					<p><span lang="en-us">ÿ·«» «·’› <%=request.querystring("Class_Room")%></span></div>
				
				<div class="RecordAdd">&nbsp;<a href="Students_Data_Add.asp?Class_Room_ID=<%=request.querystring("Class_Room_ID")%>&Class_Room=<%=request.querystring("Class_Room")%>">≈÷«›… ÃœÌœ</a></div>
								
				<div class="ErrMsg">
				<%
				if session("Errmsg")<> "" then 
					response.write  session("Errmsg")
				end if
				%>						
				</div>
				
				<%
				nDisplayRecs =50
				nRecRange = 15
				nRecPerRow = 1
				pageName="Employee_list.asp?q=0"
				id=request.querystring("id")
			'	response.write id
				'response.end
			'	sSql= "SELECT Departments.Department_id, Departments.Department_Name, Employees.Employee_ID, Employees.Full_Name, Work_Day.Work_ID, Work_Day.Work_Date, Work_Day.clock_In, Work_Day.clock_Out, Work_Day.Morning_Permission,
			'	 Work_Day.Evening_Permission 	FROM (Departments INNER JOIN Employees ON Departments.Department_id = Employees.Department_ID) INNER JOIN Work_Day ON Employees.Employee_ID = Work_Day.Employee_id
			'			WHERE (((Departments.Department_id) ="& id &"))"

				
				'sSql = "select Departments.*,Employees.*  from Departments,Employees where Department_ID=Departments.Department_ID order by Date_ID DESC"
				Class_Room_id=request.queryString("Class_Room_id")
				Class_Room = Request.queryString("Class_Room")
				sSql = "select * from Students where Class_Room_ID ="&Class_Room_id&" order by Std_Number "
	 
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
									<td class="tdViewHead" width="18%">—ﬁ„ 
									«·ÿ«·» ›Ì «·ﬂ‘›</td>
									<td class="tdViewHead" width="26%">«”„ 
									«·ÿ«·»</td>
									<td class="tdViewHead" width="12%">«·—ﬁ„ 
									«·„œ‰Ì</td>
									<td class="tdViewHead" width="11%">«·’›</td>
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
									<td class="tdView" width="18%"><%=rs("Std_Number")%>
											
									</td>
									
									<td class="tdView" width="26%">&nbsp;<%=rs("Std_Name")%></td>
									
									<td class="tdView" width="12%"><%=rs("Std_Civil_ID")%></td>
									<td class="tdView" width="11%">&nbsp;
									<%=Class_room%></td>
								

									<td class="tdView" align="center" width="10%">
									<a href="Students_Data_Delete.asp?id=<%=rs("ID")%>&Class_Room=<%=Class_Room%>&Class_room_id=<%=Class_Room_id%>">
									Õ–›</a></td>
									<td class="tdView" align="center" width="7%">
									<a href="Students_Data_update.asp?id=<%=rs("ID")%>&Class_Room=<%=Class_Room%>&Class_room_id=<%=Class_Room_id%>">
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
									<td colspan="4">&nbsp;</td>
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
					<p><span lang="en-us">ÿ·«» «·’› <%=request.querystring("Class_Room")%></span></div>
				
				<div class="RecordAdd">&nbsp;<a href="Students_Data_Add.asp?Class_Room_ID=<%=request.querystring("Class_Room_ID")%>&Class_Room=<%=request.querystring("Class_Room")%>">≈÷«›… ÃœÌœ</a></div>
								
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
				pageName="Employee_list.asp?q=0"
				id=request.querystring("id")
			'	response.write id
				'response.end
			'	sSql= "SELECT Departments.Department_id, Departments.Department_Name, Employees.Employee_ID, Employees.Full_Name, Work_Day.Work_ID, Work_Day.Work_Date, Work_Day.clock_In, Work_Day.clock_Out, Work_Day.Morning_Permission,
			'	 Work_Day.Evening_Permission 	FROM (Departments INNER JOIN Employees ON Departments.Department_id = Employees.Department_ID) INNER JOIN Work_Day ON Employees.Employee_ID = Work_Day.Employee_id
			'			WHERE (((Departments.Department_id) ="& id &"))"

				
				'sSql = "select Departments.*,Employees.*  from Departments,Employees where Department_ID=Departments.Department_ID order by Date_ID DESC"
				Class_Room_id=request.queryString("Class_Room_id")
				Class_Room = Request.queryString("Class_Room")
				sSql = "select * from Students where Class_Room_ID ="&Class_Room_id&" order by Std_Number "
	 
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
									<td class="tdViewHead" width="18%">—ﬁ„ 
									«·ÿ«·» ›Ì «·ﬂ‘›</td>
									<td class="tdViewHead" width="26%">«”„ 
									«·ÿ«·»</td>
									<td class="tdViewHead" width="12%">«·—ﬁ„ 
									«·„œ‰Ì</td>
									<td class="tdViewHead" width="11%">«·’›</td>
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
									<td class="tdView" width="18%"><%=rs("Std_Number")%>
											
									</td>
									
									<td class="tdView" width="26%">&nbsp;<%=rs("Std_Name")%></td>
									
									<td class="tdView" width="12%"><%=rs("Std_Civil_ID")%></td>
									<td class="tdView" width="11%">&nbsp;
									<%=Class_room%></td>
								

									<td class="tdView" align="center" width="10%">
									<a href="Students_Data_Delete.asp?id=<%=rs("ID")%>&Class_Room=<%=Class_Room%>&Class_room_id=<%=Class_Room_id%>">
									Õ–›</a></td>
									<td class="tdView" align="center" width="7%">
									<a href="Students_Data_update.asp?id=<%=rs("ID")%>&Class_Room=<%=Class_Room%>&Class_room_id=<%=Class_Room_id%>">
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
									<td colspan="4">&nbsp;</td>
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