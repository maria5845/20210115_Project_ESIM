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
 * ClLayout 함수 목록
 */
/**
 * 
 * // 탭별로 화면에서 사용하는 URL, hashCode 등을 저장할 Json
 * ClLayout.tapJsn
 * 
 * // 현재 탭의 tapJsn 값을 가져온다.
 * ClLayout.fnGetTabJsn()
 * 
 * // tab 중 iframe 이 보여지고 있는 윈도우를 리턴
 * ClLayout.$owner()
 * 
 * //selector 가져오기
 * ClLayout.fnGetSelector(_params)
 * 
 * // 네비게이션바 hover 이벤트
 * ClLayout.fnGnb(_selector, _option) 
 * 
 * //
 * ClLayout.fnResizeContainer()
 * 
 * //
 * ClLayout.fnIframeResize()
 * 
 * // Layout 하단에 탭 추가
 * ClLayout.fnTabAdd(tabName, id, link, topMenuId)
 * 
 * // Layout 하단 탭 선택
 * ClLayout.fnTabSelect(id, addHistory)
 * 
 * // Layout 하단 탭 닫기
 * ClLayout.fnTabClose(id)
 * 
 * // 초기 로딩시 사용자 탭 로딩
 * ClLayout.fnUserTabLoad(tab_info)
 * 
 * // 사용자 탭 변경시 DB 저장
 * ClLayout.fnUserTabUpdate()
 * 
 * // Layout 하단에 열려있는 모든 탭 닫기
 * ClLayout.fnTabAllClose()
 * 
 * // 현재 iframe 내부의 크기
 * ClLayout.fnGetWrapperSize()
 * 
 * // 상단(메뉴), 하단 영역 토글(show/hide)
 * ClLayout.fnToggleTopBottom()
 * 
 * // 좌측 트리 영역 사이즈 조절
 * ClLayout.fnResizeLnbTree()
 * 
 * // PIE V2 테마 변경
 * ClLayout.fnChangePIEThema()
 */


/**
 * Class 선언
 */
