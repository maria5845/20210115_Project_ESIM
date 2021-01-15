<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>


<script type="text/javascript">
if( "${serverLocale }" == "en" ){
	kendo.culture("en-US");
}else{
	kendo.culture("ko-KR");
}

var iw = 0;
var clickCnt = 0;

/**
 * mng_frame Load시, 한번만 실행
 */
if(typeof frameBool != 'undefined' && frameBool){
	frameBool = false;
	
	$(document).ready(function(){
		
		// 레이아웃 설정
		ClLayout.fnGnb();
		ClLayout.fnResizeContainer();
		ClLayout.fnIframeResize();
		
		//사용자 탭 로드
		ClLayout.fnUserTabLoad('${userTabInfo}','${home_yn}','${home_menu_no}');
// 		ClLayout.fnTabSelect(0); // Home menu
		
		//쿠키에 저장된 탭 불러오기
		fnSessionTabLoad();
		
		//알람 갯수 체크
// 		ClAjax.fnCallAjax({
// 			url: '/quality/alarmMyCountAjax.do',
// 			sucFn: function(data){
// 				if(data.data.count > 0){
// 					$("#myAlarmArea").show();
// 					$(".info-pan").css("right", "100px");
// 				}
// 			}
// 		});

		//메뉴 길이 맞춤
		fnMenuWid();

		//메뉴 클릭시
		$("#gnb .items li a").on('click', function(evt){
			evt.preventDefault();

			if(this.nohref != undefined || this.href == "" || this.href == "#"){
				return false;
			}
			
			var $t = $(this);
			var $p = $t.closest("li.item1depth");
			ClLayout.fnTabAdd($t.text(), $t.attr("menu_no"), $t.attr("href"), $p.attr("id"));
			$p.removeClass("hov");
			return false;
		});
		
		// 수정필요, frame
		$(window).keydown(function (e) {  
			var isF5 = (e.which || e.keyCode) == 116;
			// console.log("keydown" , e.which, e.keyCode);
			if(isF5){
				setTimeout(function(){
					$("#ifrm_tab_"+tid_act).attr("src", $("#ifrm_tab_"+tid_act).attr("src"));						
				},100)
				ClPopup.fnCloseModalAll();//열여있는 모든 모달창 닫기
			}
			return !isF5;
		});

		// 수정필요, nolnb
		$(window).keydown(function (e,f,g) {
			var isF5 = (e.which || e.keyCode) == 116;
			//console.log(e,f,g,e.which, e.keyCode);
			if(isF5){
				setTimeout(function(){
					location.reload();
				},100);
				return false;
			}
			
			var isBack = false;
			if(e.altKey && e.which == 37) {//Alt + <-
				isBack = true;
			}else if((e.which || e.keyCode) == 9){
				isBack = true;
				if(e.target.nodeName == "INPUT"){
					return true;
				}
			}
			if(isBack){
				
			}
			
			return true;			
		});
		
		$(window).on("popstate", function(e){
			//console.log("popstate",e)
			try{
				var id = e.originalEvent.state;
				if(id != null){
					ClLayout.fnTabSelect(id, false);
					ClPopup.fnCloseModalAll();//열여있는 모든 모달창 닫기
				}
			}catch(Ex){}
		});
		
	});
}else{
	
	//All Selectbox init
	$("select").not('.notKendoDropdownList').kendoDropDownList();

	// 화면 상단의 검색영역 input 부분 엔터키하면 검색되도록 적용
	ClCRUD.fnHeaderSearch();
}

//메뉴 길이 맞춤
function fnMenuWid(){
	var ww = $(window).outerWidth();
	var bw = $(".l-brand").outerWidth();
	var mw = $(".l-member-info").outerWidth();
	var sw = $(".nav-slide-box").outerWidth();
	var max = $("#gnb>.items>li").length * 140;
	
	var gnbWidth = ww - bw - mw - sw + 20;
	
	$("header .l-gnb").css("width", gnbWidth+"px");
	
	
	if(gnbWidth > max){
		$(".gnb-btn").removeClass("active");
	}else{
		$(".gnb-btn").addClass("active");
	}
}


//메뉴 슬라이드 버튼 이벤트
$(".gnb-btn.right").click(function(){
	fnMenuSlide(0);
});
$(".gnb-btn.left").click(function(){
	fnMenuSlide(1);
});

//메뉴 슬라이드 이동
function fnMenuSlide(x){
	var ww = $(window).outerWidth();
	var bw = $(".l-brand").outerWidth();
	var mw = $(".l-member-info").outerWidth();
	var sw = $(".nav-slide-box").outerWidth();
	var max = $("#gnb>.items>li").length * 160;
	
	var gnbWidth = ww - bw - mw - sw - 15;
	
	if(x == 0){
		clickCnt++;
		
		if((clickCnt * gnbWidth) > max){
			clickCnt--;
		}
	}else{
		if(clickCnt > 0){
			clickCnt--;
		}
	}
	
	$("#gnb>.items").css("margin-left", "-"+(clickCnt * gnbWidth)+"px");
}

//메뉴 슬라이드 CSS에 추가된 overflow:hidden 속성으로 인해 서브메뉴가 가려지는 문제를 위해 추가 (일단 header의 높이값 50으로 고정)
$(".item1depth").hover(function(){
	var ih = $(this).find("ul").height();
	$("header #gnb").css("height", (50 + ih)+"px");
}, function(){
	$("header #gnb").css("height", "50px");
});

//쿠키에 저장된 탭 추가, 선택
function fnSessionTabLoad(){
	
	//쿠키에 저장된 탭 정보 가져오기
	var tabName = $.cookie('tabName');
	var tabNo = $.cookie('tabNo');
	var tabLink = $.cookie('tabLink');
	var tabTopMenuId = $.cookie('tabTopMenuId');
	
	//저장된 쿠키 삭제
	$.removeCookie('tabName', { path: '/' });
	$.removeCookie('tabNo', { path: '/' });
	$.removeCookie('tabLink', { path: '/' });
	$.removeCookie('tabTopMenuId', { path: '/' });
	
	//저장된 값이 있다면 저장 탭으로 이동
	if (tabName) {
		//쿠키에 저장된 탭 추가
		ClLayout.fnTabAdd(tabName, tabNo, tabLink, tabTopMenuId);
		//쿠키에 저장된 탭 선택
		ClLayout.fnTabSelect(tabNo, true);
	}else{
		return;
	}
}

$(window).resize(function(){
	clickCnt = 0;
	fnMenuWid();
	fnMenuSlide(1);
});
</script>
