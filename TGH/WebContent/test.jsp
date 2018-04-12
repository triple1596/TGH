<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>Insert title here</title>
	</head>
	<body>
		<img src="image/pic1.jpg" id="mainImage" alt="Image" style="width:100%;height:700px;">
	</body>
	<script>
		var myImage=document.getElementById("mainImage");
		var imageArray=["image/pic1.jpg","image/pic2.jpg","image/pic3.jpg","image/pic4.jpg"];
		var imageIndex=0;
		
		function changeImage(){
			myImage.setAttribute("src",imageArray[imageIndex]);
			imageIndex++;
			if(imageIndex>=imageArray.length){
				imageIndex=0;
			}
		}
		setInterval(changeImage,3000);
	</script>
</html>