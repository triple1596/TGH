<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<title>1</title>
	</head>
	<body>
		<%
		String type = (String)session.getAttribute("type");
		if(type == null){
			%><img src="image/pic1.jpg" id="mainImage" alt="Image" style="width:100%;height:700px;"><%
		}else if(type.equals("movie")){

			%><img src="image/pic1.jpg" id="mainImage" alt="Image" style="width:100%;height:700px;"><%
		}else{
			%><img src="image/movie1.jpg" id="mainImage" alt="Image" style="width:100%;height:700px;"><%
		}%>
		
	</body>
	<script>
		var myImage=document.getElementById("mainImage");
		<%
		
		if(type == null){
			//System.out.println("[ Picture Session ] null");
			%>var imageArray=["image/pic1.jpg","image/pic2.jpg","image/pic3.jpg","image/pic4.jpg"];<%
		}else if(type.equals("movie")){
			//System.out.println("[ Picture Session ] Movie");
			%>var imageArray=["image/pic1.jpg","image/pic2.jpg","image/pic3.jpg","image/pic4.jpg"];<%
		}else{
			//System.out.println("[ Picture Session ] Hotel");
			%>var imageArray=["image/movie1.jpg","image/movie2.jpg","image/movie3.jpg","image/movie4.jpg"];<%
			
		}%>
		
		var imageIndex=0;
		
		function changeImage(){
			myImage.setAttribute("src",imageArray[imageIndex]);
			imageIndex++;
			if(imageIndex>=imageArray.length){
				imageIndex=0;
			}
		}
		setInterval(changeImage,2000);
	</script>
</html>