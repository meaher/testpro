<!--#include file = "header.asp"-->
<html dir="rtl">

<div align="center">
	<table border="0" width="900" id="table1" cellspacing="0" cellpadding="0" bgcolor=#FFFFFF>
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
				<table border="0" width="98%" id="table36">
					<tr>
						<td width="23">
			<img src="images/el-ameed_42.gif" width="22" height="22" alt=""></td>
						<td><font face="Sultan normal" size="5">
			<img border="0" src="Images/GustBook.jpg" width="100" height="29"></font></td>
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
			<a href="GuestBookView.asp?start=1">
			<font color="#FF0000">«” ⁄—÷ ”Ã· «·“Ê«—</font></a></td>
					</tr>
					<tr>
						<td colspan="2">
						
		<script>
function chkform(){
	var Name = document.frm.tName.value;
	var Email = document.frm.tEmail.value;
	var Body = document.frm.sBody.value;
	if(Name==""){
	alert("·«   —ﬂ Õﬁ· «·«”„ ›«—€")
	document.frm.tName.focus();
	return false;
	}
	else if(Email==""){
	alert("·«   —ﬂ Õﬁ· «·»—Ìœ «·≈·ﬂ —Ê‰Ì ›«—€")
	document.frm.tEmail.focus();
	return false;
	}
	else if (!(Email.indexOf("@") > -1 && Email.indexOf(".") > -1)){
		alert ("«·—Ã«¡ ﬂ «»…«·»—Ìœ «·≈·ﬂ —Ê‰Ì »‘ﬂ· ’ÕÌÕ")
		document.frm.tEmail.focus();	
		return false;
	}	
	else if(Body==""){
	alert("·«   —ﬂ Õﬁ· ‰’ «·—”«·… ›«—€")
	document.frm.sBody.focus();
	return false;
	}

}
</script>
						
						

						<form action="GuestBookAdd.asp" method=POST name=frm onsubmit="return chkform();">		
		<div align="center">
		<table border="0" width="95%" id="table35" style="border-collapse: collapse" cellpadding="3">
			

			<tr>
				<td align="left">«·«”„:<font color="#FF0000"> </font></td>
				<td align="right"><input type="text" name="tName" size="40"><font color="#FF0000"> </font></td>
			</tr>
			<tr>
				<td align="left">«·»·œ:<font color="#FF0000"> </font></td>
				<td align="right">
				<input type="text" name="tCountry" size="40"><font color="#FF0000"> </font></td>
			</tr>
			<tr>
				<td align="left">«·»—Ìœ «·≈·ﬂ —Ê‰Ì:<font color="#FF0000"> </font></td>
				<td align="right"><input type="text" name="tEmail" size="40"></td>
			</tr>
			<tr>
				<td align="left" valign="top">«·„‘«—ﬂÂ</td>
				<td align="right" valign="top">
				<textarea rows="8" name="sBody" cols="41"></textarea><font color="#FF0000">
				</font></td>
			</tr>
			<tr>
				<td align="left">&nbsp;</td>
				<td align="right">
				<input type="submit" value="«÷€ÿ Â‰« ··≈÷«›…" name="B2">&nbsp;&nbsp;&nbsp;&nbsp;
				<font color="#FF0000">&nbsp;</font></td>
			</tr>
						
		</table>
		</div>
</form></td>
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