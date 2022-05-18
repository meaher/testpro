<!--#include file = "header.asp"-->
<html dir="rtl">

<head>
<meta http-equiv="Content-Language" content="ar-sa">
</head>

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
				<table border="0" width="100%" id="table4" cellspacing="0" cellpadding="0">
						<tr>
							<td colspan="3" valign="top">
							<div align="right">
			<font face="Sultan normal" size="5">
			<div align="center">
				<table border="0" width="98%" id="table10">
					<tr>
						<td width="23">
			<img src="images/el-ameed_42.gif" width="22" height="22" alt=""></td>
						<td>
									<img border="0" src="Images/forum.jpg" width="53" height="16"></td>
					</tr>
				</table>
			</div>
			</font><font face="Sultan normal" size="5">
			<p></p>
			</font></div>
							<table border="0" width="98%" id="table7" cellspacing="0" cellpadding="0">
								<tr>
									<td colspan="2" align="center">
									<table border="0" width="97%" id="table8" cellspacing="0" cellpadding="0">
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
		
				<div align="center">
		
				<table border="0" width="100%" id="table11">
					<tr>
						<td>
			<table border="0" width="98%" cellspacing="0" cellpadding="0">
								<tr>
									<td>&nbsp;</td>
								</tr>
								<tr>
									<td align="center">
									<p>
									<b>„‰ œÏ À«‰ÊÌ ‰«</b></p>
									
									<%
									intID = Trim(request.queryString("SID"))
									if not(isnumeric(intID)) then
										response.redirect "Error.asp"
									End if
									Set rss = Server.createObject("ADODB.RecordSet")
									
									'''''''''''''''''''''''''''request the data from subject table''''''''''''''''''''''''''''''''''''''''
									rss.Open "Select * from Subjects where Sub_ID = "& intID &" and Active = 1",conn,1,2
									if rss.eof then
										response.redirect "Error.asp?Error=ÕœÀ Œÿ√ ›Ì —ﬁ„ «·„Ê÷Ê⁄"
									End if
									cID = Rss("Visit_Count") + 1
									Rss("Visit_Count") = cID
									rss.update
									RoomID = Rss("Room_ID")									
									Sub_Header = Rss("Sub_Header")
									rss.close
									'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
									''''''''''''''''''''''''''''''''''Request the data from tha Rmms table'''''''''''''
									rss.Open "Select * from Rooms where Room_ID = "& RoomID &" and active = 1",conn
									if rss.eof then
										response.redirect "Error.asp?ÕœÀ Œÿ√ ›Ì —ﬁ„ «·€—›…"
									End if
										RoomName = Rss("Room_Name")
									rss.close
									''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
									%>
									
									<p align=right>
									<img border="0" src="images/navbits_start.gif" width="15" height="13"> 
								<a href="forum.asp">À«‰ÊÌ ‰«</a> <font size="4"> ª</font><a href="Forum_Subjects.asp?ID=<%=RoomID%>"> <%=RoomName%> </a>
								<br>
								&nbsp;&nbsp; <font size="4">-ª</font> <%=Sub_Header%>
								</p>
									<p align=right>
									&nbsp;&nbsp;
									<a href="Forum_Sub_Add.asp?RooMID=<%=RoomID%>">„Ê÷Ê⁄ ÃœÌœ </a>
									&nbsp;&nbsp;
									<a href="Forum_Comment_Add.asp?SubID=<%=intID%>&RooMID=<%=RoomID%>">√÷› —œ</a></p>

									<table border="0" width="98%" id="table1" cellspacing="1">
																		
									<%rs.Open "Select * from Subjects where Sub_ID = "& intID &" and Active = 1",conn%>
									<%if not rs.eof then%>
										<tr>
											<td width="16%" bgcolor="#DDDDDD" >
											<p align="center">
											<font color="#000080">
											<span lang="ar-kw">«”„ «·⁄÷Ê</span></font></td>
											<td width="83%" bgcolor="#DDDDDD" colspan="2" >
											<span lang="ar-kw">
											<font color="#000080">„Ê÷Ê⁄ «·—”«·…</font><font color="#008000">:</font>
											<%=rs("Sub_Header")%>
											</span></td>
										</tr>
										<tr>
											

											<td width="16%" valign="top" align="center" >
											<font color="#800000">&nbsp;
											<%=rs("NickName")%>
											<br>
											<%=rs("Add_Date")%>
											</font>
											</td>
											<td valign="top" >
											<p align="justify">
											<%=rs("Sub_Details")%>
											</td>
											
											<%if rs("Sub_Img") <> "" then%>
												<td width="40%" valign="top" >&nbsp;
													<img src="Forum_Pictures/<%=rs("Sub_Img")%>" width="250">
												</td>
											<%End if%>
										</tr>
									<%Else%>
										<%Response.redirect "Error.asp?ÕœÀ Œÿ√ ›Ì «” œ⁄«¡ «·»Ì«‰«  „‰ ÃœÊ· «·„Ê«÷Ì⁄"%>
									<%End if%>
									<%SubID = rs("Sub_ID")%>
									<%rs.close%>
									
									<%rs.open "Select * from Comments Where Sub_ID = "& SubID &" and Active = 1",conn,1,2%>
									<%if not rs.eof then%>
									
										<%While not rs.eof%>
										<tr>
											<td width="97%" valign="top" align="center" colspan="3" >
											--------------------------------&lt;&lt;&lt;&lt;&lt;&lt;&gt;&gt;&gt;&gt;&gt;&gt;--------------------------------</tr>
										<tr>
											<td width="16%" valign="top" align="center" >
											
											<font color="#800000">
											
											<%=rs("NickName")%>
											<br>
											<%=rs("Add_Date")%>
											
											
											
											</font>
											
											
											
											<td width="81%" colspan="2" valign="top" >
											<p align="justify"><%=rs("Com_Details")%></td>
										</tr>
										<%
										rs.movenext
										wend
										%>
										<tr>
											<td width="97%" bgcolor="#DDDDDD" colspan="3" >
											&nbsp;</td>
										</tr>
									
									<%End if%>
									
									</table>
									<p align=right>
									&nbsp;
									<a href="Forum_Sub_Add.asp?RooMID=<%=RoomID%>">√÷› „Ê÷Ê⁄ ÃœÌœ</a>&nbsp;&nbsp;&nbsp;
									<a href="Forum_Comment_Add.asp?SubID=<%=SubID%>&RooMID=<%=RoomID%>">√÷› —œ</a>
									<br>
									<b><br>
									<p>
									≈‰ „« Ìﬂ » ›Ì «·„‰ œÏ Ì⁄»— ⁄‰ —√Ì ’«Õ»Â ›ﬁÿ Ê·« Ì⁄»— »«·÷—Ê—… ⁄‰ —√Ì ≈œ«—… «·„Êﬁ⁄ 
									.</b></p>
									</td>
								</tr>
								<tr>
									<td>&nbsp;</td>
								</tr>
							</table></td>
					</tr>
					<tr>
						<td>
						&nbsp;</td>
					</tr>
				</table>
									</div>
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