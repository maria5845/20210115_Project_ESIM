/**
 * ClPrint 함수 목록
 */
/**
 * // 지정된 URL을 호출하여 결과를 자동으로 인쇄한다.
 * ClPrint.fnPrintAction(_url, _data)
 *  
 * // 인쇄(Print) - 체크박스
 * ClPrint.fnPrintIt(_keyNm, _url)
 * 
 */
	

/**
 * Class 선언
 */
if(parent.ClPrint != null){
	ClPrint = parent.ClPrint;
} else{
	ClPrint = {
			
			/**
			 * 지정된 URL을 호출하여 결과를 자동으로 인쇄한다.
			 * @Params _url : 호출할 URL
			 * @Params _data : 전달할 파라메터(json object)
			 */
			fnPrintAction: function(_url, _data){
				var f = document.createElement('form');
				var w = 800, h = 500;
				var left  = (window.screen.width/2)-(w/2),
					top   = (window.screen.height/2)-(h/2);
				var props = "width="+w+", height="+h+",top="+top+",left="+left;
				props += ",resizable=yes,status=no,toolbar=no,menubar=no,scrollbars=no,location=no,directories=no";
				
				var w = window.open ("", "winPrintpopupwin", props);
				w.focus();
				
				for (var key in _data) {
					var value = _data[key];
					var objs = document.createElement('input');
					objs.setAttribute('type', 'hidden');
					objs.setAttribute('name', key);
					objs.setAttribute('value', value);
					f.appendChild(objs);
				}
				
				f.method = "POST";
				f.action = _url;
				f.target = "winPrintpopupwin";
				
				$('body')[0].appendChild(f);
				f.submit();	
				$('body')[0].removeChild(f);
			},
			
			/**
			 * 인쇄(Print) - 체크박스
			 * @Params _keyNm 	: 체크박스의 name
			 * @Params _url		: key를 던질 url
			 */
			fnPrintIt: function(_keyNm, _url){
	
				// 프린트는 익스에서만 가능.(ActiveX를 써야하므로)
				// 브라우저 및 버전을 구하기 위한 변수들.
				var common = new ClCommon();
				if(common.fnBrowserChk().indexOf('ie') < 0){
					alert('인쇄 기능은 Internet Explorer 브라우저에서만 사용가능합니다.');
					return;
				}
	
				var keys = [];
				var list = $("input[name=" + _keyNm + "]:checked");
				if(list.length == 0){
					alert("인쇄할 대상 체크박스를 선택해 주세요.")
					return;
				}
				
				var frstAlrm = false;
				list.each(function(){
					if($(this).data('state') != null){
						// 상태가 취소인 항목 제외
						if($(this).data('state') != 'CANCEL'){
							keys.push($(this).val());
						}else{
							frstAlrm = true;
						}
					}else{
						keys.push($(this).val());
					}
				});
				if(frstAlrm){
					alert('상태가 취소인 항목은 인쇄항목에서 제외됩니다.');
				}
				
				if(keys.length > 0){
					var prnt = new ClPrint();
					prnt.fnPrintAction(_url, {"keys": keys});
				}
			},
	
	}
}
