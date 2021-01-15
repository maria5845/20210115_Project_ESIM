<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>

<script type="text/javascript">
//******************************************************************
var var_arr = [];
var var_str_arr = [];

//화면에 있는 var_id 조회 후 배열 만들기
var classList = document.getElementsByClassName('var_id');
for (var i = 0; i < classList.length; i++) {
	var_arr.push(classList[i].className.replaceAll('var_id ', ''));
}

//화면에 있는 var_id 조회 후 배열 만들기
var classStrList = document.getElementsByClassName('var_id_str');
for (var i = 0; i < classStrList.length; i++) {
	var_str_arr.push(classStrList[i].className.replaceAll('var_id_str ', ''));
}


var timeout = null;
var intvl = 60000; //재조회 시간 60 * 1000 1분

//초, 노, 빨
var color_arr =['#11a448', '#ffc52a','#f00000'];

//recent 값 가져오기
fngetRecentList(var_arr, 'n');

//recent string 값 가져오기
fngetRecentList(var_str_arr, 's');

//SV 색상 값 가져오기
fngetSVColorList();

//PV 색상 값 가져오기
fngetPVColorList();

//차트 데이터 조회 (설정값, 현재값 순서)
drawChart(['Cutter_Number_Setting_of_Strokes_of_Upper_Electrode_Cutting', 'Cutter_Number_of_Strokes_of_Upper_Electrode_Cutting'], '1');
drawChart(['Cutter_Number_Setting_of_Strokes_of_Center_Electrode_Cutting', 'Cutter_Number_of_Strokes_of_Center_Electrode_Cutting'], '2');
drawChart(['Cutter_Number_Setting_of_Strokes_of_Lower_Electrode_Cutting', 'Cutter_Number_of_Strokes_of_Lower_Electrode_Cutting'], '3');
drawChart(['Cutter_Number_Setting_of_Strokes_of_Final_Cutting', 'Cutter_Number_of_Strokes_of_Final_Cutting'], '4');


// ============= CTQ =============
fnGetCtqRecentList();

//******************************************************************

function fnMove(){
	//에러 추적 화면으로 이동
	ClLayout.fnTabAdd('Error Tracking', 962, '/pmng/errTrack.do', 'Error Tracking');
}

/**
 * recent 값 가져오기
 */
function fngetRecentList(_var_arr, type){
	ClAjax.fnCallAjax({
		url : '/pmng/getRecentList.do',
		paramJsn : {
			var_arr : _var_arr,
		},
		sucFn : function(data) {
			var l = data.data.list;
			if(l.length > 0){
				
				if('s' == type){ //문자
					$.each(l, function(idx, item) {
						
						$('.var_id_str.'+item.var_id).text(item.data_str_val);
					});
				}
				
				if('n' == type){ //숫자
					$.each(l, function(idx, item) {
						var val = item.data_val.replaceAll(',', '');
						if(val > 100000){
							//백단위 자른 후 K 붙임
							var valarr = item.data_val.split('.'); //소수점 제외
							$('.var_id.'+item.var_id).text(valarr[0].substr(0, (valarr[0].length) - 4) + ' K');
						}else{
							//Cell_Type  1  ->  A ,  2 -> C 로 표시(20.09.03 변경)
							if('Cell_Type' == item.var_id){
								if(item.data_val == 1){
									$('.var_id.'+item.var_id).text('A');
								}else if(item.data_val == 2){
									$('.var_id.'+item.var_id).text('C');
								}
							}else{
								$('.var_id.'+item.var_id).text(item.data_val);
							}
						}
					});
				}
				
			}
		},
		errHandle : true,
		errFn: true,
		compltFn : function() {
			timeout = setTimeout(function(){
				fngetRecentList(_var_arr, type);
	        }, intvl);
		},
	}); 
	
} 


/**
 * CTQ recent 값 가져오기
 */
function fnGetCtqRecentList(){
	
	ClAjax.fnCallAjax({
		url : '/pmng/getCtqRecentList.do',
		paramJsn : {
			//var_arr : _var_arr,
		},
		sucFn : function(data) {
			var l = data.data.list;
// 			console.log(l);
			if(l.length > 0){
				$.each(l, function(idx, item) {
					$('.ctq_list.'+item.var_id+'.'+(item.gubun.toLowerCase())).text(item.data_val);
				});
			}
		},
		errHandle : true,
		errFn: true,
		compltFn : function() {
			fngetCTQColorList();
			timeout = setTimeout(function(){
				fnGetCtqRecentList();
	        }, intvl);
		},
	}); 
	
}

/**
 * SV 색상 가져오기
 */
function fngetSVColorList(){
	ClAjax.fnCallAjax({
		url : '/pmng/getSVColorList.do',
		sucFn : function(data) {
			var l = data.data.list;
			if(l.length > 0){
				$.each(l, function(idx, item) {
					$('.'+item.var_id).removeClass('green');
					$('.'+item.var_id).removeClass('yellow');
					$('.'+item.var_id).removeClass('red');
					$('.'+item.var_id).addClass(item.color_class);
					//클릭 이벤트 발생
					$('.'+item.var_id).on('click', function(){
// 						console.log(this.classList[1]);
						//TODO 메뉴 id 확인
// 						<a href="/pmng/svHistory.do?menu_no=963&header_menu=Y&dvc_gr_type=" menu_no="963">
						ClLayout.fnTabAdd('SV History Summary', 963, '/pmng/svHistory.do?var_id'+ this.classList[1], 'SV History Summary');
					})
				});
			}
		},
		errHandle : true,
		errFn: true,
		compltFn : function() {
			timeout = setTimeout(function(){
				fngetSVColorList();
	        }, intvl);
		},
	}); 
}

