<!--#include file = "header.asp"-->
<html dir="rtl">
		
		<head>
		<meta http-equiv="Content-Language" content="en-us">
		</head>

		<script language="JavaScript" type="text/javascript" src="wysiwyg.js">
</script>
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
			<%
									intID = Trim(request.queryString("RooMID"))
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

							
							
							
							
							<table border="0" width="98%" cellspacing="0" cellpadding="0">
								<tr>
									<td>&nbsp;</td>
								</tr>
								<tr>
									<td align="center">
									<p>
									<b><br>
									„‰ œÏ <span lang="ar-sa">À«‰ÊÌ ‰«</span></b></p>
									<p align="right">
									<img border="0" src="images/navbits_start.gif" width="15" height="13"> 
									<a href="forum.asp"><span lang="ar-sa">À«‰ÊÌ ‰«</span></a> <font size="4"> ª</font> <%=rs("Room_Name")%>
									<%RoomID = Rs("Room_ID")%>
									<%rs.close%>
									</p>
									<%if session("FormErr") = "" then%>
										<%=session("FormErr")%>
										<%session("FormErr")=""%>
									<%End if%>
									
						<form method="POST" action="Forum_Sub_Add_Check.asp" enctype="multipart/form-data">
									<table border="1" width="98%" id="table1" style="border-collapse: collapse" bordercolor="#DDDDDD">
										<tr>
											<td>
									&nbsp;</td>
											<td>
									<b>
											<font size="4" face="Times New Roman">
									ª
											 </font>
											√÷› „Ê÷Ê⁄ ÃœÌœ</b></td>
										</tr>
										
										<tr>
											<td>
				<span lang="ar-sa">«·≈”„</span></td>
											<td>
				<input type="text" name="TName" size="60"></td>
										</tr>
										
										<tr>
											<td>
				<span lang="ar-sa">«··ﬁ»</span></td>
											<td>
				<input type="text" name="NickName" size="60"></td>
										</tr>
										
										<tr>
											<td>
				<span lang="ar-kw">«·⁄‰Ê«‰:</span></td>
											<td>
				<input type="text" name="TSubject" size="60"></td>
										</tr>
										
										<tr>
											<td>
				<span lang="ar-kw">«· ›«’Ì·:</span></td>
											<td>
				<textarea rows="6"  name="tDetails" cols="51"></textarea>
				<script language="javascript">
					  generate_wysiwyg('tDetails');
				</script>

											
											</td>
										</tr>
										<tr>
											<td>
											
												
												<span lang="ar-kw">’Ê—…:</span></td>
											<td>
											
												
												<input type="file"  name="tFileImg" id="tFileImg" size="45">
												<input type="hidden" name="a_add" value="A">
												<input type="hidden" name="EW_Max_File_Size" value="2000000">

												</td>
										</tr>
										<tr>
											<td>
											
												
												&nbsp;</td>
											<td>
											
												
												<p>
												<input type="submit" value="≈—”«·" name="B1">
												<input type="hidden" value="<%=RoomID%>" name="RoomID">
												</p>
											
											</td>
										</tr>
									</table>
							</form>
									<p>
									<a href="javascript:history.go(-1)">⁄Êœ… ··’›Õ… «·”«»ﬁ…</a>
									&nbsp;		
</p>
									<p>
									&nbsp;</p></td>
								</tr>
								<tr>
									<td>&nbsp;</td>
								</tr>
							</table>
							</td>

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