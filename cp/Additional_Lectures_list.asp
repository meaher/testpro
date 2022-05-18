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
					<p align="right">Õ’… ≈÷«›Ì…<br>
					<a href="Additional_Lectures_Add.asp?id=<%=request.querystring("id")%>">ÿ·» ÃœÌœ</a></div>
				
				<div class="RecordAdd">
				&nbsp;</div>
								
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
				pageName="Switch_Lectures_list.asp?q=0"
				
				'id=request.Form("SelectDepartment")
				'if id="" then
				'	id = request.querystring("id")
				'end if
				
				'if ID > 0 then		
				'	sSql = "select * from School_Letters where Department_id = "& id &" order by Letter_date"
				'Elseif ID = "-1" then
				'	sSql = "select * from School_Letters where Public_Letter = '0' order by Letter_date"
				'Else
				'	sSql = "select * from School_Letters order by Department_ID"
	 			'End if
				
				id = request.querystring("id")
				sSql = "select * from Switch_Lectures where Additional= 1 and (First_Department_ID="&id&" or Second_Department_ID="&id&")"
	 
				Set rs = Server.CreateObject("ADODB.Recordset")
				Set rss = Server.CreateObject("ADODB.Recordset")
				rs.CursorLocation = 3
				'response.write sSql
				
				
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
									<td class="tdViewHead" width="7%">
									<span lang="en-us">&nbsp;</span> «—ÌŒ «·ÿ·»</td>
									<td class="tdViewHead" width="11%">«·ﬁ”„ 
									„ﬁœ„ «·ÿ·»</td>
									<td class="tdViewHead" width="9%">«·„«œ…</td>
									<td class="tdViewHead" width="5%">«·„⁄·„</td>
									<td class="tdViewHead" width="4%">«·’›</td>
									<td class="tdViewHead" width="5%">«· «—ÌŒ</td>
									<td class="tdViewHead" width="4%">«·Õ’…</td>
									<td class="tdViewHead" width="11%" align="center">«·ﬁ”„ 
									«·„Œ«ÿ»</td>
									<td class="tdViewHead" width="7%">«·„«œ…</td>
									<td class="tdViewHead" width="8%">«·„⁄·„</td>
									<td class="tdViewHead" width="7%">«·’›</td>
									<td class="tdViewHead" width="7%">«· «—ÌŒ</td>
									<td class="tdViewHead" width="3%">«·Õ’… </td>
									<td class="tdViewHead" width="3%">«·Õ«·…</td>
									<td class="tdViewHead" width="2%">&nbsp;</td>
									<td class="tdViewHead" width="8%">&nbsp;</td>
									<td class="tdViewHead" width="8%">&nbsp;</td>
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
									<td class="tdView" width="7%"><%=DAY(rs("Order_Date"))&"/"&Month(rs("Order_Date"))&"/"&Year(rs("Order_Date"))%>
											
									</td>
									
									<td class="tdView" width="11%">
									
									<%
									set Rst=conn.execute("Select * from Departments where Department_id="&rs("First_Department_ID")&"")
										if not rst.eof then
											response.write rst("Department_Name")
										Else
											response.write "Õ’· Œÿ√"
										End if
									set rst=nothing
									%>
									
									</td>
									
									<td class="tdView" width="9%">
									
									
									<%
									set Rst=conn.execute("Select * from Subjects where Subject_id="&rs("First_Subject_ID")&"")
										if not rst.eof then
											response.write rst("Subject_Name")
										Else
											response.write "Õ’· Œÿ√"
										End if
									set rst=nothing
									%>
									
									<td class="tdView" width="5%">
									<%
									set Rst=conn.execute("Select * from Employees where Employee_id="&rs("First_Employee_ID")&"")
										if not rst.eof then
											response.write rst("Employee_Name")
										Else
											response.write "Õ’· Œÿ√"
										End if
									set rst=nothing
									%>								
									</td>
									
									<td class="tdView" width="4%">
									
									<%
									set Rst=conn.execute("Select * from Class_room where Class_room_ID="&rs("First_Class_room_ID")&"")
										if not rst.eof then
											response.write rst("Class_room")
										Else
											response.write "Õ’· Œÿ√"
										End if
									set rst=nothing
									%>
									</td>
									
									<td class="tdView" width="5%">
									&nbsp;<%=DAY(rs("First_Lecture_Date"))&"/"&Month(rs("First_Lecture_Date"))&"/"&Year(rs("First_Lecture_Date"))%></td>
									
									<td class="tdView" width="4%">
									&nbsp;<%=rs("First_Lecture_Time_id")%></td>
									
									<td class="tdView" width="11%">
									
									<%
									set Rst=conn.execute("Select * from Departments where Department_id="&rs("Second_Department_ID")&"")
										if not rst.eof then
											response.write rst("Department_Name")
										Else
											response.write "Õ’· Œÿ√"
										End if
									set rst=nothing
									%>
									
									</td>
									
									<td class="tdView" width="7%">
									
									
									<%
									set Rst=conn.execute("Select * from Subjects where Subject_id="&rs("Second_Subject_ID")&"")
										if not rst.eof then
											response.write rst("Subject_Name")
										Else
											response.write "Õ’· Œÿ√"
										End if
									set rst=nothing
									%>
									
									</td>
									<td class="tdView" width="8%">
									<%
									set Rst=conn.execute("Select * from Employees where Employee_id="&rs("Second_Employee_ID")&"")
										if not rst.eof then
											response.write rst("Employee_Name")
										Else
											response.write "Õ’· Œÿ√"
										End if
									set rst=nothing
									%>								
									</td>
									
									<td class="tdView" width="7%">
									
									<%
									set Rst=conn.execute("Select * from Class_room where Class_room_ID="&rs("First_Class_room_ID")&"")
										if not rst.eof then
											response.write rst("Class_room")
										Else
											response.write "Õ’· Œÿ√"
										End if
									set rst=nothing
									%>
									</td>
									
									<td class="tdView" width="7%">
									&nbsp;<%=DAY(rs("Second_Lecture_Date"))&"/"&Month(rs("Second_Lecture_Date"))&"/"&Year(rs("Second_Lecture_Date"))%></td>
									
									<td class="tdView" width="3%">
									&nbsp;<%=rs("Second_Lecture_Time_id")%></td>
									
									<td class="tdView" width="3%">
									<%
									if rs("Status")="open" then
										response.write " Õ  «·„—«Ã⁄…"
									Elseif rs("Status")="no" then
										response.write "„—›Ê÷"
									Elseif rs("Status")="ok" then
										response.write " „  «·„Ê«›ﬁ…"
									End if
									%></td>
									
									<td class="tdView" width="2%">
									<%if cint(id)=rs("Second_Department_id") and rs("Status")="open" then%>
										<a href="Additional_Lectures_update.asp?Switch_lectures_ID=<%=rs("Switch_lectures_ID")%>&id=<%=id%>">
										«·„Ê«›ﬁ…</a>
									<%End if%>
									</td>
									<td class="tdView" width="8%">
									<%
									if rs("Status")="ok" then
									%>
									<a href="Additional_Lectures_Print.asp?Switch_lectures_ID=<%=rs("Switch_lectures_ID")%>&id=<%=id%>&DeptName=<%=request.queryString("DeptName")%>">
										ÿ»«⁄…</a>
									<%
									End if
									%>
									</td>
									
									<td class="tdView" width="8%">
									
									<%if cint(id) = rs("First_Department_id") and rs("Status")="open" then%>
										<a href="Additional_Lectures_Delete.asp?Switch_lectures_ID=<%=rs("Switch_lectures_ID")%>&id=<%=id%>">
										Õ–›</a>
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
									<td colspan="11">&nbsp;</td>
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