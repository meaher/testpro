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
						<td><span lang="ar-kw">
			<font size="6" face="Andalus">«·‰ «∆Ã</font></span>

			
			</td>
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

Civil_ID	= Request.Form("Civil_ID")
Class_ID	= Request.Form("sClass")
'response.write Civil_ID
'response.end
if Class_ID = "Class10" then
		rs.open "SELECT [101].full_name, [10].st_name, [101].cid, [10].subj1, [10].subj2, [10].subj3, [10].subj4, [10].subj5, [10].subj6, [10].subj7, [10].subj8, [10].subj9, [10].subj10, [10].subj11, [10].subj12, [10].subj13, [10].subj14, [10].subj15, [10].mark1, [10].mark2, [10].mark3, [10].mark4, [10].mark5, [10].mark6, [10].mark7, [10].mark8, [10].mark9, [10].mark10, [10].mark11, [10].mark12, [10].mark13, [10].mark14, [10].mark15, [10].week, [10].serial, [10].total, [10].nat, [10].result, [10].name_1, [10].name_5, [10].name_6, [10].work1, [10].work2, [10].work3, [10].work4, [10].work5, [10].work6, [10].work7, [10].work8, [10].work9, [10].work10, [10].work11, [10].work12, [10].work13, [10].work14, [10].work15, [10].exam1, [10].exam2, [10].exam3, [10].exam4, [10].exam5, [10].exam6, [10].exam7, [10].exam8, [10].exam9, [10].exam10, [10].exam11, [10].exam12, [10].exam13, [10].exam14, [10].exam15, [10].unify1, [10].unify2, [10].unify3, [10].unify4, [10].unify5, [10].unify6, [10].unify7, [10].unify8, [10].unify9, [10].unify10, [10].unify11, [10].unify12, [10].unify13, [10].unify14, [10].unify15, [10].cert_sort, [10].unify, [10].min1, [10].min2, [10].min3, [10].min4, [10].min5, [10].min6, [10].min7, [10].min8, [10].min9, [10].min10, [10].min11, [10].min12, [10].min13, [10].min14, [10].min15 FROM q_10 where cid = "& Civil_ID &" ",conn
End if
if Class_ID = "Class11e" then
		rs.open "SELECT [11e1].full_name, [11e].st_name, [11e1].cid, [11e].subj1, [11e].subj2, [11e].subj3, [11e].subj4, [11e].subj5, [11e].subj6, [11e].subj7, [11e].subj8, [11e].subj9, [11e].subj10, [11e].subj11, [11e].subj12, [11e].subj13, [11e].subj14, [11e].subj15, [11e].mark1, [11e].mark2, [11e].mark3, [11e].mark4, [11e].mark5, [11e].mark6, [11e].mark7, [11e].mark8, [11e].mark9, [11e].mark10, [11e].mark11, [11e].mark12, [11e].mark13, [11e].mark14, [11e].mark15, [11e].week, [11e].serial, [11e].total, [11e].nat, [11e].result, [11e].name_1, [11e].name_5, [11e].name_6, [11e].work1, [11e].work2, [11e].work3, [11e].work4, [11e].work5, [11e].work6, [11e].work7, [11e].work8, [11e].work9, [11e].work10, [11e].work11, [11e].work12, [11e].work13, [11e].work14, [11e].work15, [11e].exam1, [11e].exam2, [11e].exam3, [11e].exam4, [11e].exam5, [11e].exam6, [11e].exam7, [11e].exam8, [11e].exam9, [11e].exam10, [11e].exam11, [11e].exam12, [11e].exam13, [11e].exam14, [11e].exam15, [11e].unify1, [11e].unify2, [11e].unify3, [11e].unify4, [11e].unify5, [11e].unify6, [11e].unify7, [11e].unify8, [11e].unify9, [11e].unify10, [11e].unify11, [11e].unify12, [11e].unify13, [11e].unify14, [11e].unify15, [11e].cert_sort, [11e].unify, [11e].min1, [11e].min2, [11e].min3, [11e].min4, [11e].min5, [11e].min6, [11e].min7, [11e].min8, [11e].min9, [11e].min10, [11e].min11, [11e].min12, [11e].min13, [11e].min14, [11e].min15 FROM 11e where cid = "& Civil_ID &" ",conn
End if

if Class_ID = "Class11a" then
response.write Civil_ID
response.end

		rs.open "SELECT [11a1].full_name, [11a].st_name, [11a1].cid, [11a].subj1, [11a].subj2, [11a].subj3, [11a].subj4, [11a].subj5, [11a].subj6, [11a].subj7, [11a].subj8, [11a].subj9, [11a].subj10, [11a].subj11, [11a].subj12, [11a].subj13, [11a].subj14, [11a].subj15, [11a].mark1, [11a].mark2, [11a].mark3, [11a].mark4, [11a].mark5, [11a].mark6, [11a].mark7, [11a].mark8, [11a].mark9, [11a].mark10, [11a].mark11, [11a].mark12, [11a].mark13, [11a].mark14, [11a].mark15, [11a].week, [11a].serial, [11a].total, [11a].nat, [11a].result, [11a].name_1, [11a].name_5, [11a].name_6, [11a].work1, [11a].work2, [11a].work3, [11a].work4, [11a].work5, [11a].work6, [11a].work7, [11a].work8, [11a].work9, [11a].work10, [11a].work11, [11a].work12, [11a].work13, [11a].work14, [11a].work15, [11a].exam1, [11a].exam2, [11a].exam3, [11a].exam4, [11a].exam5, [11a].exam6, [11a].exam7, [11a].exam8, [11a].exam9, [11a].exam10, [11a].exam11, [11a].exam12, [11a].exam13, [11a].exam14, [11a].exam15, [11a].unify1, [11a].unify2, [11a].unify3, [11a].unify4, [11a].unify5, [11a].unify6, [11a].unify7, [11a].unify8, [11a].unify9, [11a].unify10, [11a].unify11, [11a].unify12, [11a].unify13, [11a].unify14, [11a].unify15, [11a].cert_sort, [11a].unify, [11a].min1, [11a].min2, [11a].min3, [11a].min4, [11a].min5, [11a].min6, [11a].min7, [11a].min8, [11a].min9, [11a].min10, [11a].min11, [11a].min12, [11a].min13, [11a].min14, [11a].min15 FROM 11a where cid = "& Civil_ID &" ",conn
End if
if Class_ID = "Class12e" then
		rs.open "SELECT [12e1].full_name, [12e].st_name, [12e1].cid, [12e].subj1, [12e].subj2, [12e].subj3, [12e].subj4, [12e].subj5, [12e].subj6, [12e].subj7, [12e].subj8, [12e].subj9, [12e].subj10, [12e].subj11, [12e].subj12, [12e].subj13, [12e].subj14, [12e].subj15, [12e].mark1, [12e].mark2, [12e].mark3, [12e].mark4, [12e].mark5, [12e].mark6, [12e].mark7, [12e].mark8, [12e].mark9, [12e].mark10, [12e].mark11, [12e].mark12, [12e].mark13, [12e].mark14, [12e].mark15, [12e].week, [12e].serial, [12e].total, [12e].nat, [12e].result, [12e].name_1, [12e].name_5, [12e].name_6, [12e].work1, [12e].work2, [12e].work3, [12e].work4, [12e].work5, [12e].work6, [12e].work7, [12e].work8, [12e].work9, [12e].work10, [12e].work11, [12e].work12, [12e].work13, [12e].work14, [12e].work15, [12e].exam1, [12e].exam2, [12e].exam3, [12e].exam4, [12e].exam5, [12e].exam6, [12e].exam7, [12e].exam8, [12e].exam9, [12e].exam10, [12e].exam11, [12e].exam12, [12e].exam13, [12e].exam14, [12e].exam15, [12e].unify1, [12e].unify2, [12e].unify3, [12e].unify4, [12e].unify5, [12e].unify6, [12e].unify7, [12e].unify8, [12e].unify9, [12e].unify10, [12e].unify11, [12e].unify12, [12e].unify13, [12e].unify14, [12e].unify15, [12e].cert_sort, [12e].unify, [12e].min1, [12e].min2, [12e].min3, [12e].min4, [12e].min5, [12e].min6, [12e].min7, [12e].min8, [12e].min9, [12e].min10, [12e].min11, [12e].min12, [12e].min13, [12e].min14, [12e].min15 FROM 12e where cid = "& Civil_ID &" ",conn
