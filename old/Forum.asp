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
					rs.open "Select * from Rooms where Active = 1",conn
					if not rs.eof then
					%>
									<table border="1" width="98%" id="table1" style="border-collapse: collapse" bordercolor="#DDDDDD">
									<%While not rs.eof%>
										<tr>
											<td width="9"><b>
											<font size="4" face="Times New Roman">ª </font> 
											</b></td>
											<td>&nbsp;<a href="Forum_Subjects.asp?ID=<%=rs("Room_ID")%>"><%=rs("Room_Name")%></a></td>
										</tr>
									<%
									rs.movenext
									wend
									%>
									</table>
					<%
					End if
					%>
									<p>
									<b><br>
									&nbsp;
									≈‰ „« Ìﬂ » ›Ì «·„‰ œÏ Ì⁄»— ⁄‰ —√Ì ’«Õ»Â ›ﬁÿ Ê·« Ì⁄»— »«·÷—Ê—… ⁄‰ —√Ì ≈œ«—… «·„œ—”… 
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