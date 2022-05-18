<%@ codepage=1256%>
<!-- #include file="includes/inc_db.asp" -->
<!-- #include file="includes/inc_functions.asp" -->

<%
Set Conn = Server.CreateObject("ADODB.Connection")
Conn.open ConnString 

Set rs = Server.CreateObject("ADODB.RecordSet")
Set rss = Server.CreateObject("ADODB.RecordSet")

%>
<html dir="rtl">

<head>
<meta http-equiv="Content-Language" content="ar-sa">
<meta http-equiv="Content-Type" content="text/html; charset=windows-1256">
<title>.::مدرسة ::.</title>
</head>

<body topmargin="0" leftmargin="0" rightmargin="0" bottommargin="0" marginwidth="0" marginheight="0">

<div align="center">
	<table border="0" width="900" id="table13">
		<tr>
			<td valign="top">
			<table border="0" width="100%" id="table16" cellspacing="0" cellpadding="0">
				<tr>
					<td width="96%" valign="top">

			<table border="0" width="80%" id="table18" cellspacing="0" cellpadding="0">
			<tr><td>
							<img border="0" src="images/el-ameed_08_2.gif" width="245" height="34"></td>
				<tr>
					<td height="121">
					
				
			<img border="0" src="images/el-ameed_12_4.gif" width="273" height="147"><img border="0" src="images/homod_11.gif" width="270" height="147"><img border="0" src="images/homod_10.gif" width="174" height="147"></td>
				</tr>
				<tr>
					<td height="121" valign="top">
					<form method="post" action="sendingData.asp">
											
					<table border="0" width="100%" id="table20" cellspacing="0" cellpadding="0">
					
						<tr>
							<td>
							<table border="1" width="100%" style="border-collapse: collapse" dir="rtl">
								<tr>
									<td align="left" colspan="2">
									<p dir="ltr" align="center">&nbsp;</p>
									<p dir="ltr" align="center"><b>
									<font size="5">شروط المسابقة</font></b></p>
									<p>&nbsp;</p>
									<p>&nbsp;</td>
								</tr>
								<tr>
									<td align="left"><b><font size="4">اسم الطالب:</font></b></td>
									<td><input type="text" name="T1" size="50"></td>
								</tr>
								<tr>
									<td align="left"><b><font size="4">الصف:</font></b></td>
									<td><input type="text" name="T2" size="50"></td>
								</tr>
							</table>
							</td>
						</tr>

						<tr>
							<td>
							&nbsp;</td>
						</tr>
								<%
								nDisplayRecs =11
								nRecRange = 15
								nRecPerRow = 1
								pageName="default.asp?NI=0"

								Set prs = Server.CreateObject("ADODB.Recordset")
								%>
								<%

								sSql = "select * from qu"
								Set rs = Server.CreateObject("ADODB.Recordset")
								
								rs.CursorLocation = 3
								rs.Open sSql ,conn
								if rs.eof then
								
									response.write "<br><br><font size=3 color=993300>لا يوجد بيانات مضافة</font>"
								end if
								nTotalRecs = rs.RecordCount
								If nDisplayRecs <= 0 Then ' Display All Records
									nDisplayRecs = nTotalRecs
								End If
								
								nStartRec = 1
								SetUpStartRec() 
								%>
								
								<% If nTotalRecs > 0 Then %>
													
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
												
											<tr  id="trRow">
											<% End If %>
							<td>
							<table border="0" width="100%" style="border-collapse: collapse">
		<tr>
			<td>
			<table border="1" width="100%" style="border-collapse: collapse">
				<tr>
					<td colspan="3" height="24">							<b>
					<font size="4">							<%id=id+1%>
							<%=id%>-&nbsp;
					<%=rs("q")%></font></b></td>
				</tr>
				<tr>
					<td width="17%">							&nbsp;<input type="radio" name="R<%=id%>" value=1 checked><%=rs("ch1")%></td>
					<td width="17%">							&nbsp;<input type="radio" name="R<%=id%>" value=2><%=rs("ch2")%></td>
					<td width="64%">							&nbsp;<input type="radio" name="R<%=id%>" value=3><%=rs("ch3")%></td>
				</tr>
				</table>
			</td>
		</tr>
		</table>
		<br>
		
							</td>
											<%		If (nRecActual Mod nRecPerRow = 0) Or (nRecPerRow < 2) Then %>
											</tr>
											<% 
													End If 
												End If
												rs.MoveNext
											Loop
											%>
											<% If (nRecActual Mod nRecPerRow) <> 0 Then
												For i = 1 to (nRecPerRow - nRecActual Mod nRecPerRow) %>
												<td height="17"></td>
												<% Next %>
											</tr>
											<% End If %>
										
								<% End If %>
								<p align=right><!-- #includes file="includes/inc_pagging.asp"--></p></td>
																				

					</table>
					<p align="center"><input type="submit" value="ارسل الاجابات" name="B1"></p>
					</form>
					</td>
				</tr>
				<tr>
					<td>
					&nbsp;</td>
				</tr>
				<tr>
					<td>
					&nbsp;</td>
				</tr>
			</table>
			
					</td>
				</tr>
			</table>
			</td>
		</tr>
	</table>
</div>

			</body>

</html>