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
									<b>„‰ œÏ <span lang="ar-sa">À«‰ÊÌ ‰« «·⁄“Ì“…</span></b></p>
									
									<%
									intID = Trim(request.queryString("ID"))
									if not(isnumeric(intID)) then
										response.redirect "Error.asp"
									End if
									Set rss = Server.createObject("ADODB.RecordSet")
									%>
									
									<%
									rs.Open "Select * from Rooms where Room_ID = "& intID &" and active = 1",conn
									if rs.eof then
										response.redirect "Error.asp"
									End if
									%>
									
									<p align=right>
									<img border="0" src="images/navbits_start.gif" width="15" height="13"> 
									<a href="forum.asp">Õ„Êœ «·Ã«»—</a> <font size="4"> ª</font> <%=rs("Room_Name")%>
									<%RoomID = Rs("Room_ID")%>
									<%rs.close%>
									</p>
									<p align=right>
									<a href="Forum_Sub_Add.asp?RooMID=<%=RoomID%>">„Ê÷Ê⁄ ÃœÌœ </a>
									</p>
									
									<table border="0" width="98%" id="table1" cellspacing="1">
																		
									<%rs.Open "Select * from Subjects where Room_ID = "& intID &" and Active = 1",conn%>
									<%if not rs.eof then%>
										<tr>
											<td width="3%" bgcolor="#DDDDDD" >
											&nbsp;</td>
											<td width="47%" bgcolor="#DDDDDD" >
											<p align="center">«·„Ê«÷Ì⁄</td>
											<td width="18%" bgcolor="#DDDDDD" >
											<p align="center">¬Œ— „‘«—ﬂ…</td>
											<td width="14%" bgcolor="#DDDDDD" >
											<p align="center">—œÊœ</td>
											<td width="15%" bgcolor="#DDDDDD" >
											<p align="center">‘ÊÂœ</td>
										</tr>

										<%While not rs.eof%>
										<tr>
											<td width="3%" valign="top" >
											<img border="0" src="images/folder.gif" width="20" height="20"></td>
											
											<td width="47%" >&nbsp;<a href="Forum_Comment.asp?SID=<%=rs("Sub_ID")%>"><%=rs("Sub_Header")%></a>
											<br>&nbsp;
											<%=rs("NickName")%>
											</td>
											<td width="18%" bgcolor="#F5F5F5" align="center" >&nbsp;
											<%
											SubID = Rs("Sub_ID")
											rss.open "Select * from Comments Where Sub_ID = "& SubID &" ",conn
												if not rss.eof then
												%>
												
												<%
												AddDate = Rss("Add_Date")
												
												%>
												<%=AddDate%><br>
												<%=Rs("NickNAme")%>
												<%
												Else
													response.Write "·«  ÊÃœ "
												End if
											rss.close
											%>
											</td>
											<td width="14%" align="center" >&nbsp;<%=rs("Comment_Count")%></td>
											<td width="15%" bgcolor="#F5F5F5" align="center" >&nbsp;<%=rs("Visit_Count")%></td>
										</tr>
										<%
										rs.movenext
										wend
										%>
										<tr>
											<td width="97%" bgcolor="#DDDDDD" colspan="5" >
											&nbsp;</td>
										</tr>
									<%Else%>
											<tr>
											<td colspan="5" align="center" height="22">·« 
											ÌÊÃœ „Ê«÷Ì⁄ „÷«›… Õ«·Ì«</td>
										</tr>
									<%End if%>
									
									</table>
									<p>
									<b><br>
									&nbsp;
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