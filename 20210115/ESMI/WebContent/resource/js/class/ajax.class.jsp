<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>

<c:set var="rootPath" value="${pageContext.request.contextPath}" scope="application"/>
<c:set var="userSession" value="${sessionScope.userSession}" scope="session"/>

<!-- <script type="text/javascript"> -->
/**
 * ClAjax 함수 목록
 */
/**
 * // 일반 Ajax 호출 포맷
 * ClAjax.fnCallAjax(_params)
 *
 * // Ajax 연결엔 성공하여 값은 받았지만, 에러일때
 * ClAjax.fnAjaxSuccessErrHandle(data)
 *
 * // Ajax의 Error 발생시 호출하는 function 
 * ClAjax.fnAjaxErrHandle(_data)
 *
 * //주기적으로 Ajax를 호출하는 Fn 
 * ClAjax.fnCallAjaxCycle(_url, _paramJsn, _sucFn, _sec, _firstCallParam)
 * 
 */

	
/**
 * Class 선언
 */
if(parent.ClAjax != null){
	ClAjax = parent.ClAjax;
} else{
	ClAjax = {
			
			/**
			 * 일반 Ajax 호출 포맷
			 * @Params _params : Json형식
			 * 						- url(필수) 		: Ajax 호출할 URL
			 * 						- paramJsn(선택) 	: Ajax에 넘겨줄 Parameter(* 반드시 Json형식으로 던질것)
			 * 						- runFn(선택) 		: Ajax의 결과값이 성공했을때, 무조건 호출할 Function
			 * 						- sucFn(선택) 		: Ajax의 결과값이 성공했을때, result=true일때 호출할 Function
			 * 						- errHandle(선택) 	: Ajax의 에러 발생시, 처리 alert을 작동할지 여부 - boolean
			 * 						- compltFn(선택)	: Ajax의 결과값이 성공했을때, 최종적으로 호출할 Function
			 */
			fnCallAjax: function(_params){
				
				if(!_params.hasOwnProperty('url')) return;
	
				var op = {
					url: '${rootPath}' + _params.url,
					type: "POST",
					data: _params.paramJsn,
					
					success:function(data){
						if(_params.hasOwnProperty('runFn')){
							_params.runFn(data);
						} else{
							if(data.result == true){
								if(_params.hasOwnProperty('sucFn')) _params.sucFn(data);
							}else{
								if(_params.errHandle == true) ClAjax.fnAjaxSuccessErrHandle(data);
							}
						}
					},
					error:function(data){
						console.error(_params, data);
						if(_params.errHandle == true) ClAjax.fnAjaxErrHandle(data);
					},
					complete:function(data){
						if(_params.hasOwnProperty('compltFn')) _params.compltFn();
					}
				};
				
				if(_params.timeout != null && _params.timeout != ''){
					op.timeout = _params.timeout;
				}
				
				$.ajax(op);
			},
			
			
			/**
			 * Ajax 연결엔 성공하여 값은 받았지만, 에러일때
			 * @Param data : error발생시 return하는 data
			 */
			fnAjaxSuccessErrHandle: function(data){
				// errType 이 없을 경우 무조건 alert
				if (data.errType == null) data.errType = 'alert';
				if (data.errType == 'alert') {
					if(data.msg != "" && data.msg != null) {
						alert(data.msg);
					}else{
						alert(data.sysmsg);
					}
				} else if (data.errType == 'notification') {
					ClKendo.fnErrorNotification({ msg: data.msg, level: data.errLv});
				}
				// 이동방식 변경후, 수정
	//			if(data.noauth == true) {
	//				parent.location.href='${rootPath}/login.do';
	//			}else{
	//				if(data.location && data.location != null && data.location != ""){
	//					location.href = data.location;
	//				}
	//			}
			},
			
			/**
			 * Ajax의 Error 발생시 호출하는 function
			 * @Params _data : error발생시 return하는 data
			 * @Params _rootPath : 현재의 ContextPath
			 */
			fnAjaxErrHandle: function(_data){
				switch (_data.status) {
				case 401: // Session 만료
					if("${serverLocale }".toUpperCase().indexOf("EN") > -1){
						alert('Your session has expired. Please sign in.');
					} else {
						alert("세션이 만료되었습니다. 로그인 해 주세요.");
					}
					parent.location.href='${rootPath}/login.do';
					break;
				case 403: // 권한 에러
					if("${serverLocale }".toUpperCase().indexOf("EN") > -1){
						alert('You do not have access to this page. Please contact the administrator.');
					} else {
						alert("해당 페이지 접속 권한이 없습니다. 관리자에게 문의해 주세요.");
					}
					break;
				case 0: // 네트워크 에러
					if("${serverLocale }".toUpperCase().indexOf("EN") > -1){
						alert('A network problem has occurred. Please check the network connection.');
					} else {
						alert("네트워크 문제가 발생하였습니다. 네트워크 연결상태를 확인하세요.");
					}
					break;
				case 4: // HTTP 에러
					// HTTP error (can be checked by _data.status and _data.statusText)
					if("${serverLocale }".toUpperCase().indexOf("EN") > -1){
						alert("HTTP problem occurred.[" + _data.statusText + "]");
					} else {
						alert("HTTP 문제가 발생하였습니다.[" + _data.statusText + "]");
					}
					break;
				default:
					if("${serverLocale }".toUpperCase().indexOf("EN") > -1){
						alert("Error occurred during page request.[" + _data.statusText + "]");
					} else {
						alert("페이지 요청 중 오류가 발생하였습니다.[" + _data.statusText + "]");
					}
					break;
				}
			},
			
			/**
			 * 주기적으로 Ajax를 호출하는 Fn 
			 * @Params _usl 				: Ajax 호출할 URL
			 * @Params _paramJsn 			: Ajax에 넘겨줄 Parameter(* 반드시 Json형식으로 던질것)
			 * @Params _sucFn				: Ajax의 결과값이 성공했을때, 호출할 URL
			 * @Params _sec					: 호출 주기(MilliSecond)
			 * @Params _firstCallParam 		: 첫호출에만 해당 Json을 _paramJsn에 추가해서 넘겨준다.
			 */
			fnCallAjaxCycle: function(_url, _paramJsn, _sucFn, _sec, _firstCallParam){
				
				// #2. _sec밀리초를 주기로, Ajax 호출.
				ClCommon.fnTimeOutIt(ClAjax.fnCallAjax, _sec, {
					url: 		_url,
					paramJsn: 	_paramJsn,
					sucFn: 		_sucFn,
				});
				
				// #1. 첫호출
				// - _firstCallParam를 넘겼을때, 첫호출에만 해당 Json을 _paramJsn에 추가해서 넘겨준다.
				var p;
				if(typeof _firstCallParam != 'undefined'){
					p = $.extend(true, {}, _paramJsn, _firstCallParam);
				}else{
					p = _paramJsn;
				}
				ClAjax.fnCallAjax(_url, p, _sucFn);
			},
			
	}
}
<!-- </script> -->