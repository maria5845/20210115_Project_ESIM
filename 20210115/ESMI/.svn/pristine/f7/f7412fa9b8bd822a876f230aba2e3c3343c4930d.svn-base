<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>

<c:set var="rootPath" value="${pageContext.request.contextPath}" scope="application"/>
<c:set var="userSession" value="${sessionScope.userSession}" scope="session"/>

/**
 * Excel 함수 목록
 */
/**
 * 
 * // 엑셀 다운로드
 * ClExcel.fnCommonExcelDown(_params)
 * 
 */


/**
 * Class 선언
 */
if(parent.ClExcel != null){
	ClExcel = parent.ClExcel;
} else{
	ClExcel = {
			/**
			 * 오류 데이터 선언
			 * 
			 */
			err_msg_jsn: {
				Common:'CSV file download failed.',
				ERR01: 'The data does not exist.'
			},
			/**
			 * 기본 변수 선언
			 */
			json: {
				isProcessing: false,
			},
			
			/**
			 * 공통 엑셀 다운로드
			 * @param _params 		: 	selector(선택)		검색영역 선택자
			 * 							handle(선택) 		함수형식
			 * 							selPos(선택) 		기본값 -1(가장 마지막 selector)
			 */
			fnCommonExcelDown: function(_params) {
				if(ClExcel.json.isProcessing) return;
				ClExcel.json.isProcessing = true;
				
				var cnfrmMsg = "CSV파일 다운로드를 진행하시겠습니까?";
				if("${serverLocale }".toUpperCase().indexOf("EN") > -1){
					cnfrmMsg = "Do you want to proceed with CSV download?";
				}
				if(_params.cnfrmMsg == null) _params.cnfrmMsg = cnfrmMsg;
				
				if(!_params.actionUrl){
					console.log('필수값을 넣어주세요.');
					return;
				}
				
				if(!confirm(_params.cnfrmMsg)){
					ClExcel.json.isProcessing = false;
					return false;
				}
				
				kendo.ui.progress($('body'), true);
				var now = new Date();
				if(_params.method == null) _params.method = "POST";
				if(_params.frameId == null) _params.frameId = "winExcelFrame";
				if(_params.data.excelFileName == null) _params.data.excelFileName = "CSV_" + now.getFullYear()+("0"+(now.getMonth()+1)).slice(-2)+("0"+now.getDate()).slice(-2);
				
				var f = document.createElement('form');
				var fileNm = _params.excelFileName;
				
				f.method = _params.method;
				f.action = _params.actionUrl;
				f.target = _params.frameId;
				
				//파일 다운로드 실행
				$.fileDownload(f.action,{
				    httpMethod: _params.method,
				    data: _params.data
				})
				//파일 다운로드 성공시
				.done(function(){
					kendo.ui.progress($('body'), false);
					ClExcel.json.isProcessing = false;
				})
				//파일 다운로드 실패시
				.fail(function(data, url){
					var temp = data;
					var start = temp.indexOf(">");
					var end = temp.indexOf("\<\/");
					
					//pre태그 text 가져온다.
					var str = temp.substring(start + 1, end);
					
					//str을 array로 parse
					var obj = JSON.parse(str);
					
					//해당 오류 데이터가 있으면 출력, 없으면 Common 오류메세지 출력
					//최상단 err_msg_jsn에서 오류 메세지 추가 가능
					var rs = ClExcel.err_msg_jsn[obj.data.msg] ? ClExcel.err_msg_jsn[obj.data.msg] : ClExcel.err_msg_jsn["Common"];
					
					alert(rs);
					kendo.ui.progress($('body'), false);
					ClExcel.json.isProcessing = false;
				});
			},
			
	}
}	


