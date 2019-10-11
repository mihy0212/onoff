<%@ tag language="java" pageEncoding="UTF-8"%>
<%@ attribute name="paging" type="co.oc.dto.Paging" %>
<%@ attribute name="pgfunc" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div align="center">
	<nav aria-label="Page navigation">
		<ul class="pagination" id="pagination">
			<c:if test="${ paging.startPage > paging.pageSize }">
				<li class="page-item"><a class="page-link" href="javascript:${ pgfunc }(${ paging.startPage-paging.pageSize })">이전 ${ paging.pageSize }건</a></li>
			</c:if>
			<c:forEach begin="${ paging.startPage }" end="${paging.endPage}" var="i">
				<c:if test="${ i != paging.page }">
					<li class="page-item"><a class="page-link" href="javascript:${ pgfunc }(${ i })">${ i }</a></li>
				</c:if>
				<c:if test="${ i == paging.page }">
					<li class="page-item disabled"><a class="page-link">${ i }</a></li>
				</c:if>
			</c:forEach>
			<c:if test="${ paging.endPage < paging.totalPageCount }">
				<li class="page-item"><a class="page-link" href="javascript:${ pgfunc }(${ paging.endPage+1 })">다음 ${ paging.pageSize }건</a>
			</c:if>
		</ul>
	</nav>
</div>