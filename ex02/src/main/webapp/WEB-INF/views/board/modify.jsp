<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<c:set var="a" value="${java.util.Date}"/>
<!DOCTYPE html>
<html>
<head>

  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta name="description" content="">
  <meta name="author" content="">

  <title>글 수정</title>

  <!-- Custom fonts for this template -->
  
  <!-- Custom styles for this template -->
  <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/css/bootstrap.min.css">

  <!-- Custom styles for this page -->

<script src="http://code.jquery.com/jquery-latest.js"></script>
<script >

function list(){
	location.href="/board/list";
}



</script>
</head>
<body>

<div class="container">
<div class="row">
<div class="col-lg-12">
<h1 class="page-header">수정페이지</h1>
</div>
</div>

<div class="row">
<div class="col-lg-12">
<div class="card">
<div class="card-header">수정</div>
<div class="card-body">


<form  action="/board/modify" method="post">
<div class="form-group">
<label> 번호</label>
<input name='bno' class="form-control" value="${board.bno}">
</div>


<div class="form-group">
<label>title</label> <input class="form-control" name='title' value="${board.title }"/>
</div>

<div class="form-group">
<label>text area</label>
<textarea class="form-control" rows="3" name='content' >
${board.content }
</textarea>
</div>

<div class="form-group">
<label>Writer</label><input class="form-control" name='writer' value="${board.writer }">
</div>

<button type="submit" data-oper='modify' class="btn btn-primary"> 수정</button>
<button class="btn btn-primary" onclick="list()"> 리스트</button>>



</form>


</div>





</div>
</div>
</div>

</div>
</body>
</html>