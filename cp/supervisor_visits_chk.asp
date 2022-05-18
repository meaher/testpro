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
uploadsDirVar = server.mappath("/visits_file")
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
	Rs.open "select * from supervisor_visits" , Conn,1,2

	rs.addnew	
	rs("Department_ID")=Upload.Form("txthdnDptID")
	rs("visit_no")=Upload.Form("visit_no")
	
	rs("subject")=Upload.Form("subject")
	rs("visit_Date")=Upload.Form("visit_Date")
	
	rs("visit_notes")=Upload.Form("visit_notes")
	rs("visit_File")=ArrImg(0)
	rs("Employee_id")=Upload.Form("Employee_id")
	rs("Class_Room_id")=Upload.Form("Class_Room_id")
	rs("day_date")=Day(Upload.Form("visit_Date"))
	rs("month_date")=month(Upload.Form("visit_Date"))
	rs("year_date")=year(Upload.Form("visit_Date"))
	
	rs.update
	
	session("ErrMsg")="ÊãÊ ÇáÇÖÇÞÉ ÈäÌÇÍ"
	rs.close
	set rs=nothing	
	conn.close
	set conn=nothing
	response.redirect "supervisor_visits_list.asp?id="&Upload.Form("txthdnDptID")&"&start=1" 
	
elseif procType="edit" then
	visit_ID= Upload.Form("txtvisitID")

	set Rs=server.createobject("ADODB.Recordset")
	Rs.open "select * from Supervisor_visits where Visit_ID="&Visit_ID&" " , Conn,1,2

	rs("visit_no")=Upload.Form("visit_no")
	
	rs("subject")=Upload.Form("subject")
	rs("visit_Date")=Upload.Form("visit_Date")
	
	rs("visit_notes")=Upload.Form("visit_notes")
	
	rs("Employee_id")=Upload.Form("Employee_id")
	rs("Class_Room_id")=Upload.Form("Class_Room_id")
	rs("day_date")=Day(Upload.Form("visit_Date"))
	rs("month_date")=month(Upload.Form("visit_Date"))
	rs("year_date")=year(Upload.Form("visit_Date"))
	
	if ArrImg(0)="" then 
		rs("visit_File")=Upload.Form("txtHdnImg")
	else
		rs("visit_File")=ArrImg(0)
	end if
	
	rs.update
	
	session("ErrMsg")="Êã ÇáÊÚÏíá ÈäÌÇÍ"
	rs.close
	set rs=nothing	
	conn.close
	set conn=nothing
	response.redirect "supervisor_visits_list.asp?id="&Upload.Form("txthdnDptID")&"&start=1"
	
elseif procType="delete" then	
	visit_ID= Upload.Form("txtvisitID")
	
	conn.execute "delete  from supervisor_visits where visit_ID="&visit_ID&" "
	session("ErrMsg")="Êã ÇáÍÐÝ "
	conn.close
	set conn=nothing
	response.redirect "supervisor_visits_list.asp?id="&Upload.Form("txthdnDptID")&"&start=1"	

end if
%>