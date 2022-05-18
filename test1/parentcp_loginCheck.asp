<!-- #include file="portal_Header.asp"-->

<head>
<style>
<!--
.auto-style1 {
	text-align: center;
}
-->
</style>
</head>

<body style="text-align: center">
<table class=" w3-left w3-hide-large w3-hover-cyan w3-large w3-theme" border="0" width="100%" id="table1"  style="border-style: solid; background-color: #FFFFFF !important">
				<tr>
					<td>
						
					<table style="width: 98%" cellspacing="0" cellpadding="0">
						
							<tr>
								<td  valign="top" background="images/defaul8.gif">
										<!--#include file="Banner_mobile.asp"-->
								</td>
							</tr>
							<tr>
								<td style="height: 84px" valign="top" background="images/defaul8.gif">
									
					<div align="center">
					<table border="0" width="75%" cellspacing="0" cellpadding="0" dir="rtl">
			<tr>
				<td align="left">
				<font size="5" face="Akhbar MT" color="#0E0584">#<b>⁄Êœ…_»«· “«„</b></font></td>
				<td width="825">
				<img border="0" src="images/homud_Back.jpg" width="207" height="175"><p>&nbsp;</td>
			</tr>
		</table>
										</div>
				</td>
							</tr>
							<tr>
								<td style="height: 84px" valign="top" align="center" background="images/defaul8.gif">
