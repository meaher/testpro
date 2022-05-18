<div align="center">
	<table border="0" width="900" id="table1" height="222" cellspacing="0" cellpadding="0">
		<tr>
			<td height="142">
			<img border="0" src="Images/surra-header.gif" width="900" height="140"></td>
		</tr>
		<tr>
			<td>
			<p align="left">
		<a href="PageContent.asp?id=7">	<img border="0" src="Images/H.JPG" width="40" height="40"><img border="0" src="Images/call.jpg" width="40" height="40"><img border="0" src="Images/e.JPG" width="40" height="40"><img border="0" src="Images/t.jpg" width="40" height="40"><img border="0" src="Images/BloggerButton.JPG" width="40" height="40"><img border="0" src="Images/f.jpg" width="40" height="40"></a>
		
			</td>
		</tr>
		<tr>
			<td background="Images/a7dthaakhbaar.jpg" height="40%">
			<table border="0" width="100%" id="table2" height="34">
				<tr>
					<td width="126">&nbsp;</td>
					<td valign="top">
					<%
			Rss.open "Select * from News where NEWS_MP = True", conn
			If not Rss.eof then
				news = ""
				While not rss.eof
					news = news & "<a href='NewsDetails.asp?NewsID="& rss("News_ID")& "'>" & rss("NEWS_TITLE_EN") & "</a> &nbsp;<img height=20  src=images/staroffice.jpg>&nbsp;&nbsp;"
				rss.movenext
				wend
			Else
				news = ""
			end if
			rss.close
			%><marquee dir="rtl" direction=right scrolldelay="120"><%=news%></marquee>

					
					</td>
				</tr>
			</table>
			</td>
		</tr>
	</table>
</div>