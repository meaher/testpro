<table border="0" cellspacing="0" cellpadding="0">
	<tr>
		<td>&nbsp;</td>
	</tr>
	<tr>
		<td nowrap align="right" style="font-size: 8pt; color:#999999" height="30">

			<table border="0" cellspacing="3" cellpadding="3">
				<tr>
					<td nowrap align="center" style="font-size: 8pt; color:#999999">
			<p align="right"><font color="#FF00FF">
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
						<a href="<%=pageName%>&start=<%=PrevStart%>#display" class="page">
			<font color="#FF00FF">Prev</font></a><font color="#FF00FF">
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
					 | <b><%=y%></b>
								<%	Else %>
			 | 
								</font> 
								<a href="<%=pageName%>&start=<%=x%>#display" class="page">
			<font color="#FF00FF"><%=y%></font></a><font color="#FF00FF">
										
								<%	End If
								x = x + nDisplayRecs
								y = y + 1
							ElseIf x >= (dx1-nDisplayRecs*nRecRange) And x <= (dx2+nDisplayRecs*nRecRange) Then
								If x+nRecRange*nDisplayRecs < nTotalRecs Then %>
								 | 
								</font> 
								<a href="<%=pageName%>&start=<%=x%>#display" class="page">
			<font color="#FF00FF"><%=y%>-<%=y+nRecRange-1%></font></a><font color="#FF00FF">
					
								<% Else
									ny=(nTotalRecs-1)\nDisplayRecs+1
										If ny = y Then %>
										</font>
										<a href="<%=pageName%>&start=<%=x%>#display" class="page">
			<font color="#FF00FF"><%=y%></font></a><font color="#FF00FF">
										<% Else %>
										</font>
										<a href="<%=pageName%>&start=<%=x%>#display" class="page">
			<font color="#FF00FF"><%=y%>-<%=ny%></font></a><font color="#FF00FF">
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
						  |  
						</font>  
						<a href="<%=pageName%>&start=<%=NextStart%>#display" class="page">
			<font color="#FF00FF">Next</font></a><font color="#FF00FF">
					<% Else
						isMore = False
					End If %>
					<br><br>
			<%	End If
				If CLng(nStartRec) > CLng(nTotalRecs) Then nStartRec = nTotalRecs
				nStopRec = nStartRec + nDisplayRecs - 1
				nRecCount = nTotalRecs - 1
				If rsEof Then nRecCount = nTotalRecs
				If nStopRec > nRecCount Then nStopRec = nRecCount %>
				from <%= nStartRec %> to <%= nStopRec %> of <%= nTotalRecs %>
			<% Else %>
				<% If sSrchWhere = "0=101" Then %>
				<% Else %>
				
				
				<% End If %>
			<% End If %>
					</font>
					</td>
				</tr>
			</table>

		</td>
	</tr>
	<tr>
		<td>&nbsp;</td>
	</tr>
</table>
