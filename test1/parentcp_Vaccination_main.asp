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
		Sql="select * from students where std_Civil_ID='"&session("std_civil_id")&"'"
		Set rs = Server.CreateObject("ADODB.Recordset")
		rs.Open Sql, conn, 1, 2
		
		if not rs.eof then
			Std_Number=rs("Std_Number")
			std_name=rs("std_name")
			std_civil_id=rs("std_civil_id")
			Class_Room_ID=rs("Class_Room_ID")
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


								<p style="text-align: right">
			<font size="3">
			<img src="images/el-ameed_42.gif" width="22" height="22" alt=""></font><span lang="en-us"><font size="3">
			</font>
			</span><font size="3">‰Ÿ«„ „⁄·Ê„«  «· ÿ⁄Ì„ «·ÿ«·»<span lang="en-us">:</span> <%=std_name%>			
			</font>
			<p style="text-align: right"><font color="#FF0000">&nbsp;<%=session("ErrMsg")%></font>
											<p>
											
					<form action="Parentcp_Vaccination_chk.asp" method="post" name="frmData" id="frmData" onsubmit="return ValidateData()"  enctype="multipart/form-data">
						<input type="hidden" name="txtProcType" value="add">						
						<input type="hidden" name="std_civil_id" value="<%=std_civil_id%>">	
						<input type="hidden" name="Class_Room_ID" value="<%=Class_Room_ID%>">	
											

											<table cellspacing="0" cellpadding="3" class="tblView" dir="rtl" width="100%">
								<thead>
									<td class="tdViewHead" width="25%" dir="rtl">
																		«·—ﬁ„ 
									«·„œ‰Ì</td>
									<td class="tdViewHead" width="73%" dir="rtl">
									«”„ «·ÿ«·»</td>
									</thead>

								<tr  id="trRow" class="<%=className%>">
								
									<td class="tdView" width="25%" dir="rtl">
									&nbsp;<%=std_Civil_id%></td>
									
									<td class="tdView" width="73%" dir="rtl">
									
									<p align="right">
									<%=std_Name%>
																		
									</td>
									
									
								</tr>
									<tr>
									<td>&nbsp;</td>
									<td>
									<input type="radio" name="Vaccination" value="0" >&nbsp;·„ Ìÿ⁄„</td>
								</tr>
								<tr>
									<td>&nbsp;</td>
									<td>
									<input type="radio" name="Vaccination" value="1" checked><span lang="ar-kw">Ã—⁄… 
									Ê«Õœ…</span></td>
								</tr>
								<tr>
									<td>&nbsp;</td>
									<td>
														
																	<input type="radio" name="Vaccination" value="2"><span lang="ar-kw">Ã—⁄ Ì‰</span></td>
								</tr>
								<tr>
									<td>&nbsp;</td>
									<td>
														
																	<input type="radio" name="Vaccination" value="3" >„⁄›Ì</td>
								</tr>
									<td>‘Â«œ… «· ÿ⁄Ì„ √Ê «·≈⁄›«¡:</td>
									<td>&nbsp;<input type=file  name="txtImg" class="textBox" size="35"></td>
								</tr>
								<tr>
									<td>&nbsp;</td>
									<td>
										<input type="submit" value="«—”«·" name="B2"></tr>
								</table>
						</form></td>
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
							<td height="200" align="center">


								<p style="text-align: right">
			<font size="3">
			<img src="images/el-ameed_42.gif" width="22" height="22" alt=""></font><span lang="en-us"><font size="3">
			</font>
			</span><font size="3">‰Ÿ«„ „⁄·Ê„«  «· ÿ⁄Ì„ «·ÿ«·»<span lang="en-us">:</span> <%=std_name%>			
			</font>
			<p style="text-align: right"><font color="#FF0000">&nbsp;<%=session("ErrMsg")%></font>
											<p>
											
					<form action="Parentcp_Vaccination_chk.asp" method="post" name="frmData" id="frmData" onsubmit="return ValidateData()"  enctype="multipart/form-data">
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
									<td class="tdViewHead" width="3%" dir="rtl">
																		&nbsp;</td>
									<td class="tdViewHead" width="11%" dir="rtl">
																		&nbsp;</td>
									<td class="tdViewHead" width="3%" dir="rtl">
									&nbsp;</td>
									<td class="tdViewHead" width="12%" dir="rtl">
									&nbsp;</td>
									<td class="tdViewHead" width="3%" dir="rtl">
									&nbsp;</td>
									<td class="tdViewHead" width="10%" dir="rtl">
									&nbsp;</td>
									<td class="tdViewHead" width="3%" dir="rtl">
									&nbsp;</td>
									<td class="tdViewHead" width="7%" dir="rtl">
									&nbsp;</td>
									</thead>

								<tr  id="trRow" class="<%=className%>">
								
									<td class="tdView" width="23%" dir="rtl">
									&nbsp;<%=std_Civil_id%></td>
									
									<td class="tdView" width="18%" dir="rtl">
									
									<p align="right">
									<%=std_Name%>
																		
									</td>
									
									<td class="tdView" width="14%" dir="rtl" colspan="2">
									<input type="radio" name="Vaccination" value="0" >&nbsp;·„ Ìÿ⁄„</td>
								
									<td class="tdView" width="15%" dir="rtl" colspan="2">
									<input type="radio" name="Vaccination" value="1"><span lang="ar-kw">Ã—⁄… 
									Ê«Õœ…</span></td>
									
									
									<td class="tdView" width="13%" dir="rtl" colspan="2">
														
																	<input type="radio" name="Vaccination" value="2"><span lang="ar-kw">Ã—⁄ Ì‰</span></td>
									
									
									<td class="tdView" width="10%" dir="rtl" colspan="2">
														
																	<input type="radio" name="Vaccination" value="3" >„⁄›Ì</td>
									
									
								</tr>
									<td>‘Â«œ… «· ÿ⁄Ì„ √Ê «·≈⁄›«¡:</td>
									<td colspan="3">&nbsp;<input type=file  name="txtImg" class="textBox" size="35"></td>
									<td>&nbsp;</td>
									<td>&nbsp;</td>
									<td>&nbsp;</td>
									<td>&nbsp;</td>
									<td>&nbsp;</td>
									<td>&nbsp;</td>
								</tr>
								<tr>
									<td>&nbsp;</td>
									<td colspan="3">
										<input type="submit" value="«—”«·" name="B2"><td>&nbsp;</td>
									<td>&nbsp;</td>
									<td>&nbsp;</td>
									<td>&nbsp;</td>
									<td>&nbsp;</td>
									<td>&nbsp;</td>
								</tr>
								</table>
						</form>
						
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