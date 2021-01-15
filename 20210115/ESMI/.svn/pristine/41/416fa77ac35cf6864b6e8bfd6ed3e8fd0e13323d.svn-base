/**
 * ClValidate 함수 목록
 */
/**
 * // 날짜형식 체크
 * ClValidate.fnDateValidate(params) 
 * 
 */
	

/**
 * Class 선언
 */
if(parent.ClValidate != null){
	ClValidate = parent.ClValidate;
} else{
	ClValidate = {
			
			/**
			 * 날짜형식 체크 
			 *  - 날짜형식이 맞는지 체크하고, 형식을 바꿔준다.(ex) yyyyMM → yyyy-MM, yyyyMMdd → yyyy-MM-dd
			 *  - 과거날짜인지 확인
			 * @Params params : json 형식
			 * 			- selector(필수)	: 확인할 영역 선택자
			 * 			- type(필수)		: 검색타입(yyyymm / yyyymmdd / yyyymmddhhmm)
			 * 			- pastBool(선택)	: 과거날짜 입력 체크여부(boolean) / default: true
			 * @Return boolean : 잘못된 형식일 경우에만 False
			 */
			fnDateValidate: function(params){
				
				var a = ClLayout.fnGetSelector(params);
				var b = a.val();
				
				if(typeof b == 'undefined' || b == ''){
					alert('날짜 데이터를 찾을 수 없습니다.');
					return false;
				}
				
				var regex_origin, regex, str1, str2;
				switch (params.type) {
				case "yyyymm":
					regex_origin = /^[12][0-9]{3}-[01][0-9]$|^[12][0-9]{3}[01][0-9]$/g;
					regex = /^[12][0-9]{3}[01][0-9]$/g;
					str1 = 'YYYY-MM';
					str2 = 'YYYYMM';
					break;
				case "yyyymmdd":
					regex_origin = /^[12][0-9]{3}-[01][0-9]-[0-3][0-9]$|^[12][0-9]{3}[01][0-9][0-3][0-9]$|^[12][0-9]{3}[01][0-9]-[0-3][0-9]$|^[12][0-9]{3}-[01][0-9][0-3][0-9]$/g;
					regex = /^[12][0-9]{3}[01][0-9][0-3][0-9]$/g;
					str1 = 'YYYY-MM-DD';
					str2 = 'YYYYMMDD';
					break;
				case "yyyymmddhhmm":
					regex_origin = /[0-9]{4}-[0-9]{2}-[0-9]{2}\s[0-9]{2}:[0-9]{2}|[0-9]{12}/;
					regex = /[0-9]{12}/;
					str1 = 'YYYY-MM-DD HH:mm';
					str2 = 'YYYYMMDDHHmm';
					break;
				}
				
				// 1) 맞는 형식이 아닐 경우, Alert
				if(!regex_origin.test(b)){
					alert('날짜 형식은 우측 버튼으로 선택하시거나,\n' + str1 + ' 나, ' + str2 + ' 형식으로 입력하세요.');
					a.val('');
					return false;
				}
				
				// 2) 알맞은 형식으로 변환
				b = b.replace(/\W/gi, '');
				if(regex.test(b)){
					switch (params.type) {
					case "yyyymm":
						a.val(b.substring(0, 4) + "-" + b.substring(4,6));
						break;
					case "yyyymmdd":
						a.val(b.substring(0, 4) + "-" + b.substring(4,6) + "-" + b.substring(6,8));
						break;
					case "yyyymmddhhmm":
						a.val(b.substring(0, 4) + "-" + b.substring(4,6) + "-" + b.substring(6,8) + " " + b.substring(8,10) + ":" + b.substring(10,12));
						break;
					}
				}
				
				// 3) 과거날짜인지 확인 - 과거 체크는 Default : True
				if(typeof params.pastBool == 'undefined' || params.pastBool){
					var d1 = new Date();
					switch (params.type) {
					case "yyyymm":
						d1.setFullYear(b.substring(0, 4), eval(b.substring(4,6)) - 1, 1);
						break;
					case "yyyymmdd":
						d1.setFullYear(b.substring(0, 4), eval(b.substring(4,6)) - 1, b.substring(6,8));
						break;
					case "yyyymmddhhmm":
						d1.setFullYear(b.substring(0, 4), eval(b.substring(4,6)) - 1, b.substring(6,8));
						d1.setHours(b.substring(8,10));
						d1.setMinutes(b.substring(10,12));
						break;
					}
					var d2 = new Date();
					if(d1 < d2){
						alert('과거 날짜는 선택하실 수 없습니다.');
						a.val('');
						return false;
					}
				}
				
				return true;
			},
	
	}
}
