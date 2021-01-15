<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>

<script type="text/javascript">


var isProcessing = false;
/**
 *  추가/수정 Action
 */
function fnTreeMvAction(s_tree_seq, s_p_tree_seq, t_tree_seq, t_p_tree_seq){
	if(isProcessing) return;
	isProcessing = true;
	
	if(confirm("<spring:message code='MESSAGE.TREEMV' text='선택하신 장치그룹의 하위로 이동 하시겠습니까?'/>")){
		
		kendo.ui.progress($('body'), true);
		
		ClAjax.fnCallAjax({
			url: '/treemng/treeMoveActionAjax.do',
			paramJsn: {
				s_tree_seq: s_tree_seq,
				s_p_tree_seq: s_p_tree_seq,
				t_tree_seq: t_tree_seq,
				t_p_tree_seq: t_p_tree_seq,
			},
			sucFn: function(data){
				$(".is-close:eq(0)").trigger("click");
				ClLayout.$owner().fnSearchIt();
			},
			errHandle: true,
			compltFn: function(){
				kendo.ui.progress($('body'), false);
				isProcessing = false;
			},
		});
	}else{
		isProcessing = false;
	}
}
</script>
