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
	Rs.open "select * from student_Follow" , Conn,1,2

	rs.addnew	
	rs("Std_Civil_ID")=Upload.Form("Std_Civil_ID")
	rs("Class_Room_ID")=Upload.Form("Class_Room_ID")
	
	rs("Subject_id")=Upload.Form("Subject_id")
	
	rs("Employee_id")=session("Employee_id")
	rs("Department_id")=session("Department_id")
	rs("Follow_type")=Upload.Form("Follow_type")
	rs("Class_Degree")=Upload.Form("Class_Degree")
	rs("Exam_Degree")=Upload.Form("Exam_Degree")
	
	rs("sleeping")=Upload.Form("sleeping")
	rs("study_Tools")=Upload.Form("study_Tools")
	rs("not_Care")=Upload.Form("not_Care")
	
	rs("Get_out_of_Class")=Upload.Form("Get_out_of_Class")
	rs("Late_to_class")=Upload.Form("Late_to_class")
	rs("wrong_behavior")=Upload.Form("wrong_behavior")
	rs("refusal_instructions")=Upload.Form("refusal_instructions")
	rs("Class_Participation")=Upload.Form("Class_Participation")
	rs("Home_work")=Upload.Form("Home_work")
	rs("Absence")=Upload.Form("Absence")
	rs("Teamwork")=Upload.Form("Teamwork")
	rs("Preparing_lessons")=Upload.Form("Preparing_lessons")
	rs("share")=Upload.Form("share")
	rs("Responsiveness")=Upload.Form("Responsiveness")
	rs("Discussion")=Upload.Form("Discussion")
	rs("Flexibility")=Upload.Form("Flexibility")
	rs("care_learn")=Upload.Form("care_learn")
	rs("style")=Upload.Form("style")
	rs("Care_Study_Tools")=Upload.Form("Care_Study_Tools")
	rs("notes")=Upload.Form("notes")

	rs("report_Date")=session("myDate")
	rs("Report_Day")=Day(session("myDate"))
	rs("Report_month")=month(session("myDate"))
	rs("Report_year")=Year(session("myDate"))
	if Upload.Form("Event_Date")="" then
		if Upload.Form("Follow_type")="1" then
				response.redirect "student_Follow_P_list.asp?class_id="&Upload.Form("Class_Room_id")&"&class_room="&Upload.Form("Class_Room")&"&Subject_id="&Upload.Form("Subject_id")&"&Subject_name="&Upload.Form("Subject_Name")&"&start=1" 
		Else
				response.redirect "student_Follow_W_list.asp?class_id="&Upload.Form("Class_Room_id")&"&class_room="&Upload.Form("Class_Room")&"&Subject_id="&Upload.Form("Subject_id")&"&Subject_name="&Upload.Form("Subject_Name")&"&start=1" 
		End if	
	End if
	rs("Event_Date")=day(Upload.Form("Event_Date"))&"/"&month(Upload.Form("Event_Date"))&"/"&year(Upload.Form("Event_Date"))
	rs("Event_Day")=Day(Upload.Form("Event_Date"))
	rs("Event_month")=month(Upload.Form("Event_Date"))
	rs("Event_year")=Year(Upload.Form("Event_Date"))
	rs("Managment_done")="no"

	rs("report_file")=ArrImg(0)
	rs.update
	
	session("ErrMsg")="��� ������� �����"
	rs.close
	set rs=nothing	
	conn.close
	set conn=nothing
	if Upload.Form("Follow_type")="1" then
			response.redirect "student_Follow_P_list.asp?class_id="&Upload.Form("Class_Room_id")&"&class_room="&Upload.Form("Class_Room")&"&Subject_id="&Upload.Form("Subject_id")&"&Subject_name="&Upload.Form("Subject_Name")&"&start=1" 
	Else
			response.redirect "student_Follow_W_list.asp?class_id="&Upload.Form("Class_Room_id")&"&class_room="&Upload.Form("Class_Room")&"&Subject_id="&Upload.Form("Subject_id")&"&Subject_name="&Upload.Form("Subject_Name")&"&start=1" 
	End if
