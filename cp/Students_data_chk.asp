<%@ CodePage=1256 %>
<!-- #include file="portal_db.asp" -->
<!-- #include file="portal_upload.asp" -->

<%
set Conn=server.createobject("ADODB.Connection")
Conn.open ConnString

'''''''''''''''''''''''''''''''''''''''''''''''''''''''''
'Form Reader & Image setup
'''''''''''''''''''''''''''''''''''''''''''''''''''''''''
Response.Expires = -1
Server.ScriptTimeout = 600

Dim Upload, fileName, fileSize, ks, i, fileKey
Set Upload = New FreeASPUpload
uploadsDirVar = server.mappath("/PRODUCTS")
Upload.Save(uploadsDirVar)

ks = Upload.UploadedFiles.keys
dim ArrImg(3)
i=0

if (UBound(ks) <> -1) then
	for each fileKey in Upload.UploadedFiles.keys
	    ArrImg(i) = Upload.UploadedFiles(fileKey).FileName
	    i=i+1
	next
end if
''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
''''''''''''''''''''''''''''''''''''''''''''''''''''''''''

procType= Upload.Form("txtProcType")
if procType="add" then
	set Rs=server.createobject("ADODB.Recordset")
	set Rss=server.createobject("ADODB.Recordset")
	Rss.open "select * from Students where std_civil_id='"& Upload.Form("txtStd_Civil_ID") &"' " , Conn,1,2
	if Rss.eof then	
		Rs.open "select * from Students" , Conn,1,2
		rs.addnew	
			rs("Std_Number") = Upload.Form("txtStd_Number")
			rs("Std_Name") = Upload.Form("txtStd_Name")
			rs("Std_Civil_ID") = Upload.Form("txtStd_Civil_ID")
			rs("Class_Room_ID")=Upload.Form("txtClass_Room_ID")
			
		rs.update
	
		session("ErrMsg")="ÊãÊ ÇáÇÖÇÞÉ ÈäÌÇÍ"
		rs.close
	Else
			session("ErrMsg")="ÇáØÇáÈ ãÖÇÝ ãä ÞÈá"
	End if
	rss.close
	set rss=nothing
	set rs=nothing	
	conn.close
	set conn=nothing
	response.redirect "Students_data_list.asp?Class_Room_ID="&Upload.Form("txtClass_Room_ID")&"&Class_Room="&Upload.Form("txtClass_Room")&"" 
	
elseif procType="edit" then
	ID= Upload.Form("txtID")

	set Rs=server.createobject("ADODB.Recordset")
	Rs.open "select * from Students where ID="&ID&" " , Conn,1,2

			rs("Std_Number") = Upload.Form("txtStd_Number")
			rs("Std_Name") = Upload.Form("txtStd_Name")
			rs("Std_Civil_ID") = Upload.Form("txtStd_Civil_ID")
			rs("Class_Room_ID")=Upload.Form("sClass_Room_ID")
	rs.update
	
	session("ErrMsg")="Êã ÇáÊÚÏíá ÈäÌÇÍ"
	rs.close
	set rs=nothing	
	conn.close
	set conn=nothing
	response.redirect "Students_data_list.asp?Class_Room_ID="&Upload.Form("txtClass_Room_ID")&"&Class_Room="&Upload.Form("txtClass_Room")&"" 
	
elseif procType="delete" then	
	ID= Upload.Form("txtID")
	conn.execute "delete  from Students where ID="&ID&" "
	session("ErrMsg")="Êã ÇáÍÐÝ ÈäÌÇÍ"
	conn.close
	set conn=nothing
	response.redirect "Students_data_list.asp?Class_Room_ID="&Upload.Form("txtClass_Room_ID")&"&Class_Room="&Upload.Form("txtClass_Room")&"" 

end if
%>