/**
 * ClPopup 함수 목록
 */
/**
 * // 레이어 팝업 열기 - 이거 사용
 * ClPopup.fnOnClickModalOpen(_url, _params, _width)
 * 
 * // 레이어 팝업 열기 내부
 * ClPopup.fnModalOpen(_url, _params, _width)
 * 
 * // 가장 위에 있는 Modal 닫기
 * ClPopup.fnModalClose()
 * 
 * // 열려있는 모든 Modal 닫기
 * ClPopup.fnCloseModalAll()
 * 
 * // 코드 등록 공통 팝업
 * ClPopup.fnGetCodeMstr(_param)
 * 
 */


/**
 * Class 선언
 */
if(parent.ClPopup != null){
	ClPopup = parent.ClPopup;
} else{
	ClPopup = {
			
			json: {
				g_modal: [],
			},
			
			/**
			 * 레이어 팝업 열기
			 * @param _url
			 * @param _params
			 * @param _width
			 */
			fnOnClickModalOpen: function(_url, _params, _width) {
				parent.ClPopup.fnModalOpen(_url, _params, _width);
			},
			
			/**
			 * 레이어 팝업 열기 내부
			 * @param _url
			 * @param _params
			 * @param _width
			 */
			fnModalOpen: function(_url, _params, _width){
				var len = ClPopup.json.g_modal.length;
				var _id = "#myModal" + len;
				ClPopup.json.g_modal.push({"id": _id, "data": {} });
	
				if($(_id).length > 0){
					$(_id).remove();
				}
	
				$('body').append('<div id="myModal'+len+'" class="ipop lypop is-show"><div class="dimmed"></div><div class="pop-cont"></div></div>');
	
				var $dimmed = $(_id + " > .dimmed");
				var $popcont = $(_id + " > .pop-cont");
				
				$dimmed.css({
					"z-index": 300 + (len*2),
					"background-image": "none",
					"background-color": "#000000",
					"opacity": 1/(len+1)/2,
				});
				
				$popcont.css({
					"z-index": 300 + (len*2) + 1,
					"width": typeof _width == 'undefined' ? "580px" : _width + "px"
				});
	
				ClAjax.fnCallAjax({
					url: _url,
					paramJsn: _params,
					runFn: function(data){
						
						var $t = $(ClPopup.json.g_modal[len].id);
						try {
							$t.find(".pop-cont").html(data);
						}catch(ex){
							console.error(ex);
							//개발 끝나면 alert은 삭제할 것
							//alert(ex);
						}
						$t.find("select").kendoDropDownList();
						
						//화면 중간에 표시되도록 조정
						var maxH = $(window).height();
						var h = $t.find(".pop-cont").height();
						var top = (maxH - h) / 2;
						$t.find(".pop-cont").css("top", top+"px");
					},
					compltFn: function(){
						$(ClPopup.json.g_modal[len].id).find(".is-close").on("click", function(){
							ClPopup.fnModalClose();
						});
					},
				});
			},
			
			/**
			 * 가장 위에 있는 Modal 닫기
			 */
			fnModalClose: function(){
				var $t = $(ClPopup.json.g_modal[ClPopup.json.g_modal.length-1].id)
				if($t.length > 0){
					$t.remove();
					$t.removeClass("is-show");
					
					ClPopup.json.g_modal.pop();
					
					//모달이 모두 없어진 경우 kendo ui 더미 엘리먼트들 삭제
					if(ClPopup.json.g_modal.length == 0){
						$(".k-calendar-container, .k-list-container").remove();
					}
				}
			},
	
	
			/**
			 * 열려있는 모든 Modal 닫기
			 */
			fnCloseModalAll: function(){
				for(var i = ClPopup.json.g_modal.length; i >= 1; i--){
					ClPopup.fnModalClose();
				}
			},
			
			/**
			 * 열려있는 모달상의 로컬 object(변수,함수 등등)를 획득 및 설정
			 */
			fnData: function(key, value) {
				var data = ClPopup.json.g_modal[ClPopup.json.g_modal.length-1].data;
				if(typeof value == "undefined") {
					if(typeof key == "undefined") {
						return data;
					}
					return data[key];
				}else{
					data[key] = value;
					return data[key];
				}
			},
			/**
			 * 팝업 윈도우 열기
			 */
			fnShowPopup: function(w, h, url, name) {
			   var left  = (window.screen.width/2)-(w/2),
			       top   = (window.screen.height/3)-(h/3);
			    var props = "width="+w+", height="+h+",top="+top+",left="+left;
			    props += ",resizable=yes,status=no,toolbar=no,menubar=no,scrollbars=yes,location=no,directories=no";
			    
			    var w = window.open (url, name, props);
			    w.focus();
			    return w;
			    /*var u = url.split('?');
			    parent.modalOpen(u[0], (u.length >= 1 ? u[1] : {}), w);*/ 
			},
			/*
			 * 코드 등록 공통 팝업
			 * @Param _params:		cat_cd(필수)
			 * 						
			 */
			fnGetCodeMstr: function(_params){
				var _url = '/setting/codemaster.do?1=1';
					_url += '&cat_cd='	+ _params.cat_cd;
					_url += '&cd='		+ $(_params.selector).data("kendoDropDownList").value();
					_url += '&selector='+ _params.selector.replace("#", "");
				
				this.fnShowPopup(1600, 760, _url, 'code_master');
			},
	}
}
