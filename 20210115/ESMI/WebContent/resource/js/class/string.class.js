/**
 * ClString 함수 목록
 */
/**
 * // 숫자에 천 단위마다 ,(comma) 찍기
 * ClString.fnAddCommas(nStr)
 * 
 * // 0을 자릿수에맞게 삽입
 * ClString.fnAddZeros(_str, _len)
 * 
 * 
 */
	

/**
 * Class 선언
 */
if(parent.ClString != null){
	ClString = parent.ClString;
} else{
	ClString = {
			
			/**
			 * 숫자에 천 단위마다 ,(comma) 찍기
			 * @Param nStr
			 */
			fnAddCommas: function(nStr) {
				nStr += '';
				var x = nStr.split('.');
				var	x1 = x[0];
				var x2 = x.length > 1 ? '.' + x[1] : '';
				var rgx = /(\d+)(\d{3})/;
				while (rgx.test(x1)) {
					x1 = x1.replace(rgx, '$1' + ',' + '$2');
				}
				return x1 + x2;
			},
			
			/**
			 * 0을 자릿수에맞게 삽입
			 * @Param _str, _len
			 */
			fnAddZeros: function(_str, _len){
				var z = '';
				for(var i = 0; i < (_len - _str.length); i++){
					z += "0";
				}
				return z + _str;
			},
			
			isNotEmpty : function(_str){
				obj = String(_str);
				if(obj == null || obj == undefined || obj == 'null' || obj == 'undefined' || obj == '' ) return false;
				else return true;
			},

			isEmpty : function(_str){
				return !ClString.isNotEmpty(_str);
			}
			
	}
}
