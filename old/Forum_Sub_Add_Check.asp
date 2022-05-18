<!-- #include file="header.asp" -->
								
<!--#include file="ewupload.asp"-->


<%
' Initialize common variables

TSubject = Null
tDetails = Null
RoomID	= Null
TName = Null
NickName = Null
tFileImg = Null
fs_x_tFileImg = 0: fn_x_tFileImg = "": ct_x_tFileImg = ""
wd_x_tFileImg = 0: ht_x_tFileImg = 0: a_x_tFileImg = "" 	

%>
<%
If RequestBlobData() Then

	Set conn = Server.CreateObject("ADODB.Connection")
	conn.Open ConnString
	
	If AddData() Then ' Add New Record
		Set rs = Server.CreateObject("ADODB.Recordset")
		rs.open "Select * from Subjects order by Sub_ID desc",conn
			SID = rs("Sub_ID")
		rs.close
		conn.Close ' Close Connection
		Set conn = Nothing
		
		response.redirect "Forum_Comment.asp?SID="&SID 
	Else
		response.write("no data were added")
	End If

Else
	response.write ("There is no RequestBlobData()")
end if

%><%

'-------------------------------------------------------------------------------
' Function RequestBlobData
' - Handle mult-part data (for file upload)
' - Variables setup: sAction, field variables, EW_Max_File_Size

Function RequestBlobData()
	Dim rawData, separator, lenSeparator, dict
	Dim currentPos, inStrByte, tempValue, mValue, value
	Dim intDict, begPos, endPos, nValue
	Dim nameN, isValid, nameValue, midValue
	If Request.TotalBytes > 0 Then
		rawData = Request.BinaryRead(Request.TotalBytes)
		separator = MidB(rawData, 1, InStrB(1, rawData, ChrB(13)) - 1)
		lenSeparator = LenB(separator)
		Set dict = Server.CreateObject("Scripting.Dictionary")
		currentPos = 1
		inStrByte = 1
		tempValue = ""
		While inStrByte > 0
			inStrByte = InStrB(currentPos, rawData, separator)
			mValue = inStrByte - currentPos
			If mValue > 1 Then
				value = MidB(rawData, currentPos, mValue)
				Set intDict = Server.CreateObject("Scripting.Dictionary")
				begPos = 1 + InStrB(1, value, ChrB(34))
				endPos = InStrB(begPos + 1, value, ChrB(34))
				nValue = endPos
				nameN = MidB(value, begPos, endPos - begPos)
				isValid = True
				If InStrB(1, value, stringToByte("Content-Type")) > 1 Then
					begPos = 1 + InStrB(endPos + 1, value, ChrB(34))
					endPos = InStrB(begPos + 1, value, ChrB(34))
					If endPos = 0 Then
						endPos = begPos + 1
						isValid = False
					End If
					midValue = MidB(value, begPos, endPos - begPos)
					intDict.Add "FileName", Trim(byteToString(midValue))
					begPos = 14 + InStrB(endPos + 1, value, stringToByte("Content-Type:"))
					endPos = InStrB(begPos, value, ChrB(13))
					midValue = MidB(value, begPos, endPos - begPos)
					intDict.Add "ContentType", Trim(byteToString(midValue))
					begPos = endPos + 4
					endPos = LenB(value)
					nameValue = MidB(value, begPos, ((endPos - begPos) - 1))
				Else
					nameValue = Trim(byteToString(MidB(value, nValue + 5)))
				End If
				If isValid = True Then
					If dict.Exists(byteToString(nameN)) Then
						Set intDict = dict.Item(byteToString(nameN))
						If Right(intDict.Item("Value"), 2) = vbCrLf Then
							intDict.Item("Value") = Left(intDict.Item("Value"), Len(intDict.Item("Value"))-2)
						End If
						intDict.Item("Value") = intDict.Item("Value") & ", " & nameValue
					Else
						intDict.Add "Value", nameValue
						intDict.Add "Name", nameN
						dict.Add byteToString(nameN), intDict
					End If
				End If
			End If
			currentPos = lenSeparator + inStrByte
		Wend

		' Get action
		sAction = getValue(dict, "a_add")
		EW_Max_File_Size = getValue(dict, "EW_Max_File_Size")


