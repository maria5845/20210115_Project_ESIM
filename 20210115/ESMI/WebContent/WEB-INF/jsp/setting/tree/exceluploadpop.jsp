<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>

<div class="cont-header">
	<hgroup>
	    <h1>부품교체주기 업로드</h1>
	</hgroup>
	<button type="button" class="close-pop is-close">팝업 닫기</button>
</div><!-- // .cont-header -->
	
<div class="cont-body">
	<!-- [D] 좌우 마진이 있을때 hasMargin  부여 -->
	<div class="tb-wrap">
	
		<table id="hdrListSrch" class="upload">
			<colgroup>
				<col width="100">
				<col width="180">
			</colgroup>
			<tbody>
			    <tr>
			        <td scope="row" class="text-center">CSV 파일<span class="red">*</span></td>
			        <td>
			        	<form id="excelUploadForm" name="excelUploadForm" enctype="multipart/form-data" method="post" action="/filemng/excelUploadAjax.do">
							<div class="" style="border:1px solid #a59e9e;">
		         				<input id="excelFile" type="file" name="excelFile" />
							</div>
						</form> 
		            </td>
		       	</tr>
		    </tbody>
		</table>

	</div>
</div>

<div class="cont-foot">
    <div class="action hasMargin">
        <div class="fl">
        </div>
        <div class="fr">
        	<button type="button" class="btn btn-lg btn-x90" onclick="javascript:fnCheck();"><spring:message code="BUTTON.SAVE" text="저장" /></button>
            <button type="button" class="btn btn-default btn-x90 is-close"><spring:message code="BUTTON.CANCEL" text="취소" /></button>
        </div>
    </div>
</div>
    