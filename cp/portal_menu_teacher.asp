<%
if session("Employee_ID")="" then
	response.redirect("Teachercp.asp")
End if
%>
<div align="center">
	<table class="tblMenu" cellpadding="3">
		<theader>
			<td class="tdMenuHead">·ÊÕ… «· Õﬂ„</td>
		</theader>
		<tr>
			<td class="tdMenu"><a href="portal_main_Teacher.asp">«·’›Õ… «·—∆Ì”Ì…</a></td>
		</tr>
		<tr>
			<td class="tdMenu">
			
			<a href="Teacher_users_update.asp?start=1">«·»Ì«‰«  «·‘Œ’Ì…</a>
			
			</td>
		</tr>
		<tr>
			<td class="tdMenu">
			
			<a href="../media/Daleel.pdf" target=_blank>«·œ·Ì· «·≈—‘«œÌ ··„œ«—”</a>
			
			</td>
		</tr>
		<tr>
			<td class="tdMenuhead">
			
			<span lang="ar-kw">«·›’Ê· «·„œ—”Ì…</span>
			
			</td>
		</tr>
				<%
				''''''''''''''''''''''''
					Set rsm = Server.CreateObject("ADODB.Recordset")
					Set rsClass = Server.CreateObject("ADODB.Recordset")
					Set rsSubj = Server.CreateObject("ADODB.Recordset")
					rsm.open "select * from Teachers_class_room where Employee_ID ="&session("Employee_ID")&"",conn,1,2
					if not rsm.eof then
						while not rsm.eof
					%>
					
						<%
						rsClass.open "select * from class_room where Class_Room_id ="&rsm("Class_room_id")&"",conn,1,2
						if not rsClass.eof then
						%>
								<tr>
								
								<td class="tdMenu">
						<%
						rsSubj.open "select * from Subjects where Subject_id ="&rsm("Subject_id")&"",conn,1,2
						if not rsSubj.eof then
						%>	
								<a href="teacher_Class_room_absence_List.asp?Class_id=<%=rsClass("Class_room_ID")%>&subject_id=<%=rsm("subject_ID")%>&subject_Name=<%=rsSubj("Subject_name")%>&Class_room=<%=rsClass("Class_room")%>&start=1">
							<span lang="ar-kw">
						
									<%=rsSubj("subject_name")%>
								<%
								End if
								rsSubj.close
								%>	
							
							&nbsp;<%=rsClass("Class_room")%> </span></a></td>
							</tr>
						<%
						End if
						rsClass.close
						%>
		
				<%
				rsm.movenext
				wend
				end if
				rsm.close
				%>	
						
		
		<tr>
			<td class="tdMenu"><a href="Teacher_portal_signout.asp">Œ—ÊÃ</a></td>
		</tr>
		
		
		</table>
</div>