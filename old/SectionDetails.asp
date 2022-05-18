<!--#include file = "header.asp"-->
<html dir="rtl">



<script type="text/javascript" src="js/jquery-1.3.1.min.js"></script>
<script type="text/javascript">

$(document).ready(function() {		
	
	//Execute the slideShow
	slideShow();

});

function slideShow() {

	//Set the opacity of all images to 0
	$('#gallery a').css({opacity: 0.0});
	
	//Get the first image and display it (set it to full opacity)
	$('#gallery a:first').css({opacity: 1.0});
	
	//Set the caption background to semi-transparent
	$('#gallery .caption').css({opacity: 0.7});

	//Resize the width of the caption according to the image width
	$('#gallery .caption').css({width: $('#gallery a').find('img').css('width')});
	
	//Get the caption of the first image from REL attribute and display it
	$('#gallery .content').html($('#gallery a:first').find('img').attr('rel'))
	.animate({opacity: 0.7}, 400);
	
	//Call the gallery function to run the slideshow, 6000 = change to next image after 6 seconds
	setInterval('gallery()',6000);
	
}

function gallery() {
	
	//if no IMGs have the show class, grab the first image
	var current = ($('#gallery a.show')?  $('#gallery a.show') : $('#gallery a:first'));

	//Get next image, if it reached the end of the slideshow, rotate it back to the first image
	var next = ((current.next().length) ? ((current.next().hasClass('caption'))? $('#gallery a:first') :current.next()) : $('#gallery a:first'));	
	
	//Get next image caption
	var caption = next.find('img').attr('rel');	
	
	//Set the fade in effect for the next image, show class has higher z-index
	next.css({opacity: 0.0})
	.addClass('show')
	.animate({opacity: 1.0}, 1000);

	//Hide the current image
	current.animate({opacity: 0.0}, 1000)
	.removeClass('show');
	
	//Set the opacity to 0 and height to 1px
	$('#gallery .caption').animate({opacity: 0.0}, { queue:false, duration:0 }).animate({height: '1px'}, { queue:true, duration:300 });	
	
	//Animate the caption, opacity to 0.7 and heigth to 100px, a slide up effect
	$('#gallery .caption').animate({opacity: 0.7},100 ).animate({height: '100px'},500 );
	
	//Display the content
	$('#gallery .content').html(caption);
	
	
}

</script>
<style type="text/css">
body{
	font-family:arial
}

.clear {
	clear:both
}

#gallery {
	position:relative;
	height:360px
}
	#gallery a {
		float:left;
		position:absolute;
	}
	
	#gallery a img {
		border:none;
	}
	
	#gallery a.show {
		z-index:500
	}

	#gallery .caption {
		z-index:600; 
		background-color:#000; 
		color:#ffffff; 
		height:100px; 
		width:100%; 
		position:absolute;
		bottom:0;
	}

	#gallery .caption .content {
		margin:5px
	}
	
	#gallery .caption .content h3 {
		margin:0;
		padding:0;
		color:#1DCCEF;
	}
	

</style>
<%
SID = Cin(Request.querystring("SID"))
SName = Request.querystring("SName")
%>
<div align="center">
	<table bgcolor=#FFFFFF border="0" width="900" id="table1" cellspacing="0" cellpadding="0">
		<tr>
			<td bgcolor="#0A308F"  height="7"></td>
		</tr>
		<tr>
			<td>
			<table border="0" width="100%" id="table2" cellspacing="0" cellpadding="0">
				<tr>
					<td width="142" valign="top">
			<!--#include file="Right.asp"-->
					</td>
					<td valign="top">
					<!--#include file="Banner.asp"-->
				<table border="0" width="100%" id="table4" cellspacing="0" cellpadding="0">
						<tr>
							<td colspan="3" valign="top">
							<div align="right">
			<font face="Sultan normal" size="5">
			<div align="center">
				<table border="0" width="98%" id="table10">
					<tr>
						<td width="23">
			<img src="images/el-ameed_42.gif" width="22" height="22" alt=""></td>
						<td>
			<font face="Andalus" size="5">
						<font style="font-size: 20pt">«</font><font face="Andalus" style="font-size: 20pt">·√ﬁ”«„ 
						«·⁄·„Ì…</font></font><font face="Andalus" style="font-size: 20pt">.</font></td>
					</tr>
				</table>
			</div>
			<p></p>
			</font></div>
							<table border="0" width="98%" id="table7" cellspacing="0" cellpadding="0">
								<tr>
									<td colspan="2" align="center">
									<table border="0" width="97%" id="table8" cellspacing="0" cellpadding="0">
								<tr>
									<td width="8">
			<img src="images/el-ameed_36.gif" width="8" height="9" alt=""></td>
									<td background="images/el-ameed_35.gif">
			</td>
									<td width="8">
			<img src="images/el-ameed_32.gif" width="8" height="9" alt=""></td>
								</tr>
								<tr>
									<td width="8" background="images/el-ameed_40.gif">
			&nbsp;</td>
									<td>
		
			<div align="center">
				<table border="0" width="98%" id="table9">
					<tr>
						<td valign="top" width="63%">
						<p align="justify"><u><b><span lang="ar-sa">ﬁ”„ 
						«·—Ì«÷Ì« :</span></b></u></p>
						<p align="justify">&nbsp;</p>
						</td>
						<td valign="top" width="35%">
						<table border="0" width="100%" id="table11">
							<tr>
								<td>&nbsp;</td>
								<td>
								&nbsp;</td>
							</tr>
						</table>
						</td>
					</tr>
					<tr>
						<td colspan="2">
						<p align="justify">
						&nbsp;<p align="justify">
						<u><b>›—Ìﬁ «·⁄„· :</b></u><p align="justify">
						<b>√/ </b><p align="justify">
						<u><b>—∆Ì” «·ﬁ”„:</b></u><p align="justify">
						<b>«·√” «–: </b>
						<p align="justify">
						<span lang="ar-sa"><b>- «·√‰‘ÿ…</b></span><p align="right">
						<b><span lang="ar-sa">
	<br>
&nbsp;




<div class="clear"></div>








</span></b></td>
					</tr>
					<tr>
						<td colspan="2">
						<p align="left"><span lang="ar-sa"><a href="hasad.asp">
						⁄Êœ… ··√ﬁ”«„</a></span></td>
					</tr>
					</table>
			</div>
			<br>
&nbsp;</td>
									<td width="8" background="images/el-ameed_38.gif">
			&nbsp;</td>
								</tr>
								<tr>
									<td width="8">
			<img src="images/el-ameed_57.gif" width="8" height="9" alt=""></td>
									<td background="images/el-ameed_55.gif"></td>
									<td width="8">
			<img src="images/el-ameed_54.gif" width="8" height="9" alt=""></td>
								</tr>
							</table>
									</td>
								</tr>
								<tr>
									<td>&nbsp;</td>
									<td>&nbsp;</td>
								</tr>
								</table>
							</td>
						</tr>
					</table>
					</td>
				</tr>
			</table>
			</td>
		</tr>
		<tr>
			<td>
		<!--#include file="Footer.asp"-->
			</td>
		</tr>
	</table>
</div>
</body>
</html>