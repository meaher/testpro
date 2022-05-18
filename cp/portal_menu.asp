<div align="center">
	<table class="tblMenu" cellpadding="3">
		<theader>
			<td class="tdMenuHead">
			
			
			·ÊÕ… «· Õﬂ„</td>
		</theader>
		<tr>
			<td class="tdMenu"><a href="portal_main.asp?start=1">«·’›Õ… «·—∆Ì”Ì…</a></td>
		</tr>
		<%if session("ADMIN_LEVEL")=1 then%>
		<tr>
			<td class="tdMenu">
			
			<a href="admin_list.asp?start=1">≈œ«—… Õ”«»«  —ƒ”«¡ Ê√⁄÷«¡ «·›—ﬁ </a>
			
			</td>
		</tr>
		<tr>
			<td class="tdMenu">
			
			<a href="Depart_list.asp?start=1"><span lang="ar-kw">√ﬁ”«„ 
			«·„œ—”…</span></a>
			
			</td>
		</tr>
		<tr>
			<td class="tdMenu">
			
			<a href="EmployeeAdmin_list.asp?start=1">»Ì«‰«  «·„ÊŸ›Ì‰</a>
			
			</td>
		</tr>
		<tr>
			<td class="tdMenu">
			
			<a href="MeetingAdmin_list.asp?start=1&id=0"><span lang="ar-kw">«Ã „«⁄«  
			√ﬁ”«„ «·„œ—”…</span></a>
			
			</td>
		</tr>
		<tr>
			<td class="tdMenu">
			
			<a href="Managment_Meeting_admin_list.asp?start=1&id=0"><span lang="ar-kw">«Ã „«⁄«  
			„Ã·” 
			«·≈œ«—…</span></a>
			
			</td>
		</tr>
		<tr>
					<td class="tdMenu"><a href="Switch_Lectures_admin_list.asp?start=1">
					<span lang="ar-kw"> »œÌ· </span>Õ’’ «·„⁄·„Ì‰</a></td>
				</tr>
		<tr>
					<td class="tdMenu"><a href="Additional_Lectures_admin_list.asp?start=1">
					<span lang="ar-kw">ÿ·» Õ’… ≈÷«›Ì…</span></a></td>
				</tr>
		<tr>
			<td class="tdMenu">
			
			<a href="School_letters_admin_list.asp?start=1&id=0">
			<span lang="ar-kw">«·„—«”·«  «·œ«Œ·Ì…</span></a>
			
			</td>
		</tr>
		<tr>
					<td class="tdMenu">
					<!--<a href="supervisor_visits_admin_list.asp">“Ì«—«  —∆Ì” «·ﬁ”„ 
					··„⁄·„Ì‰</a>--></td>
				</tr>
		<tr>
			<td class="tdMenu">
			
			<a href="Curriculum_done_Admin_list.asp?start=1&id=0"><span lang="ar-kw">
			„« ﬁÿ⁄ „‰ «·„‰ÂÃ</span></a>
			
			</td>
		</tr>
		<%Else%>
		<tr>
			<td class="tdMenu">
			
			<a href="users_update.asp?start=1">»Ì«‰«  „”ƒÊ· «·ﬁ”„</a>
			
			</td>
		</tr>
		<%End if%>

		
		<tr>
			<td class="tdMenu"><a href="portal_signout.asp">Œ—ÊÃ</a></td>
		</tr>
		<%if session("ADMIN_LEVEL")=1 then %>
		<tr>
			<td class="tdMenuHead">”Ã· œÊ«„ √ﬁ”«„ «·„œ—”…</td>
		</tr>
		<%End if%>
		<%if session("ADMIN_LEVEL")=1 then%>
				<%
				''''''''''''''''''''''''
				Set rsm = Server.CreateObject("ADODB.Recordset")
				rsm.open "select * from Departments",conn,1,2
				if not rsm.eof then
				while not rsm.eof
				%>
		
		<tr>
			<td class="tdMenu"><a href="Department.asp?id=<%=rsm("Department_ID")%>&start=1&DeptName=<%=rsm("Department_name")%>&Day=1">
			<span lang="ar-kw"><%=rsm("Department_name")%> </span></a></td>
		</tr>
		
				<%
				rsm.movenext
				wend
				end if
				rsm.close
				%>
		<%End if%>
		
		<%if  session("ADMIN_LEVEL") = 2 or session("ADMIN_LEVEL") = 3 or session("ADMIN_LEVEL") = 5 then%>
				<%
				''''''''''''''''''''''''
				Set rsm = Server.CreateObject("ADODB.Recordset")
				rsm.open "select * from Departments where Department_id="& session("Department_ID")&"",conn,1,2
				%>
		<tr>
			<td class="tdMenuHead">&nbsp;</td>
		</tr>

				<tr>
					<td class="tdMenu"><a href="Department.asp?id=<%=rsm("Department_ID")%>&start=1&DeptName=<%=rsm("Department_name")%>">
					<span lang="ar-kw"><%=rsm("Department_name")%> ”Ã· «·œÊ«„</span></a></td>
				</tr>
				<tr>
					<td class="tdMenu"><a href="Department_Addwork.asp?id=<%=rsm("Department_ID")%>&start=1&DeptName=<%=rsm("Department_name")%>">
					<span lang="ar-kw">≈÷«›… «·œÊ«„ «·ÌÊ„Ì</span></a></td>
				</tr>
				<tr>
					<td class="tdMenu"><a href="Managment_meeting_list.asp?id=<%=rsm("Department_ID")%>&start=1&DeptName=<%=rsm("Department_name")%>">
					<span lang="ar-kw">«Ã „«⁄«  «·≈œ«—…</span></a></td>
				</tr>
				<tr>
					<td class="tdMenu">
					<a href="School_letters_list.asp?id=<%=rsm("Department_ID")%>&start=1&DeptName=<%=rsm("Department_name")%>">
					<span lang="ar-kw">„—«”·«  «·≈œ«—…</span></a></td>
				</tr>
				<tr>
					<td class="tdMenu"><a href="meeting_list.asp?id=<%=rsm("Department_ID")%>&start=1&DeptName=<%=rsm("Department_name")%>">
					<span lang="ar-kw">«Ã „«⁄«  «·√ﬁ”«„</span></a></td>
				</tr>
				<tr>
					<td class="tdMenu">
					<a href="supervisor_visits_list.asp?id=<%=rsm("Department_ID")%>&start=1&DeptName=<%=rsm("Department_name")%>">
					<span lang="ar-kw">“Ì«—«  —∆Ì” «·ﬁ”„</span></a></td>
				</tr>
				<tr>
					<td class="tdMenu"><a href="Curriculum_done_list.asp?id=<%=rsm("Department_ID")%>&start=1&DeptName=<%=rsm("Department_name")%>">
					<span lang="ar-kw">„« ﬁÿ⁄ „‰ «·„‰ÂÃ</span></a></td>
				</tr>				<tr>
					<td class="tdMenu"><a href="Employee_list.asp?id=<%=rsm("Department_ID")%>&start=1&DeptName=<%=rsm("Department_name")%>">
					<span lang="ar-kw">»Ì«‰«  «·„ÊŸ›Ì‰</span></a></td>
				</tr>
				<tr>
					<td class="tdMenu"><a href="Students_absence_list.asp?id=<%=rsm("Department_ID")%>&start=1&DeptName=<%=rsm("Department_name")%>">
					<span lang="ar-kw">„ «»⁄… €Ì«» «·ÿ·»… «·ÌÊ„Ì</span></a></td>
				</tr>
				<tr>
					<td class="tdMenu"><a href="Student_behavior_Department_list.asp?id=<%=rsm("Department_ID")%>&start=1&DeptName=<%=rsm("Department_name")%>">
					<span lang="ar-kw">„ «»⁄… «·’ÕÌ›… «·”·ÊﬂÌ… ··ÿ·»…</span></a></td>
				</tr>
				<tr>
					<td class="tdMenu"><a href="Student_Follow_P_Department_list.asp?id=<%=rsm("Department_ID")%>&start=1&DeptName=<%=rsm("Department_name")%>">
					<span lang="ar-kw">„ «»⁄… «·ÿ·»… «·„ „Ì“Ì‰</span></a></td>
				</tr>
				<tr>
					<td class="tdMenu"><a href="Student_Follow_W_Department_list.asp?id=<%=rsm("Department_ID")%>&start=1&DeptName=<%=rsm("Department_name")%>">
					<span lang="ar-kw">„ «»⁄… «·ÿ·»… «·÷⁄«›</span></a></td>
				</tr>
				<tr>
					<td class="tdMenu"><a href="Additional_Lectures_list.asp?id=<%=rsm("Department_ID")%>&start=1&DeptName=<%=rsm("Department_name")%>">
					<span lang="ar-kw">ÿ·» Õ’… ≈÷«›Ì…</span></a></td>
				</tr>
				<tr>
					<td class="tdMenu"><a href="Switch_Lectures_list.asp?id=<%=rsm("Department_ID")%>&start=1&DeptName=<%=rsm("Department_name")%>">
					<span lang="ar-kw"> »œÌ· «·Õ’’</span></a></td>
				</tr>

			<%if session("ADMIN_LEVEL")=3 then%>
				<tr>
			<td class="tdMenuHead"><span lang="ar-kw">≈œ«—… «·„Êﬁ⁄</span> </td>
		</tr>
		<tr>
					<td class="tdMenu"><a href="Students_list.asp">
					<span lang="ar-kw">»Ì«‰«  «·ÿ·»…</span></a></td>
				</tr>
			<tr>
					<td class="tdMenu"><a href="bifurcation_list.asp">
					<span lang="ar-kw">«· ‘⁄Ì»</span></a></td>
				</tr>
			<tr>
					<td class="tdMenu"><a href="passport_list.asp">
					<span lang="ar-kw">’Ê— ÃÊ«“«  «·”›— ··’›12</span></a></td>
				</tr>
			<tr>
					<td class="tdMenu"><a href="Class_Room_list.asp">
					<span lang="ar-kw">«·›’Ê·</span></a></td>
				</tr>
				<tr>
					<td class="tdMenu"><a href="Lectures_Time_list.asp">
					<span lang="ar-kw">÷»ÿ «· ÊﬁÌ </span></a></td>
				</tr>
				<tr>
					<td class="tdMenu"><a href="Employees_Password_list.asp">
					<span lang="ar-kw">ﬂ·„… «·„—Ê— ··„⁄·„</span></a></td>
				</tr>

				<tr>
					<td  class="tdMenuHead">
					
					ÃœÊ· «·Õ’’</td>
				</tr>	
				<tr>
					<td class="tdMenu">
					
					<a href="Lectures.asp?start=1">ÃœÊ· «·„œ—”…</a></td>
				</tr>
				<%
				''''''''''''''''''''''''
					Set rsm = Server.CreateObject("ADODB.Recordset")
					rsm.open "select * from Departments",conn,1,2
					if not rsm.eof then
						while not rsm.eof
					%>
					<tr>
						<td class="tdMenu"><a href="Lectures_list.asp?id=<%=rsm("Department_ID")%>&start=1&DeptName=<%=rsm("Department_name")%>&Day=1">
					<span lang="ar-kw">ÃœÊ· <%=rsm("Department_name")%> </span></a></td>
					</tr>
		
				<%
				rsm.movenext
				wend
				end if
				rsm.close
				%>	
				
				</td>
				</tr>
				<%end if%>
		<%End if%>
		<%if session("ADMIN_LEVEL")=4 or session("ADMIN_LEVEL")=1 or session("ADMIN_LEVEL")=3 or session("ADMIN_LEVEL")=6 then%>
			<tr>
				<td class="tdMenuHead">€Ì«» «·ÿ·»… </td>
			</tr>
			<tr>
				<td class="tdMenu">
				<a href="statistics_list.asp">	«·≈Õ’«∆Ì« </a>
				</td>
			</tr>	
			<tr>
				<td class="tdMenu">
				<a href="Absence_alert_list.asp">	«·≈‰–«—« </a>
				</td>
			</tr>
			<tr>
				<td class="tdMenu">
				<a href="Excused_absence_list.asp">	€Ì«» »⁄–— „ﬁ»Ê·</a>
				</td>
			</tr>
			<tr>
				<td class="tdMenu"><a href="Students_absence_Admin.asp">
				<span lang="ar-kw">„ «»⁄… «·€Ì«» «·ÌÊ„Ì</span></a></td>
			</tr>
			<%if session("ADMIN_LEVEL")=4 or session("ADMIN_LEVEL")=1 or session("ADMIN_LEVEL")=3 then%>
			<tr>
				<td class="tdMenu">
				<span lang="ar-kw"><a href="Students_non_absence_Admin.asp">ÿ·«» 
				»œÊ‰ €Ì«»</a></span></td>
			</tr>
			<%End if%>
			
				<%
				''''''''''''''''''''''''
					Set rsm = Server.CreateObject("ADODB.Recordset")
					rsm.open "select * from Class_room order by Class_room_id asc",conn,1,2
					if not rsm.eof then
						while not rsm.eof
					%>
					<tr>
						<td class="tdMenu"><a href="Students_absence_Admin_list.asp?Class_room_id=<%=rsm("Class_room_ID")%>&Class_Room=<%=rsm("Class_room")%>&start=1">
						<span lang="ar-kw"><%=rsm("Class_room")%></span></a></td>
					</tr>
					<%
						rsm.movenext
						wend
					end if
					rsm.close
					%>
							<%if session("ADMIN_LEVEL")=4 or session("ADMIN_LEVEL")=1 or session("ADMIN_LEVEL")=3 or session("ADMIN_LEVEL")=6 then%>
			<tr>
				<td class="tdMenuHead"><span lang="ar-kw">«· √Œ— ⁄‰ «·Õ’’</span> </td>
			</tr>
			<!--<tr>
				<td class="tdMenu">
				<a href="statistics_list.asp">	«·≈Õ’«∆Ì« </a>
				</td>
			</tr>
			-->	
			<tr>
				<td class="tdMenu"><a href="Students_Delay_Admin.asp">
				<span lang="ar-kw">„ «»⁄… «· √Œ— ⁄‰ «·Õ’’</span></a></td>
			</tr>
			<%if session("ADMIN_LEVEL")=4 or session("ADMIN_LEVEL")=1 or session("ADMIN_LEVEL")=3 then%>
			<%End if%>
			
				<%
				''''''''''''''''''''''''
					Set rsm = Server.CreateObject("ADODB.Recordset")
					rsm.open "select * from Class_room order by Class_room_id asc",conn,1,2
					if not rsm.eof then
						while not rsm.eof
					%>
					<tr>
						<td class="tdMenu"><a href="Students_Delay_Admin_list.asp?Class_room_id=<%=rsm("Class_room_ID")%>&Class_Room=<%=rsm("Class_room")%>&start=1">
						<span lang="ar-kw"><%=rsm("Class_room")%></span></a></td>
					</tr>
					<%
						rsm.movenext
						wend
					end if
					rsm.close
					end if
					%>	
						<tr>
				<td class="tdMenuHead">«·Œœ„«  «·ÿ·«»Ì… </td>
			</tr>
			<tr>
				<td class="tdMenu">
				<a href="Visit_appointments_list.asp"><span lang="ar-kw">„Ê«⁄Ìœ “Ì«—… «·„œ—”…</span></a>
				</td>
			</tr>
			<tr>
				<td class="tdMenu">
				<a href="vaccination_list.asp">	‘Â«œ… «· ÿ⁄Ì„</a>
				</td>
			</tr>
						<tr>
				<td class="tdMenuHead"><span lang="ar-kw">„ «»⁄… «·ÿ·»… 
				«·„ „Ì“Ì‰ Ê«·÷⁄«›</span></td>
			</tr>
				<%
				''''''''''''''''''''''''
				Set rsm = Server.CreateObject("ADODB.Recordset")
				rsm.open "select * from Departments where Department_Type='B'",conn,1,2
				if not rsm.eof then
				while not rsm.eof
				%>
		
		<tr>
			<td class="tdMenu"><a href="Student_Follow_Admin_List.asp?id=<%=rsm("Department_ID")%>&start=1&DeptName=<%=rsm("Department_name")%>">
			<span lang="ar-kw"><%=rsm("Department_name")%> </span></a></td>
		</tr>
		
				<%
				rsm.movenext
				wend
				end if
				rsm.close
				%>
					<%End if%>	
		<%if session("ADMIN_LEVEL")=4 or session("ADMIN_LEVEL")=1 or session("ADMIN_LEVEL")=3 or session("ADMIN_LEVEL")=6 then%>
			<tr>
				<td class="tdMenuHead">«·’ÕÌ›… «·”·ÊﬂÌ…</td>
			</tr>
			<tr>
				<td class="tdMenu"><a href="Student_behavior_Admin_New.asp?start=1">
				<span lang="ar-kw">«· ﬁ«—Ì— «·ÃœÌœ…</span></a></td>
			</tr>
			<tr>
				<td class="tdMenu"><a href="Student_behavior_Admin_all.asp?start=1">
				<span lang="ar-kw">ﬂ«›… «· ﬁ«—Ì— </span></a></td>
			</tr>

			
				<%
				''''''''''''''''''''''''
					Set rsm = Server.CreateObject("ADODB.Recordset")
					rsm.open "select * from Class_room order by Class_room_id asc",conn,1,2
					if not rsm.eof then
						while not rsm.eof
					%>
					<tr>
						<td class="tdMenu"><a href="Student_behavior_Admin_list.asp?Class_room_id=<%=rsm("Class_room_ID")%>&Class_Room=<%=rsm("Class_room")%>&start=1">
						<span lang="ar-kw"><%=rsm("Class_room")%></span></a></td>
					</tr>
					<%
						rsm.movenext
						wend
					end if
					rsm.close
					%>		
				<%End if%>
				<%if session("ADMIN_LEVEL")=5 or session("ADMIN_LEVEL")=3 then%>
			<tr>
				<td class="tdMenuHead">‘ƒÊ‰ «·ÿ·»… </td>
			</tr>
				<%
				''''''''''''''''''''''''
					Set rsm = Server.CreateObject("ADODB.Recordset")
					rsm.open "select * from Class_room order by Class_room_id asc",conn,1,2
					if not rsm.eof then
						while not rsm.eof
					%>
					<tr>
						<td class="tdMenu"><a href="Std_affairs_Admin_list.asp?Class_room_id=<%=rsm("Class_room_ID")%>&Class_Room=<%=rsm("Class_room")%>&start=1">
						<span lang="ar-kw"><%=rsm("Class_room")%></span></a></td>
					</tr>
					<%
						rsm.movenext
						wend
					end if
					rsm.close
					%>	
			
		<%End if%>				
		</table>
</div>