/**
 * ClAlarm 함수 목록
 */
/**
 *
 * // 알람 목록으로 이동
 * ClAlarm.fnGoUserAlarmPage(nStr) 
 * 
 * 
 */
	

/**
 * Class 선언
 */
if(parent.ClAlarm != null){
	ClAlarm = parent.ClAlarm;
} else{
	ClAlarm = {
			
			/**
			 * 알람 목록으로 이동
			 */
			fnGoUserAlarmPage: function(){
				var $a = $("a[href*='/quality/alarmmng.do']");
				if($a.length > 0){
					$a.trigger("click");
				}
			},
			
	}
}