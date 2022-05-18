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
					<p align="right">«·„—«”·« <br>
					<a href="School_letters_admin_Add.asp">≈÷«›… ÃœÌœ</a></div>
				
				<div class="RecordAdd">
				<form action="School_letters_admin_list.asp?start=1" method="post" >
					
					<input type="hidden" value="<%=request.querystring("id")%>" name="txtDepartmentID">
				
								<!--	<input type="hidden" value="<%=PRODUCT_IMG1%>" name="txtHdnImg1">
									-->
					<p>&nbsp;
					<%ss=Request.Form("SelectDepartment")%>
					
					<select size="1" name="SelectDepartment" class="select">
						<option Value="0" <%if ss="0" then%> selected <%end if%>>Ã„Ì⁄ «·√ﬁ”«„</option>
						<option Value="-1" <%if ss="-1" then%> selected <%end if%>>ﬂ «» ⁄«„</option>
										<%									
										set Rssd=conn.execute("Select * from Departments")
										while not rssd.eof
										%>
														<option value="<%=rssd("Department_id")%>" <%if rssd("Department_id")=cint(ss) then%> selected <%end if%>><%=Rssd("Department_Name")%></option>
										<%
											rssd.movenext
										wend
										set rssd=nothing
										%>
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
				pageName="School_letters_admin_list.asp?q=0"
				
				id=request.Form("SelectDepartment")
				if id="" then
					id = request.querystring("id")
				end if
				
				if ID > 0 then		
					sSql = "select * from School_Letters where Department_id = "& id &" order by Letter_date"
				Elseif ID = "-1" then
					sSql = "select * from School_Letters where Public_Letter = '0' order by Letter_date"
				Else
					sSql = "select * from School_Letters order by Department_ID"
	 			End if

									
	 
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
									<td class="tdViewHead" width="15%">
									<span lang="en-us">&nbsp;</span> «—ÌŒ «·ﬂ «»</td>
									<td class="tdViewHead" width="18%">«·„Ê÷Ê⁄</td>
									<td class="tdViewHead" width="18%">«·ﬁ”„</td>
									<td class="tdViewHead" width="21%">„·«ÕŸ«  
									«·≈œ«—…</td>
									<td class="tdViewHead" width="10%">„·› 
									«·≈œ«—…</td>
									<td class="tdViewHead" width="11%">„·› «·ﬁ”„ </td>
									<td class="tdViewHead" width="38%">Õ–› </td>
									<td class="tdViewHead" width="8%"> ⁄œÌ·</td>
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
									<td class="tdView" width="15%"><%=DAY(rs("letter_Date"))&"/"&Month(rs("letter_Date"))&"/"&Year(rs("letter_Date"))%>
											
									</td>
									
									<td class="tdView" width="18%">
									&nbsp;<%=rs("Subject")%></td>
									
									<td class="tdView" width="18%">
									<%
									if rs("Public_Letter") =0 then
										response.write "Ã„Ì⁄ «·√ﬁ”«„"
									Else
										
										
										DeptSql = "select * from Departments where Department_id="&rs("Department_ID")&" "
										rss.open DeptSql,conn, 1, 2
											response.write "ﬁ”„ " & rss("Department_Name")
										rss.close
									End if
									%>
									
									</td>
									
									<td class="tdView" width="21%">&nbsp;<%=rs("notes")%></td>
									<td class="tdView" width="10%">
									<a href="/School_Letters/<%=rs("File_letter")%>">
									„·› «·≈œ«—…</a></td>
									
									<td class="tdView" width="11%">
									<%if rs("File_letter2")<>"" then%>
									<a href="/School_Letters/<%=rs("File_letter2")%>">
									„·› «·ﬁ”„</a>
									<%End if%>
									</td>
									
									<td class="tdView" width="8%">
									<a href="School_letters_admin_delete.asp?Letter_id=<%=rs("Letter_ID")%>">
									Õ–›</a></td>
									<td class="tdView" width="8%">
									<a href="School_letters_admin_update.asp?Letter_id=<%=rs("Letter_ID")%>">
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
									<td colspan="6">&nbsp;</td>
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