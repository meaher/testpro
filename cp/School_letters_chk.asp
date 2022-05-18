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
uploadsDirVar = server.mappath("/School_Letters")
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
	Rs.open "select * from School_Letters" , Conn,1,2

	rs.addnew	
	rs("Subject")=Upload.Form("txtSubject")
	
	if Upload.Form("SelectDepartment")=0 then
		rs("Public_letter") = 0
		rs("Department_id") = -1
	Else
		rs("Public_letter") = 1
		rs("Department_id") = Upload.Form("SelectDepartment")
	end if
	
	rs("Letter_date")=Upload.Form("txtLetter_date")
	
	rs("notes")=Upload.Form("txtnotes")
	rs("File_letter")=ArrImg(0)
	rs.update
	
	session("ErrMsg")="ÊãÊ ÇáÇÖÇÞÉ ÈäÌÇÍ"
	rs.close
	set rs=nothing	
	conn.close
	set conn=nothing
	response.redirect "School_letters_admin_list.asp?start=1" 
	
elseif procType="edit" then
	Letter_ID= Upload.Form("txtLetterID")

	set Rs=server.createobject("ADODB.Recordset")
	Rs.open "select * from School_Letters where Letter_ID="&Letter_ID&" " , Conn,1,2
	
	if ArrImg(0)="" then 
		rs("File_Letter2")=Upload.Form("txtHdnImg")
	else
		rs("File_Letter2")=ArrImg(0)
	end if
	
	rs.update
	
	session("ErrMsg")="Êã ÇáÇÑÓÇá ÈäÌÇÍ"
	rs.close
	set rs=nothing	
	conn.close
	set conn=nothing
	response.redirect "School_letters_list.asp?start=1"
	
elseif procType="delete" then	
	Letter_ID= Upload.Form("txtLetterID")
	
	conn.execute "delete  from School_Letters where Letter_ID="&Letter_ID&" "
	session("ErrMsg")="Êã ÇáÍÐÝ "
	conn.close
	set conn=nothing
	response.redirect "School_letters_admin_List.asp?start=1"	

end if
%>