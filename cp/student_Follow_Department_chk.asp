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
uploadsDirVar = server.mappath("/report_file")
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
	Rs.open "select * from student_behavior" , Conn,1,2

	rs.addnew	
	rs("Std_Civil_ID")=Upload.Form("Std_Civil_ID")
	rs("Class_Room_ID")=Upload.Form("Class_Room_ID")
	
	rs("Lecture_Time_ID")=Upload.Form("Lecture_Time_ID")
	rs("Subject_id")=0
	
	rs("Employee_id")=0
	rs("Department_id")=0
	rs("Smoking")=Upload.Form("Smoking")
	
	rs("sleeping")=Upload.Form("sleeping")
	rs("study_Tools")=Upload.Form("study_Tools")
	rs("not_Care")=Upload.Form("not_Care")
	
	rs("Get_out_of_Class")=Upload.Form("Get_out_of_Class")
	rs("Late_to_class")=Upload.Form("Late_to_class")
	rs("wrong_behavior")=Upload.Form("wrong_behavior")
	rs("refusal_instructions")=Upload.Form("refusal_instructions")
	rs("notes")=Upload.Form("notes")

	rs("report_Date")=session("myDate")
	rs("Report_Day")=Day(session("myDate"))
	rs("Report_month")=month(session("myDate"))
	rs("Report_year")=Year(session("myDate"))
	rs("Event_Date")=day(Upload.Form("Event_Date"))&"/"&month(Upload.Form("Event_Date"))&"/"&year(Upload.Form("Event_Date"))
	rs("Event_Day")=Day(Upload.Form("Event_Date"))
	rs("Event_month")=month(Upload.Form("Event_Date"))
	rs("Event_year")=Year(Upload.Form("Event_Date"))
	rs("Managment_done")="no"

	rs("report_file")=ArrImg(0)
	rs.update
	
	session("ErrMsg")="??? ??????? ?????"
	rs.close
	set rs=nothing	
	conn.close
	set conn=nothing
	response.redirect "student_behavior_Admin_list.asp?class_Room_id="&Upload.Form("Class_Room_id")&"&class_room="&Upload.Form("Class_Room")&"&start=1" 
	
elseif procType="edit" then
	ID= Upload.Form("id")

	set Rs=server.createobject("ADODB.Recordset")
	Rs.open "select * from Student_Follow where ID="&ID&" " , Conn,1,2
		rs("Managment_notes")=Upload.Form("managment_notes")
	
		rs("Managment_Date")=day(date())&"/"&month(date())&"/"&year(date())
		rs("Managment_Day")=Day(Date())
		rs("Managment_month")=month(Date())
		rs("Managment_year")=Year(Date())
		rs("Managment_done")="yes"
		
	rs.update
	
	session("ErrMsg")="?? ??????? ?????"
	rs.close
	set rs=nothing	
	conn.close
	set conn=nothing
	if Upload.Form("Follow_type")="1" then
		response.redirect "Student_Follow_P_Department_list.asp?id="&Upload.Form("deptid")&"&DeptName="&Upload.Form("Dept_name")&"&start=1" 
	Else
		response.redirect "Student_Follow_w_Department_list.asp?id="&Upload.Form("deptid")&"&DeptName="&Upload.Form("Dept_name")&"&start=1" 
	End if
	
elseif procType="delete" then	
	ID= Upload.Form("ID")
	
	conn.execute "delete  from Student_Behavior where ID="&ID&" "
	session("ErrMsg")="?? ????? "
	conn.close
	set conn=nothing
		response.redirect "student_behavior_list.asp?class_id="&Upload.Form("Class_id")&"&class_room="&Upload.Form("Class_room")&"&Subject_id="&Upload.Form("Subject_id")&"&Subject_name="&Upload.Form("Subject_Name")&"&start=1" 

end if
%>