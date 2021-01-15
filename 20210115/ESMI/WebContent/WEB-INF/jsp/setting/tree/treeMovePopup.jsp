<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>


<div class="cont-header">
	<hgroup>
		<h1><spring:message code="BUTTON.CHANGESUBLEVELDVCGROUP" text="장치그룹 이동" /></h1>
	</hgroup>
	<button type="button" class="close-pop is-close">팝업 닫기</button>
</div><!-- // .cont-header -->
	
<div class="cont-body">
	<!-- [D] 좌우 마진이 있을때 hasMargin  부여 -->
	<div class="tb-wrap hasMargin">
	
		<form id="actionForm" method="post" action="">
			<input type="hidden" id="use_yn" name="use_yn" value="Y" />
			<input type="hidden" id="action_type" name="action_type" value="${action_type}" />

			<table class="tb2">
				<tbody>
					<tr>
						<td>
							<div class="ovf-y-scr" style="height: 600px;">
								<table class="table table-bordered">
									<colgroup>
										<col width="">
										<col width="150px">
									</colgroup>
									<thead>
										<tr>
											<th class="text-center"><spring:message code="TAB.BUTTON.DEVICEGROUP" text="장치 그룹" /></th>
											<th class="text-center"><spring:message code="GRID.HEADER.WORK" 	text="작업" /></th>
										</tr>
									</thead>
									<tbody>
										<c:forEach items="${list}" var="list"  varStatus="15">
											<tr>
												<td class="text-left" style="${bean.tree_seq eq list.tree_seq ? 'font-weight: 600 !important;' : ''}">
													<c:forEach var="i" begin="2" end="${list.level}">
														&nbsp; &nbsp; &nbsp; 
													</c:forEach>
													<c:if test="${list.level > 1}">
													┗
													</c:if>
													&nbsp; ${list.tree_nm}
												</td>
												<td class="text-center" style="${bean.tree_seq eq list.tree_seq ? 'font-weight: 600 !important; text-decoration: underline;' : ''}">
													<c:if test="${bean.p_tree_seq ne list.tree_seq }">
														<c:if test="${bean.level-1 eq list.level }">
																<button type="button" class="btn btn-small btn-lg" 
																	onclick="javascript:fnTreeMvAction('${bean.tree_seq}','${bean.p_tree_seq}','${list.tree_seq}','${list.p_tree_seq}');">
																<i class="fa fa-arrow-down"></i> <spring:message code="BUTTON.MOVE_LOW" text="하위로 이동" /></button>
														</c:if>
													</c:if>
													<c:if test="${bean.tree_seq eq list.tree_seq }">
														<spring:message code="MESSAGE.TREE_MOVE_GR" text="이동 시킬 장치그룹" />
													</c:if>
												</td>
											</tr>
										</c:forEach>
									</tbody>
								</table>
							</div>
							<hgroup class="mg-t20">
								<h4><spring:message code="MESSAGE.TREEMOVE" text="※ 같은 Depth로만 이동 가능합니다." /></h4>
							</hgroup>
						</td>
					</tr>
				</tbody>
			</table>
			
		</form>
	</div>
</div>

<div class="cont-foot">
	<div class="action hasMargin">
		<div class="fl">
		</div>
		<div class="fr">
			<button type="button" class="btn btn-default btn-x90 is-close"><spring:message code="BUTTON.CANCEL" text="취소" /></button>
		</div>
	</div>
</div>
