<!-- #include file="header.asp" -->
								
<%
	TName		= Trim(Request.Form("TName"))
	NickName	= Trim(Request.Form("NickName"))
	SubID		= Trim(Request.Form("SubID"))
	RoomID		= Trim(Request.Form("RoomID"))
	tDetails	= Trim(Request.Form("tDetails"))
	
	if tDetails = "" or SubID = "" or RoomID = "" then
		session("FormErr")="<font color=red>ํัฬ์ ฺฯใ สั฿ ใ฿วไ วแัฯ ÝวัÛ</font>"
		Response.redirect "Forum_Comment_Add.asp?SubID="& SubID &"&RooMID="&RoomID
	End if
	
	Set rs = Server.CreateObject("ADODB.RecordSet")
		
	rs.open "Select * from Comments",conn,1,2
	rs.addnew
		rs("Sub_ID")		= SubID
		rs("NickName")		= NickName
		rs("FullName")		= TName
		rs("Com_Details")	= tDetails
		rs("Active")		= 0
		rs("Add_Date")		= Date
	rs.update
	rs.close
	
	rs.open "Select * from Subjects where Sub_ID = "&SubID&" ",conn,1,2
	if rs.eof then
		response.redirect "Error.asp"
	end if
		cID = rs("Comment_Count")
		rs("Comment_Count")	= cID + 1
	rs.update
	rs.close
	
	
	response.redirect "Forum_Comment.asp?SID="& SubID

%>							