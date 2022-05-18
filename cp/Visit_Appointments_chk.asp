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
uploadsDirVar = server.mappath("/Meets")
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
	set Rsv=server.createobject("ADODB.Recordset")

			First_Department_ID = Upload.Form("First_Department_ID")
			First_Employee_ID = Upload.Form("First_Employee_ID")
			
			First_Class_room_id = Upload.Form("First_Class_room_id")
			First_Lecture_Time_id = Upload.Form("First_Lecture_Time_id")
			First_Lecture_Date = Upload.Form("First_Lecture_Date")
			if Upload.Form("First_Lecture_Date")<> "" then
				First_Lecture_Day = Day(Upload.Form("First_Lecture_Date"))
				First_Lecture_Month = Month(Upload.Form("First_Lecture_Date"))
				First_Lecture_Year = Year(Upload.Form("First_Lecture_Date"))
			Else
				First_Lecture_Day = Day(Date())
				First_Lecture_Month = Month(Date())
				First_Lecture_Year = Year(Date())	
			End if
		
			First_Lecture_ID = Upload.Form("First_Lecture_ID")
			First_subject_id =Upload.Form("First_subject_id")
			
			
			Second_Department_ID =Upload.Form("Second_Department_ID")
			Second_Employee_ID =Upload.Form("Second_Employee_ID")
			
			Second_Class_room_id=Upload.Form("Second_Class_room_id")
			Second_Lecture_Time_id=Upload.Form("Second_Lecture_Time_id")
			Second_Lecture_Date=Upload.Form("Second_Lecture_Date")
	
			if Upload.Form("Second_Lecture_Date")<> "" then
				Second_Lecture_Day = Day(Upload.Form("Second_Lecture_Date"))
				Second_Lecture_Month = Month(Upload.Form("Second_Lecture_Date"))
				Second_Lecture_Year = Year(Upload.Form("Second_Lecture_Date"))
			Else
				Second_Lecture_Day = Day(Date())
				Second_Lecture_Month = Month(Date())
				Second_Lecture_Year = Year(Date())	
			End if
			
			Second_Lecture_ID=Upload.Form("Second_Lecture_ID")
			Second_subject_id=Upload.Form("Second_subject_id")
	
	
	Rs.open "select * from Lectures where Department_ID="&First_Department_ID&" and Employee_ID="&First_Employee_ID&" and Class_room_id="&First_Class_room_id&" and Lecture_Time_id="&First_Lecture_Time_id&" and Lecture_Day="&First_Lecture_Day&"	 and Lecture_Month="&First_Lecture_Month&" and Lecture_Year="&First_Lecture_Year&" and Subject_ID = "&First_Subject_ID&" " , Conn,1,2
		if rs.eof then
			First_Lecture_ID=""
			Rss.open "select * from Lectures where Department_ID="&Second_Department_ID&" and Employee_ID="&Second_Employee_ID&" and Class_room_id="&First_Class_room_id&" and Lecture_Time_id="&Second_Lecture_Time_id&" and Lecture_Day="&Second_Lecture_Day&" and Lecture_Month="&Second_Lecture_Month&" and Lecture_Year="&Second_Lecture_Year&" and subject_id="&Second_subject_id&"" , Conn,1,2
				if not rss.eof then
					Second_Lecture_ID=Rss("Lecture_ID")
						Rsv.open "select * from Switch_Lectures where  First_Department_ID="&First_Department_ID&" and First_Employee_ID="&First_Employee_ID&" and 	First_Class_room_id="&First_Class_room_id&" and First_Lecture_Time_id="&First_Lecture_Time_id&" and First_Lecture_Day="&First_Lecture_Day&" and First_Lecture_Month="&First_Lecture_Month&" and First_Lecture_Year="&First_Lecture_Year&" and First_subject_id="&First_subject_id&"" , Conn,1,2
							if rsv.eof then
								rsv.addnew	
								rsv("First_Department_ID")=Upload.Form("First_Department_ID")
								rsv("First_Employee_ID")=Upload.Form("First_Employee_ID")
								
								rsv("First_Class_room_id")=Upload.Form("First_Class_room_id")
								rsv("First_Lecture_Time_id")=Upload.Form("First_Lecture_Time_id")
								rsv("First_Lecture_Date") =Upload.Form("First_Lecture_Date")
								
								rsv("First_Lecture_Day") = Day(Upload.Form("First_Lecture_Date"))
								rsv("First_Lecture_Month") = Month(Upload.Form("First_Lecture_Date"))
								rsv("First_Lecture_Year") = Year(Upload.Form("First_Lecture_Date"))
							
								rsv("First_Lecture_ID")= Second_Lecture_ID
								rsv("First_subject_id")=Upload.Form("First_subject_id")
								
								
								rsv("Second_Department_ID")=Upload.Form("Second_Department_ID")
								rsv("Second_Employee_ID")=Upload.Form("Second_Employee_ID")
								
								rsv("Second_Class_room_id")=Upload.Form("First_Class_room_id")
								rsv("Second_Lecture_Time_id")=Upload.Form("Second_Lecture_Time_id")
								rsv("Second_Lecture_Date") =Upload.Form("Second_Lecture_Date")
								
								rsv("Second_Lecture_Day") = Day(Upload.Form("Second_Lecture_Date"))
								rsv("Second_Lecture_Month") = Month(Upload.Form("Second_Lecture_Date"))
								rsv("Second_Lecture_Year") = Year(Upload.Form("Second_Lecture_Date"))
							
								rsv("Second_Lecture_ID")= Second_Lecture_ID
								rsv("Second_subject_id")=Upload.Form("Second_subject_id")
							
								rsv("Status")="open"
							
								rsv("Order_Date")=Date()
							
								rsv("Additional")=1

								rsv.update	
								session("ErrMsg")="Êã ÇäÔÇÁ ÇáØáÈ ÈäÌÇÍ"
							Else
								session("ErrMsg")="íæÌÏ ØáÈ ÊÈÏíá Êã ÇäÔÇÆå ãä ÞÈá"
								response.redirect "Additional_Lectures_Admin_add.asp" 
							End if
						rsv.close
						set rsv=nothing	

				Else
					session("ErrMsg")="ÍÕá ÎØÃ Ýí ÈíÇäÇÊ (2) ÇáãÏÎáÉ"
					response.redirect "Additional_Lectures_Admin_add.asp" 
				End if
			rss.close
			set rss=nothing	

		Else
			session("ErrMsg")="ÍÕá ÎØÃ Ýí ÈíÇäÇÊ (1) ÇáãÏÎáÉ"
			response.redirect "Additional_Lectures_Admin_add.asp" 

		End if
		

	
	rs.close
	set rs=nothing	
	conn.close
	set conn=nothing
	response.redirect "Additional_Lectures_Admin_list.asp" 
	
elseif procType="edit" then
	ID = Upload.Form("id")	
	status = Upload.Form("status")
	
	set Rsv=server.createobject("ADODB.Recordset")

	Rsv.open "select * from Visit_Appointments where id ="&id&"" , Conn,1,2
		if not rsv.eof then
			rsv("accept")= status
			rsv.update
		End if
	set rsv=nothing	
	conn.close
	set conn=nothing
		session("ErrMsg")="Êã ÇáÊÍÏíË "

	response.redirect "Visit_Appointments_list.asp" 
	
elseif procType="delete" then	
	ID = Upload.Form("Switch_Lectures_ID")
	
	conn.execute "delete from Switch_Lectures where Switch_lectures_ID="&ID&" "
	session("ErrMsg")="Êã ÇáÍÐÝ "
	conn.close
	set conn=nothing
	response.redirect "Additional_Lectures_Admin_list.asp" 

end if
%>