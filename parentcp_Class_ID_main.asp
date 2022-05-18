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
<%
		Sql="select * from Class_Room where Class_Room_ID="&session("Class_Room_id")&""
		Set rs = Server.CreateObject("ADODB.Recordset")
		rs.Open Sql, conn, 1, 2
		
		if not rs.eof then
			'Std_Number=rs("Std_Number")
			std_name=session("Std_Name")
			std_civil_id=session("std_civil_ID")
			Class_Room=rs("Class_Room")
		Else
			response.redirect "parentcp_Vacination.asp"
		End if	
		rs.close	
%>
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
							<td height="200" align="center">


									<p align="right">
			<img src="images/el-ameed_42.gif" width="22" height="22" alt=""><span lang="en-us">
			</span>«·‰Ÿ«„ «·Œ«’ »„⁄—›… «·„Ã„Ê⁄… Ê√Ì«„ «·œÊ«„ 
			<p style="text-align: right"><font color="#FF0000">&nbsp;<%=session("ErrMsg")%></font>
											<p>
											
					<table cellspacing="0" cellpadding="3" class="tblView" dir="rtl">
								<thead>
									<td class="tdViewHead" width="23%" dir="rtl">
																		«·—ﬁ„ 
									«·„œ‰Ì</td>
									<td class="tdViewHead" width="18%" dir="rtl">
									«”„ «·ÿ«·»</td>
									<td class="tdViewHead" width="18%" dir="rtl">
									<span lang="ar-kw">«·’›</span>
									<span lang="ar-kw">- «·„Ã„Ê⁄…</span></td>
									</thead>

								<tr  id="trRow0" class="<%=className%>">
								
									<td class="tdView" width="23%" dir="rtl">
									&nbsp;<%=std_Civil_id%></td>
									
									<td class="tdView" width="18%" dir="rtl">
									
									<p align="right">
									<%=std_Name%>
																		
									</td>
									
									<td class="tdView" width="18%" dir="rtl">
									
									<p align="right">
									<%=Class_Room%>
																		
									</td>
									
									
								</tr>
									</table>
										<br>	
					<table cellspacing="0" cellpadding="3" class="tblView" dir="rtl">
								<thead>
									<td class="tdViewHead" width="77%" dir="rtl" align="center">
																		<span lang="ar-kw">√Ì«„ «·œÊ«„&nbsp; ··√”»Ê⁄ 
									«·√Ê·</span></td>
									</thead>

								<tr  id="trRow1" class="<%=className%>">
								
									<td class="tdView" width="77%" dir="rtl" align="center">
									
									<p align="right">
																										
									<p align="right">
																										
									<p>
																	
									«·„Ã„Ê⁄… √ (√Õœ - À·«À«¡ - Œ„Ì”).<br>
									«·„Ã„Ê⁄… » (≈À‰Ì‰ - √—»⁄«¡).</td>
									
									
								</tr>
									</table></td>
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
									<table border="0" cellpadding="0" cellspacing="0" width="75%" style="border: 1px solid #999999; padding-left: 4px; padding-right: 4px; padding-top: 1px; padding-bottom: 1px" bgcolor="#FFFFFF">
						<tr>
							<td height="200" align="center" valign="top">


									<p align="right">
			<img src="images/el-ameed_42.gif" width="22" height="22" alt="">«·‰Ÿ«„ «·Œ«’ »„⁄—›… «·„Ã„Ê⁄… Ê√Ì«„ «·œÊ«„ 
			<p style="text-align: right"><font color="#FF0000">&nbsp;<%=session("ErrMsg")%></font>
											<p>
											
						<input type="hidden" name="txtProcType" value="add">						
						<input type="hidden" name="std_civil_id" value="<%=std_civil_id%>">	
						<input type="hidden" name="Class_Room_ID" value="<%=Class_Room_ID%>">	
											

											<table cellspacing="0" cellpadding="3" class="tblView" dir="rtl">
								<thead>
									<td class="tdViewHead" width="23%" dir="rtl">
																		«·—ﬁ„ 
									«·„œ‰Ì</td>
									<td class="tdViewHead" width="18%" dir="rtl">
									«”„ «·ÿ«·»</td>
									<td class="tdViewHead" width="18%" dir="rtl">
									<span lang="ar-kw">«·’›- «·„Ã„Ê⁄…</span></td>
									<td class="tdViewHead" width="18%" dir="rtl">
									<span lang="ar-kw">√Ì«„ «·œÊ«„&nbsp; ··√”»Ê⁄ 
									«·√Ê·</span></td>
									</thead>

								<tr  id="trRow" class="<%=className%>">
								
									<td class="tdView" width="23%" dir="rtl">
									&nbsp;<%=std_Civil_id%></td>
									
									<td class="tdView" width="18%" dir="rtl">
									
									<p align="right">
									<%=std_Name%>
																		
									</td>
									
									<td class="tdView" width="18%" dir="rtl">
									
									<p align="right">
									<%=Class_Room%>
																		
									</td>
									
									<td class="tdView" width="18%" dir="rtl">
									
									<p align="right">
																	
									«·„Ã„Ê⁄… √ (√Õœ - À·«À«¡ - Œ„Ì”).<br>
									«·„Ã„Ê⁄… » (≈À‰Ì‰ - √—»⁄«¡).</td>
									
									
								</tr>
									</table>
						
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