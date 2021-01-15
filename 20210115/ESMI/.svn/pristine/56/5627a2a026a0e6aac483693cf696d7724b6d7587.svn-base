<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>


<script type="text/javascript">
//목록 페이지 별로 설정
ClLayout.fnGetTabJsn().urlList.push('/lang/langmngAjax.do');

//Grid생성
ClKendo.fnCreateGrid({
	selector: '#grid',
	height: 720,
	columns: [
// 		{ field: "lang_cd_nm",		title: '<spring:message code="TABLE.COLUMN.LANG_CD_NM" 		text="다국어 코드" />', 		width: 150, attributes:{ 'class':"text-center"}},
		{ field: "lang_msg_cd",		title: '<spring:message code="TABLE.COLUMN.LANG_MSG_CD" 	text="다국어 메시지 코드" />', 	width: 200, },
		{ field: "lang_msg_ko",		title: '<spring:message code="TABLE.COLUMN.LANG_MSG_KO" 	text="한국어" />',	width: 250, },
		{ field: "lang_msg_en",		title: '<spring:message code="TABLE.COLUMN.LANG_MSG_EN" 	text="영어" />',		width: 250, },
		{ field: "lang_msg_cn",		title: '<spring:message code="TABLE.COLUMN.LANG_MSG_CN" 	text="중국어" />',	width: 250, },
		{ field: "lang_msg_pl",		title: '<spring:message code="TABLE.COLUMN.LANG_MSG_PL" 	text="폴란드어" />',	width: 250, },
		{ title: '<spring:message code="GRID.HEADER.WORK" 	text="작업" />', template: kendo.template($("#cmd-template").html()), width:100, attributes:{ 'class':"text-center"}},
	],
	excel: {
    	fileName: '${curMenuNm}'//다운로드 파일명
    },
    pageable: {
    	pageSize: 50,
    },
    scrollable: {
        virtual: true//가상스크롤 사용여부 - Boolean (default: false) 
    },
    toolbar: false
});

ClCRUD.fnListSearchIt({selector: '#grid', url: ClLayout.fnGetTabJsn('urlList')});

/**
 * 다국어 변경내용 적용
 *  - 다국어 properties 재생성
 */
function fnApplyChangesLang(){
	if(confirm("<spring:message code='MESSAGE.LANG_UPT' text='변경된 다국어 정보를 서버에 반영하시겠습니까?'/>")){
		
		kendo.ui.progress($('body'), true);
		
		ClAjax.fnCallAjax({
			url: '/lang/applyChangesLangAjax.do',
			paramJsn: {
			},
			sucFn: function(data){
				alert("<spring:message code='MESSAGE.APPLY.COMPLETE' text='적용이 완료되었습니다.'/>");
			},
			errHandle: true,
			compltFn: function(){
				kendo.ui.progress($('body'), false);
			},
		});
	}
}
</script>
