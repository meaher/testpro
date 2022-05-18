
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

					</td>
					<td valign="top">

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
						<td><font face="Sultan normal" size="5"><span lang="ar-sa"><img border="0" src="Images/Esehamk.jpg" width="72" height="32"></span></font></td>
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
		
			<div align="center">
				<table border="0" width="98%" id="table9">
					<tr>
						<td valign="top">
						&nbsp;</td>
						<td valign="top">
						&nbsp;</td>
					</tr>
					<tr>
						<td colspan="2">
						<p align="center">
						
&nbsp;
					
<%
m_Subject=Request.Form("tSubject")	
m_Country=Request.Form("tCountry")	
m_Name=Request.Form("tName")	
m_Email=Request.Form("tEmail")
m_body=Request.Form("sBody")

				DIM strEmail, strName, strComments, mail, reply, objMail
			
				Set objMail = Server.CreateObject("CDONTS.NewMail")
				objMail.From = "info@albathal.com"
				objMail.Subject = "—”«·… „‰ ’›Õ… «”Â«„ﬂ"
				strMsgHeader = " Â–Â «·—”«·Â „‰ „Êﬁ⁄ «·„œ—”…" & vbCrLf & "<br>"
				objMail.To = "meaher@hotmail.com"
				objMail.BodyFormat = 0
				objMail.MailFormat = 0
				objMail.Body = "<html><head></head><body><p><b><font size='3' color='green'><center>"&strMsgHeader&"</center></font>"&_ 
								"<p dir='rtl'><b><span lang='ar-kw'>«”„ «·„—”· : " & m_Name & "<br>"&_
								"<p dir='rtl'><b><span lang='ar-kw'>«·»—Ìœ «·≈·ﬂ —Ê‰Ì : " & m_Email &"<br>"&_
								"<p dir='rtl'><b><span lang='ar-kw'>«·»·œ : " & m_Country &"<br>"&_
								"<p dir='rtl'><span lang='ar-kw'>«·„Ê÷Ê⁄  :" & m_Subject &"</span><br>"&_
								"<p dir='rtl'><span lang='ar-kw'>‰’ «·—”«·… : " & m_body &" </span></p>"&_
								"</body></html>"
				objMail.Send
				Set objMail = nothing

						IF Err <> 0 THEN
							Response.Write "<font color=red> ÌÊÃœ Œÿ√ ›Ì ⁄„·Ì… «—”«· «·—”«·…° Õ«Ê· „—… √Œ—Ï √Ê ﬁ„ »«·« ’«· «·„»«‘— „⁄‰«. </font>" & Err.Description
							%>
							<p align=center >
							<a href="javascript:history.go(-1)">
							<font color="#003366">⁄Êœ… ≈·Ï «·’›Õ… «·”«»ﬁ…</font></a>
							</p>						
						<%
						else
							response.redirect "Contact_Result.asp"
							Response.Write "<font color=green> ·ﬁœ  „ «—”«· «·—”«·… »‰Ã«Õ° Ê ”‰ﬁÊ„ »«·—œ ﬁ—Ì»«. ‘ﬂ—« ·ﬂ°</font>"
						END IF


				%>						</td>
					</tr>
					<tr>
						<td colspan="2">
						&nbsp;</td>
					</tr>
					<tr>
						<td colspan="2">
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