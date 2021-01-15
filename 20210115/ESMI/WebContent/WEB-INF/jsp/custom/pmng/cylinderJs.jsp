<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>

<script type="text/javascript">
var _status = null;
var _interval = null;
var reset = "${reset}";

//최초 실행
fnTable();
fnSearch();

function fnSearch(){
	
	ClAjax.fnCallAjax({
		url : '/pmng/cylinderStatusAjax.do',
		errHandle : true,
		sucFn: function(data){
			var list = data.data.list;
			
			if(list.length > 0) {
				list.forEach(function(item, idx){
					var _dvc = item.dvc_id;
					var _var = item.var_id;
					var _data = item.data_val;
					var _type = item.status;
					
					$("#dvc_" + _dvc + "_"+ _var).text(_data);
					$("#dvc_" + _dvc + "_"+ _var).removeClass("warn alarm run");
					$("#dvc_" + _dvc + "_"+ _var).addClass(_type);					
				});
			}
		},
		compltFn: function(){
			//재조회
			_status = setTimeout(function(){
				fnSearch();						
			}, 1000 * 60 * reset); //갱신
			
			//장비별 임계치 상태
			fnStatus();
		}
	});
}


function fnStatus() {
	$.each($("td[headers=title]"), function(idx, item){
		var _tt = item.id;
		var t_warn = 0;
		var t_alarm = 0;
		var t_run = 0;
		var t_col = "";
		
		$.each($("td[headers=value]"), function(i, v){
			if(v.id.indexOf(_tt) >= 0) {
				if($("#"+v.id).attr('class') != undefined && $("#"+v.id).attr('class').indexOf("warn") >= 0) {
					t_warn++;
				}else if($("#"+v.id).attr('class') != undefined && $("#"+v.id).attr('class').indexOf("alarm") >= 0) {
					t_alarm++;
				}else if($("#"+v.id).attr('class') != undefined && $("#"+v.id).attr('class').indexOf("run") >= 0) {
					t_run++;
				}
			}
		});
		
		if(t_warn > 0) {
			t_col = "warn";
		}else if (t_warn == 0 && t_alarm > 0) {
			t_col = "alarm";
		}else if (t_warn == 0 && t_alarm == 0 && t_run > 0) {
			t_col = "run";
		} else {
			t_col = "off";
		}
		
		$("#" + _tt).removeClass("title-warn title-alarm title-run title-off");
		$("#" + _tt).addClass("title-" + t_col);
	});
}

function fnTable(){
	ClAjax.fnCallAjax({
		url : '/pmng/cylinderCylceAjax.do',
		errHandle : true,
		sucFn: function(data){
			var list = data.data.list;
			var list_str;
			
			if(list.length > 0) {
				list.forEach(function(i, idx){
					list_str += '<tr>'
		                      + '	 <td class="text-center fnt-14">'+i.rn+'</td>'
		                      + '	 <td class="text-center fnt-14">'+i.weekly+'</td>'
		                      + '	 <td class="text-center fnt-14">'+i.res_1+'</td>'
		                      + '	 <td class="text-center fnt-14">'+i.res_2+'</td>'
		                      + '	 <td class="text-center fnt-14">'+i.res_3+'</td>'
		                      + '	 <td class="text-center fnt-14">'+i.res_4+'</td>'
		                      + '	 <td class="text-center fnt-14">'+i.res_5+'</td>'
		                      + '	 <td class="text-center fnt-14">'+i.res_6+'</td>'
		                      + '	 <td class="text-center fnt-14">'+i.res_7+'</td>'
		                      + '	 <td class="text-center fnt-14">'+i.res_8+'</td>'
		                      + '	 <td class="text-center fnt-14">'+i.res_9+'</td>'
		                      + ' </tr>'
				});
			} else {
				list_str = '<tr>'
                    	  + '<td colspan="11" style="height:481px; text-align:center; font-size:30px;">NO RECORD DATA</td>'
                    	  + '</tr>';
			}
			
			$('#tbody').empty();
            $('#tbody').append(list_str);
		},
		compltFn: function(){
			//재조회
			_interval = setTimeout(function(){
				fnTable();						
			}, 1000 * 60 * reset); //갱신
		}
	});
}
</script>
