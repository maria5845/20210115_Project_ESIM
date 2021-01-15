<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>


<script type="text/javascript" charset="utf-8">
var num = ${num};

$(document).ready(function() {
	fnTable();    	
});

$("#cyl_count").change(function(){
	fnTable();
});

//조회
function fnSearch(){
	var count = num;
	kendo.ui.progress($('body'), true);
	
	ClAjax.fnCallAjax({
		url : "/pmng/settingthresholdAjax.do",
		paramJsn: {
			set_type: count
		},
		errHandle : true,
		sucFn : function(data) {
			if( data.result ){
				var l = data.data.list;
				$.each(l, function(idx, item) {
					var _id = item.threshold_type;
					for(var i=1; i<=5; i++){
						$("#" + _id + "_attr" + i).val(item['threshold_attr'+i]);
						$("#" + _id + "_attr" + i + "-1").val(Number(item['threshold_attr'+i])+1);
					}
				});
			}
		},
		compltFn: function(data){
			kendo.ui.progress($('body'), false);
		}
	});
}

/**
 * 임계치 저장
 */
function fnSave(){
	var answer = confirm("Do you want to save it?");

	if(answer == false){
		return false;
	}
	
	var count = num;
	var _idArr = [];
	var _arr = [];
	var no_data = true;
	var ref_tm = $("#refresh").data("kendoDropDownList").value();
	
	if(count == 10) {
		for (var i = 1; i <= count; i++) {
			_idArr.push('cyl'+i+'_rms');		
			_idArr.push('cyl'+i+'_peak');		
		}
	} else {
		for (var i = 1; i <= count; i++) {
			_idArr.push('cyl'+i+'_rms');		
			_idArr.push('cyl'+i+'_peak');		
		}
	}
	
	// Null 체크
	$.each($("input[type=number]"), function(idx, item){
	    if(null == item.value || item.value.length == 0){
	    	item.focus();
	    	alert("Empty values cannot be entered as thresholds.");
	    	no_data = false;
	    	return false;
	    }
	});
	
	//전체 data가 있으면
	if(no_data) {
		$.each(_idArr, function(idx, item) {
			var _obj = new Object();
			_obj.threshold_type = item;
			
			for(var i=1; i<=5; i++){
				_obj['threshold_attr' + i] = $("#" + item + "_attr" + i).val();
				if(i == 5){
					_obj['threshold_dvc_id'] = item.replaceAll(/[^0-9]+/, "");
				}
			}
			_arr.push(_obj);
		});
		
		ClAjax.fnCallAjax({
			url : "/pmng/settingthresholdActionAjax.do",
			paramJsn: {
				arr : _arr,
				refresh: ref_tm,
				cyl_cnt: count
			},
			errHandle : true,
			sucFn : function(data) {
				if( data.result ){
					fnSearch();
				}
			},
			compltFn: function(data){
				alert("Threshold setting is complete.");
				kendo.ui.progress($('body'), false);
			}
		});
	}
}


