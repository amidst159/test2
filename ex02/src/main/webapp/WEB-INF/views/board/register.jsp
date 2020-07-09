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

  <title>글 등록</title>

  <!-- Custom fonts for this template -->
 
  

  <!-- Custom styles for this template -->
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/css/bootstrap.min.css">

  <!-- Custom styles for this page -->
 
 <script src="http://code.jquery.com/jquery-latest.js"></script>
 <script>

  </script>

</head>
<body>

<div class="container">

<div class="row">
<div class="col-lg-12">

<div style="padding-bottom:30px;"><h1 class="page-header">글 쓰기</h1></div>
</div>
</div>

<div class="row">
<div class="col-lg-12">
<div class="card">
<div class="card-header">글쓰기</div>
<div class="card-body">


<form  action="/board/register" method="post">
<div class="form-group">
<label>title</label> <input class="form-control" name='title' required/>
</div>

<div class="form-group">
<label>text area</label>
<textarea class="form-control" rows="3" name='content' required></textarea>
</div>

<div class="form-group">
<label>Writer</label><input class="form-control" name='writer' required>
<div style="margin-top:30px;"><button type="submit" class="btn btn-primary">submit button</button></div>
</div>




</form>

</div>





</div>
</div>
</div>
</div>


</body>
</html>