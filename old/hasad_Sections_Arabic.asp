<!--#include file = "header.asp"-->
<html dir="rtl">



<script type="text/javascript" src="js/jquery.js"></script>
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
					<font face="Andalus" style="font-size: 20pt">ﬁ”„ «··€… 
			«·⁄—»Ì…</font></font><font face="Andalus" style="font-size: 20pt">.</font></td>
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
						<td valign="top" width="98%">
						<p align="justify">
<table border="1" width="100%" cellspacing="0" cellpadding="0" dir="rtl" bordercolorlight="#4094CF">
					<tr>
						<td dir="rtl" background="images/table_back_ground.gif" height="30" width="350" align="center">
						<b><span lang="ar-kw"><font size="4" face="Andalus">
						<a href="Test_Sections_Arabic.asp">«·«Œ »«—« </a></font></span></b></td>
						<td background="images/table_back_ground.gif" dir="rtl" align="center" width="350">
						<b><span lang="ar-kw"><font size="4" face="Andalus">
						<a href="Activity.asp">«·√‰‘ÿ…</a></font></span></b></td>
					</tr>
				</table>					
				<br>
			<table border="1" width="700" cellspacing="0" cellpadding="0" dir="rtl" bordercolorlight="#4094CF">
					<tr>
						<td dir="rtl" align="center" height="30" background="images/section-back-ground.gif">
						<b><span lang="ar-kw"><font size="4" face="Andalus">ﬂ·„… «·ﬁ”„</font></span></b></td>
					</tr>
					<tr>
						<td>
						<p align="center">&nbsp;<div align="center">
							<table border="0" width="650" cellspacing="0" cellpadding="0" dir="rtl">
								<tr>
									<td dir="rtl" align="justify" width="350" valign="top">
									&nbsp;</td>
									<td dir="rtl" align="center" width="300" valign="top">
									&nbsp;</td>
								</tr>
								<tr>
									<td dir="rtl" align="justify" width="650" valign="top" colspan="2">
									<p style="margin: 0 10px">&nbsp;<p style="margin: 0 10px">&nbsp;<p style="margin: 0 10px">&nbsp;<p style="margin: 0 10px">&nbsp;<p style="margin: 0 10px">&nbsp;</td>
								</tr>
							</table>
							<table border="0" width="650" cellspacing="0" cellpadding="0" dir="rtl">
								<tr>
									<td>
									<p style="margin: 0 10px">&nbsp;</td>
								</tr>
							</table>
						</div>
						<p align="center">&nbsp;</td>
					</tr>
				</table></p>
						</td>
					</tr>
					<tr>
						<td>
						<p align="justify">
						<br>
						<table border="1" width="100%" cellspacing="0" cellpadding="0" dir="rtl" bordercolorlight="#4094CF">
					<tr>
						<td dir="rtl" align="center" height="30" background="images/section-back-ground.gif">
						<span lang="ar-kw"><font size="4" face="Andalus"><b>√⁄÷«¡ «·ﬁ”„</b></font></span></td>
					</tr>
					<tr>
						<td>
						<p align="right" style="margin-top: 0; margin-bottom: 0">&nbsp;<div align="center">
							<table border="1" width="400" cellspacing="0" cellpadding="0" dir="rtl" bordercolorlight="#4094CF">
								<tr>
									<td dir="rtl" height="30" width="250" bgcolor="#FFCCFF">
									<p align="center"><b><span lang="ar-kw">
									<font size="4">«·«”‹‹„</font></span></b></td>
									<td dir="rtl" height="30" bgcolor="#FFCCFF">
									<p align="center"><b><span lang="ar-kw">
									<font size="4">«·ÊŸÌ›…</font></span></b></td>
								</tr>
								<tr>
									<td>
									&nbsp;</td>
									<td align="center">
									&nbsp;</td>
								</tr>
								<tr>
									<td>
									&nbsp;</td>
									<td align="center">
									&nbsp;</td>
								</tr>
								<tr>
									<td>
									&nbsp;</td>
									<td align="center">
									&nbsp;</td>
								</tr>
								<tr>
									<td>
									&nbsp;</td>
									<td align="center">
									&nbsp;</td>
								</tr>
								<tr>
									<td>
									&nbsp;</td>
									<td align="center">
									&nbsp;</td>
								</tr>
								<tr>
									<td>
									&nbsp;</td>
									<td align="center">
									&nbsp;</td>
								</tr>
							</table>
						</div>
						<p align="right" style="margin-top: 0; margin-bottom: 0">&nbsp;</td>
					</tr>
				</table>
	<br>
&nbsp;





<div class="clear"></div>








</span></b></td>
					</tr>
					<tr>
						<td>
						<p align="left"><a href="hasad.asp">
						<span lang="ar-sa">⁄Êœ… ··√ﬁ”«„</span></a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </td>
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