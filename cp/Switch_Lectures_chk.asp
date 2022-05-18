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
		if not rs.eof then
			First_Lecture_ID=Rs("Lecture_ID")
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
							
								rsv("First_Lecture_ID")= First_Lecture_ID
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
							
								rsv("Additional")=0

								rsv.update	
								session("ErrMsg")="Êã ÇäÔÇÁ ÇáØáÈ ÈäÌÇÍ"
							Else
								session("ErrMsg")="íæÌÏ ØáÈ ÊÈÏíá Êã ÇäÔÇÆå ãä ÞÈá"
								response.redirect "Switch_Lectures_add.asp?id="&Upload.Form("First_Department_ID")&"&start=1&DeptName="&Upload.Form("txtDepartment_Name")&"" 
							End if
						rsv.close
						set rsv=nothing	

				Else
					session("ErrMsg")="ÍÕá ÎØÃ Ýí ÈíÇäÇÊ ÇáÞÓã ÇáãÎÇØÈ (2) "
					response.redirect "Switch_Lectures_add.asp?id="&Upload.Form("First_Department_ID")&"&start=1&DeptName="&Upload.Form("txtDepartment_Name")&"" 
				End if
			rss.close
			set rss=nothing	

		Else
			session("ErrMsg")="ÍÕá ÎØÃ Ýí ÈíÇäÇÊ ÇáÍÕÉ ÇáãÑÇÏ ÊÈÏíáåÇ áÏì ÞÓãí (1) "
			response.redirect "Switch_Lectures_add.asp?id="&Upload.Form("First_Department_ID")&"&start=1&DeptName="&Upload.Form("txtDepartment_Name")&"" 

		End if
		

	
	rs.close
	set rs=nothing	
	conn.close
	set conn=nothing
	response.redirect "Switch_Lectures_list.asp?id="&Upload.Form("First_Department_ID")&"&start=1&DeptName="&Upload.Form("txtDepartment_Name")&"" 
	
elseif procType="edit" then
	'ID = Upload.Form("txtLecture_id")
	Second_Department_id=Upload.Form("Second_Department_id")
	Switch_Lectures_id=Upload.Form("Switch_Lectures_id")
	First_Lecture_ID=Upload.Form("First_Lecture_ID")
	Second_Lecture_ID=Upload.Form("Second_Lecture_ID")
	
	status=Upload.Form("status")
	
	set Rs=server.createobject("ADODB.Recordset")
	set Rss=server.createobject("ADODB.Recordset")
	set Rsv=server.createobject("ADODB.Recordset")
	set Rst=server.createobject("ADODB.Recordset")

	Rsv.open "select * from Switch_Lectures where Switch_Lectures_id ="&Switch_Lectures_id&"" , Conn,1,2
		if not rsv.eof then
			if status = "ok" then

				Rs.open "select * from Lectures where Lecture_ID = "&First_Lecture_ID&" " , Conn,1,2
					if not rs.eof then
							Rss.open "select * from Lectures where Lecture_ID = "&rsv("First_Lecture_ID")&" and Department_id="& rsv("First_Department_id")&" and Subject_ID="&rsv("First_Subject_id")&" and Employee_ID="&rsv("First_Employee_ID")&" and Class_room_ID="&rsv("First_Class_room_ID")&" and Lecture_Time_id="&Rsv("Second_Lecture_time_ID")&" and Lecture_Day="&rsv("Second_Lecture_Day")&" and Lecture_Month="&rsv("Second_Lecture_Month")&" and Lecture_year="&rsv("Second_Lecture_year")&"" , Conn,1,2
							if rss.eof then
								rs("Lecture_Time_id")=rsv("Second_Lecture_Time_id")
								rs("Lecture_Date") =rsv("Second_Lecture_Date")
								rs("Lecture_Day") = rsv("Second_Lecture_Day")
								rs("Lecture_Month") = rsv("Second_Lecture_Month")
								rs("Lecture_Year") = rsv("Second_Lecture_Year")
						
								
							Else
							
								session("ErrMsg")="áÇ íãßä ÇÌÑÇÁ ÇáÊÈÏíá - ÇáãÚáã (1) áÏíå ÍÕÉ Ýí äÝÓ ÇáæÞÊ"
							End if
							rss.close
						
							Rst.open "select * from Lectures where Lecture_ID = "&Second_Lecture_ID&" " , Conn,1,2
								if not rst.eof then
										Rss.open "select * from Lectures where Lecture_ID = "&rsv("Second_Lecture_ID")&" and Department_id="& rsv("Second_Department_id")&" and Subject_ID="&rsv("Second_Subject_id")&" and Employee_ID="&rsv("Second_Employee_ID")&" and Class_room_ID="&rsv("First_Class_room_ID")&" and Lecture_Time_id="&Rsv("First_Lecture_time_ID")&" and Lecture_Day="&rsv("First_Lecture_Day")&" and Lecture_Month="&rsv("First_Lecture_Month")&" and Lecture_year="&rsv("First_Lecture_year")&"" , Conn,1,2
										if rss.eof then
											rst("Lecture_Time_id")=rsv("First_Lecture_Time_id")
											rst("Lecture_Date") =rsv("First_Lecture_Date")
											rst("Lecture_Day") = rsv("First_Lecture_Day")
											rst("Lecture_Month") = rsv("First_Lecture_Month")
											rst("Lecture_Year") = rsv("First_Lecture_Year")
									
											rst.update
											rs.update

											rsv("Status")="ok"
											rsv.update
				
											session("ErrMsg")="Êã ÇáÊÚÏíá ÈäÌÇÍ"
										Else
											session("ErrMsg")="áÇ íãßä ÇÌÑÇÁ ÇáÊÈÏíá - ÇáãÚáã (2) áÏíå ÍÕÉ Ýí äÝÓ ÇáæÞÊ"
										End if
								Else
										session("ErrMsg")="ÎØÃ Ýí ÇÓÊÑÌÇÚ ÇáÈíÇäÇÊ ÇáãÚáã (2)"
								end if
						
							rst.close
					Else
						session("ErrMsg")="ÎØÃ Ýí ÇÓÊÑÌÇÚ ÇáÈíÇäÇÊ ÇáãÚáã (1)"
					end if
				rs.close

			Else
				rsv("Status")="no"
				rsv.update
			End if
	Else
	End if

	set rs=nothing	
	set rss=nothing	
	set rsv=nothing	
	set rst=nothing	
	conn.close
	set conn=nothing
	response.redirect "Switch_Lectures_list.asp?id="&Upload.Form("Second_Department_ID")&"&start=1&DeptName="&Upload.Form("txtDepartment_Name")&"" 
	
elseif procType="delete" then	
	ID = Upload.Form("Switch_Lectures_ID")
	
	conn.execute "delete from Switch_Lectures where Switch_lectures_ID="&ID&" "
	session("ErrMsg")="Êã ÇáÍÐÝ "
	conn.close
	set conn=nothing
	response.redirect "Switch_Lectures_list.asp?id="&Upload.Form("First_Department_ID")&"&start=1&DeptName="&Upload.Form("txtDepartment_Name")&"" 

end if
%>