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
 * ClCRUD 함수 목록
 */
/**
 * 
 * // 검색영역에 Enter키 매핑
 * ClCRUD.fnHeaderSearch(_params)
 * 
 * // 조회 조건 변경후, Enter키를 치면 _handle 함수 호출
 * ClCRUD.fnSearchEnterEvent(_params)
 * 
 * // 기본 List페이지 검색
 * ClCRUD.fnListSearchIt(_params)
 * 
 * // 기본 CUD 액션
 * ClCRUD.fnActionIt(_params)
 * 
 * // 선택 삭제 Action
 * ClCRUD.fnDeleteChk(_params)
 * 
 */


/**
 * Class 선언
 */
if(parent.ClCRUD != null){
	ClCRUD = parent.ClCRUD;
} else{
	ClCRUD = {
	
			/**
			 * 기본 변수 선언
			 */
			json: {
				isProcessing: false,
			},
			
			/**
			 * 검색영역에 Enter키 매핑
			 * @param _params 		: 	selector(선택)		검색영역 선택자
			 * 							handle(선택) 		함수형식
			 * 							selPos(선택) 		기본값 -1(가장 마지막 selector)
			 */
			fnHeaderSearch: function(_params) {
				
				var defOpt = {
						selector: '#hdrListSrch',
						handle: function(){ClCRUD.fnListSearchIt({selector: '#grid', url: ClLayout.fnGetTabJsn('urlList')})},
						selPos: -1,
				};
				
				_params = $.extend(true, {}, defOpt, _params);
				
				// 화면 상단의 검색영역 input 부분 엔터키하면 검색되도록 적용
				var $h = ClLayout.fnGetSelector(_params);
				if($h.length > 0 && typeof ClLayout.fnGetTabJsn() != 'undefined'){
					var hdrListSrchArr = [];
					$.each($h.find('input, select'), function(){
						hdrListSrchArr.push('#' + this.name);
					});
					if(hdrListSrchArr.length > 0) {
						ClCRUD.fnSearchEnterEvent({
							selector: hdrListSrchArr, 
							handle: _params.handle,
						});
					}
				}
			},
			
			/**
			 * 조회 조건 변경후, Enter키를 치면 _handle 함수 호출
			 * @param _params 		: 	selector(필수) 	dom 선택자(String or Array)
			 * 							handle(필수) 	함수형식
			 * 							selPos(선택) 	기본값 -1(가장 마지막 selector)
			 */
			fnSearchEnterEvent: function(_params) {
				
				if(_params.selPos == null) _params.selPos = -1;
				
				var list = [];
			 	if(typeof _params.selector === 'string') {
			 		list[0] = _params.selector;
			 	}else{
			 		list = _params.selector;
			 	}
			 	
			 	var sel = '';
			 	for(var i=0; i < list.length; i++) {
			 		ClLayout.fnGetSelector({selector: list[i]}).off("keypress").on("keypress", function(e){
			 			var keycode = (e.keyCode ? e.keyCode : e.which);
			 			if(keycode == 13){
			 				e.preventDefault();
			 				_params.handle();
			 			}
			 		});
			 	}
			},
			
			/**
			 * 기본 List페이지 검색
			 * @param _params 		: 	selector(필수) 	Table의 ID값 
			 * 							url(필수) 		Ajax 호출할 URL 
			 * 							page(선택) 		넘어온 값으로 페이지 설정
			 * 							selPos(선택) 	기본값 -1(가장 마지막 selector)
			 * 							callBack(선택)  성공 후, 해당 함수를 호출
			 */
			fnListSearchIt: function(_params) {
				
				if(typeof _params.url == 'undefined') return;
				
				if(_params.selPos == null) _params.selPos = -1;
				
				if(typeof _params.page != 'undefined') ClLayout.fnGetSelector(_params).find("#page").val(_params.page);
				
				kendo.ui.progress($('body'), true);
				
				var _prmDt = {};
				$.each(ClLayout.fnGetSelector({selector:"#hdrListSrch", selPos: _params.selPos}).find('input, select'), function(){
					var $a = $(this);
					_prmDt[$a.attr('name')] = $a.val();
				});
				
				ClAjax.fnCallAjax({
					url: _params.url,
					paramJsn: _prmDt,
					sucFn: function(data){
						ClKendo.fnSetDataToKendoGrid({selector: _params.selector, data: data.data.list, selPos: _params.selPos});
					},
					errHandle: true,
					compltFn: function(){
						if (_params.hasOwnProperty('callBack')) _params.callBack();
						kendo.ui.progress($('body'), false);
					},
				});
			},
			
			/**
			 * 기본 CUD 액션
			 * @param _params 		: 	selector(필수) 			Table의 ID값 
			 * 							url(필수) 				테이블 데이터를 가져올 url
			 * 							actionUrl(필수)			Ajax 호출할 URL 
			 * 							param(필수)				Ajax 호출할때 던져줄 패러미터
			 * 							selPos(선택) 			기본값 -1(가장 마지막 selector)
			 * 							validFnc(선택)			추가적인 validate 처리를 하고싶을때 함수를 추가하여 전달(정상일때 return true로)
			 * 							cnfrmMsg(선택)			진행전에 나오는 confirm 메세지(기본값: 진행하시겠습니까?)
			 * 							uLDelBool(선택)			tapJsn의 urlList의 마지막값을 삭제할지 여부(기본값: false)
			 * 							mdClsBool(선택)			모달창을 닫을지 여부(기본값: false)
			 * 							listFnc(선택)			Action 성공 후, list 검색 함수를 호출(있으면 이거, 아니면 기본값)
			 * 							callBack(선택)         	Action 성공 후, 해당 함수를 호출
			 */
			fnActionIt: function(_params){
				if(ClCRUD.json.isProcessing) return;
				ClCRUD.json.isProcessing = true;
				
				
				var cnfrmMsg = "진행하시겠습니까?";
				if("${serverLocale }".toUpperCase().indexOf("EN") > -1){
					cnfrmMsg = "Do you want to proceed?";
				}
				if(_params.cnfrmMsg == null) _params.cnfrmMsg = cnfrmMsg;
				
				
				if(!confirm(_params.cnfrmMsg)){
					ClCRUD.json.isProcessing = false;
					return false;
				}
				
				kendo.ui.progress($('body'), true);
				
				if(_params.hasOwnProperty('validFnc') && !_params.validFnc()){
					kendo.ui.progress($('body'), false);
					ClCRUD.json.isProcessing = false;
					return false;
				}
				
				if(_params.selPos == null) _params.selPos = -1;
				
				var p = _params.param;
				if(typeof p == 'string'){
					// = 이 없으면 selector라고 판단
					if(p.indexOf('=') == -1){
						// disabled 컬럼 처리
						var disabledField = $(p).find(':input:disabled').removeAttr('disabled');
						p = $(p).eq(-1).serialize();
						disabledField.attr('disabled','disabled');
					}
				}
				
				ClAjax.fnCallAjax({
					url: _params.actionUrl,
					paramJsn: p,
					sucFn: function(){
						
						// Modal창 닫기
						if(_params.mdClsBool) $(".is-close").eq(-1).trigger("click");

						// grid 검색
						if(_params.hasOwnProperty('listFnc')){
							_params.listFnc();
						}else{
							var listParam = {selector: _params.selector, url: _params.url, selPos: _params.selPos};
							// 콜백 함수
							if (_params.hasOwnProperty('callBack')) { 
								listParam.callBack = _params.callBack;
							}
							ClCRUD.fnListSearchIt(listParam);
						}
						
						// List URL 목록 마지막 삭제
						if(_params.uLDelBool) ClLayout.fnGetTabJsn().urlList.splice(-1,1);
						
					},
					errHandle: true,
					compltFn: function(){
						kendo.ui.progress($('body'), false);
						ClCRUD.json.isProcessing = false;
					},
				});
			},
			
			/**
			 * 선택 삭제 Action
			 * @param _params 		: 	selector(필수) 			Table의 ID값 
			 * 							url(필수) 				테이블 데이터를 가져올 url
			 * 							actionUrl(필수)			Ajax 호출할 URL 
			 * 							selPos(선택) 			기본값 -1(가장 마지막 selector)
			 * 							validFnc(선택)			추가적인 validate 처리를 하고싶을때 함수를 추가하여 전달(정상일때 return true로)
			 * 							cnfrmMsg(선택)			진행전에 나오는 confirm 메세지(기본값: 진행하시겠습니까?)
			 * 							uLDelBool(선택)			tapJsn의 urlList의 마지막값을 삭제할지 여부(기본값: false)
			 * 							mdClsBool(선택)			모달창을 닫을지 여부(기본값: false)
			 */
			fnDeleteChk: function(_params){
				if(ClCRUD.json.isProcessing) return;
				ClCRUD.json.isProcessing = true;
				
				if(_params.cnfrmMsg == null) _params.cnfrmMsg = "선택된 항목들을 삭제하시겠습니까?";
				if("${serverLocale }".toUpperCase().indexOf("EN") > -1){
					_params.cnfrmMsg = "Are you sure you want to delete the selected items?";
				}
				
				if(!confirm(_params.cnfrmMsg)){
					ClCRUD.json.isProcessing = false;
					return false;
				}
				
				kendo.ui.progress($('body'), true);
				
				if(_params.hasOwnProperty('validFnc') && !_params.validFnc()){
					kendo.ui.progress($('body'), false);
					ClCRUD.json.isProcessing = false;
					return false;
				}
				
				if(_params.selPos == null) _params.selPos = -1;

				// 체크박스 삭제는, 항상 패러미터가 bean_arr(CommonBean)가 (key: 해당 체크박스의 name, value: 해당 체크박스의 값)으로 넘어간다.
				var $chk = ClLayout.fnGetSelector({selector: _params.selector, selPos: _params.selPos}).find("tbody input[type=checkbox]:checked");
				var cArr = [];
				if($chk.length < 1){
					if("${serverLocale }".toUpperCase().indexOf("EN") > -1){
						alert('Please select an item to delete.');
					} else {
						alert('선택된 항목이 없습니다.');
					}
					kendo.ui.progress($('body'), false);
					ClCRUD.json.isProcessing = false;
					return false;
				}else{
					$.each($chk, function(){
						var a = {};
						a[this.name] = this.value;
						cArr.push(a);
					});
				}
				
				ClAjax.fnCallAjax({
					url: _params.actionUrl,
					paramJsn: {
						action_type: 'delete_chk',
						bean_arr: cArr,
					},
					sucFn: function(){
						
						// Modal창 닫기
						if(_params.mdClsBool) $(".is-close").eq(-1).trigger("click");
						
						// grid 검색
						ClCRUD.fnListSearchIt({selector: _params.selector, url: _params.url, selPos: _params.selPos});
						
						// List URL 목록 마지막 삭제
						if(_params.uLDelBool) ClLayout.fnGetTabJsn().urlList.splice(-1,1);
					},
					errHandle: true,
					compltFn: function(){
						kendo.ui.progress($('body'), false);
						ClCRUD.json.isProcessing = false;
					},
				});
			},
	
	}
}	


