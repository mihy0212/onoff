<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>문의 관리</title>
<meta name="description" content="">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="${pageContext.request.contextPath }/assets/css/style.css"><!--Theme custom css -->
<script>
	$(document).ready(function(){
		/* $('.pull-right').on('click', function(){
			var con = confirm("선택한 문의글을 삭제하시겠습니까?");
			if(con){
				document.frm.submit();
			} else{
				return false;
			}
			
		}); */
		
		//제목 체크박스 선택 시 전체 선택
		$("#th_checkAll").on('click', function(){
			if( $("#th_checkAll").is(':checked') ){
		        $(".checkRow").prop("checked", true);
		      }else{
		        $(".checkRow").prop("checked", false);
		      }
		});
		
		//체크된 항목 삭제하기
		$('.pull-right').on('click', function(){
			var checkRow = "";
			var checkArray = new Array();
			
			if($(".checkRow").is(':checked')){
				for(var i=$(".checkRow:checked").length-1; i>-1; i--){ 
					checkArray.push($(".checkRow:checked").eq(i).attr('id'));
				}﻿ 
			}
			if(checkArray.length == 0){
				alert("삭제할 대상을 선택하세요.");
				return false;
			}
			
			console.log(checkArray);
			if(confirm("선택한 문의글을 삭제 하시겠습니까?")){
				for(var i=$(".checkRow:checked").length-1; i>-1; i--){ 
					$(".checkRow:checked").eq(i).closest("tr").remove(); 
				}
				$.ajax({
					type:"post",
					url: "borderdelete.do",
					dataType: "json",
					data: {
						checkArray: checkArray
					},
					success: function(result){
						if(result != 0){
							location.href="list.do";
							$(".checkRow").prop('checked',false);
						}
					}
				});					
			}
		});
		
	});
	
	/* $(document).ready(function() {
	    //라디오 요소처럼 동작시킬 체크박스 그룹 셀렉터
	    $('input[type="checkbox"][name="userNum"]').click(function(){
	        //클릭 이벤트 발생한 요소가 체크 상태인 경우
	        if ($(this).prop('checked')) {
	            //체크박스 그룹의 요소 전체를 체크 해제후 클릭한 요소 체크 상태지정
	            $('input[type="checkbox"][name="userNum"]').prop('checked', false);
	            $(this).prop('checked', true);
	        }
	    });
	}); */
	
	

</script>
<style>
.movebtn{
	border:0;
	padding: 3px;
	background-color: gray;
	border-radius: 8px;
	color: yellow;
}
.movebtn:hover{
	border:0;
	padding: 3px;
	background-color: #F2F2F2;
	border-radius: 8px;
	color: #886A08;
}
</style>
</head>
<body>
	<br />
	<br />
	<br />
<c:if test="${ userGrant == 'S' }">
<div class="container">
<div class="row">
	<div class="head_title text-left sm-text wow fadeInDown">
		<h2 class="text-uppercase"><strong>1:1 문의 목록</strong></h2>
	</div>
	<form name="frm" id="frm" method="post" action='borderdelete.do'>
		<div class="container">
			<div class="row">
				<table class="table table-striped table-bordered" style="text-align: center; border: 1px solid #dddddd">
					<thead>
						<tr>
							<th width="10" style="background-color: #eeeeee; text-align: center; vertical-align: middle;">답변</th>
							<th width="10" style="background-color: #eeeeee; text-align: center; vertical-align: middle;">번호</th>
							<th width="200" style="background-color: #eeeeee; text-align: center; vertical-align: middle;;">문의 제목</th>
							<th width="20" style="background-color: #eeeeee; text-align: center; vertical-align: middle;">처리 상태</th>
							<th width="80" style="background-color: #eeeeee; text-align: center; vertical-align: middle;">문의 등록일</th>
							<th width="10" style="background-color: #eeeeee; text-align: center; vertical-align: middle;">문의글로 이동</th>
							<th width="10" style="background-color: #eeeeee; text-align: center; vertical-align: middle;">
								<input type="checkbox" name="checkAll" id="th_checkAll"/>
							</th>
						</tr>
						<!-- db 목록을 가져와서 뿌려주는 곳 -->
						<c:if test="${list.isEmpty()}">
							<tr>
								<td colspan="5">등록된 글이 존재하지 않습니다.</td>
							</tr>
						</c:if>
						<c:forEach items="${list }" var="dto">
							<tr>
								<td><c:choose>
										<c:when test="${dto.askRe==dto.askNum}">
											<p><font color="red" style="font-weight: bold;">문의</font></p>
										</c:when>
										<c:otherwise>
											<p><font color="#045FB4" style="font-weight: bold;">답변</font></p>
										</c:otherwise>
									</c:choose></td>
									<td align="center">${dto.askNum }</td>
								<td align="center">${dto.askTitle }</td>
								<td align="center"><c:choose>
										<c:when test="${dto.askStatus=='1'}">
											<p><font color="red">답변 대기 중</font></p>
										</c:when>
										<c:when test="${dto.askStatus=='2'}">
											<p><font color="#045FB4">답변 완료</font></p>
										</c:when>
										<c:when test="${dto.askStatus=='3'}">
											<p><font color="#04B404">답변 글</font></p>
										</c:when>
										<c:when test="${dto.askStatus=='4'}">
											<p>답변 보류</p>
										</c:when>
									</c:choose></td>
								<td align="center">${dto.askDate }</td>
								<td>
									<c:if test="${dto.askRe==dto.askNum}">
										<input type="button" class="movebtn" onclick="location.href='borderRead.do?key=${dto.askNum}'" value="이동">											
									</c:if>
								</td>
								<td align="center"><input type="checkbox" id="${dto.askNum}" name="checkNum" class="checkRow" value="${dto.askNum}"></td>
							</tr>
						</c:forEach>
						<!-- db 목록을 가져와서 뿌려주는 곳 -->
				</table>
				<a><button type='button' class="btn btn-warning pull-right">삭제하기</button></a> <br>
				<!-- 	<a href="borderdelete.do" class="btn btn-primary pull-right">삭제하기</a> -->
			</div>
		</div>
	</form></div></div>
	</c:if>
	<c:if test="${ userGrant != 'S' }">
		<div align="center"><h2>관리자만 접근할 수 있는 페이지입니다.</h2></div>
	</c:if>
	<br><br><br>
</body>
</html>