'----------------------------------------------------------------------------------
'----------------------------------------------------------------------------------
' Add the fields name 
'

		'Field Name
		TSubject	= getValue(dict, "TSubject")
		tDetails	= getValue(dict, "tDetails")
		RoomID		= getValue(dict, "RoomID")
		TName	= getValue(dict, "TName")
		NickName 	= getValue(dict, "NickName")
		fs_x_tFileImg = getFileSize(dict, "tFileImg")

'----------------------------------------------------------------------------------
' Image fields settings
'

		' Check the file size
		If fs_x_tFileImg > 0 And CLng(EW_Max_File_Size) > 0 Then
			If fs_x_tFileImg > CLng(EW_Max_File_Size) Then
				Response.Write Replace("Max. file size (%s bytes) exceeded.", "%s", EW_Max_File_Size)
				Response.End
			End If
		End If
		fn_x_tFileImg = getFileName(dict, "tFileImg")

		' Check the file type
		If Not ewUploadAllowedFileExt(fn_x_tFileImg) Then
			Response.Write "File type is not allowed."
			Response.End
		End If

		ct_x_tFileImg = getFileContentType(dict, "tFileImg")
		tFileImg = getFileData(dict, "tFileImg")
		wd_x_tFileImg = getValue(dict, "wd_x_tFileImg")
		ht_x_tFileImg = getValue(dict, "ht_x_tFileImg")
		a_x_tFileImg = getValue(dict, "a_x_tFileImg")
		
'--------------------------------------------
' Stop add
'---------------------------------------------
		
		If IsObject(intDict) Then
			intDict.RemoveAll
			Set intDict = Nothing
		End If
		dict.RemoveAll
		Set dict = Nothing
		RequestBlobData = True
	Else
		RequestBlobData = False
	End If
End Function
%><%

'-------------------------------------------------------------------------------
' Function AddData
' - Add Data
' - Variables used: field variables

Function AddData()
	On Error Resume Next
	Dim rs, sSql, sFilter
	Dim bCheckKey, sSqlChk, sWhereChk
	sFilter = ewSqlKeyWhere


	' Add New Record
	sFilter = "(0 = 1)"
	
	
	sSql = "select * from Subjects"
	Set rs = Server.CreateObject("ADODB.Recordset")
	rs.CursorLocation = 3
	rs.Open sSql, conn ,1 ,2
	
		rs.AddNew
		' Field TSubject
		sTmp = Trim(TSubject)
		If Trim(sTmp) = "" Then sTmp = Null
		rs("Sub_Header") = sTmp		
			
		' Field tDetails
		sTmp = Trim(tDetails)
		If Trim(sTmp) = "" Then sTmp = Null
		rs("Sub_Details") = sTmp		
			
		' Field Active
		rs("Active") = 0		
		
		' Field Add_Date
		rs("Add_Date") = Date	

		
		' Field RoomID
		sTmp = Trim(RoomID)
		If Trim(sTmp) = "" Then sTmp = Null
		rs("Room_ID") = sTmp	

		rs("NickName")		= NickName
		rs("FullName")		= TName
			
		' Field tFileImg
		ox_tFileImg = rs("Sub_Img")
		sTmpFolder = ewUploadPathEx(True, EW_UploadDestPath)
		If ox_tFileImg <> "" Then ewDeleteFile sTmpFolder & ox_tFileImg
		sTmp = tFileImg
		
		If Trim(sTmp) = "" Then sTmp = Null
		If IsNull(sTmp) Then
			rs("Sub_Img") = Null
		Else		
			rs("Sub_Img") = ewUploadFileNameEx(sTmpFolder, fn_x_tFileImg)
			ewSaveFile sTmpFolder, rs("Sub_Img"), sTmp
		End If
		
	
		rs.Update
		AddData = True
	rs.Close
	Set rs = Nothing

	
End Function
%>


									