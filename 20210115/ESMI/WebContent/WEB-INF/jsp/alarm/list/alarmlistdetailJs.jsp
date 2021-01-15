<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>

<script type="text/javascript">
/**
 * confirm 메세지
 */
function fnGetCnfrmMsgAlarm(){
	var alarmState	= $("#alarm_state option:selected").val(); 
	var orgAlarmState	= $("#org_alarm_state").val(); 
	var cnfrmMsg	= $("#cnfrm_msg").val();

	var msg = "<spring:message code='MESSAGE.SAVE' text='저장하시겠습니까?' />";
	if( orgAlarmState == 'ALARM' && alarmState == 'ALARM' ){
		msg = "<spring:message code='MESSAGE.ALARM_STATE_NOT' text='알람이 해결상태로 변경되지 않았습니다. 저장하시겠습니까?' />";
	}else if( orgAlarmState == 'SOLVE' && alarmState == 'ALARM' ){
		msg = "<spring:message code='MESSAGE.ALARM_STATE_YES' text='해결상태의 알람입니다. 변경하시겠습니까?' />";
	}
	
	return msg;
}

</script>