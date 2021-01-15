<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>


<script type="text/javascript" charset="utf-8">


//색상 맵
var colorMap = {
		green: 			'#18a34a',
		yellow: 		'#f4ff47',
		yellow_green: 	'#92d050',
		red: 			'#ff0000',
		blue: 			'#2688e2',
		gray: 			'#B3B3B3',
		tbl_gray:		'#2f3036',
};

//장치 목록
var dvcJsn = {
// 		pkg1: "PACKAGE_6_1",
// 		pkg2: "PACKAGE_6_2",
// 		pkg3: "PACKAGE_6_3",
// 		lami: "LAMINATION_8_2",
// 		coater: "COATER_2",
		lami    : "LNS 803",
		notch   : "NOTCHING8_2",
		module  : "CMA-06-Module-02",
		pkg1    : "package6_1",
		pkg2    : "PACKAGE_6_2",
		pkg3    : "PACKAGE_6_3",
		coater_c_1 : "COATER_C_1", // cathode 음극
		coater_c_2 : "COATER_C_2",
		coater_a_1 : "COATER_A_1", // anode 양극
		coater_a_2 : "COATER_A_2",
}

//SVG 센서 정보
var svgJsn = {
		pkg_main:[
			{id:'forming1', _x: 297, _y:  25, _width: 114, _height: 100, _fill: 'transparent', _stroke: '#dadada', _strokeWidth: 4},
			{id:'forming2', _x: 837, _y:  25, _width: 114, _height: 100, _fill: 'transparent', _stroke: '#dadada', _strokeWidth: 4},
			{id:'index1',   _x: 410, _y: 210, _width: 180, _height: 190, _fill: 'transparent', _stroke: '#dadada', _strokeWidth: 4},
			{id:'index2',   _x: 659, _y: 210, _width: 180, _height: 190, _fill: 'transparent', _stroke: '#dadada', _strokeWidth: 4},
		],
		pkg_1:[
			{id:'robot01',  x: 487, y: 190, r: 8, var_id:'robot01'},
		],
		pkg_2:[
			{id:'m12', x: 200, y: 600, r: 10, var_id:'m12'},
			{id:'m13', x: 300, y: 600, r: 10, var_id:'m13'},
			{id:'m14', x: 400, y: 600, r: 10, var_id:'m14'},
			{id:'m15', x: 500, y: 600, r: 10, var_id:'m15'},
			{id:'m16', x: 600, y: 600, r: 10, var_id:'m16'},
			{id:'m17', x: 700, y: 600, r: 10, var_id:'m17'},
			{id:'m18', x: 800, y: 600, r: 10, var_id:'m18'},
			{id:'m19', x: 320, y: 190, r: 10, var_id:'m19'},
			{id:'m20', x: 420, y: 190, r: 10, var_id:'m20'},
			{id:'m21', x: 330, y: 220, r: 10, var_id:'m21'},
			{id:'m22', x: 400, y: 220, r: 10, var_id:'m22'}
		],
		pkg_3:[
			{id:'m23', x: 560, y: 550, r: 10, var_id:'m23'},
			{id:'m24', x: 300, y: 550, r: 10, var_id:'m24'},
			{id:'m25', x: 400, y: 550, r: 10, var_id:'m25'},
			{id:'m26', x: 500, y: 550, r: 10, var_id:'m26'},
			{id:'m27', x: 600, y: 550, r: 10, var_id:'m27'},
			{id:'m28', x: 700, y: 550, r: 10, var_id:'m28'},
			{id:'m29', x: 852, y: 580, r: 10, var_id:'m29'},
			{id:'m30', x: 200, y: 580, r: 10, var_id:'m30'},
			{id:'m31', x: 300, y: 580, r: 10, var_id:'m31'},
			{id:'m32', x: 400, y: 580, r: 10, var_id:'m32'}
		],
		lami:[
			{id:'lns_rect_1', x: 908, y: 114, r: 8, var_id:'Electrode/Separator Combiner_[Upper] Electrode. Sensor Upper'},
			{id:'lns_rect_2', x: 892, y: 140, r: 8, var_id:'Electrode/Separator Combiner_[Upper] Electrode. Sensor Lower'},
			{id:'lns_rect_3', x: 857, y: 142, r: 8, var_id:'Electrode/Separator Combiner_[Lower] Electrode. Sensor Upper'},
			{id:'lns_rect_4', x: 857, y: 173, r: 8, var_id:'Electrode/Separator Combiner_[Lower] Electrode. Sensor Lower'},
		],
		coater_a_main:[
			{id:'rewinder1',  x: 230, y: 200},
			{id:'rewinder2',  x: 230, y: 50},
			{id:'slitter',    x: 350, y: 200},
			{id:'unwinder',   x: 250, y: 440},
		],
		coater_c_main:[
			{id:'Re-winder',  x: 174, y: 286},
			{id:'Un-winder',  x: 176, y: 610},
		],
		module:[
			{id:'A_Stacking_01', name: "A Stacking #01",  cx: 534, cy: 221, r: 10, x: 603, y: 226},
			{id:'A_Stacking_02', name: "A Stacking #02",  cx: 534, cy: 197, r: 10, x: 603, y: 202},
			{id:'A_Stacking_03', name: "A Stacking #03",  cx: 534, cy: 174, r: 10, x: 603, y: 179},
			{id:'A_Stacking_04', name: "A Stacking #04",  cx: 534, cy: 152, r: 10, x: 603, y: 157},
			{id:'B_Stacking_01', name: "B Stacking #01",  cx: 475, cy: 221, r: 10, x: 410, y: 226},
			{id:'B_Stacking_02', name: "B Stacking #02",  cx: 475, cy: 197, r: 10, x: 410, y: 202},
			{id:'B_Stacking_03', name: "B Stacking #03",  cx: 475, cy: 174, r: 10, x: 410, y: 179},
			{id:'B_Stacking_04', name: "B Stacking #04",  cx: 475, cy: 152, r: 10, x: 410, y: 157},
			{id:'Lead_Welding_01_LH', name: "Lead Welding #01(LH)",  cx: 772, cy: 325, r: 10, x: 700, y: 352},
			{id:'Lead_Welding_01_RH', name: "Lead Welding #01(RH)",  cx: 848, cy: 325, r: 10, x: 920, y: 352},
			{id:'Lead_Welding_02_LH', name: "Lead Welding #02(LH)",  cx: 772, cy: 260, r: 10, x: 700, y: 290},
			{id:'Lead_Welding_02_RH', name: "Lead Welding #02(RH)",  cx: 848, cy: 260, r: 10, x: 920, y: 290},
			{id:'MF_Feeding', name: "MF Feeding",  cx: 1030, cy: 247, r: 10, x: 1025, y: 225},
			{id:'EP_01', name: "E/P Aligner 01",  cx: 1130, cy: 275, r: 10, x: 1130, y: 305},
			{id:'EP_02', name: "E/P Aligner 02",  cx: 1130, cy: 230, r: 10, x: 1130, y: 210},
		],
};

