<html dir="rtl">

<head>
<meta content="text/html; charset=windows-1256" http-equiv="Content-Type">
<meta content="ar-kw" http-equiv="Content-Language">
</head>

<table border="0" width="100%" id="table4" cellspacing="0" cellpadding="0">
						<tr>
							<td colspan="3" valign="top">
			<table border="0" width="100%" id="table12" cellspacing="0" cellpadding="0">
				<tr>
					<td width="289">
							<img border="0" src="images/el-ameed_09_1.gif" width="44" height="34" align="left"></td>
					<td background="images/el-ameed_07_1.gif">
					<p align="left">
					<b>&nbsp;<font size="2" face="Tahoma"> </font>
					</b><font face="Tahoma" size="2"><a href="Default.asp">
					الرئيسية</a><b> |&nbsp; </b>
					<!--<a href="results.asp">
					النتائج</a></a><b> | </b>-->
					<a href="aboutSchool.asp">عن المدرسة</a><b> |</b><a href="ContactUS.asp"> 
					اتصل بنـا</a><b> |</b>
					<!--<a href="Forum.asp">
					منتدانا</a>-->
					<a href="cp/default.asp">ادارة المدرسة</a>
					</font>
					<b><font size="2" face="Tahoma">&nbsp;</font>&nbsp;&nbsp; </b></td>
				</tr>
			</table>
			<img border="0" src="images/homod_12.gif" width="273" height="146"><img border="0" src="images/homod_11.gif" width="270" height="147"><img border="0" src="images/homod_10.gif" width="174" height="147"></td>
						</tr>
						<tr>
							<td colspan="3" valign="top">
							<table border="0" width="100%" id="table5" cellspacing="0" cellpadding="0">
								<tr>
									<td width="143">
			<img src="images/el-ameed_23.gif" width="143" height="35" alt=""></td>
									<td background="images/el-ameed_21.gif">
								<%
							'	Rs.open "Select * from News where Active = True", conn
							'	If not Rs.eof then
							'		news = ""
							'		While not rs.eof
							'			if rs("Details") <> "" then
							'					news = news & "<img src='images/el-ameed_25.gif' width='15' height='13' alt=''>&nbsp;&nbsp;<a href='E-Magazine_Details.asp?NewsID="& rs("News_ID")& "'>" & rs("Subject") & "</a> &nbsp;"
							'			Else
							'					news = news & "<img src='images/el-ameed_25.gif' width='15' height='13' alt=''>&nbsp;&nbsp;" & rs("Subject") & "&nbsp;"
							'			End if		
							'		rs.movenext
							'		wend
							'	Else
							'		news = ""
							'	end if
							'	rs.close
								'set rs=nothing
								%>
								
									<marquee scrollamount="2" direction="right" width="565"><%=news%> </marquee>
									
			</td>
			
								</tr>
							</table>
							</td>
						</tr>
						<tr>
							<td colspan="3" valign="top">&nbsp;</td>
						</tr>
				</table>