<%=DateAdd("h",11,Date())-1%>
<br>
<%
response.write (Day(DateAdd("h",11,now())))
%>
<br>
<%
if hour(DateAdd("h",0,now())) >= 20 and hour(DateAdd("h",0,now())) <= 24 then
	response.write "new Date"
Else 
	response.write("normal date")
End if
%>