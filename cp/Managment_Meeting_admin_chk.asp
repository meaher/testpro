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
uploadsDirVar = server.mappath("/Managment_Meets")
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
	Rs.open "select * from Managment_meeting" , Conn,1,2

	rs.addnew	
	rs("meeting_no")=Upload.Form("SelectMeeting_no")
	
	rs("meeting_subject")=Upload.Form("txtmeeting_subject")
	rs("Meeting_Date")=Upload.Form("txtMeeting_Date")
	
	rs("meeting_notes")=Upload.Form("txtmeeting_notes")
	rs("Meeting_File")=ArrImg(0)
	rs.update
	
	session("ErrMsg")="ÊãÊ ÇáÇÖÇÞÉ ÈäÌÇÍ"
	rs.close
	set rs=nothing	
	conn.close
	set conn=nothing
	response.redirect "Managment_Meeting_admin_list.asp?start=1" 
	
elseif procType="edit" then
	Meeting_ID= Upload.Form("txtmeetingID")

	set Rs=server.createobject("ADODB.Recordset")
	Rs.open "select * from Managment_meeting where Meeting_ID="&Meeting_ID&" " , Conn,1,2

	rs("meeting_subject")=Upload.Form("txtmeeting_subject")
	rs("Meeting_Date")=Upload.Form("txtMeeting_Date")
	rs("meeting_no")=Upload.Form("SelectMeeting_no")
	rs("meeting_notes")=Upload.Form("txtmeeting_notes")
	
	if ArrImg(0)="" then 
		rs("Meeting_File")=Upload.Form("txtHdnImg")
	else
		rs("Meeting_File")=ArrImg(0)
	end if
	
	rs.update
	
	session("ErrMsg")="Êã ÇáÊÚÏíá ÈäÌÇÍ"
	rs.close
	set rs=nothing	
	conn.close
	set conn=nothing
	response.redirect "Managment_Meeting_admin_list.asp?start=1"
	
elseif procType="delete" then	
	Meeting_ID= Upload.Form("txtmeetingID")
	
	conn.execute "delete  from Managment_meeting where meeting_ID="&meeting_ID&" "
	session("ErrMsg")="Êã ÇáÍÐÝ "
	conn.close
	set conn=nothing
	response.redirect "Managment_Meeting_admin_list.asp?start=1"	

end if
%>