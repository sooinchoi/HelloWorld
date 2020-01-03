<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Hello World!</title>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="/css/mainBase.css">
<link rel="stylesheet" type="text/css" href="/css/font-awesome/css/font-awesome.css">

	<style>
            h1{
                text-align: center;
                padding-top: 50px;
                padding-bottom: 50px;
            }
            ul{
                background-color: lightgray;
                font-size: 13px;
            }
            .card{
                margin-top:20px;
            }
            .myprofile{
                float: left;
                margin-top: 20px;
                margin-bottom: 30px;
            }
            #mycard{
                height: 300px;
                float:none;
                display:flex;
                margin: auto;
                align-items:center;
            }
            .cardwrap{
                float:left;
            }
            .card-img-top{
                width: 80%;
                margin:10%;
            }
        </style>
</head>
<body>
	<jsp:include page="/WEB-INF/views/standard/header.jsp"/>
	
 		<div id=baseBackgroundColor>
            <div class=container>
                <div class=row>
                    <div class="col-12" id=aroundContent>
                    </div>
                </div>
            </div>
            
            <!--      몸통 시작!!!   -->

            
            <div class="container">
				<h1> Programming-Log</h1>
	            <ul class="nav nav-tabs d-none d-sm-block">
	                <li class="nav-item">
	                    <a class="nav-link" href="#">내 포트폴리오</a>
	                </li>
	                <li class="nav-item">
	                    <a class="nav-link" href="#">내 지식인</a>
	                </li>
	                <li class="nav-item">
	                    <a class="nav-link" href="#">내 스크랩</a>
	                </li>
	                <li class="nav-item">
	                    <a class="nav-link" href="#">내 팀 프로젝트</a>
	                </li>
	                <li class="nav-item">
	                    <a class="nav-link active" href="#">방명록</a>
	                </li>
	            </ul>
	            <ul class="nav nav-tabs d-sm-none">
	                <li class="nav-item">
	                    <a class="nav-link" href="#" style="padding:7px;">내 포트폴리오</a>
	                </li>
	                <li class="nav-item">
	                    <a class="nav-link" href="#" style="padding:7px;">내 지식인</a>
	                </li>
	                <li class="nav-item">
	                    <a class="nav-link" href="#" style="padding:7px;">내 스크랩</a>
	                </li>
	                <li class="nav-item">
	                    <a class="nav-link" href="#" style="padding:7px;">내 팀 프로젝트</a>
	                </li>
	                <li class="nav-item">
	                    <a class="nav-link active" href="#" style="padding:7px;">방명록</a>
	                </li>
	            </ul>
	            <div class="row">
	                <div class="col-12 col-md-4 col-lg-3 myprofile">
	                    <div class="card" id="mycard">
	                        <img src="lion.png" class="card-img-top" alt="..." style="width: 170px;height: 170px;margin:15px;">
	                        <div class="card-body">
	                            <h3 class="card-title" style="text-align: center;">라이언 님</h3>
	                            <p class="card-text" style="text-align: center;">point : 12,345</p>
	                        </div>
	                    </div>
						<div style = "text-align: end;margin-top: 10px;">
                       		<button id="addPF">포트폴리오 추가하기</button>
                    	</div>
	                </div>
	                <div class ="col-12 col-md-8 col-lg-9 wrapportfolio">
	                	<c:forEach items="${list }" var="dto">
	                		<div class="cardwrap col-6 col-xl-4">
		                        <div class="card">
		                            <img src="${dto.image1}" class="card-img-top" alt="..." style="height: inherit;width: 160px;height: 170px;margin:15px;">
		                            <div class="card-body" style="padding: 5px;width:190px;height:115px;">
		                                <h5 class="card-title" style="white-space:nowrap;overflow: hidden;text-overflow:ellipsis;width:100%;height:16px;"><a href="${pageContext.request.contextPath}/Portfolio/detail.do?seq=${dto.seq}">${dto.portfolioTitle}</a></h5>
		                                <p class="card-text" style="overflow: hidden;width:100%;height:60%;text-overflow: ellipsis;">${dto.purpose }</p>
	                                <div style="text-align: end;">
	                                </div>
		                            </div>
		                        </div>
	                    	</div>
						</c:forEach>
	                </div>
	            </div>
            </div>
            
            <!--       몸통 끝!!!   -->
            
            <div class=container>
                <div class=row>
                    <div class="col-12" id=aroundContent>
                    </div>
                </div>
            </div>
        </div>
        
        <jsp:include page="/WEB-INF/views/standard/footer.jsp"/>
        
        
		<script>
            $("#addPF").on("click",function(){
                location.href = "${pageContext.request.contextPath}/Portfolio/toInsert.do";
            })
        </script>
</body>
</html>