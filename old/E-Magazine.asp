<!--#include file = "header.asp"-->
<html dir="rtl">


<div align="center">
	<table bgcolor=#FFFFFF border="0" width="900" id="table1" cellspacing="0" cellpadding="0">
		<tr>
			<td bgcolor="#0A308F"  height="7"></td>
		</tr>
		<tr>
			<td>
			<table border="0" width="100%" id="table2" cellspacing="0" cellpadding="0">
				<tr>
					<td width="142" valign="top">
			<!--#include file="Right.asp"-->
					</td>
					<td valign="top">
					<!--#include file="Banner.asp"-->
<%
Const ewTblStartRec = "start"
Const ewSessionTblStartRec = "Products_start"
nStartRec = 0
nStopRec = 0
nTotalRecs = 0
nRecCount = 0
nRecActual = 0
nDisplayRecs = 10
nRecRange = 16

' Multi Column
nRecPerRow = 1

PageName = "E-Magazine.asp" 
%>
<%
sSql="Select * from news where Active=true order by News_ID asc"


' Set up Record Set
Set rs = Server.CreateObject("ADODB.Recordset")
rs.CursorLocation = 3
rs.Open sSql, conn, 1, 2
nTotalRecs = rs.RecordCount
If nDisplayRecs <= 0 Then ' Display All Records
	nDisplayRecs = nTotalRecs
End If
nStartRec = 1
SetUpStartRec() ' Set Up Start Record Position

%>
<%

' Avoid starting record > total records
If CLng(nStartRec) > CLng(nTotalRecs) Then
	nStartRec = nTotalRecs
End If

' Set the last record to display
nStopRec = nStartRec + nDisplayRecs - 1

' Move to first record directly for performance reason
nRecCount = nStartRec - 1
If Not rs.Eof Then
	rs.MoveFirst
	rs.Move nStartRec - 1
End If
nRecActual = 0
%>
				<table border="0" width="100%" id="table4" cellspacing="0" cellpadding="0">
						<tr>
							<td colspan="3" valign="top">
							<div align="center">
</div>
							<table border="0" width="98%" id="table7" cellspacing="0" cellpadding="0">
								<tr>
									<td colspan="2" align="center">
									
									<font face="Sultan normal" size="5">
									<div align="center">
										<table border="0" width="98%" id="table10">
											<tr>
												<td width="23">
			<img src="images/el-ameed_42.gif" width="22" height="22" alt=""></td>
												<td>
									<img border="0" src="Images/Emagazeen.jpg" width="160" height="28"></td>
											</tr>
										</table>
									</div>
			</font>
		<%if rs.eof then%>
									<p>	
		<br>	
		·« ÌÊÃœ √Œ»«— „÷«›…
		<% else %>
		
		</p>
		
		<table border="0" width="99%" id="table2" cellpadding="3">
						
		<%set rss = Server.CreateObject("ADODB.RecordSet")%>
			<%
			Do While (Not rs.Eof) And (nRecCount < nStopRec)
				nRecCount = nRecCount + 1
				If CLng(nRecCount) >= CLng(nStartRec) Then
					nRecActual = nRecActual + 1
			%>
			<% If (nRecActual Mod nRecPerRow = 1) OR (nRecPerRow = 2) Then %>
			<tr>
			<% End If %>
			
			<tr>
				<td valign="top">
				<table border="0" width="99%" id="table8" cellspacing="0" cellpadding="0">
								<tr>
									<td width="8">
			<img src="images/el-ameed_36.gif" width="8" height="9" alt=""></td>
									<td background="images/el-ameed_35.gif">
			</td>
									<td width="8">
			<img src="images/el-ameed_32.gif" width="8" height="9" alt=""></td>
								</tr>
								<tr>
									<td width="8" background="images/el-ameed_40.gif">
			&nbsp;</td>
									<td>
			
