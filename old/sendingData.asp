<%@ CodePage=1256 %>
<!-- #include file="includes/inc_db.asp" -->
<%
set conn=server.createobject("ADODB.Connection")
conn.open connstring
'i=1
'response.write 
Name	= Request.Form("T1")	
stClass = Request.Form("T2")
tot=0
set rss=server.createobject("ADODB.Recordset")
rss.open "select * from qu",conn,1,2
	for i=1 to 10
	response.write rss("an")

		ass = rss("an")
			if ass = Request.Form("R"&i) then
				tot= tot +1
			end if
		rss.movenext
	next
rss.close()

set rs=server.createobject("ADODB.Recordset")
rs.open "select * from students " ,conn ,1 ,2
	rs.addnew
	rs("stName")	= Name
	rs("stClass")	= stClass
	rs("Total")		= tot
	rs.update

set rs=nothing
conn.close
set conn=nothing
response.redirect "result.asp"

%>