<table border="0" cellpadding="0" cellspacing="0" width="95%" style="border: 1px solid #999999; padding-left: 4px; padding-right: 4px; padding-top: 1px; padding-bottom: 1px" bgcolor="#FFFFFF">
						<tr>
							<td height="35">
							<p align="left"><span lang="en-us">Parent Login</span></td>
						</tr>
						<tr>
							<td height="200" align="center">


								<%
								user=Trim(request.form("tUser"))
								'pass=Trim(request.form("tPass"))
								
								user= replace (user, "'", "_")
								user= replace (user, "/", "_")
								user= replace (user, "\", "_")
								user= replace (user, "%", "_")
								user= replace (user, "$", "_")
								user= replace (user, "&", "_")
								user= replace (user, "(", "_")
								user= replace (user, ")", "_")
								user= replace (user, "[", "_")
								user= replace (user, "]", "_")
								user= replace (user, "-", "_")
								user= replace (user, ".", "_")
								user= replace (user, ">", "_")
								user= replace (user, "<", "_")
								user= replace (user, " ", "_")
								
								pass= replace (pass, "'", "_")
								pass= replace (pass, "/", "_")
								pass= replace (pass, "\", "_")
								pass= replace (pass, "%", "_")
								pass= replace (pass, "$", "_")
								pass= replace (pass, "&", "_")
								pass= replace (pass, "(", "_")
								pass= replace (pass, ")", "_")
								pass= replace (pass, "[", "_")
								pass= replace (pass, "]", "_")
								pass= replace (pass, "-", "_")
								pass= replace (pass, ".", "_")
								pass= replace (pass, ">", "_")
								pass= replace (pass, "<", "_")
								pass= replace (pass, " ", "_")								
								
								Sql="select * from students where std_Civil_ID='"&user&"'"
								Set rs = Server.CreateObject("ADODB.Recordset")
								rs.Open Sql, conn, 1, 2
								
								if rs.eof then
								%>
									<font color="#FF0000">Õ’· Œÿ√ ›Ì «·—ﬁ„ «·„œ‰Ì .</font></p>
								<%
								else
									
											Session.Timeout=90
											session("std_civil_ID")=rs("std_civil_ID")
											session("Std_Name")= rs("Std_Name")
											'session("Department_ID")= rs("Department_ID")
											rs.close
											set rs=nothing											
											conn.close
											set conn=nothing	
											
											response.redirect "parentcp_main.asp"										
									
								end if
								
								rs.close
								set rs=nothing
								
								%>
				
								<p><a href="javascript:history.go(-1)">⁄Êœ… ··Œ·›</a>

							</td>
						</tr>
						<tr>
							<td>
							&nbsp;</td>
						</tr>
					</table>										</td>
							</tr>
							<tr>
								<td style="height: 84px" valign="bottom" align="center">
						<!--#include file="Footer_mobile.asp"-->

								</td>
							</tr>
						</table>
					</td>
					
				</tr>
			</table>


<table class="w3-hide-medium w3-hide-small" border="0" width="100%"  cellspacing="0" cellpadding="0" style="border-style: solid; background-color: #F9FCFF !important">
	<tr>
	<td>
										<!--#include file="Banner.asp"-->
	</td>
	</tr>
	


	<tr>
		<td align="center">
		<table border="0" width="100%" cellspacing="0" cellpadding="0" dir="rtl">
			<tr>
				<td align="left">
				<font size="6" face="Akhbar MT" color="#0E0584">#<b>⁄Êœ…_»«· “«„</b></font></td>
				<td width="825">
				<img border="0" src="images/homud_Back.jpg" width="207" height="175"><p>&nbsp;</td>
			</tr>
		</table>
									<table border="0" cellpadding="0" cellspacing="0" width="688" style="border: 1px solid #999999; padding-left: 4px; padding-right: 4px; padding-top: 1px; padding-bottom: 1px" bgcolor="#FFFFFF">
						<tr>
							<td height="35">
							<p align="left"><span lang="en-us">Parent Login</span></td>
						</tr>
						<tr>
							<td height="200" align="center">


								<%
								user=Trim(request.form("tUser"))
								'pass=Trim(request.form("tPass"))
								
								user= replace (user, "'", "_")
								user= replace (user, "/", "_")
								user= replace (user, "\", "_")
								user= replace (user, "%", "_")
								user= replace (user, "$", "_")
								user= replace (user, "&", "_")
								user= replace (user, "(", "_")
								user= replace (user, ")", "_")
								user= replace (user, "[", "_")
								user= replace (user, "]", "_")
								user= replace (user, "-", "_")
								user= replace (user, ".", "_")
								user= replace (user, ">", "_")
								user= replace (user, "<", "_")
								user= replace (user, " ", "_")
								
								pass= replace (pass, "'", "_")
								pass= replace (pass, "/", "_")
								pass= replace (pass, "\", "_")
								pass= replace (pass, "%", "_")
								pass= replace (pass, "$", "_")
								pass= replace (pass, "&", "_")
								pass= replace (pass, "(", "_")
								pass= replace (pass, ")", "_")
								pass= replace (pass, "[", "_")
								pass= replace (pass, "]", "_")
								pass= replace (pass, "-", "_")
								pass= replace (pass, ".", "_")
								pass= replace (pass, ">", "_")
								pass= replace (pass, "<", "_")
								pass= replace (pass, " ", "_")								
								
								Sql="select * from students where std_Civil_ID='"&user&"'"
								Set rs = Server.CreateObject("ADODB.Recordset")
								rs.Open Sql, conn, 1, 2
								
								if rs.eof then
								%>
									<font color="#FF0000">Õ’· Œÿ√ ›Ì «·—ﬁ„ «·„œ‰Ì .</font></p>
								<%
								else
									
											Session.Timeout=90
											session("std_civil_ID")=rs("std_civil_ID")
											session("Std_Name")= rs("Std_Name")
											'session("Department_ID")= rs("Department_ID")
											rs.close
											set rs=nothing											
											conn.close
											set conn=nothing	
											
											response.redirect "parentcp_main.asp"										
									
								end if
								
								rs.close
								set rs=nothing
								
								%>
				
								<p><a href="javascript:history.go(-1)">⁄Êœ… ··Œ·›</a>

							</td>
						</tr>
						<tr>
							<td>
							&nbsp;</td>
						</tr>
					</table>
					<p>
											<br>
											<br>
&nbsp;
									&nbsp;<p>&nbsp;</td>
	</tr>
	<tr>
		<td>
			<!--#include file="Footer.asp"-->
		</td>
	</tr>
</table>

</body>

</html>