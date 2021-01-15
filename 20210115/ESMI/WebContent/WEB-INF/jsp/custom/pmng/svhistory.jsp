<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>

<style>
.detail_box{
	width: 1026px;
	height: 730px;
    float: right;
/*  	background-color: #32323d; */
/*     border-radius: 10px;s
/*     padding: 10px; */
}
#grid, #detail_grid, #chart_box{
	border-radius: 10px;
    overflow: hidden;
}
.detail_box span.excel_btn {
	float: right;
    position: relative;
    top: 6px;
    right: 50px;
    z-index: 10;
    color: #b4b2b3;
    cursor:pointer;
}
.hide{
	display:none;
}
</style>


     <div class="m-form">
         <div class="in">

            <table id="hdrListSrch" class="inForm">
           		<colgroup>
<%--             		<col width="80px"> --%>
<%--             		<col width="120px"> --%>
            		<col width="120px">
            		<col width="120px">
            		<col width="590px">
            		<col width="80px">
            		<col width="120px">
            		<col width="*">
            	</colgroup>
                <tbody>
                	<tr>
<!--                      	<th scope="row" class="text-right"> -->
<%--                         	 <label for="dvc_id"><spring:message code="TABLE.COLUMN.DVC_ID" text="장치 ID" /></label> --%>
<!--                     	</th> -->
<!--                      	<td> -->
<!--                         	<input type="text" id="dvc_id" name="dvc_id" class="itx itx-x180"/> -->
<!--                      	</td> -->

                     	<th scope="row" class="text-right">
                        	 <label for="var_id"><spring:message code="TABLE.COLUMN.VAR_ID" text="수집항목 ID" /></label>
                    	</th>
                     	<td>
                        	<input type="text" id="var_id" name="var_id" class="itx itx-x180"/>
                     	</td>
	                     
                     	<td>
                        	<input name="sdate" id="sdate" class="picker-input date">
							<input name="stime" id="stime" class="picker-input time">
							<span>~</span>
							<input name="edate" id="edate" class="picker-input date">
							<input name="etime" id="etime" class="picker-input time">
                     	</td>
                     	<td>
							<input id="lot_id" name="lot_id" value="${bean.lot_id}" <c:out value="${bean.lot_id }"/> />
							<script id="noDataTemplate" type="text/x-kendo-template">
								<strong>No Data</strong>
							</script>
                     	</td>
		             	<td>
            				<button type="button" class="btn btn-srch btn-medium" id="kendoSearchBtn" 
            					onclick="javascript:fnLoad()"
            					style="position:static;">
            					<spring:message code="BUTTON.SEARCH" text="조회" /></button>
            			</td>
            			
            			<td>
            				<button type="button" class="btn btn-srch btn-medium" id="kendoSearchBtn" 
            					onclick="javascript:fnShowHistoryDetail()"
            					style="position:static;">
            					<spring:message code="BUTTON.SHOWDETAIL" text="Show Detail" /></button>
            			</td>
<!-- 		             	<td> -->
<!--             				<button type="button" class="btn btn-gray btn-medium" -->
<!--             					onclick="javascript:fnShowHistoryDetail()" -->
<!--             					style="position:static;"> -->
<%--             					<spring:message code="BUTTON.SHOWDETAIL" text="Show Detail" /></button> --%>
<!--             			</td> -->
					</tr>
                </tbody>
            </table>
        </div>
    </div>


    <div class="grid-wrap" style="height: 100%">
		<input type="hidden" id="page" value="1">
		<div style="width: 50%; height: 30px; text-align: center;">SV History Summary</div>
		<div id="grid" style="float: left; width: 50%;"></div>
		
		<div class="detail_box fr" style="width: 49%;   position: absolute;top: 70px;right: 8px;">
			<div style="height: 30px; text-align: center;">SV Change History & Trend</div>
			<div id="detail_grid" style="margin-bottom: 20px;"></div>
			
			<span onclick="fnCreateExcel('chart_box');" class="hide excel_btn">
				<i class="fa fa-file-excel-o" style="font-size: 20px;" aria-hidden="true"></i>
			</span>
			<div id="chart_box" style="height: 330px;">
			</div>
		</div>
		
		<script id="pk-template" type="text/x-kendo-template">
			<input class="svHistorySeq" type="checkbox" value="#:var_id#"
				# if(checked == 'true' ) { #
					#='checked'#
				# } #
			/>
		</script>
		
		<script id="cmd-template" type="text/x-kendo-template">
			<button type="button" class="btn btn-small btn-grid-edit" 
			onclick="javascript:ClPopup.fnOnClickModalOpen('/pmng/svhistorydetail.do', 'action_type=modify&history_seq=#:history_seq#', '500');">
			<i class="fa fa-edit"></i> <spring:message code="BUTTON.EDIT" text="수정" /></button>
		</script>
    </div>
    
    
