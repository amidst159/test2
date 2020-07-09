<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html lang="en">

<head>

  <meta charset="utf-8">
 <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<link rel="stylesheet" href="/resources/a/adminlte.css">


   <script src="http://code.jquery.com/jquery-latest.js"></script>
  <script>
 
  function reg(){
	  location.href="/board/register";
  }
  $(document).ready(function(){
	
	  var s=$("#searchForm");
	  $("#searchForm button").on("click",function(e){
		  if(!s.find("option:selected").val()){
			  alert("종류설정하세요");
			 return false;
		  }
		  if(!s.find("input[name='keyword']").val()){
			  alert("키워드설정");
			  return false;
		  }
		  
		  s.find("input[name='pageNum']").val("1");
		  e.preventDefault();
		  
		  s.submit();
		  
	  });
	  
	 var ac = $("#actionForm");
	$(".page-item a").on("click",function(e){
		e.preventDefault();
		ac.find("input[name='pageNum']").val($(this).attr("href"));
	
	ac.submit();
	});
  });

  
  
  </script>
  

</head>
<body>

  <form id='actionForm' action="/board/list" method='get'>
                <input type='hidden' name='pageNum' value='${pageMaker.cri.pageNum}'>
                <input type='hidden' name='amount' value='${pageMaker.cri.amount}'>
                </form>

<div class="container">
  <!-- Page Wrapper -->
  
        <!-- End of Topbar -->

        <!-- Begin Page Content -->
        <div class="container-fluid">

          <!-- Page Heading -->
          <h1 class="h3 mb-2 text-gray-800">원두경의 게시판</h1>
          

        
            <div>
              <div >
                <table class="table table-bodered">
                  <thead>
                  <tr>
                  <th>#번호</th>
                  <th>제목</th>
                  <th>작성자</th>
                  <th>작성일</th>
                  <th>수정일</th>
                  </tr>
                  </thead>
                  <c:forEach items="${list }" var="board">
                  <tr>
                  <td>${board.bno}</td>
                  <td><a href="${con}/board/get?bno=${board.bno}"> ${board.title}</a></td>
                  <td>${board.writer}</td>
                  <td><fmt:formatDate pattern="yyyy-MM-dd" value="${board.regdate }"/></td>
                  <td><fmt:formatDate pattern="yyyy-MM-dd" value="${board.updateDate}"/></td>
                  </tr>
                  </c:forEach>
                  
                </table>
                <div class='row'>
                <div class="col-lg-12">
                
                
                <form id='searchForm' action="/board/list" method='get'>
                <select name='type'>
                <option value="">--</option>
                <option value="T">제목</option>
                <option value="C">내용</option>
                <option value="W">작성자</option>
                <option value="TC">제목 OR 내용</option>
                <option value="TW">제목 OR 작성자</option>
                <option value="TWC">제목 OR 내용 OR 작성자</option>
                
                </select>
                <input type='text' name='keyword' >
                <input type='hidden' name='pageNum' value='${pageMaker.cri.pageNum}'>
                <input type='hidden' name='amount' value='${pageMaker.cri.amount }'>
                <button class='btn btn-default'> Search</button>
             
                
                </form>
                
                </div>
                </div>
                
                
                
                <ul class="pagination justify-content-center">
                <c:if test="${pageMaker.prev }">
                <li class="page-item"><a class="page-link" href="${pageMaker.startPage -1 }">Prev</a><li>
                </c:if>
                
                <c:forEach var="num" begin="${pageMaker.startPage }" end="${pageMaker.endPage}">
                <li class="page-item ${pageMaker.cri.pageNum == num ? "active":""}"><a class="page-link" href="${num}">${num}</a></li>
                
                </c:forEach>
                
                <c:if test="${pageMaker.next}">
                <li class="page-item "><a class="page-link" href="${pageMaker.endPage +1 }">Next</a></li>
                </c:if>
                </ul>
              
              
                
                <button class="btn btn-primary" onclick="reg()"> 글쓰기 </button>
               
             
            </div>
          </div>

        </div>
        <!-- /.container-fluid -->

     
      <!-- End of Main Content -->

      <!-- Footer -->
   
      </div>

</body>

</html>
