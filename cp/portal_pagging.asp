<table class="tblPagging" cellspacing="0" cellpadding="3">
	<tr>
		<td class="tdPaggingR">
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
					<a href="<%=pageName%>&start=<%=PrevStart%>">
		<span lang="en-us">Back</span></a>
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
							<a href="<%=pageName%>&start=<%=x%>" class="pagging"><%=y%></a>
									
							<%	End If
							x = x + nDisplayRecs
							y = y + 1
						ElseIf x >= (dx1-nDisplayRecs*nRecRange) And x <= (dx2+nDisplayRecs*nRecRange) Then
							If x+nRecRange*nDisplayRecs < nTotalRecs Then %>
							 | 
							<a href="<%=pageName%>&start=<%=x%>" class="pagging"><%=y%>-<%=y+nRecRange-1%></a>
				
							<% Else
								ny=(nTotalRecs-1)\nDisplayRecs+1
									If ny = y Then %>
									<a href="<%=pageName%>&start=<%=x%>" class="pagging"><%=y%></a>
									<% Else %>
									<a href="<%=pageName%>&start=<%=x%>" class="pagging"><%=y%>-<%=ny%></a>
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
					<a href="<%=pageName%>&start=<%=NextStart%>">
		<span lang="en-us">next</span></a>
				<% Else
					isMore = False
				End If %>
		</td>
		<td class="tdPaggingL">
		
			<%	End If
				If CLng(nStartRec) > CLng(nTotalRecs) Then nStartRec = nTotalRecs
				nStopRec = nStartRec + nDisplayRecs - 1
				nRecCount = nTotalRecs - 1
				If rsEof Then nRecCount = nTotalRecs
				If nStopRec > nRecCount Then nStopRec = nRecCount %>
				From <%= nStartRec %> To <%= nStopRec %> All <%= nTotalRecs %>
			<% Else %>
				<% If sSrchWhere = "0=101" Then %>
				<% Else %>
			Empty
				<% End If %>
			<% End If %>		
		
		</td>
	</tr>
</table>