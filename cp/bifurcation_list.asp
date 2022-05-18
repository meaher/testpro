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
					<p align="right"><span lang="ar-kw">«· ‘⁄Ì» ⁄·„Ì - √œ»Ì</span></div>
				
				<div class="RecordAdd">
				<form action="bifurcation_list.asp?start=1" method="post" >
					
					<input type="hidden" value="<%=request.querystring("id")%>" name="txtDepartmentID">
				
								<!--	<input type="hidden" value="<%=PRODUCT_IMG1%>" name="txtHdnImg1">
									-->
					<p>&nbsp;
					<select size="1" name="SelectClass_room">
						<option Value="0">Ã„Ì⁄ ’›Ê› «·⁄«‘—</option>
										<%									
										set Rssd=conn.execute("Select * from class_room where Class_level = '10'")
										while not rssd.eof
										%>
														<option value="<%=rssd("Class_Room_id")%>" <%if rssd("Class_Room_id")=cint(request.form("selectClass_Room")) then%> selected <%end if%>><%=Rssd("Class_room")%></option>
										<%
											rssd.movenext
										wend
										set rssd=nothing
										%>
					</select>
					<select size="1" name="select_bifurcation">
						<option Value="0">«· ‘⁄Ì»</option>
						<option value="1" <%if request.form("select_bifurcation")=1 then%> selected <%end if%>>⁄·„Ì</option>
						<option value="2" <%if request.form("select_bifurcation")=2 then%> selected <%end if%>>√œ»Ì</option>
					</select>&nbsp;
					
					
					<input type="submit" value="≈—”«·" name="B1"></p>
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
				pageName="bifurcation_list.asp?q=0"
				bifurcation = request.form("select_bifurcation")
				id=request.Form("SelectClass_room")
				if id="" then
					id = request.querystring("id")
				end if
				if bifurcation = "" then
					bifurcation = 0
				end if
				
				if ID > 0 then	
					if bifurcation > 0 then	
						sSql = "select * from bifurcation where Class_Room_id = "& id &" and bifurcation ="&bifurcation&" order by Class_room_id"
					Else
						sSql = "select * from bifurcation where Class_Room_id = "& id &" order by Class_room_id"
					End if
				Else
					if bifurcation > 0 then	
						sSql = "select * from bifurcation where bifurcation ="&bifurcation&" order by Class_room_id"
					Else
						sSql = "select * from bifurcation order by Class_Room_ID"
					End if
	 			End if

									
				Set rs = Server.CreateObject("ADODB.Recordset")
				Set rss = Server.CreateObject("ADODB.Recordset")
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
									<td class="tdViewHead" width="6%">„</td>
									<td class="tdViewHead" width="22%">«·’›</td>
									<td class="tdViewHead" width="24%">«”„ 
									«·ÿ«·»</td>
									<td class="tdViewHead" width="18%">«·—ﬁ„ 
									«·„œ‰Ì</td>
									<td class="tdViewHead" width="23%">«· ‘⁄Ì»</td>
									</thead>
								<%
								ii=1
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
																		
									<td class="tdView" width="6%">
									&nbsp;<%=ii%></td>
									
									<td class="tdView" width="22%">
									&nbsp;	<%
									if rs("Class_Room_ID")<>"" then
										DeptSql = "select * from Class_Room where Class_Room_id="&rs("Class_Room_ID")&" "
										rss.open DeptSql,conn, 1, 2
											response.write rss("Class_Room")
										rss.close
									End if
									%>
									</td>
									
									<td class="tdView" width="24%">
									<%
										DeptSql = "select * from Students where Std_Civil_ID='"&rs("Std_Civil_ID")&"' "
										rss.open DeptSql,conn, 1, 2
										if not rss.eof then
											response.write rss("Std_Name")
										End if
										rss.close
									%>
									
									</td>
									
									<td class="tdView" width="18%">&nbsp;<%=rs("Std_Civil_ID")%></td>
									
									<td class="tdView" width="23%">&nbsp;
									<%
									if rs("bifurcation")=1 then
										response.write("⁄·„Ì")
									elseif rs("bifurcation")=2 then
										response.write("√œ»Ì")
									End if
									%>
									
									</td>
									<%ii=ii+1%>
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
					<p align="right"><span lang="ar-kw">«· ‘⁄Ì» ⁄·„Ì - √œ»Ì</span></div>
				
				<div class="RecordAdd">
				<form action="bifurcation_list.asp?start=1" method="post" >
					
					<input type="hidden" value="<%=request.querystring("id")%>" name="txtDepartmentID">
				
								<!--	<input type="hidden" value="<%=PRODUCT_IMG1%>" name="txtHdnImg1">
									-->
					<p>&nbsp;
					<select size="1" name="SelectClass_room" class="select">
						<option Value="0">Ã„Ì⁄ ’›Ê› «·⁄«‘—</option>
										<%									
										set Rssd=conn.execute("Select * from class_room where Class_level = '10'")
										while not rssd.eof
										%>
														<option value="<%=rssd("Class_Room_id")%>" <%if rssd("Class_Room_id")=cint(request.form("selectClass_Room")) then%> selected <%end if%>><%=Rssd("Class_room")%></option>
										<%
											rssd.movenext
										wend
										set rssd=nothing
										%>
					</select>
					<select size="1" name="select_bifurcation" class="select">
						<option Value="0">«· ‘⁄Ì»</option>
						<option value="1" <%if request.form("select_bifurcation")=1 then%> selected <%end if%>>⁄·„Ì</option>
						<option value="2" <%if request.form("select_bifurcation")=2 then%> selected <%end if%>>√œ»Ì</option>
					</select>&nbsp;
					
					
					<input type="submit" value="≈—”«·" name="B1"></p>
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
				pageName="bifurcation_list.asp?q=0"
				bifurcation = request.form("select_bifurcation")
				id=request.Form("SelectClass_room")
				if id="" then
					id = request.querystring("id")
				end if
				if bifurcation = "" then
					bifurcation = 0
				end if
				
				if ID > 0 then	
					if bifurcation > 0 then	
						sSql = "select * from bifurcation where Class_Room_id = "& id &" and bifurcation ="&bifurcation&" order by Class_room_id"
					Else
						sSql = "select * from bifurcation where Class_Room_id = "& id &" order by Class_room_id"
					End if
				Else
					if bifurcation > 0 then	
						sSql = "select * from bifurcation where bifurcation ="&bifurcation&" order by Class_room_id"
					Else
						sSql = "select * from bifurcation order by Class_Room_ID"
					End if
	 			End if

									
				Set rs = Server.CreateObject("ADODB.Recordset")
				Set rss = Server.CreateObject("ADODB.Recordset")
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
									<td class="tdViewHead" width="9%">„</td>
									<td class="tdViewHead" width="9%">«·’›</td>
									<td class="tdViewHead" width="18%">«”„ 
									«·ÿ«·»</td>
									<td class="tdViewHead" width="29%">«·—ﬁ„ 
									«·„œ‰Ì</td>
									<td class="tdViewHead" width="32%">«· ‘⁄Ì»</td>
									</thead>
								<%
								ii=1
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
																		
									<td class="tdView" width="9%">
									&nbsp;<%=ii%></td>
									
									<td class="tdView" width="9%">
									&nbsp;	<%
									if rs("Class_Room_ID")<>"" then
										DeptSql = "select * from Class_Room where Class_Room_id="&rs("Class_Room_ID")&" "
										rss.open DeptSql,conn, 1, 2
											response.write rss("Class_Room")
										rss.close
									End if
									%>
									</td>
									
									<td class="tdView" width="18%">
									<%
										DeptSql = "select * from Students where Std_Civil_ID='"&rs("Std_Civil_ID")&"' "
										rss.open DeptSql,conn, 1, 2
										if not rss.eof then
											response.write rss("Std_Name")
										End if
										rss.close
									%>
									
									</td>
									
									<td class="tdView" width="29%">&nbsp;<%=rs("Std_Civil_ID")%></td>
									
									<td class="tdView" width="32%">&nbsp;
									<%
									if rs("bifurcation")=1 then
										response.write("⁄·„Ì")
									elseif rs("bifurcation")=2 then
										response.write("√œ»Ì")
									End if
									%>
									
									</td>
									<%ii=ii+1%>
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