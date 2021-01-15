<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>

<script type="text/javascript" charset="utf-8">
// JSN 업로드
var tbl = [];
var lot_cnt = 0;

// 파일명 체크 function
function checkFileType(filePath) {
    var fileFormat = filePath.split(".");
    if (fileFormat.indexOf("csv") > -1) {
        return true;
    } else {
        return false;
    }
}

// 파일 체크 후 
function fnCheck() {
	var file = $("#excelFile").val().split("\\");
	var file_nm = file[file.length-1];
	
	if (file_nm == "" || file_nm == null) {
        alert("CSV을 선택해주세요.");
        return false;
    } else if (!checkFileType(file_nm)) {
        alert("CSV 파일만 업로드 가능합니다.");
        return false;
    }
	
    if (confirm("현재 모든 부품의 교체주기 정보가 삭제되고, CSV파일의 내용으로 업로드 됩니다.진행하시겠습니까?")) {
	    if (confirm("이전 데이터는 복구할 수 없습니다. 진행하시겠습니까?")) {
	       	var form = new FormData(document.getElementById('excelUploadForm'));
	       	kendo.ui.progress($('body'), true);
	       	$.ajax({ 
	       		url: "${rootPath}/treemng/treeExcelImport.do",
	       		enctype: "multipart/form-data",
	       		data: form,
	       		processData: false,
	       		contentType: false,
	       		type: 'POST',
	       		success: function (data){
// 	       			console.log(data);
					if(data.result){
						alert("업로드가 완료되었습니다.");
						//부모 grid 업데이트
						ClCRUD.fnListSearchIt({selector: '#tree1depthList', url: "/treemng/tree1depthMngAjax.do" });
						$(".is-close").eq(-1).trigger("click");
					}
	   			},
	   			error: function (jqXHR){
	   				console.log('error'); 
				},
				complete: function(){
					kendo.ui.progress($('body'), false);
				}
	   		});
	    }
    }
}


</script>
