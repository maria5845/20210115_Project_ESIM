<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<c:if test="${tree_use_yn == 'Y' || tree_use_yn == 'S'}">
	<!-- 좌측 Tree 영역 -->
	<div id="lnbTree" class="lnbTree">

		<div id="treeDiv" class="lnbTreeDv"></div>

	</div>
</c:if>
	
<script id="radio-treeview" type="text/kendo-ui-template">
	# if (!item.items) { #
		<input type="radio" name="radio_c" 
		# if(item.checked) { #
			#='checked'#
		# } #
		></a>
	# } #
	#: item.text #
</script>


	
<script type="text/javascript">
<c:if test="${tree_use_yn == 'Y' || tree_use_yn == 'S' }">
$(document).ready(function(){
	fnTreeIt();
});



/**
 * 트리 그리기
 */
function fnTreeIt() {
	
	ClAjax.fnCallAjax({
		url: '/treemng/lnbTreeAjax.do',
		paramJsn: {
			<c:if test="${bean.dsbd_temp_seq == null or ''.equals(bean.dsbd_temp_seq)}">
			dsbd_seq : '${bean.dsbd_seq}'
			</c:if>
			<c:if test="${bean.dsbd_temp_seq != null and !''.equals(bean.dsbd_temp_seq)}">
			dsbd_seq : '${bean.dsbd_temp_seq}'
			</c:if>
		},
		sucFn: function(data){
			
			var l = eval(data.data.list);
			
			<c:if test="${tree_use_yn eq 'Y'}">
				$("#treeDiv").kendoTreeView({
					checkboxes: {
						checkChildren: true,
					},
					select: function(e){
	
						// 전역변수에 set
	// 					loadid_selected = $("#treeDiv").data('kendoTreeView').dataItem(e.node).name;
	
						// 선택시, 체크박스 체크
						var chbx = $(e.node).find(":checkbox");
						chbx.prop("checked", !chbx.prop("checked"));
	// 					$("#treeDiv").data('kendoTreeView').dataItem(e.node).checked = chbx.prop("checked");
	
						// 부모 Check 액션
						var node = $("#treeDiv").data('kendoTreeView').dataItem(e.node);
						fnActChckNdsParent(node, chbx.prop("checked"));
						
						// 자식 check 액션
						fnActChckNdsChild(node, chbx.prop("checked"));
						
						if(typeof fnLnbChkBx == 'function') fnLnbChkBx();
						
						e.preventDefault();
						return false;
					},
					check: function(e){
						if(typeof fnLnbChkBx == 'function') fnLnbChkBx();
					},
					dataSource: l,
				});
			</c:if>
			<c:if test="${tree_use_yn eq 'S'}">
				$("#treeDiv").kendoTreeView({
					template: kendo.template($("#radio-treeview").html()),
					select: function(e){
					
						// 선택시 라디오 버튼 체크
						var i = $("#treeDiv").data('kendoTreeView').dataItem(e.node).index;
						$("input:radio").eq(i).prop( "checked", true );
						
						//전체 라디오 리스트
						var radio_list = $("#treeDiv").data('kendoTreeView').dataSource.view()[0].items;
						
						//이미 체크된 항목 해제
						for(var index in radio_list){
							radio_list[index].checked = 0;
						}
						
						//checked 속성 부여
						radio_list[i].checked = true
						
						if(typeof fnLnbChkBx == 'function') fnLnbChkBx();
						
						e.preventDefault();
						return false;
					},
					check: function(e){
						if(typeof fnLnbChkBx == 'function') fnLnbChkBx();
					},
					dataSource: l,
				});
			</c:if>
			
// 			if(l.length > 0){
// 				// 처음 로드할땐, 첫번째 트리 선택 및 값저장
// 				// 선택
// 				var tView = $("#treeDiv").data('kendoTreeView');
// 				tView.select(tView.findByUid(tView.dataSource.get(l[0].id).uid));
// 			}
			
		},
		compltFn: function(){
			if(typeof fnLnbCallback == 'function') fnLnbCallback();
			
			//설정에서 선택한 단일 장비 선택
			<c:if test="${tree_use_yn == 'S' }">
				//전체 라디오 리스트
				var radio_list = $("#treeDiv").data('kendoTreeView').dataSource.view()[0].items;
				
				//checked 항목 선택
				for(var index in radio_list){
					if(radio_list[index].checked == true){
						$("input:radio").eq(index).prop( "checked", true );
					}
				}
			</c:if>
		},
		errHandle: true,
	});
	
}
</c:if>


/**
 * 글씨 선택시, check 액션(부모)
 */
function fnActChckNdsParent(_node, _checked){
	if(_node == null) return false;
	
	_node.checked = _checked;
	if(_node.checked){
		delete _node.dirty;
	}else{
		_node.dirty = true;
	}
	
	// 부모 check 액션
	fnActChckNdsParent($("#treeDiv").data('kendoTreeView').dataSource.get(_node.p_tree_seq), _checked);
}

/**
 * 글씨 선택시, check 액션(자식)
 */
function fnActChckNdsChild(_node, _checked){
	if(_node == null) return false;
	
	var n = _node.items;
	
	for(var index in n){
		n[index].checked = _checked;
		
		fnActChckNdsChild(n[index], _checked)
	}
}

/**
 * 좌측 트리의 확대/축소 버튼을 토글시 발생
 */
function onclickTglLnbIt(){
	if($('.lnbTree').hasClass('display-none')){
		// asis:축소, tobe:펼침
		
		// 왼쪽영역 변경
		$('.lnbTree').removeClass('display-none');
		// 메인영역 변경
		$('.cntnt_lnb').removeClass('mg-l0');
		// 버튼 변경
		$('#lnbTreeTglBtn').addClass('btn-gray');
		$('#lnbTreeTglBtn').removeClass('btn-default');
		
		// 좌측 트리영역 토글시 실행할 함수
		if(typeof fnLnbRszDo == 'function') fnLnbRszDo();
		
	}else {
		// asis:펼침, tobe:축소
		
		// 왼쪽영역 변경
		$('.lnbTree').addClass('display-none');
		// 메인영역 변경
		$('.cntnt_lnb').addClass('mg-l0');
		// 버튼 변경
		$('#lnbTreeTglBtn').addClass('btn-default');
		$('#lnbTreeTglBtn').removeClass('btn-gray');
		
		// 좌측 트리영역 토글시 실행할 함수
		if(typeof fnLnbRszDo == 'function') fnLnbRszDo();
	}
}

/**
 * 선택된 체크박스의 객체 array를 가져오는 function
 */
function fnGetChckItms(){
	if($("#treeDiv").length > 0){
		return fnGetChckNds($("#treeDiv").data('kendoTreeView').dataSource.view());
	}else{
		return null;
	}
}

/**
 * Recursive 함수. 체크박스 선택값 가져오기
 */
function fnGetChckNds(nodes){
	var node, childCheckedNodes;
	var checkedNodes = [];
	
	for (var i = 0; i < nodes.length; i++) {
		node = nodes[i];
		
		if (node.checked) {
			// json 객체가 아닌, 특정값을 넣고싶다면 이부분을 수정
			checkedNodes.push(node);
		}
			
		if (node.hasChildren) {
			childCheckedNodes = fnGetChckNds(node.children.view());
			if (childCheckedNodes.length > 0){
				checkedNodes = checkedNodes.concat(childCheckedNodes);
			}
		}
	}
	return checkedNodes;
}
</script>