<table border="0" width="99%" id="table9">
	<tr>
		<td width="81" valign="top">
			<%if rs("Img") <> "" then%>
				<img src="pecture/<%=rs("Img")%>" width=120>
			<%end if%>
			</td>
		<td valign="top"><p align="justify">
		<b> 
		<%if rs("Details") <> "" then%>
			<a href="E-Magazine_Details.asp?NewsID=<%=rs("News_ID")%>"><%=rs("Subject")%></a>
			</b>
		<br><%=rs("Details")%>.
		<%Else%>
			<b>
			<%=rs("Subject")%></b>
		<%End if%>
		
		 
		 <%if rs("Details") <> "" then%>
		 	<a href="E-Magazine_Details.asp?NewsID=<%=rs("News_ID")%>">		 
			<font color="#FF0000">«· ›«’Ì·...</font></a>
		<%End if%>	
			</p>
				<p align="left"><%=rs("regdate")%></p></td>
	</tr>
</table>
			
</td>
									<td width="8" background="images/el-ameed_38.gif">
			&nbsp;</td>
								</tr>
								<tr>
									<td width="8">
			<img src="images/el-ameed_57.gif" width="8" height="9" alt=""></td>
									<td background="images/el-ameed_55.gif"></td>
									<td width="8">
			<img src="images/el-ameed_54.gif" width="8" height="9" alt=""></td>
								</tr>
							</table>
				</td>
		<% If (nRecActual Mod nRecPerRow = 0) Or (nRecPerRow < 2) Then %>
		</tr>
		<% End If %>
		<%
			End If
			rs.MoveNext
		Loop
		%>
	</table>
		<%
		end if 
		rs.close
		set rs=nothing
		%>
&nbsp;
<br><br>
			<div align="center">

			</div>
									
									
								

<table border="0" cellspacing="0" cellpadding="0" dir="rtl">
	<tr>
		<td nowrap align="center">
<font size="2">
<%

' Display page numbers
If nTotalRecs > 0 Then
	rsEof = (nTotalRecs < (nStartRec + nDisplayRecs))
	If CLng(nTotalRecs) > CLng(nDisplayRecs) Then

		' Find out if there should be Backward or Forward Buttons on the TABLE.
		If 	nStartRec = 1 Then
			isPrev = False
		Else
			isPrev = True
			PrevStart = nStartRec - nDisplayRecs
			If PrevStart < 1 Then PrevStart = 1 %>
		</font>
		<a href="<%=PageName%>?start=<%=PrevStart%>"><b><font size="2">«·”«»ﬁ</font></b></a><font size="2">
		<%
		End If
		If (isPrev Or (Not rsEof)) Then
			x = 1
			y = 1
			dx1 = ((nStartRec-1)\(nDisplayRecs*nRecRange))*nDisplayRecs*nRecRange+1
			dy1 = ((nStartRec-1)\(nDisplayRecs*nRecRange))*nRecRange+1
			If (dx1+nDisplayRecs*nRecRange-1) > nTotalRecs Then
				dx2 = (nTotalRecs\nDisplayRecs)*nDisplayRecs+1
				dy2 = (nTotalRecs\nDisplayRecs)+1
			Else
				dx2 = dx1+nDisplayRecs*nRecRange-1
				dy2 = dy1+nRecRange-1
			End If
			While x <= nTotalRecs
				If x >= dx1 And x <= dx2 Then
					If CLng(nStartRec) = CLng(x) Then %>
		<b><%=y%></b>
					<%	Else %>
		</font>
		<a href="<%=PageName%>?start=<%=x%>"><b><font size="2"><%=y%></font></b></a><font size="2">
					<%	End If
					x = x + nDisplayRecs
					y = y + 1
				ElseIf x >= (dx1-nDisplayRecs*nRecRange) And x <= (dx2+nDisplayRecs*nRecRange) Then
					If x+nRecRange*nDisplayRecs < nTotalRecs Then %>
		</font>
		<a href="<%=PageName%>?start=<%=x%>"><b><font size="2"><%=y%>-<%=y+nRecRange-1%></font></b></a><font size="2">
					<% Else
						ny=(nTotalRecs-1)\nDisplayRecs+1
							If ny = y Then %>
		</font>
		<a href="<%=PageName%>?start=<%=x%>"><b><font size="2"><%=y%></font></b></a><font size="2">
							<% Else %>
		</font>
		<a href="<%=PageName%>?start=<%=x%>"><b><font size="2"><%=y%>-<%=ny%></font></b></a><font size="2">
							<%	End If
					End If
					x=x+nRecRange*nDisplayRecs
					y=y+nRecRange
				Else
					x=x+nRecRange*nDisplayRecs
					y=y+nRecRange
				End If
			Wend
		End If

		' Next link
		If NOT rsEof Then
			NextStart = nStartRec + nDisplayRecs
			isMore = True %>
		</font>
		<a href="<%=PageName%>?start=<%=NextStart%>"><b><font size="2">«· «·Ì</font></b></a><font size="2">
		<% Else
			isMore = False
		End If %>
		<br>
