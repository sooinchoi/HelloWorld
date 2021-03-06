<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Hello World!</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="icon" type="image/png" href="${pageContext.request.contextPath }/icon/favicon.ico"/>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<link rel="stylesheet" type="text/css" href="/css/font-awesome/css/font-awesome.css">
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<link rel="stylesheet" href="/css/mainBase.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
    <style>
	    div{font-size:13px;}
		textarea{border :0px;width:100%;height: 100px;resize: none;}
		input{width:100%;}
		#datepicker,#datepicker2{width:20%}
		.theme{line-height: 100px;}
		h4{text-align: center;background-color:lightgray;padding-top: 10px;padding-bottom: 10px;}
		#funcname, #funcexpl{text-align: center;font-size:10px;line-height:20px;}
		#funcexpl{line-height: 150px;}
		#funcname1,#funcname2,#funcname3{margin-bottom: 8px;}
		.redStar{color:red;}
		.line-over{width:100%;overflow:hidden;text-overflow:ellipsis;white-space:nowrap;}
		#plogPortfolio{background-color:#efefef;border-radius:5px 5px 0px 0px;padding:13px;}
        input, textarea{border: 1px solid rgba(0,0,0,.125);;background-color:#EAEAEA}
        .page{background-color:white;border-radius:5px;padding:10px;border: 1px solid rgba(0,0,0,.125);}
    </style>
</head>
<body>
	<jsp:include page="/WEB-INF/views/standard/plogHeader.jsp"/>
	
 		<div id="plogBaseBackgroundColor">
            <div class=container>
                <div class=row>
                    <div class="col-12" id=plogAroundContent>
                    </div>
                </div>
            </div>
            
            <!--      몸통 시작!!!   -->

            <form action="${pageContext.request.contextPath}/Portfolio/toModify.do?" method="post">
            	<input type="hidden" value="${pdto.seq}" name="seq">
	            <div class="container">
	            	<div class="page">
	            		<h1> 포 트 폴 리 오</h1>
			            <div class="row">
			                <div class="col-3 col-md-2"> 프로젝트명  </div>
			                <div class="col-9 col-md-10"><div class= "line-over"> ${pdto.portfolioTitle }</div> </div>               
			            </div>
				        <hr class="sp">
			            <div class="row">
			                <div class="col-3 col-md-2"> 수행 기간  </div>
			                <div class="col-9 col-md-10"> ${str} ~ ${end } </div>               
			            </div>
				        <hr class="sp">
			            <div class="row">
			                <div class="col-3 col-md-2"> 개발 목표 </div>
			                <div class="col-9 col-md-10"> <div class= "line-over">${pdto.purpose } </div> </div>               
			            </div>
				        <hr class="sp">
			            <div class="row">
			                <div class="col-3 col-md-2 theme"> 개발 환경 </div>
			                <div class="col-9 col-md-10"> <textarea name="environment" readonly> ${pdto.environment }</textarea></div>               
			            </div>
				        <hr class="sp">
			            <div class="row">
			                <div class="col-3 col-md-2 theme"> 구현 기능 </div>
			                <div class="col-9 col-md-10"> <textarea name="allFunction" readonly>${pdto.allFunction }</textarea></div>               
			            </div>
				        <hr class="sp">
			            <div class="row">
			                <div class="col-3 col-md-2 theme">  DB 설계 </div>
			                <div class="col-9 col-md-10"> <textarea name="dbUnitPlan" readonly>${pdto.dbUnitPlan }</textarea></div>               
			            </div>
				        <hr class="sp">
			            <div class="row">
			                <div class="col-3 col-md-2 theme"> 담당 역할 </div>
			                <div class="col-9 col-md-10"> <textarea name="role" readonly>${pdto.role }</textarea></div>               
			            </div>
				        <hr class="sp">
			            <div class="row">
			                <div class="col-3 col-md-2 theme"> 참여/기여도 </div>
			                <div class="col-9 col-md-10"> <textarea name="contribution" readonly>${pdto.contribution }</textarea></div>               
			            </div>
	            	</div>
		            <div class="page" style="margin-top:20px;">
			            <h4>구현 기능</h4>
			            <div class="row">
			                <div class="col-12 col-sm-3 col-xl-2"><img src="${pdto.image1}" style="height: 95%;width:100%;max-height: 170px;"><input type="hidden" name ="image1"></div>
			                <div class="col-12 col-sm-9 col-xl-10">
			                    <div class="row">
			                        <div class="col-3 col-sm-2  col-lg-1" id="funcname">기능명</div>
			                        <div class="col-9 col-sm-10 col-lg-11" id="funcname1"><div style="height:18px margin-bottom:" class= "line-over">${pdto.function1 } </div> </div>
			                        <div class="col-3 col-sm-2  col-lg-1" id="funcexpl" > 설명</div>
			                        <div class="col-9 col-sm-10 col-lg-11"><textarea name="explanation1" style="height:150px;" readonly>${pdto.explanation1 }</textarea>
			                        </div>
			                    </div>
			                </div>
			            </div>
						<c:choose>
				            <c:when test="${pdto.function2 != null }">
				            	<hr class="sp">
					            <div class="row">
					                <div class="col-12 col-sm-3 col-xl-2"><img src="${pdto.image2}" style="height: 95%;width:100%;max-height: 170px;"><input type="hidden" name ="image2"></div>
					                <div class="col-12 col-sm-9 col-xl-10">
					                    <div class="row">
					                        <div class="col-3 col-sm-2  col-lg-1" id="funcname"> 기능명</div>
					                        <div class="col-9 col-sm-10 col-lg-11" id="funcname2"><div style="height:18px margin-bottom:" class= "line-over">${pdto.function2 } </div></div>
					                        <div class="col-3 col-sm-2  col-lg-1" id="funcexpl" > 설명</div>
					                        <div class="col-9 col-sm-10 col-lg-11"><textarea name="explanation2" style="height:150px;" readonly>${pdto.explanation2 }</textarea>
					                        </div>
					                    </div>
					                </div>
					            </div>	
				           	</c:when>
						</c:choose>
			            
				        <c:choose>
				            <c:when test="${pdto.function2 != null }">
						        <hr class="sp">
					            <div class="row">
					                <div class="col-12 col-sm-3 col-xl-2"><img src="${pdto.image3}" style="height: 95%;width:100%;max-height: 170px;"> <input type="hidden" name ="image3"></div>
					                <div class="col-12 col-sm-9 col-xl-10">
					                    <div class="row">
					                        <div class="col-3 col-sm-2  col-lg-1" id="funcname"> 기능명</div>
					                        <div class="col-9 col-sm-10 col-lg-11 " id="funcname3"><div style="height:18px margin-bottom:" class= "line-over">${pdto.function3 } </div> </div>
					                        <div class="col-3 col-sm-2  col-lg-1" id="funcexpl" > 설명</div>
					                        <div class="col-9 col-sm-10 col-lg-11"><textarea name="explanation3" style="height:150px;" readonly>${pdto.explanation3 }</textarea>
					                        </div>
					                    </div>
					                </div>
					            </div>
			  				</c:when>
						</c:choose>
				        <hr class="sp">
			             <div class="row">
			                <div class="col-3 col-md-2"> 깃 링크  </div>
			                <div class="col-9 col-md-10"><div class="line-over" id="git-link" onclick="copy()" style="background-color:#EAEAEA;color:#007bff;cursor:pointer">${pdto.git }</div></div>               
			            </div>
			            <div class="interval"></div>
		            </div>
		            <div style="text-align: end;margin-top:20px;">
		            	<c:choose>
							<c:when test="${loginInfo.id ==ownerInfo.id}">
								<button class="btn btn-danger" type="button" id="delete">삭제</button>
		            			<button class="btn btn-info" type="submit">수정</button>
							</c:when>
						</c:choose>
		            	<button class="btn btn-secondary" type="button" id="return">목록</button>
		            </div>
		            
		        </div>
			</form>
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
                
                $("#return").on("click",function(){
                	location.href="${pageContext.request.contextPath}/Portfolio/toPlogmain.do";
                })
                $("#delete").on("click",function(){
                	location.href="${pageContext.request.contextPath}/Portfolio/delete.do?seq=${pdto.seq}";
                })
                function copy(){
                	var tempElem = document.createElement('textarea');
	  				tempElem.value = $("#git-link").html();
	  				document.body.appendChild(tempElem);
	  				
	  				tempElem.select();
	  				document.execCommand("copy");
	  				document.body.removeChild(tempElem);
	  				alert("클립보드에 복사되었습니다.");
                }
		</script>	
</body>
</html>