elseif procType="edit" then
	ID= Upload.Form("id")

	set Rs=server.createobject("ADODB.Recordset")
	Rs.open "select * from Student_Follow where ID="&ID&" " , Conn,1,2
		Subject_id = rs("Subject_id")
		subject_name = Upload.Form("subject_name")
		class_id = rs("Class_room_id")
	
		rs("Std_Civil_ID")=Upload.Form("Std_Civil_ID")
				
		rs("Follow_type")=Upload.Form("Follow_type")
		rs("Class_Degree")=Upload.Form("Class_Degree")
		rs("Exam_Degree")=Upload.Form("Exam_Degree")
		
		rs("sleeping")=Upload.Form("sleeping")
		rs("study_Tools")=Upload.Form("study_Tools")
		rs("not_Care")=Upload.Form("not_Care")
		
		rs("Get_out_of_Class")=Upload.Form("Get_out_of_Class")
		rs("Late_to_class")=Upload.Form("Late_to_class")
		rs("wrong_behavior")=Upload.Form("wrong_behavior")
		rs("refusal_instructions")=Upload.Form("refusal_instructions")
		rs("Class_Participation")=Upload.Form("Class_Participation")
		rs("Home_work")=Upload.Form("Home_work")
		rs("Absence")=Upload.Form("Absence")
		rs("Teamwork")=Upload.Form("Teamwork")
		rs("Preparing_lessons")=Upload.Form("Preparing_lessons")
		rs("share")=Upload.Form("share")
		rs("Responsiveness")=Upload.Form("Responsiveness")
		rs("Discussion")=Upload.Form("Discussion")
		rs("Flexibility")=Upload.Form("Flexibility")
		rs("care_learn")=Upload.Form("care_learn")
		rs("style")=Upload.Form("style")
		rs("Care_Study_Tools")=Upload.Form("Care_Study_Tools")
		rs("notes")=Upload.Form("notes")
	
		rs("report_Date")=session("myDate")
		rs("Report_Day")=Day(session("myDate"))
		rs("Report_month")=month(session("myDate"))
		rs("Report_year")=Year(session("myDate"))
		rs("Event_Date")=day(Upload.Form("Event_Date"))&"/"&month(Upload.Form("Event_Date"))&"/"&year(Upload.Form("Event_Date"))
		rs("Event_Day")=Day(Upload.Form("Event_Date"))
		rs("Event_month")=month(Upload.Form("Event_Date"))
		rs("Event_year")=Year(Upload.Form("Event_Date"))
	
		if ArrImg(0)="" then 
			rs("report_file")=Upload.Form("txtHdnImg")
		else
			rs("report_file")=ArrImg(0)	
		end if
		
	rs.update
	
	session("ErrMsg")="�� ������� �����"
	rs.close
	set rs=nothing	
	conn.close
	set conn=nothing
		if Upload.Form("Follow_type")="1" then
				response.redirect "student_Follow_P_list.asp?class_id="&Class_id&"&class_room="&Upload.Form("Class_room")&"&Subject_id="&Subject_id&"&Subject_name="&Subject_Name&"&start=1" 
		Else
				response.redirect "student_Follow_W_list.asp?class_id="&Class_id&"&class_room="&Upload.Form("Class_room")&"&Subject_id="&Subject_id&"&Subject_name="&Subject_Name&"&start=1" 
		End if
elseif procType="delete" then	
	ID= Upload.Form("ID")
	
	conn.execute "delete  from Student_Follow where ID="&ID&" "
	session("ErrMsg")="�� ����� "
	conn.close
	set conn=nothing
	if Upload.Form("Follow_type")="1" then
			response.redirect "student_Follow_P_list.asp?class_id="&Upload.Form("Class_id")&"&class_room="&Upload.Form("Class_room")&"&Subject_id="&Upload.Form("Subject_id")&"&Subject_name="&Upload.Form("Subject_Name")&"&start=1" 
	Else
			response.redirect "student_Follow_W_list.asp?class_id="&Upload.Form("Class_id")&"&class_room="&Upload.Form("Class_room")&"&Subject_id="&Upload.Form("Subject_id")&"&Subject_name="&Upload.Form("Subject_Name")&"&start=1" 
	End if
end if
%>