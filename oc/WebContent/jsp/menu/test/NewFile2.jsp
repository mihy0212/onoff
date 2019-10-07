<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ page trimDirectiveWhitespaces="true"%>




<!DOCTYPE html>

<html>
<head>
<meta charset="UTF-8">
<title>Review</title>
<!-- jQuery library -->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
<!-- Latest compiled JavaScript -->
<script type="text/javascript">
function review_delete() {
	.done(function() {
        alert("삭제성공");
      })
</script>



</head>
<body>
	<div class="container">

		<table class="table">
			<thead>
				<tr>
					<th>번호</th>
					<th>제목</th>
					<th>질문내용</th>
					<th>질문작성일</th>
					<th>질문답변상태</th>
				</tr>
			</thead>

			<tbody>
				
				
				<tr class="info">
					<td>${dto.askNum}</td>
					<td>${dto.user_id}</td>
					<td><a data-toggle="modal" data-target="#myModal2" onclick="location.href='askread.do'">${dto.askTitle}</a></td>
					<td>${dto.review_goods_name}</td>
					<td>${dto.askDate}</td>
				</tr>
			</tbody>
		</table>

		<div class="row">
			<div class="col-sm-6">
			
				<div style="text-align:left">
					<ul class="pagination" id="page_num">
						<li>
									
										
						</li>
					</ul>
				</div>
			</div>
			<div class="col-sm-2"></div>
			<div class="col-sm-4 text-success" style="text-align: right;"> 
			<button type="button" class="btn btn-success btn-lg" data-toggle="modal" data-target="#myModal">Write</button>
			</div>
		</div>
		 
		
 <!-------------------------------------------- Modal 문의글작성 -------------------------------------------------->
  	<div class="modal fade" id="myModal" role="dialog">
    	<div class="modal-dialog modal-lg">
    
      	<!-- Modal content-->
      	<div class="modal-content">
	        <div class="modal-header">
	        <button type="button" class="close" data-dismiss="modal">&times;</button>
	        </div>
        <div class="modal-body">
          
			<div class="panel-group">
			<div class="panel panel-success" style="margin-top: 10px;">
				<div class="panel-heading">문의사항</div>
				<div class="panel-body">
					<%-- form --%>
					<form class="form-horizontal" role="form" onclick="location.href='askwrite.do'"  method="post">
						<div class="form-group">
							<label class="control-label col-sm-2">작성자(ID):</label>
							<div class="col-sm-10">
								<input type="text" class="form-control" id="user_id"
									name="user_id" placeholder="ID" readonly="readonly">${userEmail}
							</div>
						</div>
						<div class="form-group">
							<label class="control-label col-sm-2" for="pwd">제목:</label>
							<div class="col-sm-10">
								<input type="text" class="form-control" id="askTitle"
									name="askTitle" placeholder="Title">
							</div>
						</div>
						
						<div class="form-group">
							<label class="control-label col-sm-2" for="pwd">내용:</label>
							<div class="col-sm-10">
								<textarea class="form-control" rows="5"	placeholder="ask_content" name="review_content" id="review_content"></textarea>
							</div>
						</div>
						<div class="form-group">
							<div class="col-sm-offset-2 col-sm-10">
								<button type="submit" class="btn btn-success">작 성</button>
								<button type="reset" class="btn btn-danger">초기화</button>
							</div>
						</div>
					</form>


				</div>

			</div>
		</div>
        </div>
        <div class="modal-footer">
          <button type="button" class="btn btn-info" data-dismiss="modal">Close</button>
        </div>
      </div>
      
    </div>
  </div>
  
  
  <!------------------------------------- Modal2 _ 문의글읽기 --------------------------------------------->
  <div class="modal fade" id="myModal2" role="dialog">
    <div class="modal-dialog">
    
      <!-- Modal content-->
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          <h4 class="modal-title">ASK Detail</h4>
        </div>
        <div class="modal-body">
                   	
          <textarea rows="10" class="form-control" readonly="readonly" id="content"></textarea>	
                    
        </div>
<!-- ---------------------------------------------------------------------------------------------------------- -->
        <div class="modal-footer">
          <button type="button" class="btn btn-danger" onclick="location.href='askdelete.do'" >Delete</button>
          <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
        </div>
      </div>
      
    </div>
  </div>
		
	</div>


</body>
</html>