<%	End If
	If CLng(nStartRec) > CLng(nTotalRecs) Then nStartRec = nTotalRecs
	nStopRec = nStartRec + nDisplayRecs - 1
	nRecCount = nTotalRecs - 1
	If rsEof Then nRecCount = nTotalRecs
	If nStopRec > nRecCount Then nStopRec = nRecCount %>
	 <%= nStartRec %> ≈·Ï&nbsp;<%= nStopRec %>&nbsp;„‰ <%= nTotalRecs %>
<% Else %>
	<% If sSrchWhere = "0=101" Then %>
	<% Else %>
	<br>	<br>	<br>	<br>
	·« ÌÊÃœ »Ì«‰« 
	<% End If %>
<% End If %>
</span>
		</font>
		</td>
	</tr>
</table>
	</td>
								</tr>
								<tr>
									<td>&nbsp;</td>
									<td>&nbsp;</td>
								</tr>
								</table>
							</td>
						</tr>
					</table>
					</td>
				</tr>
			</table>
			</td>
		</tr>
		<tr>
			<td>
		<!--#include file="Footer.asp"-->
			</td>
		</tr>
	</table>
</div>
</body>
</html>
<%
'-------------------------------------------------------------------------------
' Function SetUpStartRec
' - Set up Starting Record parameters based on Pager Navigation
' - Variables setup: nStartRec

Sub SetUpStartRec()
	Dim nPageNo

	' Check for a START parameter
	If Request.QueryString(ewTblStartRec).Count > 0 Then
		nStartRec = Request.QueryString(ewTblStartRec)
		Session(ewSessionTblStartRec) = nStartRec
	ElseIf Request.QueryString("pageno").Count > 0 Then
		nPageNo = Request.QueryString("pageno")
		If IsNumeric(nPageNo) Then
			nStartRec = (nPageNo-1)*nDisplayRecs+1
			If nStartRec <= 0 Then
				nStartRec = 1
			ElseIf nStartRec >= ((nTotalRecs-1)\nDisplayRecs)*nDisplayRecs+1 Then
				nStartRec = ((nTotalRecs-1)\nDisplayRecs)*nDisplayRecs+1
			End If
			Session(ewSessionTblStartRec) = nStartRec
		Else
			nStartRec = Session(ewSessionTblStartRec)
			If Not IsNumeric(nStartRec) Or nStartRec = "" Then
				nStartRec = 1 ' Reset start record counter
				Session(ewSessionTblStartRec) = nStartRec
			End If
		End If
	Else
		nStartRec = Session(ewSessionTblStartRec)
		If Not IsNumeric(nStartRec) Or nStartRec = "" Then
			nStartRec = 1 'Reset start record counter
			Session(ewSessionTblStartRec) = nStartRec
		End If
	End If
End Sub

%>