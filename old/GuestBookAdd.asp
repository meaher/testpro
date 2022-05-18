<%@codepage=1256%>
<!-- #include file="db.asp" -->


<%
set conn=server.createobject("ADODB.Connection")
conn.open connstring

Country=Request.Form("tCountry")	
Name=Request.Form("tName")	
Email=Request.Form("tEmail")
body=Request.Form("sBody")

set rs=server.createobject("ADODB.Recordset")
rs.open "select * from GuestBook where FullName = '"&Name&"' and Email = '"&Email&"'" ,conn ,1 ,2
if rs.eof then
	rs.addnew
	rs("FullName")	= Name
	rs("Email")		= Email
	rs("Country")	= Country
	rs("Details")	= body
	rs("AddDate")	= Date()
	rs("AddTime")	= Time
	rs.update
else
	session("Add")="<font color=green>ÚĞÑÇğ ÊæÌÏ ãÔÇÑßÉ ÈåĞÇ ÇáÅÓã ãä ŞÈá</font>"
	response.redirect "GuestBook.asp"
end if
set rs=nothing
conn.close
set conn=nothing
session("ADD")="<font color=green>ÊãÊ ÇáÅÖÇİÉ ÈäÌÇÍ</font>"
response.redirect "GuestBookView.asp?start=1"
%>