/**
 * CTQ 색상 가져오기
 */
function fngetCTQColorList(){
	ClAjax.fnCallAjax({
		url : '/pmng/getCTQColorList.do',
		sucFn : function(data) {
			var l = data.data.list;
// 			console.log(l);
			if(l.length > 0){
				$.each(l, function(idx, item) {
					$('.ctq_list.'+item.gubun+'.'+item.var_id).removeClass('green');
					$('.ctq_list.'+item.gubun+'.'+item.var_id).removeClass('yellow');
					$('.ctq_list.'+item.gubun+'.'+item.var_id).removeClass('red');
					$('.ctq_list.'+item.gubun+'.'+item.var_id).addClass(item.color_class);
				});
			}
		},
		errHandle : true,
		errFn: true,
		compltFn : function() {
			timeout = setTimeout(function(){
				fngetCTQColorList();
	        }, intvl);
		},
	}); 
}

/**
 * PV 색상 가져오기
 */
function fngetPVColorList(){
	ClAjax.fnCallAjax({
		url : '/pmng/getPVColorList.do',
		sucFn : function(data) {
			var l = data.data.list;
			if(l.length > 0){
				$.each(l, function(idx, item) {
					$('.var_id.'+item.var_id).removeClass('green');
					$('.var_id.'+item.var_id).removeClass('yellow');
					$('.var_id.'+item.var_id).removeClass('red');
					$('.var_id.'+item.var_id).addClass(item.color_class);
					
// 						console.log(item.var_id);
					//클릭 이벤트 발생
					//TODO 메뉴 id 확인
					$('.var_id.'+item.var_id).on('click', function(){
						ClLayout.fnTabAdd('Trend Monitoring', 964, 'pmng/trendMoni.do', 'Trend Monitoring');
					})
				});
			}
		},
		errHandle : true,
		errFn: true,
		compltFn : function() {
			timeout = setTimeout(function(){
				fngetPVColorList();
	        }, intvl);
		},
	}); 
}

/**
 * 차트 그리기
 */
function drawChart(_var_arr, i){
	
	ClAjax.fnCallAjax({
		url : '/pmng/getRecentList.do',
		paramJsn : {
			var_arr : _var_arr
		},
		sucFn : function(data) {
			var l = data.data.list;
// 			console.log(l);
			
			if(l.length > 0){
		            
		            var _xAxis = _var_arr; // x축 시간 데이터
		            var _series = []; // Series Object
					
		            var mk1, mk2; //마크라인
		            
		            var data1, data2; //데이터
		            
		            $.each(l, function(idx, item){
		            	if(item.var_id == _var_arr[0]){
		            		var val = item.data_val.replaceAll(',', '')
		            		
		            		data1 = val;
		            		mk1 = (val * 0.7);
		            		mk2 = (val * 0.9);
		            	}
		            	if(item.var_id == _var_arr[1]) data2 = item.data_val.replaceAll(',', '');
					})
					
					var present_color = color_arr[0];
					if(data2 >= mk2){
						present_color = color_arr[2];
					}else if(data2 >= mk1){
						present_color = color_arr[1];
					}
					
		            
		            var option = {
		            	grid:{
		            		left: 0,
		            		top: 3,
		            		bottom: 3,
		            	},
		            	legend: {
		                    show: false
		                },
		                xAxis: {
		                    type: 'value',
		                    boundaryGap: [0, 0.01],
		                    show: false
		                },
		                yAxis: {
		                    type: 'category',
		                    data: _xAxis,
		                    show: false
		                },
		                series: {
		                    type: 'bar',
		                    barWidth: '60%',
		                    markLine : {
		                        silent: true,
		                        data: [
		                            {
		                                xAxis: mk1,
		            		        },{
		                                xAxis: mk2,
		            		        }
		        		        ],
		        		        symbolSize:0,
		        		        label:{
		        		            show: false
		        		        },
		                        lineStyle:{
		                            type: 'dotted',
		                            color: 'red',
		                            width: 1,
		        		        }
		                    },
		                    data: [
		                        {     
		                            value: data2,
		                            itemStyle: {color: present_color},
		                            label:{
		                               show: false
		                            }
		                        },
		                        {     
		                            value: data1,
		                            itemStyle: {color: '#11a448'},
		                            label:{
		                                show: false
		                            }
		                        },
		                        
		                    ],
		                    backgroundColor: '#32323d',
		                }
		            };
		            
		            var _dom = document.getElementById('main_chart' + i);
		            
		            var c = echarts.getInstanceByDom(_dom);
					if(c != null){
						c.dispose();
						c = null;
					}
		            
					chart = echarts.init(_dom, 'dark');
					chart.setOption(option);
					
			}
			
		},
		errHandle : true,
		errFn: true,
		compltFn : function() {
			timeout = setTimeout(function(){
				drawChart(_var_arr, i);
	        }, intvl);
		},
	}); 
}

</script>
