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
					<p align="right"> »œÌ· «·Õ’’<br>
					<a href="Switch_Lectures_Admin_Add.asp">ÿ·» ÃœÌœ</a></div>
				
				<div class="RecordAdd">
				<form action="Switch_Lectures_admin_list.asp" method="post" >
									
								<!--	<input type="hidden" value="<%=PRODUCT_IMG1%>" name="txtHdnImg1">
									-->
					<select size="1" name="SelectDay">
						<option Value="0">«Œ — «·ÌÊ„</option>
						<%for i=1 to 31%>
							<option Value="<%=i%>" <%if cint(request.form("SelectDay")) = i then%> selected <%End if%>><%=i%></option>
							
						<%next%>
					</select>
					<select size="1" name="SelectMonth">
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

					</select>&nbsp;&nbsp;
					
					<select size="1" name="SelectDepartment" class="select">
						<option Value="0" <%if request.form("SelectDepartment")=0 then%> selected <%end if%>>«·ﬁ”„ „ﬁœ„ ÿ·» «· »œÌ·</option>
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
					<a target="_blank" href="Switch_Lectures_admin_Print.asp?ID=<%=id%>&smonth=<%=Request.form("SelectMonth")%>&sday=<%=Request.form("SelectDay")%>"><font size="3">ÿ»«⁄…</font></a></p>
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
				pageName="Switch_Lectures_Admin_list.asp?q=0"
				
				SelectMonth=request.form("SelectMonth")
				SelectDay=request.form("SelectDay")
				
				iD=request.form("SelectDepartment")
				
				if ID > 0 then
					if SelectDay > 0 then
						if SelectMonth > 0 then
							sSql = "select * from Switch_Lectures where Additional= 0 and  First_Department_id = "& id &" and First_Lecture_Day= "& SelectDay &" and First_Lecture_Month="& SelectMonth &" Order By status='open' "							
						else 
							sSql = "select * from Switch_Lectures where Additional= 0 and  First_Department_id = "& id &" and First_Lecture_Day= "& SelectDay &" and First_Lecture_Month="& month(Date()) &" Order By status='open' "							
						end if
					Else		
						if SelectMonth > 0 then
							sSql = "select * from Switch_Lectures where Additional= 0 and  First_Department_id = "& id &" and First_Lecture_Month="& SelectMonth &" Order By status='open' "							
						else 
							sSql = "select * from Switch_Lectures where Additional= 0 and  First_Department_id = "& id &" Order By status='open' "							
						end if
					End if
				Else
					if SelectDay > 0 then
						if SelectMonth > 0 then
							sSql = "select * from Switch_Lectures where Additional= 0 and  First_Lecture_Day= "& SelectDay &" and First_Lecture_Month="& SelectMonth &" Order By status='open' "							
						else 
							sSql = "select * from Switch_Lectures where Additional= 0 and  First_Lecture_Day= "& SelectDay &" and First_Lecture_Month="& month(Date()) &" Order By status='open' "							
						end if
					Else		
						if SelectMonth > 0 then
							sSql = "select * from Switch_Lectures where Additional= 0 and  First_Lecture_Month="& SelectMonth &" Order By status='open' "							
						else 
							sSql = "select * from Switch_Lectures where Additional= 0 Order By status='open' "							
						end if
					End if
	 			End if
	 			
				'id = request.querystring("id")
				'sSql = "select * from Switch_Lectures Order By status='open' "
	 
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
										response.write " „ «· »œÌ·"
									End if
									%></td>
									
									<td class="tdView" width="2%">
									<%if rs("Status")="open" then%>
										<a href="Switch_Lectures_Admin_update.asp?Switch_lectures_ID=<%=rs("Switch_lectures_ID")%>">
										«·„Ê«›ﬁ…</a>
									<%End if%>
									</td>
									
									<td class="tdView" width="8%">
									
									<%if rs("Status")="open" then%>
										<a href="Switch_Lectures_Admin_Delete.asp?Switch_lectures_ID=<%=rs("Switch_lectures_ID")%>">
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