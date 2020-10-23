<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="X-UA-Compatible" content="ie=edge">

<title>Insert title here</title>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
</head>
<body>
<div class="row">
    <div class="col-xs-2 col-md-2"></div>
    <div class="col-xs-8 col-md-8">
    <h2 class="text-center">게시글 보기</h2><p>&nbsp;</p>
    <div class="table table-responsive">
        <table class="table">
        <tr>
            <th class="success">글번호</th>
            
            <th class="success">조회수</th>
            
        </tr>
           
         
        <tr>
            <th class="success">작성자</th>
            
            <th class="success">작성일</th>
            
        </tr>
         
        <tr>
            <th class="success">이메일</th>
            
        </tr>
         
        <tr>
            <th class="success">제목</th>
            
        </tr>
         
        <tr>
            <th class="success">글 내용</th>
            
        </tr>
         
        <tr>
            <td colspan="4" class="text-center">
			<input type="button" class="btn btn-danger" value="삭제하기" onclick="alert('삭제완료'),location.href='noticeListCP.jsp'">
			<input type="button" class="btn btn-primary" value="목록보기" onclick="location.href='noticeListCP.jsp'">
            </td>
        </tr>
     
             
         
        </table>
    </div>
     
    </div>
</div>
</body>
</html>