<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>


<script type="text/javascript" charset="utf-8">
fnSetGrid();

fnSearchIt();

/**
 * Tree Grid 생성
 */
function fnSetGrid(){
	$("#childTree").kendoTreeList({
		dataSource: {
            schema: {
                model: {
                    expanded: true
                }
            }
		},
        filterable: true,
        sortable: true,
        columns: [
            { field: "tree_nm", title: "<spring:message code='TABLE.COLUMN.DVC_TREE_NM' text='장치 그룹 명' />"},
            { field: "dvc_nm", title: "<spring:message code='TABLE.COLUMN.DVC_MAPP_NM' text='매핑 장치 명' />" },
            { field: "tree_kd_nm", title: "<spring:message code='TABLE.COLUMN.DVC_GR_TYPE' text='장치 그룹 타입' />", width: 130, attributes:{ 'class':"text-center"}},
            { field: "use_yn", title: "<spring:message code='TABLE.COLUMN.USE_YN' text='사용 여부'/>", width: 120, attributes:{ 'class':"text-center"}},
            { field: "", title: "<spring:message code='BUTTON.ADDSUBLEVELDVCGROUP' text='하위 장치 그룹 추가' />" , width: 150, attributes:{ 'class':"text-center"}, template: kendo.template($("#k-template-add").html())},
            { field: "", title: "<spring:message code='BUTTON.EDIT' text='수정' />", width: 100, attributes:{ 'class':"text-center"}, template: kendo.template($("#k-template-edit").html())},
        ],
        pageable: false,
        editable: {
            move: true
        }
    });
	
	function tree_dragend(e) {
		ClAjax.fnCallAjax({
			url: '/treemng/treeMoveActionAjax.do',
			paramJsn: {
				s_tree_seq: e.source.tree_seq,
				s_p_tree_seq: e.source.p_tree_seq,
				t_tree_seq: e.destination.tree_seq,
				t_p_tree_seq: e.destination.p_tree_seq,
			},
			sucFn: function(data){
				
			},
			errHandle: true,
			compltFn: function(){
				
			},
		});
	}
    
    var childTreeData = $("#childTree").data("kendoTreeList");
    childTreeData.bind("dragend", tree_dragend);
}
/**
 * 테이블 생성
 */
function fnSearchIt() {
	kendo.ui.progress($('body'), true);
	
	ClAjax.fnCallAjax({
		url: '/treemng/treeMngFromParentAjax.do',
		paramJsn: {
			tree_seq:	"${bean.tree_seq}"
		},
		sucFn: function(data){
			if( data ){
				var l = data.data.list;
				
				var _grid = $("#childTree").data("kendoTreeList");
				_grid.dataSource.data(l);
			}
// 			$("#childTree").empty();
			
// 			$("#childTree").kendoTreeList({
// 				dataSource: {
// 					data: data.data.list,

// 	                schema: {
// 	                    model: {
// 	                        expanded: true
// 	                    }
// 	                }
// 				},
//                 filterable: true,
//                 sortable: true,
//                 columns: [
//                     { field: "tree_nm", title: "<spring:message code='TABLE.COLUMN.DVC_TREE_NM' text='장치 그룹 명' />"},
//                     { field: "dvc_nm", title: "<spring:message code='TABLE.COLUMN.DVC_MAPP_NM' text='매핑 장치 명' />" },
//                     { field: "tree_kd_nm", title: "<spring:message code='TABLE.COLUMN.DVC_GR_TYPE' text='장치 그룹 타입' />", width: 130, attributes:{ 'class':"text-center"}},
//                     { field: "use_yn", title: "<spring:message code='TABLE.COLUMN.USE_YN' text='사용 여부'/>", width: 120, attributes:{ 'class':"text-center"}},
// //                     { field: "", title: "<spring:message code='TABLE.COLUMN.ORD_CHG' text='순서 변경' />", width: 150, attributes:{ 'class':"text-center"}, template: kendo.template($("#k-template-step").html())},
//                     { field: "", title: "<spring:message code='BUTTON.ADDSUBLEVELDVCGROUP' text='하위 장치 그룹 추가' />" , width: 150, attributes:{ 'class':"text-center"}, template: kendo.template($("#k-template-add").html())},
//                     { field: "", title: "<spring:message code='BUTTON.EDIT' text='수정' />", width: 100, attributes:{ 'class':"text-center"}, template: kendo.template($("#k-template-edit").html())},
//                 ],
//                 pageable: false,
//                 editable: {
//                     move: true
//                 }
//             });
			
// 			function tree_dragend(e) {
// 				ClAjax.fnCallAjax({
// 					url: '/treemng/treeMoveActionAjax.do',
// 					paramJsn: {
// 						s_tree_seq: e.source.tree_seq,
// 						s_p_tree_seq: e.source.p_tree_seq,
// 						t_tree_seq: e.destination.tree_seq,
// 						t_p_tree_seq: e.destination.p_tree_seq,
// 					},
// 					sucFn: function(data){
						
// 					},
// 					errHandle: true,
// 					compltFn: function(){
						
// 					},
// 				});
// 			}
            
//             var childTreeData = $("#childTree").data("kendoTreeList");
//             childTreeData.bind("dragend", tree_dragend);
		},
		errHandle: true,
		compltFn: function(){
			kendo.ui.progress($('body'), false);
		},
	});
}

$("#allcol").click(function(){
	var treeList = $("#childTree").data("kendoTreeList");
	var dataItems = treeList.dataSource.data();
	
	$.each(dataItems, function(i, item) {
	    item.expanded = false;
	});
	
	treeList.dataSource.data(dataItems);
});

$("#allexp").click(function(){
	var treeList = $("#childTree").data("kendoTreeList");
	var dataItems = treeList.dataSource.data();

	$.each(dataItems, function(i, item) {
	    item.expanded = true;
	});
	
	treeList.dataSource.data(dataItems);
});


var isProcessing = false;
/**
 * Tree 위로 이동/ 아래로 이동 Action
 */
function fnTreeUpDwnIt(action_type, tree_seq, p_tree_seq, level, depth_ord){
	if(isProcessing) return;
	isProcessing = true;
	
	kendo.ui.progress($('body'), true);
	
	ClAjax.fnCallAjax({
		url: '/treemng/treeUpDownActionAjax.do',
		paramJsn: {
			action_type: action_type, 
			tree_seq: tree_seq, 
			p_tree_seq: p_tree_seq, 
			level: level, 
			depth_ord: depth_ord
		},
		sucFn: function(data){
			fnSearchIt();
		},
		errHandle: true,
		compltFn: function(){
			kendo.ui.progress($('body'), false);
			isProcessing = false;
		},
	});
}

</script>