//테이블 화면
function fnTable(){
	var count = num;
	var list_str = "";
	
	
	//실린더 10개일 때
	if(count == 10) {
		//10개 만큼 row 생성
		for (var i = 1; i <= count; i++) {
			var oddNum = i%2;
			
			if(oddNum != 0){
				list_str += '<tr>'
						 +		'<td class="td-odd" rowspan="2" style="border-right:1px solid #343435; font-size:40px !important;">'+i+'</td>'
						 +		'<td class="td-odd" style="border-right:1px solid #343435;"><input type="checkbox" id="cyl'+i+'_rms_select" class="cylChk" value="'+i+'_Rms"/></td>'
						 +		'<td class="td-odd" style="border-right:1px solid #343435;">RMS</td>'
						 +		'<td class="td-odd"><input type="number" step="0.1" onkeypress="return isNumberKey(event)" name="rms1" id="cyl'+i+'_rms_attr1" class="itx itx-x150" style="border-bottom: 1px solid #ff0000;" required/></td>'
						 +		'<td class="td-odd"><input type="number" step="0.1" onkeypress="return isNumberKey(event)" name="rms2" id="cyl'+i+'_rms_attr2" class="itx itx-x150" style="border-bottom: 1px solid yellow;" required/></td>'
						 +		'<td class="td-odd"><input type="number" step="0.1" onkeypress="return isNumberKey(event)" name="rms3" id="cyl'+i+'_rms_attr3" class="itx itx-x150" style="border-bottom: 1px solid yellow;" required /></td>'
						 +		'<td class="td-odd"><input type="number" step="0.1" onkeypress="return isNumberKey(event)" name="rms4" id="cyl'+i+'_rms_attr4" class="itx itx-x150" style="border-bottom: 1px solid #ff0000;" required /></td>'
						 +	'</tr>'
						 +	'<tr>'
						 +		'<td class="td-odd" style="border-right:1px solid #343435;"><input type="checkbox" id="cyl'+i+'_peak_select" class="cylChk" value="'+i+'_MinPlusMax"/></td>'
						 +		'<td class="td-odd" style="border-right:1px solid #343435;">PEAK</td>'
						 +		'<td class="td-odd"><input type="number" step="0.1" onkeypress="return isNumberKey(event)" name="peak1" id="cyl'+i+'_peak_attr1" class="itx itx-x150" style="border-bottom: 1px solid #ff0000;" required/></td>'
						 +		'<td class="td-odd"><input type="number" step="0.1" onkeypress="return isNumberKey(event)" name="peak2" id="cyl'+i+'_peak_attr2" class="itx itx-x150" style="border-bottom: 1px solid yellow;" required/></td>'
						 +		'<td class="td-odd"><input type="number" step="0.1" onkeypress="return isNumberKey(event)" name="peak3" id="cyl'+i+'_peak_attr3" class="itx itx-x150" style="border-bottom: 1px solid yellow;" required /></td>'
						 +		'<td class="td-odd"><input type="number" step="0.1" onkeypress="return isNumberKey(event)" name="peak4" id="cyl'+i+'_peak_attr4" class="itx itx-x150" style="border-bottom: 1px solid #ff0000;" required /></td>'
						 +	'</tr>';
			} else {
				list_str += '<tr>'
					 +		'<td class="td-even" rowspan="2" style="border-right:1px solid #343435; font-size:40px !important;">'+i+'</td>'
					 +		'<td class="td-even" style="border-right:1px solid #343435;"><input type="checkbox" id="cyl'+i+'_rms_select" class="cylChk" value="'+i+'_Rms"/></td>'
					 +		'<td class="td-even" style="border-right:1px solid #343435;">RMS</td>'
					 +		'<td class="td-even"><input type="number" step="0.1" onkeypress="return isNumberKey(event)" name="rms1" id="cyl'+i+'_rms_attr1" class="itx itx-x150" style="border-bottom: 1px solid #ff0000;" required/></td>'
					 +		'<td class="td-even"><input type="number" step="0.1" onkeypress="return isNumberKey(event)" name="rms2" id="cyl'+i+'_rms_attr2" class="itx itx-x150" style="border-bottom: 1px solid yellow;" required/></td>'
					 +		'<td class="td-even"><input type="number" step="0.1" onkeypress="return isNumberKey(event)" name="rms3" id="cyl'+i+'_rms_attr3" class="itx itx-x150" style="border-bottom: 1px solid yellow;" required /></td>'
					 +		'<td class="td-even"><input type="number" step="0.1" onkeypress="return isNumberKey(event)" name="rms4" id="cyl'+i+'_rms_attr4" class="itx itx-x150" style="border-bottom: 1px solid #ff0000;" required /></td>'
					 +	'</tr>'
					 +	'<tr>'
					 +		'<td class="td-even" style="border-right:1px solid #343435;"><input type="checkbox" id="cyl'+i+'_peak_select" class="cylChk" value="'+i+'_MinPlusMax"/></td>'
					 +		'<td class="td-even" style="border-right:1px solid #343435;">PEAK</td>'
					 +		'<td class="td-even"><input type="number" step="0.1" onkeypress="return isNumberKey(event)" name="peak1" id="cyl'+i+'_peak_attr1" class="itx itx-x150" style="border-bottom: 1px solid #ff0000;" required/></td>'
					 +		'<td class="td-even"><input type="number" step="0.1" onkeypress="return isNumberKey(event)" name="peak2" id="cyl'+i+'_peak_attr2" class="itx itx-x150" style="border-bottom: 1px solid yellow;" required/></td>'
					 +		'<td class="td-even"><input type="number" step="0.1" onkeypress="return isNumberKey(event)" name="peak3" id="cyl'+i+'_peak_attr3" class="itx itx-x150" style="border-bottom: 1px solid yellow;" required /></td>'
					 +		'<td class="td-even"><input type="number" step="0.1" onkeypress="return isNumberKey(event)" name="peak4" id="cyl'+i+'_peak_attr4" class="itx itx-x150" style="border-bottom: 1px solid #ff0000;" required /></td>'
					 +	'</tr>';
			}
      
		}
	} 
	//실린더 그 이외(22개일 때)
	else {
		for (var i = 1; i <= count; i++) {
			var oddNum = i%2;
			
			if(oddNum != 0){
				list_str += '<tr>'
						 +		'<td class="td-odd" rowspan="2" style="border-right:1px solid #343435; font-size:40px !important;">'+i+'</td>'
						 +		'<td class="td-odd" style="border-right:1px solid #343435;"><input type="checkbox" id="cyl'+i+'_rms_select" class="cylChk" value="'+i+'_Rms"/></td>'
						 +		'<td class="td-odd" style="border-right:1px solid #343435;">RMS</td>'
						 +		'<td class="td-odd"><input type="number" step="0.1" onkeypress="return isNumberKey(event)" name="rms1" id="cyl'+i+'_rms_attr1" class="itx itx-x150" style="border-bottom: 1px solid #ff0000;" required/></td>'
						 +		'<td class="td-odd"><input type="number" step="0.1" onkeypress="return isNumberKey(event)" name="rms2" id="cyl'+i+'_rms_attr2" class="itx itx-x150" style="border-bottom: 1px solid yellow;" required/></td>'
						 +		'<td class="td-odd"><input type="number" step="0.1" onkeypress="return isNumberKey(event)" name="rms3" id="cyl'+i+'_rms_attr3" class="itx itx-x150" style="border-bottom: 1px solid yellow;" required /></td>'
						 +		'<td class="td-odd"><input type="number" step="0.1" onkeypress="return isNumberKey(event)" name="rms4" id="cyl'+i+'_rms_attr4" class="itx itx-x150" style="border-bottom: 1px solid #ff0000;" required /></td>'
						 +	'</tr>'
						 +	'<tr>'
						 +		'<td class="td-odd" style="border-right:1px solid #343435;"><input type="checkbox" id="cyl'+i+'_peak_select" class="cylChk" value="'+i+'_MinPlusMax"/></td>'
						 +		'<td class="td-odd" style="border-right:1px solid #343435;">PEAK</td>'
						 +		'<td class="td-odd"><input type="number" step="0.1" onkeypress="return isNumberKey(event)" name="peak1" id="cyl'+i+'_peak_attr1" class="itx itx-x150" style="border-bottom: 1px solid #ff0000;" required/></td>'
						 +		'<td class="td-odd"><input type="number" step="0.1" onkeypress="return isNumberKey(event)" name="peak2" id="cyl'+i+'_peak_attr2" class="itx itx-x150" style="border-bottom: 1px solid yellow;" required/></td>'
						 +		'<td class="td-odd"><input type="number" step="0.1" onkeypress="return isNumberKey(event)" name="peak3" id="cyl'+i+'_peak_attr3" class="itx itx-x150" style="border-bottom: 1px solid yellow;" required /></td>'
						 +		'<td class="td-odd"><input type="number" step="0.1" onkeypress="return isNumberKey(event)" name="peak4" id="cyl'+i+'_peak_attr4" class="itx itx-x150" style="border-bottom: 1px solid #ff0000;" required /></td>'
						 +	'</tr>';
			} else {
				list_str += '<tr>'
					 +		'<td class="td-even" rowspan="2" style="border-right:1px solid #343435; font-size:40px !important;">'+i+'</td>'
					 +		'<td class="td-even" style="border-right:1px solid #343435;"><input type="checkbox" id="cyl'+i+'_rms_select" class="cylChk" value="'+i+'_Rms"/></td>'
					 +		'<td class="td-even" style="border-right:1px solid #343435;">RMS</td>'
					 +		'<td class="td-even"><input type="number" step="0.1" onkeypress="return isNumberKey(event)" name="rms1" id="cyl'+i+'_rms_attr1" class="itx itx-x150" style="border-bottom: 1px solid #ff0000;" required/></td>'
					 +		'<td class="td-even"><input type="number" step="0.1" onkeypress="return isNumberKey(event)" name="rms2" id="cyl'+i+'_rms_attr2" class="itx itx-x150" style="border-bottom: 1px solid yellow;" required/></td>'
					 +		'<td class="td-even"><input type="number" step="0.1" onkeypress="return isNumberKey(event)" name="rms3" id="cyl'+i+'_rms_attr3" class="itx itx-x150" style="border-bottom: 1px solid yellow;" required /></td>'
					 +		'<td class="td-even"><input type="number" step="0.1" onkeypress="return isNumberKey(event)" name="rms4" id="cyl'+i+'_rms_attr4" class="itx itx-x150" style="border-bottom: 1px solid #ff0000;" required /></td>'
					 +	'</tr>'
					 +	'<tr>'
					 +		'<td class="td-even" style="border-right:1px solid #343435;"><input type="checkbox" id="cyl'+i+'_peak_select" class="cylChk" value="'+i+'_MinPlusMax"/></td>'
					 +		'<td class="td-even" style="border-right:1px solid #343435;">PEAK</td>'
					 +		'<td class="td-even"><input type="number" step="0.1" onkeypress="return isNumberKey(event)" name="peak1" id="cyl'+i+'_peak_attr1" class="itx itx-x150" style="border-bottom: 1px solid #ff0000;" required/></td>'
					 +		'<td class="td-even"><input type="number" step="0.1" onkeypress="return isNumberKey(event)" name="peak2" id="cyl'+i+'_peak_attr2" class="itx itx-x150" style="border-bottom: 1px solid yellow;" required/></td>'
					 +		'<td class="td-even"><input type="number" step="0.1" onkeypress="return isNumberKey(event)" name="peak3" id="cyl'+i+'_peak_attr3" class="itx itx-x150" style="border-bottom: 1px solid yellow;" required /></td>'
					 +		'<td class="td-even"><input type="number" step="0.1" onkeypress="return isNumberKey(event)" name="peak4" id="cyl'+i+'_peak_attr4" class="itx itx-x150" style="border-bottom: 1px solid #ff0000;" required /></td>'
					 +	'</tr>';
			}
		}
	}
	
	$('#thresold_body').empty();
    $('#thresold_body').append(list_str);	
    
    fnSearch();
    //전체 체크박스 선택
    fnAllCheck();
}

