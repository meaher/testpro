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
				<table border="0" width="98%" id="table9">
					<tr>
						<td width="23">
			<img src="images/el-ameed_42.gif" width="22" height="22" alt=""></td>
						<td><font face="Sultan normal" size="5"><img border="0" src="Images/Emagazeen.jpg" width="160" height="28"></font></td>
					</tr>
				</table>
			</div>
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
			<%
Set rs = server.createobject("ADODB.RecordSet")
ID = Request.QueryString("NewsID")
rs.open "Select * from News where News_ID = "&ID&" ",conn
if rs.eof then
	response.write "<p align='center'>·« ÌÊÃœ »Ì«‰«  „÷«›…</p>"
End if
%>
		
		<table border="0" width="98%" id="table2" cellpadding="3">
			<tr>
				<td>
				<p align="center"><b> <%=rs("Subject")%></b></td>
			</tr>
			<tr>
				<td height="10"></td>
			</tr>

			<%if rs("Img")<>"" then%>
			<tr>
				<td>
				<img src="pecture/<%=rs("Img")%>">
				</td>
			</tr>
			<%End if%>
			<tr>
				<td>
				<p align="justify"><%=rs("Details")%></p>
				<p align="left"><%=rs("regdate")%>
				<br><br>
				<a href="E-Magazine.asp?start=1">⁄Êœ… ··„Ã·… «·≈·ﬂ —Ê‰Ì…
				--></a>
				</p>
				</td>
			</tr>
			
<%
rs.close
%>
			
		</table>
&nbsp;</td>
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
