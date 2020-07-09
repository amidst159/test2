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

  <title>${board.bno}번글</title>

  <!-- Custom fonts for this template -->
 


  <!-- Custom styles for this template -->
 

  <!-- Custom styles for this page -->
<link rel="stylesheet" href="/resources/a/adminlte.css">
  <script src="http://code.jquery.com/jquery-latest.js"></script>
  <script type="text/javascript" src="/resources/js/reply.js">
  </script>
    <script type="text/javascript">

   

    $(document).ready(function(){
    	var pageNum=1;
    	 var op=$("#operForm");
    	 var k=$("#k");
   	  
   
    	var bnov=${board.bno};
    	var repUL= $("#a");
    	showList(1);
    	function time(d){
    		var a = new Date(d);
    		var yy= a.getFullYear();
    		var mm=a.getMonth();
    		var dd=a.getDate();
    		var hh=a.getHours();
    		var m=a.getMinutes();
    		var s=a.getSeconds();
    		
    		return " "+yy+"년 "+mm+"월 "+dd+"일 "+hh+"시 "+m+"분 "+s+"초 "
    		
    		
    	}
    	
    	function showList(page){
    		getList({bno:bnov,page:page||1},function(replyCnt,list){
    			var str="";
    			if(page==-1){
    				pageNum=Math.ceil(replyCnt/10.0);
    				showList(pageNum);
    				return;
    			}
    		if(list==null || list.length==0){
    			repUL.html("");
    			return;
    		}
    		var i=0;
    		var len=list.length;
    		for(;i<len;i++){
    			str+="<div class='direct-chat-msg'>";
    			str+="<div class='direct-chat-info clearfix'>";
    			str+="<span class='direct-chat-name pull-left'>"+list[i].replyer+"</span>";
    			str+="<span class='direct-chat-timestamp pull-right'>"+time(list[i].replyDate)+"</span>";
    			str+="</div>";
    			str+="<div class='direct-chat-text'>"+list[i].reply+"</div>";
    			str+="<a href='#' data-n='"+list[i].rno+"'>삭제</a>";
    			str+="</div>";
    			
    			
    		}
    		repUL.html(str);
    		showReplyPage(replyCnt);
    	});
    	}
    	
    	function getList(param,callback,error){
    		var bno=param.bno;
    		var page=param.page || 1;
    		
    		$.getJSON("/replies/pages/"+bno+"/"+page+".json",
    		function(data){
    			if(callback){
    				callback(data.replyCnt,data.list);
    			}
    		}	
    		).fail(function(xhr,status,err){
    			if(error){
    				error();
    			}
    		});
    	}
    	
    	function del(rno){
    		$.ajax({
    			type:"delete",
    			url:"/replies/"+rno,
    			contentType:"application/json; charset=utf-8",
    			success:function(){
    				alert("삭제완료");
    			}
    			
    		})
    		
    	}
    	
    	
    
    	$("#a").on("click","a",function(e){
    		e.preventDefault;
    		var v=$(this).data("n");
    		del(v);
    		showList(1);
    		
    	})
    	
    	 $("button[data-a='cre']").on("click",function(){
    		 var n=$("input[data-i='n']").val();
    	    	var c=$("input[data-i='c']").val();
    	    	
    	    	var o={bno:bnov,reply:c,replyer:n};
    		 $.ajax({
    			 url:'/replies/new',
    			 type:'post',
    			 dataType:'json',
    			 data:JSON.stringify(o),
    			 contentType:"application/json; charset=utf-8",
    			 success:function(){
    				 alert("등록 성공!");
    				
    				
    			 }
    		 })
    		 showList(-1);
    		 alert("등록성공");
    		 
    	 })
    	 
    	 	  $("button[data-oper='modify']").on("click",function(e){
   		
   		  op.attr("action","/board/modify");
   		  op.submit();
   	  
   	  });
   	  
   	  $("button[data-oper='list']").on("click",function(e){
   		  op.find("#bno").remove();
   		  op.attr("action","/board/list");
   		  op.submit();
   	  })
    	
    		function showReplyPage(replyCnt){
   		  var endNum=Math.ceil(pageNum/10.0)*10;
   		  var startNum=endNum-9;
   		  
   		  var prev=startNum!=1;
   		  var next=false;
   		  
   		  if(endNum*10>=replyCnt){
   			  endNum=Math.ceil(replyCnt/10.0);
   		  }
   		  if(endNum*10<replyCnt){
   			  next=true;
   		  }
   		  var str="<ul class='pagination justify-content-center'>";
   		  
   		  if(prev){
   			  str+="<li class='page-item'><a class='page-link' href='"+(startNum-1)+"'>prev</a></li>";
   		  }
   		  
   		  for(var i=startNum;i<=endNum;i++){
   			  var active=pageNum==i? "active":"";
   			  str+="<li class='page-item"+active+"'><a class='page-link' href='"+i+"'>"+i+"</a></li>";
   		  }
   		  str+="</ul>";
   		  k.html(str);
   		  
   	  }
   	  
   	  
    k.on("click","li a",function(e){
    	e.preventDefault();
    	var target=$(this).attr("href");
    	pageNum=target;
    	showList(pageNum);
    })
    	
    });
    
    		
   
  
  
  </script>


  
  
 

</head>
<body>

<div class="container">
<div class="row">
<div class="col-lg-12">
<h1 class="page-header">  ${board.bno}번 글</h1>
</div>
</div>

<div class="row">
<div class="col-lg-12">
<div class="card">
<div class="card-header">board register</div>
<div class="card-body">
<div class="form-group">
<label>글번호</label>
<input class="form-control" name='bno' value="${board.bno }" readonly>
</div>

<div class="form-group">
<label>title</label> <input class="form-control" name='title' value="${board.title }" readonly />
</div>

<div class="form-group">
<label>text area</label>
<textarea class="form-control" rows="3" name='content' readonly >
${board.content }

</textarea>
</div>

<div class="form-group">
<label>Writer</label><input class="form-control" name='writer' value="${board.writer }" readonly >
</div>

<button data-oper='modify'
class="btn btn-default"
>수정 </button>

<button data-oper='list'
class="btn btn-info" > 리스트 </button>

<form id='operForm' action="/board/modify" method="get">
<input type='hidden' id='bno' name='bno' value='${board.bno}'>

</form>




</div>





</div>
</div>
</div>





<div class="card">
<div class="row">
<div class="col-lg-12">

<div class="card-header">
<strong> 댓글</strong>
</div>
<div id="a" class="direct-chat-messages">
</div>
<div id="k">
</div>

<div class="card-body">
<div class="form-group">
<label> 이름 </label>
<input class="form-control" data-i="n">
</div>
<div class="form-group">
<label> 내용</label>
<input class="form-control" data-i="c"> 
</div>

<button class="btn btn-primary" data-a="cre"> 등록! </button>
</div>
</div>
</div>
</div>
</div>














</body>
</html>