<table border="0" id="table17">
				<tr>
					<td>
					<a href="default.asp">
					<img border="0" src="Images/b1.jpg" width="140" height="39" ></a></td>
				</tr>
				<tr>
					<td>
					<a href="PageContent.asp?id=6">
					<img border="0" src="Images/Resume.JPG" width="140" height="39"></a></td>
				</tr>
				<tr>
					<td>
					<a href="PageContent.asp?id=1">
					<img border="0" src="Images/b2.jpg" width="140" height="39" ></a></td>
				</tr>
				<tr>
					<td>
					<a href="PageContent.asp?id=2">
					<img border="0" src="Images/b3.jpg" width="140" height="39" ></a></td>
				</tr>
				<tr>
					<td>
					<a href="PageContent.asp?id=3">
					<img border="0" src="Images/b4.jpg" width="140" height="40" ></a></td>
				</tr>
				<tr>
					<td>
					<a href="PageContent.asp?id=4">
					<img border="0" src="Images/b5.jpg" width="140" height="40" ></a></td>
				</tr>
				<tr>
					<td>
					<a href="PageContent.asp?id=5">
					<img border="0" src="Images/b6.JPG" width="140" height="40" ></a></td>
				</tr>
				<tr>
					<td>
					<a href="PageContent.asp?id=8">
					<img border="0" src="Images/b8.JPG" width="140" height="40" ></a></td>
				</tr>
				<tr>
					<td>
					<a href="PageContent.asp?id=9">
					<img border="0" src="Images/b9.JPG" width="140" height="40" ></a></td>
				</tr>
				<tr>
					<td>
					<a href="NewsList.asp?start=1">
					<img border="0" src="Images/b7.JPG" width="140" height="40"></a></td>
				</tr>
				<tr>
					<td>
					</td>
				</tr>
				<tr>
					<td>
					
					</td>
				</tr>
				<tr>
					<td align="left">
				<p align="center">
<!-- hitwebcounter Code START -->
<a href="http://www.hitwebcounter.com/freecounterfeatures.php" target="_blank">
<img src="http://hitwebcounter.com/counter/counter.php?page=384253&style=0033&nbdigits=5&type=ip&initCount=0" title="blog counter" Alt="blog counter"   border="0" >
</a>
  
    
    </td>
				</tr>
				<tr>
					<td>
					<p align="center"><b>„ﬁ«·«  „Œ «—…</b></td>
				</tr>
				<%
				rs.open "select * from Article where MainPage=yes",conn
					if not rs.eof then
						while not rs.eof
					%>
					<tr>
						<td height="28">
						
							<p align=justify><font face="Times New Roman">&#9668;&nbsp;</font><u><a href=Article.asp?id=<%=rs("Article_ID")%>><%=rs("Subject")%></a></u></p>
							
						</td>
					</tr>
					<%
					rs.movenext
					wend
				end if
				rs.close
				%>
			</table>