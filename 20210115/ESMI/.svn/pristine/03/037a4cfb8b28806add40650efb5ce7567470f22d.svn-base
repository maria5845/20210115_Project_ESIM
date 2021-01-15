<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>


<div class="cont-header">
	<hgroup>
	    <h1>PIE</h1>
	</hgroup>
	<button type="button" class="close-pop is-close">팝업 닫기</button>
</div><!-- // .cont-header -->
	
<div class="cont-body">
	<!-- [D] 좌우 마진이 있을때 hasMargin  부여 -->
	<div class="tb-wrap">
	
		<div id="tabstrip" style="height: 400px">
			<ul>
				<li class="k-state-active"><spring:message code='TABLE.COLUMN.PIE_INFO' text='PIE 정보'/></li>
				<li><spring:message code='TAB.BUTTON.ATTR_INFO' text='속성 정보'/></li>
			</ul>
			
			<!-- 탭 내부영역 -->
			<!-- 사용자정보 -->
			<div>
				<div class="pd-lr15">
					<form id="actionForm" method="post" action="">
						<input type="hidden" name="action_type" value="${action_type}" />
						<input type="hidden" name="pie_seq" value="${bean.pie_seq}" />
						<input type="hidden" id="user_id" name="user_id" value="<c:out value="${user_id}"></c:out>" />
						
					    <table class="tb2" style="width: 100%;">
					    	<colgroup>
								<col width="140">
								<col>
							</colgroup>
							<tbody>
								<tr>
					        		<th scope="row"><spring:message code='TABLE.COLUMN.PIE_ID' text='PIE ID'/><span class="red">*</span></th>
					        		<td>
					        			<input type="text" name="pie_id" id="pie_id" class="itx itx-p100" 
					        			value="<c:out value="${bean.pie_id}"></c:out>" placeholder="<spring:message code='PIE_ID' text='PIE ID'/>"
					        			${action_type == 'modify' ? 'readonly' : '' }
					        			maxlength="30" required 
					        			data-parsley-errors-container="#pie_id_text"/>
										<span id="pie_id_text"></span>
									</td>
					    		</tr>
					    		
					    		<tr>
					        		<th scope="row"><spring:message code='TABLE.COLUMN.PIE_NM' text='PIE 명'/><span class="red">*</span></th>
					        		<td>
					        			<input type="text" name="pie_nm" id="pie_nm" class="itx itx-p100" 
					        			value="<c:out value="${bean.pie_nm}"></c:out>" placeholder="<spring:message code='PIE_NM' text='PIE 명'/>"
					        			maxlength="30" required 
					        			data-parsley-errors-container="#pie_nm_text"/>
										<span id="pie_nm_text"></span>
									</td>
					    		</tr>
					    		
					    		<tr>
					        		<th scope="row"><spring:message code='TABLE.COLUMN.PIE_IP' text='PIE IP'/><span class="red">*</span></th>
					        		<td>
					        			<input type="text" name="pie_ip" id="pie_ip" class="itx itx-p100"
					        			value="<c:out value="${bean.pie_ip}"></c:out>" placeholder="<spring:message code='PIE_IP' text='PIE IP'/>"
					        			maxlength="30" required 
					        			data-parsley-errors-container="#pie_ip_text"/>
										<span id="pie_ip_text"></span>
									</td>
					    		</tr>
					    		
					    		<c:if test="${action_type == 'modify'}">
						    		<%-- <tr>
						        		<th scope="row"><spring:message code='TABLE.COLUMN.CIM_VER' text='CIM 버전'/></th>
						        		<td>
						        			<input type="text" name="cim_ver" id="cim_ver" class="itx itx-p100" value="<c:out value="${bean.cim_ver}"></c:out>" placeholder="<spring:message code='TABLE.COLUMN.CIM_VER' text='CIM 버전'/>" 
						        			data-parsley-type="cim_ver" maxlength="50" />
										</td>
						    		</tr>
						    		
						    		<tr>
						        		<th scope="row"><spring:message code='TABLE.COLUMN.ADDRMAP_VER' text='ADDRMAP 버전'/></th>
						        		<td>
						        			<input type="text" name="addrmap_ver" id="addrmap_ver" class="itx itx-p100" value="<c:out value="${bean.addrmap_ver}"></c:out>" placeholder="<spring:message code='TABLE.COLUMN.ADDRMAP_VER' text='ADDRMAP 버전'/>" 
						        			data-parsley-type="addrmap_ver" maxlength="50" />
										</td>
						    		</tr>
						    		
						    		<tr>
						        		<th scope="row"><spring:message code='TABLE.COLUMN.WEB_VER' text='WEB 버전'/></th>
						        		<td>
						        			<input type="text" name="web_ver" id="web_ver" class="itx itx-p100" value="<c:out value="${bean.web_ver}"></c:out>" placeholder="<spring:message code='TABLE.COLUMN.WEB_VER' text='WEB 버전'/>" 
						        			data-parsley-type="web_ver" maxlength="50" />
										</td>
						    		</tr>
						    		
						    		<tr>
						        		<th scope="row"><spring:message code='TABLE.COLUMN.STATS_AGENT_VER' text='통계 에이전트 버전'/></th>
						        		<td>
						        			<input type="text" name="stats_agent_ver" id="stats_agent_ver" class="itx itx-p100" value="<c:out value="${bean.stats_agent_ver}"></c:out>" placeholder="<spring:message code='TABLE.COLUMN.STATS_AGENT_VER' text='통계 에이전트 버전'/>" 
						        			data-parsley-type="stats_agent_ver" maxlength="50" />
										</td>
						    		</tr>
						    		
						    		<tr>
						        		<th scope="row"><spring:message code='TABLE.COLUMN.ALARM_AGENT_VER' text='알람 에이전트 버전'/></th>
						        		<td>
						        			<input type="text" name="alarm_agent_ver" id="alarm_agent_ver" class="itx itx-p100" value="<c:out value="${bean.alarm_agent_ver}"></c:out>" placeholder="<spring:message code='TABLE.COLUMN.ALARM_AGENT_VER' text='알람 에이전트 버전'/>" 
						        			data-parsley-type="alarm_agent_ver" maxlength="50" />
										</td>
						    		</tr> --%>
						    		
						    		<tr>
						        		<th scope="row"><spring:message code='TABLE.COLUMN.DEPLOY_STATE' text='배포 상태'/></th>
						        		<td>
						        			<input type="text" name="deploy_state" id="deploy_state" class="itx itx-p100" value="<c:out value="${bean.deploy_state}"></c:out>" placeholder="<spring:message code='TABLE.COLUMN.DEPLOY_STATE' text='배포 상태'/>" 
						        			data-parsley-type="deploy_state" maxlength="50" readonly />
										</td>
						    		</tr>
					    		
						    		<tr>
					        			<th scope="row"><spring:message code='TABLE.COLUMN.USE_YN' text='사용 여부'/><span class="red">*</span></th>
				        				<td>
											<label class="radio">
												<input type="radio" name="use_yn" value="Y" ${bean.use_yn == 'Y' || action_type == 'add' ? 'checked=checked' : ''}>
												<i></i>Yes</label>
											<label class="radio">
												<input type="radio" name="use_yn" value="N" ${bean.use_yn == 'N' ? 'checked=checked' : ''}>
											<i></i>No</label>
										</td>
					    			</tr>
					    		</c:if>
						    		
							</tbody>
						</table>
					</form>
				</div>
			</div> <!-- // 기본정보 -->
			<!-- 트리 매핑 -->
			<div class="l-kendo-wrap override">
				<div class="pd-lr15">
					<!-- <div id="grid_pieattr"></div> -->
				    <table class="tb2" style="width: 100%;">
				    	<colgroup>
							<col width="80">
						</colgroup>
						<tbody id="attrContent">
						
						</tbody>
					</table>
					<div class="add-tr" onclick="addAttr();"><spring:message code='BUTTON.ADD' text='추가' /></div>
				</div>
			</div> <!-- // 트리 매핑 -->
		</div>
	</div>
</div>

<div class="cont-foot">
    <div class="action hasMargin">
        <div class="fl">
        </div>
        <div class="fr">
        	<button type="button" class="btn btn-lg btn-x90" onclick="javascript:fnUserAction();"><spring:message code="BUTTON.SAVE" text="저장" /></button>
            <button type="button" class="btn btn-default btn-x90 is-close"><spring:message code="BUTTON.CANCEL" text="취소" /></button>
        </div>
    </div>
</div>