End if
if Class_ID = "Class12a" then
		rs.open "SELECT [12a1].full_name, [12a].st_name, [12a1].cid, [12a].subj1, [12a].subj2, [12a].subj3, [12a].subj4, [12a].subj5, [12a].subj6, [12a].subj7, [12a].subj8, [12a].subj9, [12a].subj10, [12a].subj11, [12a].subj12, [12a].subj13, [12a].subj14, [12a].subj15, [12a].mark1, [12a].mark2, [12a].mark3, [12a].mark4, [12a].mark5, [12a].mark6, [12a].mark7, [12a].mark8, [12a].mark9, [12a].mark10, [12a].mark11, [12a].mark12, [12a].mark13, [12a].mark14, [12a].mark15, [12a].week, [12a].serial, [12a].total, [12a].nat, [12a].result, [12a].name_1, [12a].name_5, [12a].name_6, [12a].work1, [12a].work2, [12a].work3, [12a].work4, [12a].work5, [12a].work6, [12a].work7, [12a].work8, [12a].work9, [12a].work10, [12a].work11, [12a].work12, [12a].work13, [12a].work14, [12a].work15, [12a].exam1, [12a].exam2, [12a].exam3, [12a].exam4, [12a].exam5, [12a].exam6, [12a].exam7, [12a].exam8, [12a].exam9, [12a].exam10, [12a].exam11, [12a].exam12, [12a].exam13, [12a].exam14, [12a].exam15, [12a].unify1, [12a].unify2, [12a].unify3, [12a].unify4, [12a].unify5, [12a].unify6, [12a].unify7, [12a].unify8, [12a].unify9, [12a].unify10, [12a].unify11, [12a].unify12, [12a].unify13, [12a].unify14, [12a].unify15, [12a].cert_sort, [12a].unify, [12a].min1, [12a].min2, [12a].min3, [12a].min4, [12a].min5, [12a].min6, [12a].min7, [12a].min8, [12a].min9, [12a].min10, [12a].min11, [12a].min12, [12a].min13, [12a].min14, [12a].min15 FROM 12a where cid = "& Civil_ID &" ",conn
