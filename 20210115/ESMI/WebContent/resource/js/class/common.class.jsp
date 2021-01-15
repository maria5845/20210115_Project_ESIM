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
 * ClCommon 함수 목록
 */
/**
 * 
 * // 페이지 이동
 * ClCommon.fnMovePage(_url, _param, _frameBool)
 * 
 * // 주기적으로 함수 호출
 * ClCommon.fnTimeOutIt(_func, _period, _param)
 * 
 * // Browser 체크
 * ClCommon.fnBrowserChk()
 * 
 * // DropDown 버튼 클릭 이벤트
 * ClCommon.fnToggleDropdown(_this)
 * 
 * // Selector영역의 이미지 다운로드
 * ClCommon.fnDownloadImg(_param)
 * 
 * // Comma
 * ClCommon.fnComma(_value)
 * 
 * // UnComma
 * ClCommon.fnUnComma(_value)
 * 
 */


/**
 * Class 선언
 */
if(parent.ClCommon != null){
	ClCommon = parent.ClCommon;
} else{
	ClCommon = {
			
			/**
			* 페이지 이동
			* @Param _url(필수) 		: 이동 URL
			* 		 _param(선택) 		: 패러미터
			*		 _frameBool(선택)	: 프레임을 이동시킬건지 여부(true외엔 현재 iframe 이동)
			*/
			fnMovePage: function(_url, _param, _frameBool){
				if(_frameBool){
					location.href = '${rootPath}' + _url + '?' + _param;
				}else{
					$('#ifrm_tab_' + ClLayout.json.tid_act).attr('src', '${rootPath}' + _url + '?' + _param);
				}
			},
			 
			/**
			* 주기적으로 함수 호출
			* @Param _func 			: 호출함수
			* 		 _period 		: 호출주기
			* 		 _param(선택)	: 호출함수의 parameter
			* @Return id
			*/
			fnTimeOutIt: function(_func, _period, _param){
			 	var id = setTimeout(function(){
			 		try {
			 			//호출
			 			if(typeof _param == 'undefined'){
			 				_func();
			 			}else{
			 				_func(_param);
			 			}
			 		} catch (e) {
			 			console.log(e);
			 		}
			 		
			 		// 완료 후, 재호출
			 		fnTimeOutIt(_func, _period, _param);
			 	}, _period);
			 	
			 	return id;
			},
			
			/**
			* Browser 체크.
			* @return String : 브라우저 형식을 string으로 반환
			*					IE: ie7~ie11, Edge: edge, Chrome: chrome, Firefox: firefox, Safari: safari, Opera: opera
			*/
			fnBrowserChk: function(){
				var agent = navigator.userAgent.toLowerCase(),
				name = navigator.appName,
				browser;
			 	
			 	// MS 계열 브라우저를 구분하기 위함.
			 	if(name === 'Microsoft Internet Explorer' || agent.indexOf('trident') > -1 || agent.indexOf('edge/') > -1) {
			 		browser = 'ie';
			 		if(name === 'Microsoft Internet Explorer') { // IE old version (IE 10 or Lower)
			 			agent = /msie ([0-9]{1,}[\.0-9]{0,})/.exec(agent);
			 			browser += parseInt(agent[1]);
			 		} else { // IE 11+
			 			if(agent.indexOf('trident') > -1) { // IE 11 
			 				browser += 11;
			 			} else if(agent.indexOf('edge/') > -1) { // Edge
			 				browser = 'edge';
			 			}
			 		}
			 	} else if(agent.indexOf('safari') > -1) { // Chrome or Safari
			 		if(agent.indexOf('opr') > -1) { // Opera
			 			browser = 'opera';
			 		} else if(agent.indexOf('chrome') > -1) { // Chrome
			 			browser = 'chrome';
			 		} else { // Safari
			 			browser = 'safari';
			 		}
			 	} else if(agent.indexOf('firefox') > -1) { // Firefox
			 		browser = 'firefox';
			 	}
	
			 	// 반환형식
			 	// IE: ie7~ie11, Edge: edge, Chrome: chrome, Firefox: firefox, Safari: safari, Opera: opera
			 	return browser;
			},
			
			/**
			* DropDown 버튼 클릭 이벤트
			*/
			fnToggleDropdown: function(_this){
				var $a = $(_this);
			 	var $b = $a.find('.dropdown-content');
			 	if($a.closest('.k-grid').length > 0){
			 		var $tr = $a.closest('tr');
					var $outer = $tr.closest('table').parent();
					
					if($b.hasClass('display-block')){
						$b.removeClass('display-block');
						$b.removeAttr('style');
						$a.find('.dropdown-bg').removeClass('display-block');

						$a.find('.sub-dropdown-bg').removeClass('display-block');
					}else{
						// (테이블 영역 크기 - 선택된 tr의 윗줄 모든 크기) < dropdown크기
						// 즉 현재 줄의 밑의 영역보다 dropdown 크기가 크면, dropdown을 위로 올린다.
						if(($outer.height() - $tr.height() * ($tr.prevAll('tr').length + 1)) < $b.height()){
							
							// 선택된 tr 모든 윗줄 크기보다 < dropdown크기
							// dropdown이 테이블 영역을 넘어가게 되어 top을 고정 시킨다.
							if($tr.height() * ($tr.prevAll('tr').length) < $b.height()){
								//top 위치를 15로 고정한다
								$b.css({top: 15});
							}else{
								// 버튼 top - dropdown높이 - 그림자(2px) + 현재스크롤위치
								$b.css({top: ($a.position().top - $b.height() - 2 + $outer.scrollTop())});
							}
						}
						$b.addClass('display-block');
						$a.find('.dropdown-bg').addClass('display-block');
					}
			 	}else{
					if($b.hasClass('display-block')){
						$b.removeClass('display-block');
						$a.find('.dropdown-bg').removeClass('display-block');
					}else{
						$b.addClass('display-block');
						$a.find('.dropdown-bg').addClass('display-block');
					}
			 	}
			},
			
			/*
			 * Selector영역의 이미지 다운로드
			 * @Param _param:		selector(필수)
			 * 						filename(필수)
			 */
			fnDownloadImg: function(_param){
			
				var $div = ClLayout.fnGetSelector(_param);
				if($div == null || $div.length < 1) return false;
				
				// 이미지를 다운로드할, 임시 a tag
				var $div_img = $('<a class="display-none"></a>');
				$('body').append($div_img);
			
				if($div.find('canvas').length > 0){
					$div_img.attr('href', $div.find('canvas').get(0).toDataURL("image/png"));
					$div_img.attr('download', _param.filename);
					$div_img.get(0).click();
					$div_img.remove();
				}else{
					html2canvas($div.get(0), {
						//foreignObjectRendering: true,
					}).then(function(canvas){
						$div_img.attr('href', canvas.toDataURL("image/png"));
						$div_img.attr('download', _param.filename);
						$div_img.get(0).click();
						$div_img.remove();
					});
				}
			},
			
			/*
			 * Comma
			 * @Param _param:		_value(필수)
			 */
			fnComma: function(_value){
			    _value= String(_value);
                return _value.replace(/(\d)(?=(?:\d{3})+(?!\d))/g, '$1,');
			},
			/*
			 * UnComma
			 * @Param _param:		_value(필수)
			 */
			fnUnComma: function(_value){
			    _value = String(_value);
                return _value.replace(/[^\d]+/g, '');
			},
	}
}

<!--  </script> -->