//센서 변수 정보
var varJsn = {
		//pkg main
		forming1:{
			chart1: [
				{varId: '02 PRE HEATER D', _type: 'line', _yAxisIndex: 0, _color: "#eee491", _symbol: 'circle', _symbolSize: 6, _width: 2},
				{varId: '02 PRE HEATER A', _type: 'line', _yAxisIndex: 0, _color: "#fd65b2", _symbol: 'circle', _symbolSize: 6, _width: 2},
				{varId: '02 PRE HEATER B', _type: 'line', _yAxisIndex: 0, _color: "#46b876", _symbol: 'circle', _symbolSize: 6, _width: 2},
			],
			chart2: [
				{varId: '02 PRE HEATER D', _type: 'line', _yAxisIndex: 0, _color: "#eee491", _symbol: 'circle', _symbolSize: 6, _width: 2},
// 				{varId: 'index01_score', _type: 'line', _yAxisIndex: 0, _color: "#eee491", _symbol: 'circle', _symbolSize: 6, _width: 2},
			],
		},
		forming2:{
			chart1: [
				{varId: 'ch1', _type: 'line', _yAxisIndex: 0, _color: "#eee491", _symbol: 'circle', _symbolSize: 6, _width: 2},
				{varId: 'ch2', _type: 'line', _yAxisIndex: 0, _color: "#fd65b2", _symbol: 'circle', _symbolSize: 6, _width: 2},
				{varId: 'ch3', _type: 'line', _yAxisIndex: 0, _color: "#46b876", _symbol: 'circle', _symbolSize: 6, _width: 2},
			],
			chart2: [
				{varId: 'index01_score', _type: 'line', _yAxisIndex: 0, _color: "#eee491", _symbol: 'circle', _symbolSize: 6, _width: 2},
			],
		},
		index1	:{
			chart1: [
				{varId: 'ch1', _type: 'line', _yAxisIndex: 0, _color: "#eee491", _symbol: 'circle', _symbolSize: 6, _width: 2},
				{varId: 'ch2', _type: 'line', _yAxisIndex: 0, _color: "#fd65b2", _symbol: 'circle', _symbolSize: 6, _width: 2},
				{varId: 'ch3', _type: 'line', _yAxisIndex: 0, _color: "#46b876", _symbol: 'circle', _symbolSize: 6, _width: 2},
			],
			chart2: [
				{varId: 'index01_score', _type: 'line', _yAxisIndex: 0, _color: "#fd65b2", _symbol: 'circle', _symbolSize: 6, _width: 2},
			],
		},
		index2	:{
			chart1: [
				{varId: 'ch1', _type: 'line', _yAxisIndex: 0, _color: "#eee491", _symbol: 'circle', _symbolSize: 6, _width: 2},
				{varId: 'ch2', _type: 'line', _yAxisIndex: 0, _color: "#fd65b2", _symbol: 'circle', _symbolSize: 6, _width: 2},
				{varId: 'ch3', _type: 'line', _yAxisIndex: 0, _color: "#46b876", _symbol: 'circle', _symbolSize: 6, _width: 2},
			],
			chart2: [
				{varId: 'index01_score', _type: 'line', _yAxisIndex: 0, _color: "#eee491", _symbol: 'circle', _symbolSize: 6, _width: 2},
			],
		},
		//pkg1
		robot01	:{
			chart1: [
				{varId: '1축_[Md.104] 모터 전류값', _type: 'line', _yAxisIndex: 0, _color: "#eee491", _symbol: 'circle', _symbolSize: 6, _width: 2},
				{varId: '1축_[Md.110] 실효 부하율', _type: 'line', _yAxisIndex: 0, _color: "#fd65b2", _symbol: 'circle', _symbolSize: 6, _width: 2},
				{varId: '1축_모터 진동 수준', _type: 'line', _yAxisIndex: 0, _color: "#46b876", _symbol: 'circle', _symbolSize: 6, _width: 2},
			],
			chart2: [
				{varId: '1축_Residual', _type: 'line', _yAxisIndex: 0, _color: "#eee491", _symbol: 'circle', _symbolSize: 6, _width: 2},
			],
		},
		//lami
		lns_yield	:{
			chart1: [
				{varId: 'Lamination_YieldRate', _type: 'line', _yAxisIndex: 0, _color: "#eee491", _symbol: 'circle', _symbolSize: 6, _width: 2},
			],
			chart2: [
				{varId: 'Electrode/Separator Combiner_[Upper] Electrode. Sensor Upper', _type: 'line', _yAxisIndex: 0, _color: "#eee491", _symbol: 'circle', _symbolSize: 6, _width: 2},
				{varId: 'Electrode/Separator Combiner_[Upper] Electrode. Sensor Lower', _type: 'line', _yAxisIndex: 0, _color: "#fd65b2", _symbol: 'circle', _symbolSize: 6, _width: 2},
				{varId: 'Electrode/Separator Combiner_[Lower] Electrode. Sensor Upper', _type: 'line', _yAxisIndex: 0, _color: "#46b876", _symbol: 'circle', _symbolSize: 6, _width: 2},
				{varId: 'Electrode/Separator Combiner_[Lower] Electrode. Sensor Lower', _type: 'line', _yAxisIndex: 0, _color: "#7b2bb5", _symbol: 'circle', _symbolSize: 6, _width: 2},
			],
		},
		lns_rect_1 :{
			chart1: [
				{varId: 'Electrode/Separator Combiner_[Upper] Electrode. Sensor Upper', _type: 'line', _yAxisIndex: 0, _color: "#eee491", _symbol: 'circle', _symbolSize: 6, _width: 2},
			],
			chart2: [
				{varId: 'Lamination_YieldRate', _type: 'line', _yAxisIndex: 0, _color: "#eee491", _symbol: 'circle', _symbolSize: 6, _width: 2},
			],
		},
		lns_rect_2 :{
			chart1: [
				{varId: 'Electrode/Separator Combiner_[Upper] Electrode. Sensor Lower', _type: 'line', _yAxisIndex: 0, _color: "#eee491", _symbol: 'circle', _symbolSize: 6, _width: 2},
			],
			chart2: [
				{varId: 'Lamination_YieldRate', _type: 'line', _yAxisIndex: 0, _color: "#eee491", _symbol: 'circle', _symbolSize: 6, _width: 2},
			],
		},
		lns_rect_3 :{
			chart1: [
				{varId: 'Electrode/Separator Combiner_[Lower] Electrode. Sensor Upper', _type: 'line', _yAxisIndex: 0, _color: "#eee491", _symbol: 'circle', _symbolSize: 6, _width: 2},
			],
			chart2: [
				{varId: 'Lamination_YieldRate', _type: 'line', _yAxisIndex: 0, _color: "#eee491", _symbol: 'circle', _symbolSize: 6, _width: 2},
			],
		},
		lns_rect_4 :{
			chart1: [
				{varId: 'Electrode/Separator Combiner_[Lower] Electrode. Sensor Lower', _type: 'line', _yAxisIndex: 0, _color: "#eee491", _symbol: 'circle', _symbolSize: 6, _width: 2},
			],
			chart2: [
				{varId: 'Lamination_YieldRate', _type: 'line', _yAxisIndex: 0, _color: "#eee491", _symbol: 'circle', _symbolSize: 6, _width: 2},
			],
		},
		//coater main
		rewinder1:{
			chart1: [
				{varId: '02 PRE HEATER D', _type: 'line', _yAxisIndex: 0, _color: "#eee491", _symbol: 'circle', _symbolSize: 6, _width: 2},
				{varId: '02 PRE HEATER A', _type: 'line', _yAxisIndex: 0, _color: "#fd65b2", _symbol: 'circle', _symbolSize: 6, _width: 2},
				{varId: '02 PRE HEATER B', _type: 'line', _yAxisIndex: 0, _color: "#46b876", _symbol: 'circle', _symbolSize: 6, _width: 2},
			],
			chart2: [
				{varId: '02 PRE HEATER B', _type: 'line', _yAxisIndex: 0, _color: "#eee491", _symbol: 'circle', _symbolSize: 6, _width: 2},
				{varId: '02 PRE HEATER C', _type: 'line', _yAxisIndex: 0, _color: "#fd65b2", _symbol: 'circle', _symbolSize: 6, _width: 2},
			],
		},
		rewinder2:{
			chart1: [
				{varId: '02 PRE HEATER D', _type: 'line', _yAxisIndex: 0, _color: "#eee491", _symbol: 'circle', _symbolSize: 6, _width: 2},
				{varId: '02 PRE HEATER A', _type: 'line', _yAxisIndex: 0, _color: "#fd65b2", _symbol: 'circle', _symbolSize: 6, _width: 2},
				{varId: '02 PRE HEATER B', _type: 'line', _yAxisIndex: 0, _color: "#46b876", _symbol: 'circle', _symbolSize: 6, _width: 2},
			],
			chart2: [
				{varId: '02 PRE HEATER B', _type: 'line', _yAxisIndex: 0, _color: "#eee491", _symbol: 'circle', _symbolSize: 6, _width: 2},
				{varId: '02 PRE HEATER C', _type: 'line', _yAxisIndex: 0, _color: "#fd65b2", _symbol: 'circle', _symbolSize: 6, _width: 2},
			],
		},
		slitter:{
			chart1: [
				{varId: '02 PRE HEATER D', _type: 'line', _yAxisIndex: 0, _color: "#eee491", _symbol: 'circle', _symbolSize: 6, _width: 2},
				{varId: '02 PRE HEATER A', _type: 'line', _yAxisIndex: 0, _color: "#fd65b2", _symbol: 'circle', _symbolSize: 6, _width: 2},
				{varId: '02 PRE HEATER B', _type: 'line', _yAxisIndex: 0, _color: "#46b876", _symbol: 'circle', _symbolSize: 6, _width: 2},
			],
			chart2: [
				{varId: '02 PRE HEATER C', _type: 'line', _yAxisIndex: 0, _color: "#eee491", _symbol: 'circle', _symbolSize: 6, _width: 2},
			],
		},
		unwinder:{
			chart1: [
				{varId: '02 PRE HEATER D', _type: 'line', _yAxisIndex: 0, _color: "#eee491", _symbol: 'circle', _symbolSize: 6, _width: 2},
				{varId: '02 PRE HEATER A', _type: 'line', _yAxisIndex: 0, _color: "#fd65b2", _symbol: 'circle', _symbolSize: 6, _width: 2},
				{varId: '02 PRE HEATER B', _type: 'line', _yAxisIndex: 0, _color: "#46b876", _symbol: 'circle', _symbolSize: 6, _width: 2},
			],
			chart2: [
				{varId: '02 PRE HEATER C', _type: 'line', _yAxisIndex: 0, _color: "#eee491", _symbol: 'circle', _symbolSize: 6, _width: 2},
			],
		},
		module:{
			chart1: [
				{varId: '02 PRE HEATER B', _type: 'line', _yAxisIndex: 0, _color: "#eee491", _symbol: 'circle', _symbolSize: 6, _width: 2},
				{varId: '리드컷팅L 서보위치 02', _type: 'line', _yAxisIndex: 0, _color: "#fd65b2", _symbol: 'circle', _symbolSize: 6, _width: 2},
				{varId: '리드컷팅L 서보위치 03', _type: 'line', _yAxisIndex: 0, _color: "#46b876", _symbol: 'circle', _symbolSize: 6, _width: 2},
				{varId: '리드컷팅L 서보위치 04', _type: 'line', _yAxisIndex: 0, _color: "#2688e2", _symbol: 'circle', _symbolSize: 6, _width: 2},
			],
			chart2: [
				{varId: '02 PRE HEATER D', _type: 'line', _yAxisIndex: 0, _color: "#eee491", _symbol: 'circle', _symbolSize: 6, _width: 2},
				{varId: '리드컷팅L 서보위치 06', _type: 'line', _yAxisIndex: 0, _color: "#fd65b2", _symbol: 'circle', _symbolSize: 6, _width: 2},
				{varId: '리드컷팅L 서보위치 07', _type: 'line', _yAxisIndex: 0, _color: "#46b876", _symbol: 'circle', _symbolSize: 6, _width: 2},
				{varId: '리드컷팅L 서보위치 08', _type: 'line', _yAxisIndex: 0, _color: "#2688e2", _symbol: 'circle', _symbolSize: 6, _width: 2},
			],
		},
		moduleUseCnt:{
			chart1: [
				{varId: 'Probe 교체주기 01', _type: 'line', _yAxisIndex: 0, _color: "#eee491", _symbol: 'circle', _symbolSize: 6, _width: 2},
				{varId: 'Probe 교체주기 02', _type: 'line', _yAxisIndex: 0, _color: "#fd65b2", _symbol: 'circle', _symbolSize: 6, _width: 2},
				{varId: 'Probe 교체주기 03', _type: 'line', _yAxisIndex: 0, _color: "#46b876", _symbol: 'circle', _symbolSize: 6, _width: 2},
				{varId: 'Probe 교체주기 04', _type: 'line', _yAxisIndex: 0, _color: "#2688e2", _symbol: 'circle', _symbolSize: 6, _width: 2},
			],
			chart2: [
				{varId: '통전고무 교체주기 01', _type: 'line', _yAxisIndex: 0, _color: "#eee491", _symbol: 'circle', _symbolSize: 6, _width: 2},
				{varId: '통전고무 교체주기 02', _type: 'line', _yAxisIndex: 0, _color: "#fd65b2", _symbol: 'circle', _symbolSize: 6, _width: 2},
				{varId: '통전고무 교체주기 03', _type: 'line', _yAxisIndex: 0, _color: "#46b876", _symbol: 'circle', _symbolSize: 6, _width: 2},
				{varId: '통전고무 교체주기 04', _type: 'line', _yAxisIndex: 0, _color: "#2688e2", _symbol: 'circle', _symbolSize: 6, _width: 2},
			],
			chart3: [
				{varId: '커터날 교체주기 01', _type: 'line', _yAxisIndex: 0, _color: "#eee491", _symbol: 'circle', _symbolSize: 6, _width: 2},
				{varId: '커터날 교체주기 02', _type: 'line', _yAxisIndex: 0, _color: "#fd65b2", _symbol: 'circle', _symbolSize: 6, _width: 2},
				{varId: '커터날 교체주기 03', _type: 'line', _yAxisIndex: 0, _color: "#46b876", _symbol: 'circle', _symbolSize: 6, _width: 2},
				{varId: '커터날 교체주기 04', _type: 'line', _yAxisIndex: 0, _color: "#2688e2", _symbol: 'circle', _symbolSize: 6, _width: 2},
			],
			chart4: [
// 				{varId: '02 PRE HEATER C', _type: 'line', _yAxisIndex: 0, _color: "#46b876", _symbol: 'circle', _symbolSize: 6, _width: 2},
			],
		},
		moduleSensor:{
			varArr: ["최종 생산 수량", "A Stacking Main Align 01 Counting Data", "A Stacking Main Align 02 Counting Data", "B Stacking Main Align 01 Counting Data", "B Stacking Main Align 02 Counting Data"]
		},
}

var pkg4Jsn = {
	<c:forEach var="i" items="${dvcList}" varStatus="idx">
		unit${idx.index+1} : {
			name: '${i.dvc_nm}',
			dvc_id : '${i.dvc_id}'
		},
	</c:forEach>
}

var loadfactor_type = '${bean.loadfactor_type}';
var tree_nm = '${bean.tree_nm}';
loadfactor_type = ClString.isEmpty(loadfactor_type)?"LOAD_FACTOR":loadfactor_type;
var tree_nm = ClString.isEmpty(tree_nm)?"CWA_PKG4":tree_nm;
var parent_url = '${bean.parent_url}';
</script>