End if
if not rs.eof then
%>
	
		<table border="0" width="98%" id="table2" cellpadding="3">
			<tr>
				<td>
			 							<table border="0">
							<tr>
								<td bgcolor="#ECECFF">«”„ «·ÿ«·»:</td>
								<td bgcolor="#ECECFF">&nbsp;<%=rs("st_name")%></td>
							</tr>
							
						</table>
					<br>
					<%if Class_ID = "Class10" then%>
					
						<table border="1" width="100%" style="border-collapse: collapse">
							<tr>
								<td bgcolor="#0000FF"><font color="#FFFFFF">ﬁ—¬‰ ﬂ—Ì„</font></td>
								<td width="80%" bgcolor="#0000FF">
								&nbsp;</td>
							</tr>
							<tr>
								<td bgcolor="#FFFFFF" align="left">√⁄„«·</td>
								<td bgcolor="#FFFFFF" width="80%">
								&nbsp;<%=rs("work1")%></td>
							</tr>
							<tr>
								<td bgcolor="#FFFFFF" align="left">«Œ »«—</td>
								<td bgcolor="#FFFFFF" width="80%">
								&nbsp;<%=rs("exam1")%></td>
							</tr>
							<tr>
								<td bgcolor="#FFFFFF" align="left">‰Â«Ì…</td>
								<td bgcolor="#FFFFFF" width="80%">
								&nbsp;<%=rs("mark1")%></td>
							</tr>
							<tr>
								<td bgcolor="#0000FF"><font color="#FFFFFF">
								 —»Ì… «”·«„Ì…</font></td>
								<td bgcolor="#0000FF" width="80%">
								&nbsp;</td>
							</tr>
							<tr>
								<td bgcolor="#FFFFFF" align="left">√⁄„«·</td>
								<td bgcolor="#FFFFFF" width="80%">
								&nbsp;<%=rs("work2")%></td>
							</tr>
							<tr>
								<td bgcolor="#FFFFFF" align="left">«Œ »«—</td>
								<td bgcolor="#FFFFFF" width="80%">
								&nbsp;<%=rs("exam2")%></td>
							</tr>
							<tr>
								<td bgcolor="#FFFFFF" align="left">‰Â«Ì…</td>
								<td bgcolor="#FFFFFF" width="80%">
								&nbsp;<%=rs("mark2")%></td>
							</tr>
							<tr>
								<td bgcolor="#0000FF"><font color="#FFFFFF">·€… ⁄—»Ì…</font></td>
								<td width="80%" bgcolor="#0000FF">&nbsp;</td>
							</tr>
							<tr>
								<td bgcolor="#FFFFFF" align="left">√⁄„«·</td>
								<td bgcolor="#FFFFFF" width="80%">
								&nbsp;<%=rs("work3")%></td>
							</tr>
							<tr>
								<td bgcolor="#FFFFFF" align="left">«Œ »«—</td>
								<td bgcolor="#FFFFFF" width="80%">
								&nbsp;<%=rs("exam3")%></td>
							</tr>
							<tr>
								<td bgcolor="#FFFFFF" align="left">‰Â«Ì…</td>
								<td bgcolor="#FFFFFF" width="80%">
								&nbsp;<%=rs("mark3")%></td>
							</tr>
							<tr>
								<td bgcolor="#0000FF"><font color="#FFFFFF">·€… 
								«‰Ã·Ì“Ì…</font></td>
								<td bgcolor="#0000FF" width="80%">
								&nbsp;</td>
							</tr>
							<tr>
								<td bgcolor="#FFFFFF" align="left">√⁄„«·</td>
								<td bgcolor="#FFFFFF" width="80%">
								&nbsp;<%=rs("work4")%></td>
							</tr>
							<tr>
								<td bgcolor="#FFFFFF" align="left">«Œ »«—</td>
								<td bgcolor="#FFFFFF" width="80%">
								&nbsp;<%=rs("exam4")%></td>
							</tr>
							<tr>
								<td bgcolor="#FFFFFF" align="left">‰Â«Ì…</td>
								<td bgcolor="#FFFFFF" width="80%">
								&nbsp;<%=rs("mark4")%></td>
							</tr>
							<tr>
								<td bgcolor="#0000FF"><font color="#FFFFFF">«·—Ì«÷Ì« </font></td>
								<td width="80%" bgcolor="#0000FF">&nbsp;</td>
							</tr>
							<tr>
								<td bgcolor="#FFFFFF" align="left">√⁄„«·</td>
								<td bgcolor="#FFFFFF" width="80%">
								&nbsp;<%=rs("work5")%></td>
							</tr>
							<tr>
								<td bgcolor="#FFFFFF" align="left">«Œ »«—</td>
								<td bgcolor="#FFFFFF" width="80%">
								&nbsp;<%=rs("exam5")%></td>
							</tr>
							<tr>
								<td bgcolor="#FFFFFF" align="left">‰Â«Ì…</td>
								<td bgcolor="#FFFFFF" width="80%">
								&nbsp;<%=rs("mark5")%></td>
							</tr>
							<tr>
								<td bgcolor="#0000FF"><span lang="ar-kw">
								<font color="#FFFFFF">«·ﬂÌ„Ì«¡</font></span></td>
								<td bgcolor="#0000FF" width="80%">
								&nbsp;</td>
							</tr>
							<tr>
								<td bgcolor="#FFFFFF" align="left">√⁄„«·</td>
								<td bgcolor="#FFFFFF" width="80%">
								&nbsp;<%=rs("work6")%></td>
							</tr>
							<tr>
								<td bgcolor="#FFFFFF" align="left">«Œ »«—</td>
								<td bgcolor="#FFFFFF" width="80%">
								&nbsp;<%=rs("exam6")%></td>
							</tr>
							<tr>
								<td bgcolor="#FFFFFF" align="left" height="24">‰Â«Ì…</td>
								<td bgcolor="#FFFFFF" width="80%" height="24">
								&nbsp;<%=rs("mark6")%></td>
							</tr>
							<tr>
								<td bgcolor="#0000FF"><span lang="ar-kw">
								<font color="#FFFFFF">«·›Ì“Ì«¡</font></span></td>
								<td width="80%" bgcolor="#0000FF">&nbsp;</td>
							</tr>
							<tr>
								<td bgcolor="#FFFFFF" align="left">√⁄„«·</td>
								<td bgcolor="#FFFFFF" width="80%">
								&nbsp;<%=rs("work7")%></td>
							</tr>
							<tr>
								<td bgcolor="#FFFFFF" align="left">«Œ »«—</td>
								<td bgcolor="#FFFFFF" width="80%">
								&nbsp;<%=rs("exam7")%></td>
							</tr>
							<tr>
								<td bgcolor="#FFFFFF" align="left">‰Â«Ì…</td>
								<td bgcolor="#FFFFFF" width="80%">
								&nbsp;<%=rs("mark7")%></td>
							</tr>
							<tr>
								<td bgcolor="#0000FF"><span lang="ar-kw">
								<font color="#FFFFFF">«·√ÕÌ«¡</font></span></td>
								<td bgcolor="#0000FF" width="80%">
								&nbsp;</td>
							</tr>							
							<tr>
								<td bgcolor="#FFFFFF" align="left">√⁄„«·</td>
								<td bgcolor="#FFFFFF" width="80%">
								&nbsp;<%=rs("work8")%></td>
							</tr>
							<tr>
								<td bgcolor="#FFFFFF" align="left">«Œ »«—</td>
								<td bgcolor="#FFFFFF" width="80%">
								&nbsp;<%=rs("exam8")%></td>
							</tr>
							<tr>
								<td bgcolor="#FFFFFF" align="left">‰Â«Ì…</td>
								<td bgcolor="#FFFFFF" width="80%">
								&nbsp;<%=rs("mark8")%></td>
							</tr>
							<tr>
								<td bgcolor="#0000FF"><span lang="ar-kw">
								<font color="#FFFFFF">«Ã „«⁄Ì« </font></span></td>
								<td width="80%" bgcolor="#0000FF">&nbsp;</td>
							</tr>
							<tr>
								<td bgcolor="#FFFFFF" align="left">√⁄„«·</td>
								<td bgcolor="#FFFFFF" width="80%">
								&nbsp;<%=rs("work9")%></td>
							</tr>
							<tr>
								<td bgcolor="#FFFFFF" align="left">«Œ »«—</td>
								<td bgcolor="#FFFFFF" width="80%">
								&nbsp;<%=rs("exam9")%></td>
							</tr>
							<tr>
								<td bgcolor="#FFFFFF" align="left">‰Â«Ì…</td>
								<td bgcolor="#FFFFFF" width="80%">
								&nbsp;<%=rs("mark9")%></td>
							</tr>
							<tr>
								<td bgcolor="#0000FF"><span lang="ar-kw">
								<font color="#FFFFFF"> —»Ì… »œ‰Ì…</font></span></td>
								<td bgcolor="#0000FF" width="80%">
								&nbsp;</td>
							</tr>
							<tr>
								<td bgcolor="#FFFFFF" align="left">√⁄„«·</td>
								<td bgcolor="#FFFFFF" width="80%">
								&nbsp;<%=rs("work10")%></td>
							</tr>
							<tr>
								<td bgcolor="#FFFFFF" align="left">«Œ »«—</td>
								<td bgcolor="#FFFFFF" width="80%">
								&nbsp;<%=rs("exam10")%></td>
							</tr>
							<tr>
								<td bgcolor="#FFFFFF" align="left">‰Â«Ì…</td>
								<td bgcolor="#FFFFFF" width="80%">
								&nbsp;<%=rs("mark10")%></td>
							</tr>
							<tr>
								<td bgcolor="#0000FF"><span lang="ar-kw">
								<font color="#FFFFFF">«·„⁄·Ê„« Ì… Êÿ—ﬁ «·»ÕÀ</font></span></td>
								<td width="80%" bgcolor="#0000FF">&nbsp;</td>
							</tr>
							<tr>
								<td bgcolor="#FFFFFF" align="left">√⁄„«·</td>
								<td bgcolor="#FFFFFF" width="80%">
								&nbsp;<%=rs("work11")%></td>
							</tr>
							<tr>
								<td bgcolor="#FFFFFF" align="left">«Œ »«—</td>
								<td bgcolor="#FFFFFF" width="80%">
								&nbsp;<%=rs("exam11")%></td>
							</tr>
							<tr>
								<td bgcolor="#FFFFFF" align="left">‰Â«Ì…</td>
								<td bgcolor="#FFFFFF" width="80%">
								&nbsp;<%=rs("mark11")%></td>
							</tr>
														
						</table><br>
					<%End if%>
					
					<%if Class_ID = "Class11a" then%>
					
						<table border="1" width="100%" style="border-collapse: collapse">
							<tr>
								<td bgcolor="#0000FF"><font color="#FFFFFF">ﬁ—¬‰ ﬂ—Ì„</font></td>
								<td width="80%" bgcolor="#0000FF">
								&nbsp;</td>
							</tr>
							<tr>
								<td bgcolor="#FFFFFF" align="left">√⁄„«·</td>
								<td bgcolor="#FFFFFF" width="80%">
								&nbsp;<%=rs("work1")%></td>
							</tr>
							<tr>
								<td bgcolor="#FFFFFF" align="left">«Œ »«—</td>
								<td bgcolor="#FFFFFF" width="80%">
								&nbsp;<%=rs("exam1")%></td>
							</tr>
							<tr>
								<td bgcolor="#FFFFFF" align="left">‰Â«Ì…</td>
								<td bgcolor="#FFFFFF" width="80%">
								&nbsp;<%=rs("mark1")%></td>
							</tr>
							<tr>
								<td bgcolor="#0000FF"><font color="#FFFFFF">
								 —»Ì… «”·«„Ì…</font></td>
								<td bgcolor="#0000FF" width="80%">
								&nbsp;</td>
							</tr>
							<tr>
								<td bgcolor="#FFFFFF" align="left">√⁄„«·</td>
								<td bgcolor="#FFFFFF" width="80%">
								&nbsp;<%=rs("work2")%></td>
							</tr>
							<tr>
								<td bgcolor="#FFFFFF" align="left">«Œ »«—</td>
								<td bgcolor="#FFFFFF" width="80%">
								&nbsp;<%=rs("exam2")%></td>
							</tr>
							<tr>
								<td bgcolor="#FFFFFF" align="left">‰Â«Ì…</td>
								<td bgcolor="#FFFFFF" width="80%">
								&nbsp;<%=rs("mark2")%></td>
							</tr>
							<tr>
								<td bgcolor="#0000FF"><font color="#FFFFFF">·€… ⁄—»Ì…</font></td>
								<td width="80%" bgcolor="#0000FF">&nbsp;</td>
							</tr>
							<tr>
								<td bgcolor="#FFFFFF" align="left">√⁄„«·</td>
								<td bgcolor="#FFFFFF" width="80%">
								&nbsp;<%=rs("work3")%></td>
							</tr>
							<tr>
								<td bgcolor="#FFFFFF" align="left">«Œ »«—</td>
								<td bgcolor="#FFFFFF" width="80%">
								&nbsp;<%=rs("exam3")%></td>
							</tr>
							<tr>
								<td bgcolor="#FFFFFF" align="left">‰Â«Ì…</td>
								<td bgcolor="#FFFFFF" width="80%">
								&nbsp;<%=rs("mark3")%></td>
							</tr>
							<tr>
								<td bgcolor="#0000FF"><font color="#FFFFFF">·€… 
								«‰Ã·Ì“Ì…</font></td>
								<td bgcolor="#0000FF" width="80%">
								&nbsp;</td>
							</tr>
							<tr>
								<td bgcolor="#FFFFFF" align="left">√⁄„«·</td>
								<td bgcolor="#FFFFFF" width="80%">
								&nbsp;<%=rs("work4")%></td>
							</tr>
							<tr>
								<td bgcolor="#FFFFFF" align="left">«Œ »«—</td>
								<td bgcolor="#FFFFFF" width="80%">
								&nbsp;<%=rs("exam4")%></td>
							</tr>
							<tr>
								<td bgcolor="#FFFFFF" align="left">‰Â«Ì…</td>
								<td bgcolor="#FFFFFF" width="80%">
								&nbsp;<%=rs("mark4")%></td>
							</tr>
							<tr>
								<td bgcolor="#0000FF"><font color="#FFFFFF">«·—Ì«÷Ì«  Ê«·≈Õ’«¡</font></td>
								<td width="80%" bgcolor="#0000FF">&nbsp;</td>
							</tr>
							<tr>
								<td bgcolor="#FFFFFF" align="left">√⁄„«·</td>
								<td bgcolor="#FFFFFF" width="80%">
								&nbsp;<%=rs("work5")%></td>
							</tr>
							<tr>
								<td bgcolor="#FFFFFF" align="left">«Œ »«—</td>
								<td bgcolor="#FFFFFF" width="80%">
								&nbsp;<%=rs("exam5")%></td>
							</tr>
							<tr>
								<td bgcolor="#FFFFFF" align="left">‰Â«Ì…</td>
								<td bgcolor="#FFFFFF" width="80%">
								&nbsp;<%=rs("mark5")%></td>
							</tr>
							<tr>
								<td bgcolor="#0000FF"><font color="#FFFFFF">
								 —»Ì… »œ‰Ì…</font></td>
								<td bgcolor="#0000FF" width="80%">
								&nbsp;</td>
							</tr>
							<tr>
								<td bgcolor="#FFFFFF" align="left">√⁄„«·</td>
								<td bgcolor="#FFFFFF" width="80%">
								&nbsp;<%=rs("work6")%></td>
							</tr>
							<tr>
								<td bgcolor="#FFFFFF" align="left">«Œ »«—</td>
								<td bgcolor="#FFFFFF" width="80%">
								&nbsp;<%=rs("exam6")%></td>
							</tr>
							<tr>
								<td bgcolor="#FFFFFF" align="left" height="24">‰Â«Ì…</td>
								<td bgcolor="#FFFFFF" width="80%" height="24">
								&nbsp;<%=rs("mark6")%></td>
							</tr>
							<tr>
								<td bgcolor="#0000FF"><font color="#FFFFFF">«·„⁄·Ê„« Ì… Êÿ—ﬁ «·»ÕÀ</font></td>
								<td width="80%" bgcolor="#0000FF">&nbsp;</td>
							</tr>
							<tr>
								<td bgcolor="#FFFFFF" align="left">√⁄„«·</td>
								<td bgcolor="#FFFFFF" width="80%">
								&nbsp;<%=rs("work7")%></td>
							</tr>
							<tr>
								<td bgcolor="#FFFFFF" align="left">«Œ »«—</td>
								<td bgcolor="#FFFFFF" width="80%">
								&nbsp;<%=rs("exam7")%></td>
							</tr>
							<tr>
								<td bgcolor="#FFFFFF" align="left">‰Â«Ì…</td>
								<td bgcolor="#FFFFFF" width="80%">
								&nbsp;<%=rs("mark7")%></td>
							</tr>
							<tr>
								<td bgcolor="#0000FF"><font color="#FFFFFF">
								 «—ÌŒ</font></td>
								<td bgcolor="#0000FF" width="80%">
								&nbsp;</td>
							</tr>							
							<tr>
								<td bgcolor="#FFFFFF" align="left">√⁄„«·</td>
								<td bgcolor="#FFFFFF" width="80%">
								&nbsp;<%=rs("work8")%></td>
							</tr>
							<tr>
								<td bgcolor="#FFFFFF" align="left">«Œ »«—</td>
								<td bgcolor="#FFFFFF" width="80%">
								&nbsp;<%=rs("exam8")%></td>
							</tr>
							<tr>
								<td bgcolor="#FFFFFF" align="left">‰Â«Ì…</td>
								<td bgcolor="#FFFFFF" width="80%">
								&nbsp;<%=rs("mark8")%></td>
							</tr>
							<tr>
								<td bgcolor="#0000FF"><font color="#FFFFFF">Ã€—«›Ì…</font></td>
								<td width="80%" bgcolor="#0000FF">&nbsp;</td>
							</tr>
							<tr>
								<td bgcolor="#FFFFFF" align="left">√⁄„«·</td>
								<td bgcolor="#FFFFFF" width="80%">
								&nbsp;<%=rs("work9")%></td>
							</tr>
							<tr>
								<td bgcolor="#FFFFFF" align="left">«Œ »«—</td>
								<td bgcolor="#FFFFFF" width="80%">
								&nbsp;<%=rs("exam9")%></td>
							</tr>
							<tr>
								<td bgcolor="#FFFFFF" align="left">‰Â«Ì…</td>
								<td bgcolor="#FFFFFF" width="80%">
								&nbsp;<%=rs("mark9")%></td>
							</tr>
							<tr>
								<td bgcolor="#0000FF"><font color="#FFFFFF">⁄·„ 
								«·‰›”</font></td>
								<td bgcolor="#0000FF" width="80%">
								&nbsp;</td>
							</tr>
							<tr>
								<td bgcolor="#FFFFFF" align="left">√⁄„«·</td>
								<td bgcolor="#FFFFFF" width="80%">
								&nbsp;<%=rs("work10")%></td>
							</tr>
							<tr>
								<td bgcolor="#FFFFFF" align="left">«Œ »«—</td>
								<td bgcolor="#FFFFFF" width="80%">
								&nbsp;<%=rs("exam10")%></td>
							</tr>
							<tr>
								<td bgcolor="#FFFFFF" align="left">‰Â«Ì…</td>
								<td bgcolor="#FFFFFF" width="80%">
								&nbsp;<%=rs("mark10")%></td>
							</tr>
							<tr>
								<td bgcolor="#0000FF"><font color="#FFFFFF">·€… ›—‰”Ì…</font></td>
								<td width="80%" bgcolor="#0000FF">&nbsp;</td>
							</tr>
							<tr>
								<td bgcolor="#FFFFFF" align="left">√⁄„«·</td>
								<td bgcolor="#FFFFFF" width="80%">
								&nbsp;<%=rs("work11")%></td>
							</tr>
							<tr>
								<td bgcolor="#FFFFFF" align="left">«Œ »«—</td>
								<td bgcolor="#FFFFFF" width="80%">
								&nbsp;<%=rs("exam11")%></td>
							</tr>
							<tr>
								<td bgcolor="#FFFFFF" align="left">‰Â«Ì…</td>
								<td bgcolor="#FFFFFF" width="80%">
								&nbsp;<%=rs("mark11")%></td>
							</tr>
							<tr>
								<td bgcolor="#0000FF"><font color="#FFFFFF">
								«Œ Ì«— «·Õ— 1</font></td>
								<td bgcolor="#0000FF" width="80%">
								&nbsp;</td>
							</tr>
							<tr>
								<td bgcolor="#FFFFFF" align="left">√⁄„«·</td>
								<td bgcolor="#FFFFFF" width="80%">
								&nbsp;<%=rs("work12")%></td>
							</tr>
							<tr>
								<td bgcolor="#FFFFFF" align="left">«Œ »«—</td>
								<td bgcolor="#FFFFFF" width="80%">
								&nbsp;<%=rs("exam12")%></td>
							</tr>
							<tr>
								<td bgcolor="#FFFFFF" align="left">‰Â«Ì…</td>
								<td bgcolor="#FFFFFF" width="80%">
								&nbsp;<%=rs("mark12")%></td>
							</tr>
							<tr>
								<td bgcolor="#0000FF"><font color="#FFFFFF">«Œ Ì«— «·Õ—2</font></td>
								<td width="80%" bgcolor="#0000FF">&nbsp;</td>
							</tr>
							
							<tr>
								<td bgcolor="#FFFFFF" align="left">√⁄„«·</td>
								<td bgcolor="#FFFFFF" width="80%">
								&nbsp;<%=rs("work13")%></td>
							</tr>
							<tr>
								<td bgcolor="#FFFFFF" align="left">«Œ »«—</td>
								<td bgcolor="#FFFFFF" width="80%">
								&nbsp;<%=rs("exam13")%></td>
							</tr>
							<tr>
								<td bgcolor="#FFFFFF" align="left">‰Â«Ì…</td>
								<td bgcolor="#FFFFFF" width="80%">
								&nbsp;<%=rs("mark13")%></td>
							</tr>
							
						</table>
						<br>
					<%End if%>
					
					<%if Class_ID = "Class11e" then%>
					
						<table border="1" width="100%" style="border-collapse: collapse">
							<tr>
								<td bgcolor="#0000FF"><font color="#FFFFFF">ﬁ—¬‰ ﬂ—Ì„</font></td>
								<td width="80%" bgcolor="#0000FF">
								&nbsp;</td>
							</tr>
							<tr>
								<td bgcolor="#FFFFFF" align="left">√⁄„«·</td>
								<td bgcolor="#FFFFFF" width="80%">
								&nbsp;<%=rs("work1")%></td>
							</tr>
							<tr>
								<td bgcolor="#FFFFFF" align="left">«Œ »«—</td>
								<td bgcolor="#FFFFFF" width="80%">
								&nbsp;<%=rs("exam1")%></td>
							</tr>
							<tr>
								<td bgcolor="#FFFFFF" align="left">‰Â«Ì…</td>
								<td bgcolor="#FFFFFF" width="80%">
								&nbsp;<%=rs("mark1")%></td>
							</tr>
							<tr>
								<td bgcolor="#0000FF"><font color="#FFFFFF">
								 —»Ì… «”·«„Ì…</font></td>
								<td bgcolor="#0000FF" width="80%">
								&nbsp;</td>
							</tr>
							<tr>
								<td bgcolor="#FFFFFF" align="left">√⁄„«·</td>
								<td bgcolor="#FFFFFF" width="80%">
								&nbsp;<%=rs("work2")%></td>
							</tr>
							<tr>
								<td bgcolor="#FFFFFF" align="left">«Œ »«—</td>
								<td bgcolor="#FFFFFF" width="80%">
								&nbsp;<%=rs("exam2")%></td>
							</tr>
							<tr>
								<td bgcolor="#FFFFFF" align="left">‰Â«Ì…</td>
								<td bgcolor="#FFFFFF" width="80%">
								&nbsp;<%=rs("mark2")%></td>
							</tr>
							<tr>
								<td bgcolor="#0000FF"><font color="#FFFFFF">·€… ⁄—»Ì…</font></td>
								<td width="80%" bgcolor="#0000FF">&nbsp;</td>
							</tr>
							<tr>
								<td bgcolor="#FFFFFF" align="left">√⁄„«·</td>
								<td bgcolor="#FFFFFF" width="80%">
								&nbsp;<%=rs("work3")%></td>
							</tr>
							<tr>
								<td bgcolor="#FFFFFF" align="left">«Œ »«—</td>
								<td bgcolor="#FFFFFF" width="80%">
								&nbsp;<%=rs("exam3")%></td>
							</tr>
							<tr>
								<td bgcolor="#FFFFFF" align="left">‰Â«Ì…</td>
								<td bgcolor="#FFFFFF" width="80%">
								&nbsp;<%=rs("mark3")%></td>
							</tr>
							<tr>
								<td bgcolor="#0000FF"><font color="#FFFFFF">·€… 
								«‰Ã·Ì“Ì…</font></td>
								<td bgcolor="#0000FF" width="80%">
								&nbsp;</td>
							</tr>
							<tr>
								<td bgcolor="#FFFFFF" align="left">√⁄„«·</td>
								<td bgcolor="#FFFFFF" width="80%">
								&nbsp;<%=rs("work4")%></td>
							</tr>
							<tr>
								<td bgcolor="#FFFFFF" align="left">«Œ »«—</td>
								<td bgcolor="#FFFFFF" width="80%">
								&nbsp;<%=rs("exam4")%></td>
							</tr>
							<tr>
								<td bgcolor="#FFFFFF" align="left">‰Â«Ì…</td>
								<td bgcolor="#FFFFFF" width="80%">
								&nbsp;<%=rs("mark4")%></td>
							</tr>
							<tr>
								<td bgcolor="#0000FF"><font color="#FFFFFF"> —»Ì… »œ‰Ì…</font></td>
								<td width="80%" bgcolor="#0000FF">&nbsp;</td>
							</tr>
							<tr>
								<td bgcolor="#FFFFFF" align="left">√⁄„«·</td>
								<td bgcolor="#FFFFFF" width="80%">
								&nbsp;<%=rs("work5")%></td>
							</tr>
							<tr>
								<td bgcolor="#FFFFFF" align="left">«Œ »«—</td>
								<td bgcolor="#FFFFFF" width="80%">
								&nbsp;<%=rs("exam5")%></td>
							</tr>
							<tr>
								<td bgcolor="#FFFFFF" align="left">‰Â«Ì…</td>
								<td bgcolor="#FFFFFF" width="80%">
								&nbsp;<%=rs("mark5")%></td>
							</tr>
							<tr>
								<td bgcolor="#0000FF"><font color="#FFFFFF">«·„⁄·Ê„« Ì… Êÿ—ﬁ «·»ÕÀ</font></td>
								<td bgcolor="#0000FF" width="80%">
								&nbsp;</td>
							</tr>
							<tr>
								<td bgcolor="#FFFFFF" align="left">√⁄„«·</td>
								<td bgcolor="#FFFFFF" width="80%">
								&nbsp;<%=rs("work6")%></td>
							</tr>
							<tr>
								<td bgcolor="#FFFFFF" align="left">«Œ »«—</td>
								<td bgcolor="#FFFFFF" width="80%">
								&nbsp;<%=rs("exam6")%></td>
							</tr>
							<tr>
								<td bgcolor="#FFFFFF" align="left" height="24">‰Â«Ì…</td>
								<td bgcolor="#FFFFFF" width="80%" height="24">
								&nbsp;<%=rs("mark6")%></td>
							</tr>
							<tr>
								<td bgcolor="#0000FF"><font color="#FFFFFF">—Ì«÷Ì« </font></td>
								<td width="80%" bgcolor="#0000FF">&nbsp;</td>
							</tr>
							<tr>
								<td bgcolor="#FFFFFF" align="left">√⁄„«·</td>
								<td bgcolor="#FFFFFF" width="80%">
								&nbsp;<%=rs("work7")%></td>
							</tr>
							<tr>
								<td bgcolor="#FFFFFF" align="left">«Œ »«—</td>
								<td bgcolor="#FFFFFF" width="80%">
								&nbsp;<%=rs("exam7")%></td>
							</tr>
							<tr>
								<td bgcolor="#FFFFFF" align="left">‰Â«Ì…</td>
								<td bgcolor="#FFFFFF" width="80%">
								&nbsp;<%=rs("mark7")%></td>
							</tr>
							<tr>
								<td bgcolor="#0000FF"><font color="#FFFFFF">›Ì“Ì«¡</font></td>
								<td bgcolor="#0000FF" width="80%">
								&nbsp;</td>
							</tr>							
							<tr>
								<td bgcolor="#FFFFFF" align="left">√⁄„«·</td>
								<td bgcolor="#FFFFFF" width="80%">
								&nbsp;<%=rs("work8")%></td>
							</tr>
							<tr>
								<td bgcolor="#FFFFFF" align="left">«Œ »«—</td>
								<td bgcolor="#FFFFFF" width="80%">
								&nbsp;<%=rs("exam8")%></td>
							</tr>
							<tr>
								<td bgcolor="#FFFFFF" align="left">‰Â«Ì…</td>
								<td bgcolor="#FFFFFF" width="80%">
								&nbsp;<%=rs("mark8")%></td>
							</tr>
							<tr>
								<td bgcolor="#0000FF"><font color="#FFFFFF">ﬂÌ„Ì«¡</font></td>
								<td width="80%" bgcolor="#0000FF">&nbsp;</td>
							</tr>
							<tr>
								<td bgcolor="#FFFFFF" align="left">√⁄„«·</td>
								<td bgcolor="#FFFFFF" width="80%">
								&nbsp;<%=rs("work9")%></td>
							</tr>
							<tr>
								<td bgcolor="#FFFFFF" align="left">«Œ »«—</td>
								<td bgcolor="#FFFFFF" width="80%">
								&nbsp;<%=rs("exam9")%></td>
							</tr>
							<tr>
								<td bgcolor="#FFFFFF" align="left">‰Â«Ì…</td>
								<td bgcolor="#FFFFFF" width="80%">
								&nbsp;<%=rs("mark9")%></td>
							</tr>
							<tr>
								<td bgcolor="#0000FF"><font color="#FFFFFF">
								«ÕÌ«¡</font></td>
								<td bgcolor="#0000FF" width="80%">
								&nbsp;</td>
							</tr>
							<tr>
								<td bgcolor="#FFFFFF" align="left">√⁄„«·</td>
								<td bgcolor="#FFFFFF" width="80%">
								&nbsp;<%=rs("work10")%></td>
							</tr>
							<tr>
								<td bgcolor="#FFFFFF" align="left">«Œ »«—</td>
								<td bgcolor="#FFFFFF" width="80%">
								&nbsp;<%=rs("exam10")%></td>
							</tr>
							<tr>
								<td bgcolor="#FFFFFF" align="left">‰Â«Ì…</td>
								<td bgcolor="#FFFFFF" width="80%">
								&nbsp;<%=rs("mark10")%></td>
							</tr>
							<tr>
								<td bgcolor="#0000FF"><font color="#FFFFFF">ÃÌÊ·ÊÃÌ«</font></td>
								<td width="80%" bgcolor="#0000FF">&nbsp;</td>
							</tr>
							<tr>
								<td bgcolor="#FFFFFF" align="left">√⁄„«·</td>
								<td bgcolor="#FFFFFF" width="80%">
								&nbsp;<%=rs("work11")%></td>
							</tr>
							<tr>
								<td bgcolor="#FFFFFF" align="left">«Œ »«—</td>
								<td bgcolor="#FFFFFF" width="80%">
								&nbsp;<%=rs("exam11")%></td>
							</tr>
							<tr>
								<td bgcolor="#FFFFFF" align="left">‰Â«Ì…</td>
								<td bgcolor="#FFFFFF" width="80%">
								&nbsp;<%=rs("mark11")%></td>
							</tr>
							<tr>
								<td bgcolor="#0000FF"><font color="#FFFFFF">
								«Œ Ì«— «·Õ— 1</font></td>
								<td bgcolor="#0000FF" width="80%">
								&nbsp;</td>
							</tr>
							<tr>
								<td bgcolor="#FFFFFF" align="left">√⁄„«·</td>
								<td bgcolor="#FFFFFF" width="80%">
								&nbsp;<%=rs("work12")%></td>
							</tr>
							<tr>
								<td bgcolor="#FFFFFF" align="left">«Œ »«—</td>
								<td bgcolor="#FFFFFF" width="80%">
								&nbsp;<%=rs("exam12")%></td>
							</tr>
							<tr>
								<td bgcolor="#FFFFFF" align="left">‰Â«Ì…</td>
								<td bgcolor="#FFFFFF" width="80%">
								&nbsp;<%=rs("mark12")%></td>
							</tr>
							<tr>
								<td bgcolor="#0000FF"><font color="#FFFFFF">«Œ Ì«— «·Õ—2</font></td>
								<td width="80%" bgcolor="#0000FF">&nbsp;</td>
							</tr>
							
							<tr>
								<td bgcolor="#FFFFFF" align="left">√⁄„«·</td>
								<td bgcolor="#FFFFFF" width="80%">
								&nbsp;<%=rs("work13")%></td>
							</tr>
							<tr>
								<td bgcolor="#FFFFFF" align="left">«Œ »«—</td>
								<td bgcolor="#FFFFFF" width="80%">
								&nbsp;<%=rs("exam13")%></td>
							</tr>
							<tr>
								<td bgcolor="#FFFFFF" align="left">‰Â«Ì…</td>
								<td bgcolor="#FFFFFF" width="80%">
								&nbsp;<%=rs("mark13")%></td>
							</tr>
							
						</table>
						<br>
					<%End if%>

					<%if Class_ID = "Class12a" then%>
					
						<table border="1" width="100%" style="border-collapse: collapse">
							<tr>
								<td bgcolor="#0000FF"><font color="#FFFFFF">ﬁ—¬‰ ﬂ—Ì„</font></td>
								<td width="80%" bgcolor="#0000FF">
								&nbsp;</td>
							</tr>
							<tr>
								<td bgcolor="#FFFFFF" align="left">√⁄„«·</td>
								<td bgcolor="#FFFFFF" width="80%">
								&nbsp;<%=rs("work1")%></td>
							</tr>
							<tr>
								<td bgcolor="#FFFFFF" align="left">«Œ »«—</td>
								<td bgcolor="#FFFFFF" width="80%">
								&nbsp;<%=rs("exam1")%></td>
							</tr>
							<tr>
								<td bgcolor="#FFFFFF" align="left">‰Â«Ì…</td>
								<td bgcolor="#FFFFFF" width="80%">
								&nbsp;<%=rs("mark1")%></td>
							</tr>
							<tr>
								<td bgcolor="#0000FF"><font color="#FFFFFF">
								 —»Ì… «”·«„Ì…</font></td>
								<td bgcolor="#0000FF" width="80%">
								&nbsp;</td>
							</tr>
							<tr>
								<td bgcolor="#FFFFFF" align="left">√⁄„«·</td>
								<td bgcolor="#FFFFFF" width="80%">
								&nbsp;<%=rs("work2")%></td>
							</tr>
							<tr>
								<td bgcolor="#FFFFFF" align="left">«Œ »«—</td>
								<td bgcolor="#FFFFFF" width="80%">
								&nbsp;<%=rs("exam2")%></td>
							</tr>
							<tr>
								<td bgcolor="#FFFFFF" align="left">‰Â«Ì…</td>
								<td bgcolor="#FFFFFF" width="80%">
								&nbsp;<%=rs("mark2")%></td>
							</tr>
							<tr>
								<td bgcolor="#0000FF"><font color="#FFFFFF">·€… ⁄—»Ì…</font></td>
								<td width="80%" bgcolor="#0000FF">&nbsp;</td>
							</tr>
							<tr>
								<td bgcolor="#FFFFFF" align="left">√⁄„«·</td>
								<td bgcolor="#FFFFFF" width="80%">
								&nbsp;<%=rs("work3")%></td>
							</tr>
							<tr>
								<td bgcolor="#FFFFFF" align="left">«Œ »«—</td>
								<td bgcolor="#FFFFFF" width="80%">
								&nbsp;<%=rs("exam3")%></td>
							</tr>
							<tr>
								<td bgcolor="#FFFFFF" align="left">‰Â«Ì…</td>
								<td bgcolor="#FFFFFF" width="80%">
								&nbsp;<%=rs("mark3")%></td>
							</tr>
							<tr>
								<td bgcolor="#0000FF"><font color="#FFFFFF">·€… 
								«‰Ã·Ì“Ì…</font></td>
								<td bgcolor="#0000FF" width="80%">
								&nbsp;</td>
							</tr>
							<tr>
								<td bgcolor="#FFFFFF" align="left">√⁄„«·</td>
								<td bgcolor="#FFFFFF" width="80%">
								&nbsp;<%=rs("work4")%></td>
							</tr>
							<tr>
								<td bgcolor="#FFFFFF" align="left">«Œ »«—</td>
								<td bgcolor="#FFFFFF" width="80%">
								&nbsp;<%=rs("exam4")%></td>
							</tr>
							<tr>
								<td bgcolor="#FFFFFF" align="left">‰Â«Ì…</td>
								<td bgcolor="#FFFFFF" width="80%">
								&nbsp;<%=rs("mark4")%></td>
							</tr>
							<tr>
								<td bgcolor="#0000FF"><font color="#FFFFFF">«·—Ì«÷Ì«  Ê«·≈Õ’«¡</font></td>
								<td width="80%" bgcolor="#0000FF">&nbsp;</td>
							</tr>
							<tr>
								<td bgcolor="#FFFFFF" align="left">√⁄„«·</td>
								<td bgcolor="#FFFFFF" width="80%">
								&nbsp;<%=rs("work5")%></td>
							</tr>
							<tr>
								<td bgcolor="#FFFFFF" align="left">«Œ »«—</td>
								<td bgcolor="#FFFFFF" width="80%">
								&nbsp;<%=rs("exam5")%></td>
							</tr>
							<tr>
								<td bgcolor="#FFFFFF" align="left">‰Â«Ì…</td>
								<td bgcolor="#FFFFFF" width="80%">
								&nbsp;<%=rs("mark5")%></td>
							</tr>
							<tr>
								<td bgcolor="#0000FF"><font color="#FFFFFF">
								 —»Ì… »œ‰Ì…</font></td>
								<td bgcolor="#0000FF" width="80%">
								&nbsp;</td>
							</tr>
							<tr>
								<td bgcolor="#FFFFFF" align="left">√⁄„«·</td>
								<td bgcolor="#FFFFFF" width="80%">
								&nbsp;<%=rs("work6")%></td>
							</tr>
							<tr>
								<td bgcolor="#FFFFFF" align="left">«Œ »«—</td>
								<td bgcolor="#FFFFFF" width="80%">
								&nbsp;<%=rs("exam6")%></td>
							</tr>
							<tr>
								<td bgcolor="#FFFFFF" align="left" height="24">‰Â«Ì…</td>
								<td bgcolor="#FFFFFF" width="80%" height="24">
								&nbsp;<%=rs("mark6")%></td>
							</tr>
							<tr>
								<td bgcolor="#0000FF"><font color="#FFFFFF">«·„⁄·Ê„« Ì… Êÿ—ﬁ «·»ÕÀ</font></td>
								<td width="80%" bgcolor="#0000FF">&nbsp;</td>
							</tr>
							<tr>
								<td bgcolor="#FFFFFF" align="left">√⁄„«·</td>
								<td bgcolor="#FFFFFF" width="80%">
								&nbsp;<%=rs("work7")%></td>
							</tr>
							<tr>
								<td bgcolor="#FFFFFF" align="left">«Œ »«—</td>
								<td bgcolor="#FFFFFF" width="80%">
								&nbsp;<%=rs("exam7")%></td>
							</tr>
							<tr>
								<td bgcolor="#FFFFFF" align="left">‰Â«Ì…</td>
								<td bgcolor="#FFFFFF" width="80%">
								&nbsp;<%=rs("mark7")%></td>
							</tr>
							<tr>
								<td bgcolor="#0000FF"><font color="#FFFFFF">
								«·œ” Ê— ÊÕﬁÊﬁ «·≈‰”«‰</font></td>
								<td bgcolor="#0000FF" width="80%">
								&nbsp;</td>
							</tr>							
							<tr>
								<td bgcolor="#FFFFFF" align="left">√⁄„«·</td>
								<td bgcolor="#FFFFFF" width="80%">
								&nbsp;<%=rs("work8")%></td>
							</tr>
							<tr>
								<td bgcolor="#FFFFFF" align="left">«Œ »«—</td>
								<td bgcolor="#FFFFFF" width="80%">
								&nbsp;<%=rs("exam8")%></td>
							</tr>
							<tr>
								<td bgcolor="#FFFFFF" align="left">‰Â«Ì…</td>
								<td bgcolor="#FFFFFF" width="80%">
								&nbsp;<%=rs("mark8")%></td>
							</tr>
							<tr>
								<td bgcolor="#0000FF"><font color="#FFFFFF">
								 «—ÌŒ</font></td>
								<td width="80%" bgcolor="#0000FF">&nbsp;</td>
							</tr>
							<tr>
								<td bgcolor="#FFFFFF" align="left">√⁄„«·</td>
								<td bgcolor="#FFFFFF" width="80%">
								&nbsp;<%=rs("work9")%></td>
							</tr>
							<tr>
								<td bgcolor="#FFFFFF" align="left">«Œ »«—</td>
								<td bgcolor="#FFFFFF" width="80%">
								&nbsp;<%=rs("exam9")%></td>
							</tr>
							<tr>
								<td bgcolor="#FFFFFF" align="left">‰Â«Ì…</td>
								<td bgcolor="#FFFFFF" width="80%">
								&nbsp;<%=rs("mark9")%></td>
							</tr>
							<tr>
								<td bgcolor="#0000FF"><font color="#FFFFFF">
								Ã€—«›Ì«</font></td>
								<td bgcolor="#0000FF" width="80%">
								&nbsp;</td>
							</tr>
							<tr>
								<td bgcolor="#FFFFFF" align="left">√⁄„«·</td>
								<td bgcolor="#FFFFFF" width="80%">
								&nbsp;<%=rs("work10")%></td>
							</tr>
							<tr>
								<td bgcolor="#FFFFFF" align="left">«Œ »«—</td>
								<td bgcolor="#FFFFFF" width="80%">
								&nbsp;<%=rs("exam10")%></td>
							</tr>
							<tr>
								<td bgcolor="#FFFFFF" align="left">‰Â«Ì…</td>
								<td bgcolor="#FFFFFF" width="80%">
								&nbsp;<%=rs("mark10")%></td>
							</tr>
							<tr>
								<td bgcolor="#0000FF"><font color="#FFFFFF">
								«·›·”›…</font></td>
								<td width="80%" bgcolor="#0000FF">&nbsp;</td>
							</tr>
							<tr>
								<td bgcolor="#FFFFFF" align="left">√⁄„«·</td>
								<td bgcolor="#FFFFFF" width="80%">
								&nbsp;<%=rs("work11")%></td>
							</tr>
							<tr>
								<td bgcolor="#FFFFFF" align="left">«Œ »«—</td>
								<td bgcolor="#FFFFFF" width="80%">
								&nbsp;<%=rs("exam11")%></td>
							</tr>
							<tr>
								<td bgcolor="#FFFFFF" align="left">‰Â«Ì…</td>
								<td bgcolor="#FFFFFF" width="80%">
								&nbsp;<%=rs("mark11")%></td>
							</tr>
							<tr>
								<td bgcolor="#0000FF"><font color="#FFFFFF">·€… 
								›—‰”Ì…</font></td>
								<td bgcolor="#0000FF" width="80%">
								&nbsp;</td>
							</tr>
							<tr>
								<td bgcolor="#FFFFFF" align="left">√⁄„«·</td>
								<td bgcolor="#FFFFFF" width="80%">
								&nbsp;<%=rs("work12")%></td>
							</tr>
							<tr>
								<td bgcolor="#FFFFFF" align="left">«Œ »«—</td>
								<td bgcolor="#FFFFFF" width="80%">
								&nbsp;<%=rs("exam12")%></td>
							</tr>
							<tr>
								<td bgcolor="#FFFFFF" align="left">‰Â«Ì…</td>
								<td bgcolor="#FFFFFF" width="80%">
								&nbsp;<%=rs("mark12")%></td>
							</tr>
							<tr>
								<td bgcolor="#0000FF"><font color="#FFFFFF">«Œ Ì«— «·Õ—1</font></td>
								<td width="80%" bgcolor="#0000FF">&nbsp;</td>
							</tr>
							<tr>
								<td bgcolor="#FFFFFF" align="left">√⁄„«·</td>
								<td bgcolor="#FFFFFF" width="80%">
								&nbsp;<%=rs("work13")%></td>
							</tr>
							<tr>
								<td bgcolor="#FFFFFF" align="left">«Œ »«—</td>
								<td bgcolor="#FFFFFF" width="80%">
								&nbsp;<%=rs("exam13")%></td>
							</tr>
							<tr>
								<td bgcolor="#FFFFFF" align="left">‰Â«Ì…</td>
								<td bgcolor="#FFFFFF" width="80%">
								&nbsp;<%=rs("mark13")%></td>
							</tr>
							<tr>
								<td bgcolor="#0000FF"><font color="#FFFFFF">«Œ Ì«— «·Õ—2</font></td>
								<td width="80%" bgcolor="#0000FF">&nbsp;</td>
							</tr>
							
							<tr>
								<td bgcolor="#FFFFFF" align="left">√⁄„«·</td>
								<td bgcolor="#FFFFFF" width="80%">
								&nbsp;<%=rs("work14")%></td>
							</tr>
							<tr>
								<td bgcolor="#FFFFFF" align="left">«Œ »«—</td>
								<td bgcolor="#FFFFFF" width="80%">
								&nbsp;<%=rs("exam14")%></td>
							</tr>
							<tr>
								<td bgcolor="#FFFFFF" align="left">‰Â«Ì…</td>
								<td bgcolor="#FFFFFF" width="80%">
								&nbsp;<%=rs("mark14")%></td>
							</tr>
							
						</table>
						<br>
					<%End if%>
					
					<%if Class_ID = "Class12e" then%>
					
						<table border="1" width="100%" style="border-collapse: collapse">
							<tr>
								<td bgcolor="#0000FF"><font color="#FFFFFF">ﬁ—¬‰ ﬂ—Ì„</font></td>
								<td width="80%" bgcolor="#0000FF">
								&nbsp;</td>
							</tr>
							<tr>
								<td bgcolor="#FFFFFF" align="left">√⁄„«·</td>
								<td bgcolor="#FFFFFF" width="80%">
								&nbsp;<%=rs("work1")%></td>
							</tr>
							<tr>
								<td bgcolor="#FFFFFF" align="left">«Œ »«—</td>
								<td bgcolor="#FFFFFF" width="80%">
								&nbsp;<%=rs("exam1")%></td>
							</tr>
							<tr>
								<td bgcolor="#FFFFFF" align="left">‰Â«Ì…</td>
								<td bgcolor="#FFFFFF" width="80%">
								&nbsp;<%=rs("mark1")%></td>
							</tr>
							<tr>
								<td bgcolor="#0000FF"><font color="#FFFFFF">
								 —»Ì… «”·«„Ì…</font></td>
								<td bgcolor="#0000FF" width="80%">
								&nbsp;</td>
							</tr>
							<tr>
								<td bgcolor="#FFFFFF" align="left">√⁄„«·</td>
								<td bgcolor="#FFFFFF" width="80%">
								&nbsp;<%=rs("work2")%></td>
							</tr>
							<tr>
								<td bgcolor="#FFFFFF" align="left">«Œ »«—</td>
								<td bgcolor="#FFFFFF" width="80%">
								&nbsp;<%=rs("exam2")%></td>
							</tr>
							<tr>
								<td bgcolor="#FFFFFF" align="left">‰Â«Ì…</td>
								<td bgcolor="#FFFFFF" width="80%">
								&nbsp;<%=rs("mark2")%></td>
							</tr>
							<tr>
								<td bgcolor="#0000FF"><font color="#FFFFFF">·€… ⁄—»Ì…</font></td>
								<td width="80%" bgcolor="#0000FF">&nbsp;</td>
							</tr>
							<tr>
								<td bgcolor="#FFFFFF" align="left">√⁄„«·</td>
								<td bgcolor="#FFFFFF" width="80%">
								&nbsp;<%=rs("work3")%></td>
							</tr>
							<tr>
								<td bgcolor="#FFFFFF" align="left">«Œ »«—</td>
								<td bgcolor="#FFFFFF" width="80%">
								&nbsp;<%=rs("exam3")%></td>
							</tr>
							<tr>
								<td bgcolor="#FFFFFF" align="left">‰Â«Ì…</td>
								<td bgcolor="#FFFFFF" width="80%">
								&nbsp;<%=rs("mark3")%></td>
							</tr>
							<tr>
								<td bgcolor="#0000FF"><font color="#FFFFFF">·€… 
								«‰Ã·Ì“Ì…</font></td>
								<td bgcolor="#0000FF" width="80%">
								&nbsp;</td>
							</tr>
							<tr>
								<td bgcolor="#FFFFFF" align="left">√⁄„«·</td>
								<td bgcolor="#FFFFFF" width="80%">
								&nbsp;<%=rs("work4")%></td>
							</tr>
							<tr>
								<td bgcolor="#FFFFFF" align="left">«Œ »«—</td>
								<td bgcolor="#FFFFFF" width="80%">
								&nbsp;<%=rs("exam4")%></td>
							</tr>
							<tr>
								<td bgcolor="#FFFFFF" align="left">‰Â«Ì…</td>
								<td bgcolor="#FFFFFF" width="80%">
								&nbsp;<%=rs("mark4")%></td>
							</tr>
							<tr>
								<td bgcolor="#0000FF"><font color="#FFFFFF">«·—Ì«÷Ì«  Ê«·≈Õ’«¡</font></td>
								<td width="80%" bgcolor="#0000FF">&nbsp;</td>
							</tr>
							<tr>
								<td bgcolor="#FFFFFF" align="left">√⁄„«·</td>
								<td bgcolor="#FFFFFF" width="80%">
								&nbsp;<%=rs("work5")%></td>
							</tr>
							<tr>
								<td bgcolor="#FFFFFF" align="left">«Œ »«—</td>
								<td bgcolor="#FFFFFF" width="80%">
								&nbsp;<%=rs("exam5")%></td>
							</tr>
							<tr>
								<td bgcolor="#FFFFFF" align="left">‰Â«Ì…</td>
								<td bgcolor="#FFFFFF" width="80%">
								&nbsp;<%=rs("mark5")%></td>
							</tr>
							<tr>
								<td bgcolor="#0000FF"><font color="#FFFFFF">
								 —»Ì… »œ‰Ì…</font></td>
								<td bgcolor="#0000FF" width="80%">
								&nbsp;</td>
							</tr>
							<tr>
								<td bgcolor="#FFFFFF" align="left">√⁄„«·</td>
								<td bgcolor="#FFFFFF" width="80%">
								&nbsp;<%=rs("work6")%></td>
							</tr>
							<tr>
								<td bgcolor="#FFFFFF" align="left">«Œ »«—</td>
								<td bgcolor="#FFFFFF" width="80%">
								&nbsp;<%=rs("exam6")%></td>
							</tr>
							<tr>
								<td bgcolor="#FFFFFF" align="left" height="24">‰Â«Ì…</td>
								<td bgcolor="#FFFFFF" width="80%" height="24">
								&nbsp;<%=rs("mark6")%></td>
							</tr>
							<tr>
								<td bgcolor="#0000FF"><font color="#FFFFFF">«·„⁄·Ê„« Ì… Êÿ—ﬁ «·»ÕÀ</font></td>
								<td width="80%" bgcolor="#0000FF">&nbsp;</td>
							</tr>
							<tr>
								<td bgcolor="#FFFFFF" align="left">√⁄„«·</td>
								<td bgcolor="#FFFFFF" width="80%">
								&nbsp;<%=rs("work7")%></td>
							</tr>
							<tr>
								<td bgcolor="#FFFFFF" align="left">«Œ »«—</td>
								<td bgcolor="#FFFFFF" width="80%">
								&nbsp;<%=rs("exam7")%></td>
							</tr>
							<tr>
								<td bgcolor="#FFFFFF" align="left">‰Â«Ì…</td>
								<td bgcolor="#FFFFFF" width="80%">
								&nbsp;<%=rs("mark7")%></td>
							</tr>
							<tr>
								<td bgcolor="#0000FF"><span lang="ar-kw">
								<font color="#FFFFFF">«·œ” Ê— ÊÕﬁÊﬁ «·≈‰”«‰</font></span></td>
								<td bgcolor="#0000FF" width="80%">
								&nbsp;</td>
							</tr>							
							<tr>
								<td bgcolor="#FFFFFF" align="left">√⁄„«·</td>
								<td bgcolor="#FFFFFF" width="80%">
								&nbsp;<%=rs("work8")%></td>
							</tr>
							<tr>
								<td bgcolor="#FFFFFF" align="left">«Œ »«—</td>
								<td bgcolor="#FFFFFF" width="80%">
								&nbsp;<%=rs("exam8")%></td>
							</tr>
							<tr>
								<td bgcolor="#FFFFFF" align="left">‰Â«Ì…</td>
								<td bgcolor="#FFFFFF" width="80%">
								&nbsp;<%=rs("mark8")%></td>
							</tr>
							<tr>
								<td bgcolor="#0000FF"><span lang="ar-kw">
								<font color="#FFFFFF">—Ì«÷Ì« </font></span></td>
								<td width="80%" bgcolor="#0000FF">&nbsp;</td>
							</tr>
							<tr>
								<td bgcolor="#FFFFFF" align="left">√⁄„«·</td>
								<td bgcolor="#FFFFFF" width="80%">
								&nbsp;<%=rs("work9")%></td>
							</tr>
							<tr>
								<td bgcolor="#FFFFFF" align="left">«Œ »«—</td>
								<td bgcolor="#FFFFFF" width="80%">
								&nbsp;<%=rs("exam9")%></td>
							</tr>
							<tr>
								<td bgcolor="#FFFFFF" align="left">‰Â«Ì…</td>
								<td bgcolor="#FFFFFF" width="80%">
								&nbsp;<%=rs("mark9")%></td>
							</tr>
							<tr>
								<td bgcolor="#0000FF"><span lang="ar-kw">
								<font color="#FFFFFF">ﬂÌ„Ì«¡</font></span></td>
								<td bgcolor="#0000FF" width="80%">
								&nbsp;</td>
							</tr>
							<tr>
								<td bgcolor="#FFFFFF" align="left">√⁄„«·</td>
								<td bgcolor="#FFFFFF" width="80%">
								&nbsp;<%=rs("work10")%></td>
							</tr>
							<tr>
								<td bgcolor="#FFFFFF" align="left">«Œ »«—</td>
								<td bgcolor="#FFFFFF" width="80%">
								&nbsp;<%=rs("exam10")%></td>
							</tr>
							<tr>
								<td bgcolor="#FFFFFF" align="left">‰Â«Ì…</td>
								<td bgcolor="#FFFFFF" width="80%">
								&nbsp;<%=rs("mark10")%></td>
							</tr>
							<tr>
								<td bgcolor="#0000FF"><span lang="ar-kw">
								<font color="#FFFFFF">›Ì“Ì«¡</font></span></td>
								<td width="80%" bgcolor="#0000FF">&nbsp;</td>
							</tr>
							<tr>
								<td bgcolor="#FFFFFF" align="left">√⁄„«·</td>
								<td bgcolor="#FFFFFF" width="80%">
								&nbsp;<%=rs("work11")%></td>
							</tr>
							<tr>
								<td bgcolor="#FFFFFF" align="left">«Œ »«—</td>
								<td bgcolor="#FFFFFF" width="80%">
								&nbsp;<%=rs("exam11")%></td>
							</tr>
							<tr>
								<td bgcolor="#FFFFFF" align="left">‰Â«Ì…</td>
								<td bgcolor="#FFFFFF" width="80%">
								&nbsp;<%=rs("mark11")%></td>
							</tr>
							<tr>
								<td bgcolor="#0000FF"><span lang="ar-kw">
								<font color="#FFFFFF">«ÕÌ«¡</font></span></td>
								<td bgcolor="#0000FF" width="80%">
								&nbsp;</td>
							</tr>
							<tr>
								<td bgcolor="#FFFFFF" align="left">√⁄„«·</td>
								<td bgcolor="#FFFFFF" width="80%">
								&nbsp;<%=rs("work12")%></td>
							</tr>
							<tr>
								<td bgcolor="#FFFFFF" align="left">«Œ »«—</td>
								<td bgcolor="#FFFFFF" width="80%">
								&nbsp;<%=rs("exam12")%></td>
							</tr>
							<tr>
								<td bgcolor="#FFFFFF" align="left">‰Â«Ì…</td>
								<td bgcolor="#FFFFFF" width="80%">
								&nbsp;<%=rs("mark12")%></td>
							</tr>
							<tr>
								<td bgcolor="#0000FF"><font color="#FFFFFF">«Œ Ì«— «·Õ—<span lang="ar-kw">1</span></font></td>
								<td width="80%" bgcolor="#0000FF">&nbsp;</td>
							</tr>
							<tr>
								<td bgcolor="#FFFFFF" align="left">√⁄„«·</td>
								<td bgcolor="#FFFFFF" width="80%">
								&nbsp;<%=rs("work13")%></td>
							</tr>
							<tr>
								<td bgcolor="#FFFFFF" align="left">«Œ »«—</td>
								<td bgcolor="#FFFFFF" width="80%">
								&nbsp;<%=rs("exam13")%></td>
							</tr>
							<tr>
								<td bgcolor="#FFFFFF" align="left">‰Â«Ì…</td>
								<td bgcolor="#FFFFFF" width="80%">
								&nbsp;<%=rs("mark13")%></td>
							</tr>
							<tr>
								<td bgcolor="#0000FF"><font color="#FFFFFF">«Œ Ì«— «·Õ—<span lang="ar-kw">2</span></font></td>
								<td width="80%" bgcolor="#0000FF">&nbsp;</td>
							</tr>
							
							<tr>
								<td bgcolor="#FFFFFF" align="left">√⁄„«·</td>
								<td bgcolor="#FFFFFF" width="80%">
								&nbsp;<%=rs("work14")%></td>
							</tr>
							<tr>
								<td bgcolor="#FFFFFF" align="left">«Œ »«—</td>
								<td bgcolor="#FFFFFF" width="80%">
								&nbsp;<%=rs("exam14")%></td>
							</tr>
							<tr>
								<td bgcolor="#FFFFFF" align="left">‰Â«Ì…</td>
								<td bgcolor="#FFFFFF" width="80%">
								&nbsp;<%=rs("mark14")%></td>
							</tr>
							
						</table>
						<br>
					<%End if%>

			</td>
			</tr>
			<tr>
				<td>
				<p align="left">
				<br><br>
				<a href="results.asp">⁄Êœ… ··Œ·›
				--></a>
				</p>
				</p>
				</td>
			</tr>
			
			
		</table>
<%Else%>
	<%response.write "<p align='center'>·« ÌÊÃœ »Ì«‰«  „÷«›…</p>"%>

<%End if%>
<%
rs.close
set rs=nothing
conn.close
set conn=nothing
%>

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