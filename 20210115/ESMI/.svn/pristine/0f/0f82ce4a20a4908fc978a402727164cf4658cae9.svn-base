<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>


<script type="text/javascript">

// 장치 select 박스
var dvcList = ${dvc_list};
var nullable = {
		dvc_id : '선택',
		dvc_seq : null,
};
dvcList.unshift(nullable);
$("#dvc_seq").kendoDropDownList({
	height: '216px',
    filter: "startswith",
    dataTextField: "dvc_id",
    dataValueField: "dvc_seq",
    dataSource: dvcList
});

function save(){
	javascript:ClCRUD.fnActionIt({
		actionUrl: '/treemng/treeActionAjax.do', 
		param: '#actionForm', 
		validFnc: function(){return $('#actionForm').parsley().validate();}, 
		mdClsBool: true,
		listFnc: ClLayout.$owner().fnSearchIt
// 		listFnc: location.href='treeMngFromParent.do?tree_seq=${depth1_seq}'
// 		listFnc: ClLayout.$owner().location.href = '${rootPath}/treemng/treeMngFromParent.do?tree_seq=${depth1_seq}'
					
	});
}

</script>