//전체 체크박스 선택
function fnAllCheck(){
	//만약 전체 선택 체크박스가 체크된 상태일 경우
	if($("#cyl_allCheck").prop("checked")){
		$("input[type=checkbox]").prop("checked",true);
	}else{
		$("input[type=checkbox]").prop("checked",false);
	}
}

//데이트피커 설정
var now = new Date();
ClKendo.fnCreateDatePicker({selector : "#sdate", value: now, min: null}); 
ClKendo.fnCreateDatePicker({selector : "#edate", value: now, min: null});
ClKendo.fnCreateTimePicker({selector : "#etime", format: "HH:mm:ss", value: now});
now.setMinutes(now.getMinutes()-60);
ClKendo.fnCreateTimePicker({selector : "#stime", format: "HH:mm:ss", value: now});

//날짜세팅
function setDate(){
	var sdate;
	var edate;
	
	sdate = $('#sdate').val().replaceAll('-', '') + $('#stime').val().replaceAll(':', '') + '000';
	edate = $('#edate').val().replaceAll('-', '') + $('#etime').val().replaceAll(':', '') + '999';
	
	return {
		"sdate" : sdate,
		"edate" : edate
	}
}

//시그마 계산
function fnSigma(sigma_num){
	//날짜 확인
	var sdate = setDate().sdate;
	var edate = setDate().edate;
	
	if(sdate >= edate){
		alert("Please set the search period accurately.");
		return;
	}
	
	if($("input[type='checkbox']:checked").length < 1){
		alert("Please select a cylinder type.");
		return;
	}
	
	//체크된 실린더 value 가져오기
	var d_id = [];
	$('input[type="checkbox"]:checked').each(function(){
		var select_val = $(this).val();
		var select_l = select_val.split('_');
		d_id.push(select_l[0]);
	});
	
	//minus인지 plus 인지 구분
	var detail_type;
	var s_num =sigma_num;
	if(sigma_num <0){
		detail_type = 'minus';
		s_num = sigma_num * (-1);
	}else{
		detail_type = 'plus';
	}
	
	ClAjax.fnCallAjax({
		url : "/pmng/searchSigmaAjax.do",
		paramJsn: {
			sdate: sdate,
			edate: edate,
			d_list: d_id,
			gubun: s_num,
			detail_type: detail_type
		},
		errHandle : true,
		sucFn : function(data) {
			if(data.data.list.length >0){
				var l = data.data.list;
				//체크된 항목만 가져온다.
				$(".cylChk:checked").each(function(){
					var ch_id = $(this).attr('id');
					var v_id = ch_id.split('_');
					var cyl_dvc = v_id[0];
					var cyl_var = v_id[1];
					
					for(var i = 0; i<l.length; i++) {	
						if((l[i].threshold_type == cyl_dvc) && (l[i].var_id == cyl_var)){
							var _id = cyl_dvc+"_"+cyl_var;
							if(sigma_num == -3){
								$("#" + _id + "_attr1").val(l[i].sigma);
							}else if(sigma_num == -2){
								$("#" + _id + "_attr2").val(l[i].sigma);
							}else if(sigma_num == 2){
								$("#" + _id + "_attr3").val(l[i].sigma);
							}else{
								$("#" + _id + "_attr4").val(l[i].sigma);
							}	
						}	
					}
				});
			}else{
				//데이터가 없으면
				alert("There is no data on that date.");
				return;
			}
		},
		compltFn: function(data){
			kendo.ui.progress($('body'), false);
		}
	});
}

//input 소수점 제한
function isNumberKey(evt){
	var charCode = (evt.which) ? evt.which : event.keyCode;
    if (charCode != 46 && charCode > 31 && (charCode < 48 || charCode > 57))
        return false;

    // Textbox value    
    var _value = event.srcElement.value;
    
    // 소수점(.)이 두번 이상 나오지 못하게
    var _pattern0 = /^\d*[.]\d*$/; // 현재 value값에 소수점(.) 이 있으면 . 입력불가
    if (_pattern0.test(_value)) {
        if (charCode == 46) {
            return false;
        }
    }
    
    // 소수점 셋째짜리 입력가능
    var _pattern2 = /^\d*[.]\d{3}$/; // 현재 value값이 소수점 셋째짜리 숫자이면 더이상 입력 불가
    if (_pattern2.test(_value)) {
        alert("Only three decimal places can be entered.");
        return false;
    } 
    return true;
}


//이전 입력 내용 보기
function cylRecall(){
	ClPopup.fnOnClickModalOpen('/pmng/cylRecallModal.do', '', 1400);
}
</script>
