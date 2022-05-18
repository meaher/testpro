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
uploadsDirVar = server.mappath("Vaccination_Files")
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
	Rs.open "select * from visit_Appointments " , Conn,1,2
		rs.addnew	
		rs("Full_name") = Upload.Form("Full_name")
		rs("mobile")=Upload.Form("mobile")
		rs("visit_reason")=Upload.Form("visit_reason")
		rs("Visit_Time")=Upload.Form("Visit_Time")
		
		rs("Reg_Date")=Date()
		rs("Day_Date")=Day(Upload.Form("Visit_Date"))
		rs("month_Date")=Month(Upload.Form("Visit_Date"))
		rs("Year_Date")=Year(Upload.Form("Visit_Date"))
	rs.update
	rs.close
	set rs=nothing	
	conn.close
	set conn=nothing
	session("ErrMsg")="Êã ÊÞÏíã ÇáØáÈ ÈäÌÇÍ - ÓäÞæã ÈãÑÇÌÚÉ ÇáØáÈ æÇáÑÏ Úáíßã ãä ÎáÇá ÑÓÇáÉ äÕíÉ ÈÇáãæÚÏ ÇáãÊæÝÑ"

	response.redirect "Visit_appointments.asp" 
	
elseif procType="edit" then
	Meeting_ID= Upload.Form("txtmeetingID")

	set Rs=server.createobject("ADODB.Recordset")
	Rs.open "select * from meeting where Meeting_ID="&Meeting_ID&" " , Conn,1,2

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
	response.redirect "meeting_list.asp?id="&Upload.Form("txthdnDptID")&"&start=1"
	
elseif procType="delete" then	
	Meeting_ID= Upload.Form("txtmeetingID")
	
	conn.execute "delete  from meeting where meeting_ID="&meeting_ID&" "
	session("ErrMsg")="Êã ÇáÍÐÝ "
	conn.close
	set conn=nothing
	response.redirect "meeting_list.asp?id="&Upload.Form("txthdnDptID")&"&start=1"	

end if
%>