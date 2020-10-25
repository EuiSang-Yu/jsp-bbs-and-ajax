<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="X-UA-Compatible" content="ie=edge">

<title>Insert title here</title>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
    <script
  src="https://code.jquery.com/jquery-3.4.1.min.js"
  integrity="sha256-CSXorXvZcTkaix6Yvo6HppcZGetbYMGWSFlBw8HfCJo="
  crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>

    <!--폰트어섬추가 -->
    <link rel="stylesheet" type="text/css" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
    
    
<style>
#writeBtn{
	float: right;
}


</style>
</head>

<body>
    <div class="container">
        <div class="col-sm-12">
            <table class="table table-bordered table-hover" id="noticeListTable">
                <tr>
                    <th>추천수</th>
                    <th>제목</th>
                    <th>내용</th>
                    <th>작성자</th>
                    <th>작성날짜</th>
                    <th>조회수</th>
                </tr>
                
                
                <tr>
                    <td>1</td>
                    <td>가렌 공략법</td>
                    <td>D점멸을 쓰세요</td>
                    <td>팽이가렌</td>
                    <td>2020-10-23</td>
                    <td>2</td>
                </tr>
                
                
            </table>

            <!-- pagination 도 bootstrapk 의 예제 긁어온뒤 수정
                http://bootstrapk.com/components/#pagination
            -->

            <nav class="text-center">
                <ul class="pagination">
                    <li>
                    <a href="#" aria-label="Previous">
                        <span aria-hidden="true">&laquo;</span>
                    </a>
                    </li>
                    <li><a href="#">1</a></li>
                    <li><a href="#">2</a></li>
                    <li><a href="#">3</a></li>
                    <li><a href="#">4</a></li>
                    <li><a href="#">5</a></li>
                    <li>
                    <a href="#" aria-label="Next">
                        <span aria-hidden="true">&raquo;</span>
                    </a>
                    </li>
                </ul>
            </nav>
            
            <a href="noticeWrite.jsp" class="btn btn-default" id="writeBtn">작성하기</a>
        </div>
        </div>

</body>

<script>
$(document).ready(function(){
	$("#noticeListTable tr:nth-of-type(2)").click(function(){
		location.href="noticeView.jsp";
	});
});
</script>



</html>