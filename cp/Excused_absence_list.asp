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
					<p align="right"><span lang="ar-kw">&nbsp;€Ì«» »⁄–— „ﬁ»Ê·<br>
					</span>
					<a href="Excused_absence_List_Add.asp?ID=<%=request.querystring("ID")%>&DeptName=<%=request.querystring("DeptName")%>">
					<span lang="ar-kw">≈÷«›…</span> 
					ÃœÌœ</a></div>
				
				<div class="RecordAdd">
				<form action="Excused_absence_list.asp?start=1" method="post" >
									
								<!--	<input type="hidden" value="<%=PRODUCT_IMG1%>" name="txtHdnImg1">
									-->
					<p>&nbsp;
					<select size="1" name="SelectClass_room" class="select">
						<option Value="0">Ã„Ì⁄ «·’›Ê›</option>
										<%									
										set Rssd=conn.execute("Select * from class_room order by class_room_id")
										while not rssd.eof
										%>
														<option value="<%=rssd("Class_Room_id")%>"><%=Rssd("Class_room")%></option>
										<%
											rssd.movenext
										wend
										set rssd=nothing
										%>
					</select>&nbsp;
					
					
					<input type="submit" value="≈—”«·" name="B1"> </p>
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
				pageName="Excused_absence_list.asp?q=0"
				
				id=request.Form("SelectClass_room")
				if id="" then
					id = request.querystring("id")
				end if
				
				if ID > 0 then		
					sSql = "select * from Excused_absence where Class_Room_id = "& id &" order by Reg_Date"
				Else
					sSql = "select * from Excused_absence order by Class_Room_ID, Reg_date"
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
									<td class="tdViewHead" width="15%">
									<span lang="en-us">&nbsp;</span> «—ÌŒ
									<span lang="ar-kw">«·≈÷«›…</span></td>
									<td class="tdViewHead" width="10%">«·’›</td>
									<td class="tdViewHead" width="23%">«”„ 
									«·ÿ«·»</td>
									<td class="tdViewHead" width="19%">«·—ﬁ„ 
									«·„œ‰Ì</td>
									<td class="tdViewHead" width="14%">
									<span lang="ar-kw"> «—ÌŒ «·€Ì«»</span></td>
									<td class="tdViewHead" width="6%">
									<span lang="ar-kw">‰Ê⁄ «·⁄–—</span></td>
									<td class="tdViewHead" width="6%">«·„·›</td>
									<td class="tdViewHead" width="5%">
									<span lang="ar-kw"> ⁄œÌ· </span></td>
									<td class="tdViewHead" width="5%">
									<span lang="ar-kw">Õ–›</span></td>
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
									<td class="tdView" width="15%"><%=rs("Reg_Day")&"/"&rs("Reg_month")&"/"&rs("Reg_year")%>
											
									</td>
									
									<td class="tdView" width="10%">
									&nbsp;	<%
									if rs("Class_Room_ID")<>"" then
										DeptSql = "select * from Class_Room where Class_Room_id="&rs("Class_Room_ID")&" "
										rss.open DeptSql,conn, 1, 2
											response.write rss("Class_Room")
											class_room = rss("Class_Room")
										rss.close
									End if
									%>
									</td>
									
									<td class="tdView" width="23%">
									<%
										DeptSql = "select * from Students where Std_Civil_ID='"&rs("Std_Civil_ID")&"' "
										rss.open DeptSql,conn, 1, 2
										if not rss.eof then
											response.write rss("Std_Name")
										End if
										rss.close
									%>
									
									</td>
									
									<td class="tdView" width="19%">&nbsp;<%=rs("Std_Civil_ID")%></td>
									
									<td class="tdView" width="14%">&nbsp;<%=rs("Excused_Day")&"/"&rs("Excused_month")&"/"&rs("Excused_year")%></td>
									
									<td class="tdView" width="6%">
																			
															<%if rs("Excused_type")=1 then%>
																⁄–— ÿ»Ì
															<%Else%>
																⁄–— ≈œ«—Ì
															<%End if%>				
																			</td>
									
									<td class="tdView" width="6%">
									<%if rs("Excused_file") <> "" then%><a href="/Excused_absence_file/<%=rs("Excused_File")%>"> Õ„Ì·<%End if%></a>
									
									</td>
									
									<td class="tdView" width="5%">
									<a href="Excused_absence_update.asp?Excused_id=<%=rs("Excused_ID")%>&class_room=<%=Class_Room%>">
									 ⁄œÌ·</a></td>
									
									<td class="tdView" width="5%">
																			<a href="Excused_absence_delete.asp?Excused_id=<%=rs("Excused_ID")%>&class_room=<%=Class_Room%>">
									Õ–›</a></td>
									
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
									<% Next %>
									<td>&nbsp;</td>
									<td>&nbsp;</td>
									<td>&nbsp;</td>
									<td>&nbsp;</td>
									<td>&nbsp;</td>
									<td>&nbsp;</td>
									<td>&nbsp;</td>
									<td>&nbsp;</td>
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