if(parent.ClLayout != null){
	ClLayout = parent.ClLayout;
} else{
	ClLayout = {
			
			json: {
				tid_act: 0,
				tinfo_last: '',
				max_tab_length: 10, // 최대 탭 갯수
			},
			
			/**
			 * 탭별로 화면에서 사용하는 URL, hashCode 등을 저장할 Json
			 */
			tapJsn : {
				"0" :  {
							hsh: [],
							urlList: [],
					},
			},
			
			/**
			 * PIE theme 변수
			 */
			PIE_THEME : {
				active: 'black',
				inactive: 'white',
			},
			
			/**
			 * 현재 탭의 tapJsn 값을 가져온다.
			 * @Params _key(선택)	: 안넣으면 현재 탭의 jsn값, 넣으면 현재 탭의 json의 _key의 마지막 값
			 */
			fnGetTabJsn: function(_key){
				var tab = parent.ClLayout.tapJsn[parent.ClLayout.json.tid_act];
				if(typeof _key == 'undefined'){
					return tab;
				}else{
					return tab[_key][tab[_key].length - 1];
				}
			},
	
			/**
			 * owner 선언
			 *  - tab 중 iframe 이 보여지고 있는 윈도우를 리턴한다.
			 */
			$owner : function(){
				if($(".tab_iframe").length > 0){
					return $('#ifrm_tab_' + ClLayout.json.tid_act).get(0).contentWindow;
				}else{
					return window;
				}
			},
			
			/**
			 * selector 가져오기
			 * @param _params 		: 	selector(필수) 	dom 선택자
			 * 							selPos(선택) 	기본값 -1(가장 마지막 selector)
			 */
			fnGetSelector: function(_params){
				
				if(typeof _params == 'string'){
					if($(_params).length > 0){
						return $(_params);
					}else{
						return ClLayout.$owner().$(_params);
					}
				}else{
					
					if(typeof _params.selPos == "undefined" || _params.selPos == null) _params.selPos = -1;
					
					var a = $(_params.selector);
					
					if(a.length == 0 && ClLayout.$owner().$ != null){
						// 0이면 iframe 내부만
						return ClLayout.$owner().$(_params.selector).eq(_params.selPos);
					}else{
						// iframe 밖에도 selector가 있음
						if(_params.selPos == -1){
							return a.eq(_params.selPos);
						}else{
							if(a.length < Math.abs(_params.selPos)){
								return ClLayout.$owner().$(_params.selector).eq(a.length + _params.selPos);
							}else{
								return a.eq(_params.selPos);
							}
						}
					}
				}
				return $(_params);
			},
			
			/**
			 * 네비게이션바 hover 이벤트
			 * @param _selector
			 * @param _option	: json
			 */
			fnGnb : function(_selector, _option){
				var elem = '#gnb';
				var options = {
					hovClass : 'hov'
				};
				$.extend(true, elem, _selector);
				$.extend(true, options, _option);
	
				var $d1Item = $(elem).children('.items').children('li');
				var $hovClass = options.hovClass;
	
				$d1Item.bind('mouseenter mouseleave', function(event){
					if(event.type == 'mouseenter') {
						$(this).addClass($hovClass).siblings().removeClass($hovClass);
					} else if(event.type == 'mouseleave') {
						$(this).removeClass($hovClass);
					}
				});
	
				$d1Item.find('>a, >button').bind('focus', function(){
					$(this).closest('li').addClass($hovClass).siblings().removeClass($hovClass);
				})
			},
	
			/**
			 * [resizeContainer description]
			 * @return {[type]} [description]
			 * .l-content 요소를 리사이징
			 */
			fnResizeContainer : function(bool){
				
				//var layoutMinusHeight = $('header.l-header').height() + $('footer.l-footer').height() + $('#tabContainer').height();
				var layoutMinusHeight = $('header.l-header').height() + $('#tabContainer').height();
	
				var calclulate = function(){
					var minHeight = $(window).height() - layoutMinusHeight - 1;
					
					if ( bool ){
						minHeight = $(window).height() - 4;
					}
					$('.l-content, .l-content > #iframeSection, .l-kendo-wrap').css({
						// 'height' : minHeight <= 802 ? 802 : minHeight,
						'height' : minHeight <= 475 ? 475 : minHeight,
					});
				};
	
				setTimeout(calclulate,10);
				calclulate();
				setTimeout(calclulate, 1000);
	
				$(window).resize(calclulate);
			},
			
			/**
			 * [iframeResize description]
			 * @return {[type]} [description]
			 * iframe 요소를 리사이징
			 */
			fnIframeResize : function(bool){
	
				// Essential element
				var isIframe = $('iframe')
				,isContent = $('.l-content').eq(0)
				,isSection = isContent.find('.section').eq(0)
	
				// Essential variable
				,intFrameHeight = 0
				,intMinusViewSum = 0
	
				// Fn | resizeContent
				,resizeContent = function(){
					var intContentHeight = parseInt(isContent.css('height'))
					,intSectPadTop = parseInt(isSection.css('paddingTop'))
					,intSectPadBot = parseInt(isSection.css('paddingBottom'));
	
					intMinusViewSum = intSectPadTop + intSectPadBot + 6;
					intFrameHeight = Math.ceil(intContentHeight - intMinusViewSum);
					
					// intFrameHeight = 802;//강제로 고정
					// intFrameHeight = 475;//강제로 고정
					if(bool){
						intFrameHeight = $(window).height() - 4;
					}
					return isIframe.css('minHeight', intFrameHeight);
				};
	
				// Check Essential Elements
				if( isIframe.length > 0 && isContent.length > 0 && isSection.length > 0 ) {
//					setTimeout(resizeContent,10);
					resizeContent();
					setTimeout(resizeContent, 1000);
					$(window).resize(resizeContent);
					isIframe.on('load', function(){
						resizeContent();
					});
				}
			},
			
			/**
			 * Layout 하단에 탭 추가
			 * @param tabName
			 * @param id
			 * @param link
			 * @param topMenuId
			 */
			fnTabAdd: function(tabName, id, link, topMenuId) {
				var $tabs = $("#tabGroup");
				
				if($tabs.find("#li_tab_"+id).length > 0){
					ClLayout.fnTabSelect(id);
					return;
				}
				
				if($(window).width() < 1800){
					ClLayout.json.max_tab_length = 7;
				}else{
					ClLayout.json.max_tab_length = 5;
				}
				if($tabs.find("li").length >= ClLayout.json.max_tab_length){
<!-- 					alert("탭은 최대 " + ClLayout.json.max_tab_length + "개까지만 표시 가능합니다."); -->
					alert("Up to "+ ClLayout.json.max_tab_length + " tabs can be displayed");
					return;
				}
				
				//새탭 및 새탭의  iframe 추가
				var tabHtml = "<li id='li_tab_"+id+"' topMenuId='"+topMenuId+"'><a href='javascript:ClLayout.fnTabSelect("+id+");void(0);'>" 
					+ tabName + "</a>"
					+ "<button type='button' class='close-tab' onclick='ClLayout.fnTabClose("+id+")' >닫기</button></li>";
				var ifrmHtml = "<iframe id='ifrm_tab_"+id+"' frameborder='0' class='include tab_iframe' "
					+ " src='"+link+"' title='"+tabName+"' style='display:none;' ></iframe>";
<!-- 					+ " src='"+link+"' title='"+tabName+"' style='display:none;' onload='ClLayout.fnChangePIEThema();'></iframe>"; -->
				
				$tabs.append(tabHtml);
				$("#iframeSection").append(ifrmHtml);
				
				//전체 닫기 표시 여부
				if($tabs.find("li").length >= 2) {
					$("#tabAllClose").show();
				}else {
					$("#tabAllClose").hide();
				}
				
				$("#tabContainer").css("min-width", ($(window).width() < ($tabs.outerWidth() + 115) ? $(window).width() : ($tabs.outerWidth() + 115)) + "px");
				
				if(link != ""){
					ClLayout.fnIframeResize();
					ClLayout.fnTabSelect(id);
				}
			},
			
			/**
			 * Layout 하단 탭 선택
			 * @param id
			 * @param addHistory
			 * @returns
			 */
			fnTabSelect: function(id, addHistory) {
				var $tabs = $("#tabGroup");
				var $tab = $("#li_tab_"+id);
				var $ifrm = $("#ifrm_tab_"+id); 
				var $a = $("a[menu_no="+id+"]");
				
				if(id == 0 && $("#ifrm_tab_0").attr('src') == ''){
					$("#ifrm_tab_"+id).attr('src', '${rootPath }/main.do');
				}else{
					if($ifrm.length <= 0 || (id != 0 && $a.length <= 0)) return;
				}
				
				//탭내 iframe이 조회되지 않은 경우			
				if($ifrm.attr('src') == "") {
					$("#ifrm_tab_"+id).attr('src', $a.attr("href"));
					ClLayout.fnIframeResize();
				}
				
				//선택 탭의 iframe 활성화
				$(".tab_iframe").hide();
				$("#ifrm_tab_"+id).show();
	
				//선택 탭 상태 활성화
				$tabs.find("li").removeClass("act");
				$tab.addClass("act");
				
				//상단 대메뉴 선택 상태 활성화
				$(".item1depth").removeClass("act");
				$("#"+ $tab.attr("topMenuId") ).addClass("act");
				
				ClLayout.json.tid_act = id;
				ClLayout.fnUserTabUpdate();
				if(!ClLayout.tapJsn[id]) {
					ClLayout.tapJsn[id] = {
							hsh: [],
							urlList: [],
//							urlDtl: new Array(),
//							urlAct: new Array(),
					};
				}
				if(typeof addHistory == "undefined" || addHistory) {
	//				var url = "?" +(new Date()).getTime();
					var url = location.href;
					history.pushState(id, $a.text(), url);
				}
			},
	
			/**
			 * Layout 하단 탭 닫기
			 * @param id
			 * @returns
			 */
			fnTabClose: function(id) {
				var $tabs = $("#tabGroup");
				var $act = $tabs.find("li.act");
				var act_id = $act.attr("id").substring(7);
	
				$("#li_tab_"+id).remove();
				$("#ifrm_tab_"+id).remove();
				
				//전체 닫기 표시 여부
				if($tabs.find("li").length >= 2) {
					$("#tabAllClose").show();
				}else {
					$("#tabAllClose").hide();
				}
				$("#tabContainer").css("min-width", ($tabs.outerWidth()+115) + "px");
				
				ClLayout.tapJsn[id] = null;
				
				if(id == act_id){
					var $last = $tabs.find("li:last");
					var last_id = $last.attr("id").substring(7);
					
					ClLayout.fnTabSelect(last_id);				
				}else{
					ClLayout.fnUserTabUpdate();
				}
			},
			
			/**
			 * 초기 로딩시 사용자 탭 로딩
			 * @param tab_info
			 */
			fnUserTabLoad: function(tab_info){
				if(typeof tab_info == "undefined" || tab_info == null || tab_info == "") return;
				
				var arr = tab_info.split('|');
				var sel_menu_no = 0;
				for(var i=0; i<arr.length; i++){
					var menu_no = arr[i]; 
					if(menu_no.indexOf("act") != -1){
						menu_no = menu_no.replace(/act/gi, '');
						sel_menu_no = menu_no;
					}
					var $t = $("a[menu_no="+menu_no+"]");
					if($t.length > 0){
						ClLayout.fnTabAdd($t.text(), menu_no, "", $t.closest("li.item1depth").attr("id"));
					}
				}
				ClLayout.fnTabSelect(sel_menu_no);
				
				ClLayout.fnChangePIEThema();
			},
			
			/**
			 * 사용자 탭 변경시 DB 저장
			 */
			fnUserTabUpdate: function(){
				var tab_info = "";
				$(".tab_iframe:gt(0)").each(function(idx,ele){
					if(tab_info != "") tab_info += "|";
					var act = $(ele).css("display") == "none" ? "" : "act";
					//remove ifrm_tab_
					tab_info += $(ele).attr("id").substring(9)+act;
				})
				
				if(ClLayout.json.tinfo_last != tab_info){
					
					 ClAjax.fnCallAjax({
						 url: '/updateUserTabInfoActionAjax.do',
						 paramJsn: { tab_info: tab_info },
					 });
				}
				ClLayout.json.tinfo_last = tab_info;
			},
			
			/**
			 * Layout 하단에 열려있는 모든 탭 닫기
			 */
			fnTabAllClose: function(){
				$("#tabGroup").find("li:gt(0)").remove();
				$(".tab_iframe:gt(0)").remove();
				$("#tabAllClose").hide();
				
				ClLayout.tapJsn = {};
	
				ClLayout.fnTabSelect(0);
			},
			
			/**
			 * 현재 iframe 내부의 크기
			 */
			fnGetWrapperSize: function(){
				return $('#ifrm_tab_' + ClLayout.json.tid_act).height() > ClLayout.$owner().$('html').height() 
					? $('#ifrm_tab_' + ClLayout.json.tid_act).height() : ClLayout.$owner().$('html').height();
			},
			
			/**
			 * 상단(메뉴), 하단 영역 토글(show/hide)
			 */
			fnToggleTopBottom: function(_height){
				
				var header = $("header.l-header");
				var footer = $("footer.l-footer");
				var tab	= $("#tabContainer");
				var tBtn = ClLayout.fnGetSelector({selector: '#viewTglBtn'});
				var tBtnIcon = tBtn.find('i');
				
				var displayStatus = header[0].style.display;
				if( header.hasClass('display-none') ){
					header.removeClass('display-none');
					footer.removeClass('display-none');
					tab.removeClass('display-none');
					
					tBtn.removeClass('btn-gray');
					tBtnIcon.removeClass('fa-arrow-down');
					tBtn.addClass('btn-default');
					tBtnIcon.addClass('fa-arrow-up');
					
					// 컨텐츠영역 사이즈 조절
					ClLayout.fnResizeContainer(false);
					ClLayout.fnIframeResize(false);
				}else{
					header.addClass('display-none');
					footer.addClass('display-none');
					tab.addClass('display-none');
					
					tBtn.addClass('btn-gray');
					tBtnIcon.removeClass('fa-arrow-up');
					tBtn.removeClass('btn-default');
					tBtnIcon.addClass('fa-arrow-down');
					
					// 컨텐츠영역 사이즈 조절
					ClLayout.fnResizeContainer(true);
					ClLayout.fnIframeResize(true);
				}
				
				if(_height == null){
					ClLayout.fnResizeLnbTree();
				}else{
					ClLayout.fnResizeLnbTree(_height);
				}
			},
			
			/**
			 * 좌측 트리 영역 사이즈 조절
			 */
			fnResizeLnbTree: function(_height){
				
				var h = _height;
				if(_height == null){
					h = ClLayout.fnGetWrapperSize();
				}else{
					var outH = $('#ifrm_tab_' + ClLayout.json.tid_act).height();
					if(outH > h) h = outH;
				}
				
				// 트리 크기 조절(iframe 내부만)
				$.each(ClLayout.$owner().$('.lnbTree, .lnbTreeDv'), function(){
					$(this).css({
						'height': h,
					});
				});
			},
			
			/**
			 * 좌측 트리 영역 사이즈 조절
			 */
			fnGetChckNds: function(nodes){
				
				var node, childCheckedNodes;
				var checkedNodes = [];
			
				for (var i = 0; i < nodes.length; i++) {
					node = nodes[i];
					if (node.checked) {
						// json 객체가 아닌, 특정값을 넣고싶다면 이부분을 수정
						checkedNodes.push(node);
					}
						
					if (node.hasChildren) {
						childCheckedNodes = ClLayout.fnGetChckNds(node.children.view());
						if (childCheckedNodes.length > 0){
							checkedNodes = checkedNodes.concat(childCheckedNodes);
						}
					}
				}
			
				return checkedNodes;
			},
			
			/**
			 * Html Top&Bottom Thema Change
			 */
			enableStylesheet : function(node) {
				node.media = '';
			},
			
			disableStylesheet : function(node) {
				node.media = 'none';
			},
			
			/**
			 * iFrame's Thema Change
			 */
			fnChangeStylesheetW2B: function(_dom){
				_dom.contentWindow.document.querySelectorAll('link[rel=stylesheet].white_link').forEach(ClLayout.disableStylesheet);
				_dom.contentWindow.document.querySelectorAll('link[rel=stylesheet].black_link').forEach(ClLayout.enableStylesheet);
			},
			
			fnChangeStylesheetB2W: function(_dom){
				_dom.contentWindow.document.querySelectorAll('link[rel=stylesheet].white_link').forEach(ClLayout.enableStylesheet);
				_dom.contentWindow.document.querySelectorAll('link[rel=stylesheet].black_link').forEach(ClLayout.disableStylesheet);
			},
			
			
			/**
			* PIE 테마 변경
			*/
			fnChangePIEThema: function(){
			
				var currTheme = $.cookie('PIE_theme');
				
				if(currTheme == 'black' || currTheme == null){
					var currTheme = 'black';  
	 				var befTheme = 'white'; 
				}else if(currTheme == 'white'){
	 				var currTheme = 'white'; 
					var befTheme = 'black';  
				}
				
				PIE_THEME = {active: currTheme, inactive: befTheme};
				
				document
				  .querySelectorAll('link[rel=stylesheet].' + PIE_THEME.active + '_link')
				  .forEach(ClLayout.enableStylesheet);
				
				document
				  .querySelectorAll('link[rel=stylesheet].' + PIE_THEME.inactive + '_link')
				  .forEach(ClLayout.disableStylesheet);
				
				if(currTheme == 'black'){
					document.querySelectorAll('.tab_iframe').forEach(ClLayout.fnChangeStylesheetW2B);
				}else if(currTheme == 'white'){
					document.querySelectorAll('.tab_iframe').forEach(ClLayout.fnChangeStylesheetB2W);
				}
			},
	}
}
<!--  </script> -->