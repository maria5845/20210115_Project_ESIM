/**
 * ClDate 함수 목록
 */
/**
 * // 날짜를 입력받은 Format에 맞게 뽑기
 * ClDate.fnDateFormat(_format) 
 * 
 * //문자열 날짜를 Date Object로 반환
 * ClDate.fnParseDate(_dateString)
 * 
 */
	

/**
 * Class 선언
 */
if(parent.ClDate != null){
	ClDate = parent.ClDate;
} else{
	ClDate = {
			/**
			 * 기본 변수 선언
			 */
			json: {
				weekName: ["일요일", "월요일", "화요일", "수요일", "목요일", "금요일", "토요일"],
				apName: ["AM", "PM"],
			},
			
			/**
			 * 날짜를 입력받은 Format에 맞게 뽑기
			 * @Param _format, _date : Date Object
			 */
			fnDateFormat: function(_format, _date){
				var d = (typeof _date == "object" && _date.getMonth) ? _date : new Date();
				//var d = (_date == null) ? new Date() : _date;

				return _format.replace(/(yyyy|yy|MM|dd|E|hh|mm|ss|a\/p)/gi, function($1) {
					switch ($1) {
						case "yyyy": return d.getFullYear();
						case "yy": return ClString.fnAddZeros((d.getFullYear() % 1000).toString(), 2);
						case "MM": return ClString.fnAddZeros((d.getMonth() + 1).toString(), 2);
						case "dd": return ClString.fnAddZeros(d.getDate().toString(), 2);
						case "E": return ClDate.json.weekName[d.getDay()];
						case "HH": return ClString.fnAddZeros(d.getHours().toString(), 2);
						case "hh": return ClString.fnAddZeros(((h = d.getHours() % 12) ? h : 12).toString(), 2);
						case "mm": return ClString.fnAddZeros(d.getMinutes().toString(), 2);
						case "ss": return ClString.fnAddZeros(d.getSeconds().toString(), 2);
						case "a/p": return d.getHours() < 12 ? ClDate.json.apName[0] : ClDate.json.apName[1];
						default: return $1;
					}
				});
			},
			
			/**
			 * 문자열 날짜를 Date Object로 반환
			 */
			fnParseDate: function(_dateString) {
				var arr = _dateString.split(/-|\//gi);
				//console.log(_dateString, arr)
				return new Date(arr[0], arr[1]-1, arr.length == 3 ? arr[2] : 1);
			}
	}
}