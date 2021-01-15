<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>

<script type="text/javascript">
//Grid생성
ClKendo.fnCreateGrid({
	selector: '#grid',
	height: 680,
	columns: [
             { field: "dvc_id",	title: 'Cylinder', headerAttributes: {style: "font-size: 16px"}, width: 80, attributes:{ 'class':"text-center", style:"font-size: 16px"}},
             { field: "var_id",	title: 'Type', headerAttributes: {style: "font-size: 16px"}, width: 80, attributes:{ 'class':"text-center", style:"font-size: 16px"}},
             { field: "th1",	title: 'Damaged(Lower)', headerAttributes: {style: "font-size: 16px"}, width: 100, attributes:{ 'class':"text-center", style:"font-size: 16px"}},
             { field: "th2",	title: 'Warning(Lower)', headerAttributes: {style: "font-size: 16px"}, width: 100, attributes:{ 'class':"text-center", style:"font-size: 16px" }},
             { field: "th3",	title: 'Warning(Upper)', headerAttributes: {style: "font-size: 16px"}, width: 100, attributes:{ 'class':"text-center", style:"font-size: 16px" }},
             { field: "th4",	title: 'Damaged(Upper)', headerAttributes: {style: "font-size: 16px"}, width: 100, attributes:{ 'class':"text-center", style:"font-size: 16px"}},
             { field: "gen_dt",	title: 'Date', headerAttributes: {style: "font-size: 16px"}, width: 100, attributes:{ 'class':"text-center", style:"font-size: 16px"}},
             { title: 'Work', template: kendo.template($("#cmd-template").html()), headerAttributes: {style: "font-size: 16px"}, width:80, attributes:{ 'class':"text-center", style:"font-size: 16px"}}
	],
	scrollable: true,
	pageable: false,
    toolbar: false
});

ClCRUD.fnListSearchIt({selector: '#grid', url: '/pmng/cylRecallListAjax.do'});

function replaceData(dvc_id, var_id, gen_dt){
	var answer = confirm("Do you want to change the value?");

	if(answer == false){
		return false;
	}
	
	var grid = $("#grid").data("kendoGrid");
	var assy_list = [];
	
	// Grid의 rowData를 모두 assy_list 배열에 넣는다. 
	grid.dataSource._data.forEach(function(item){
		if(dvc_id == item.dvc_id && var_id == item.var_id && gen_dt == item.gen_dt){
			assy_list.push(item);
		}
    });
	
	var low_var_id = assy_list[0].var_id
	low_var_id = low_var_id.toLowerCase();
	
	for(var i = 1; i<5; i++){
		var cyl_id = "cyl"+ assy_list[0].dvc_id+"_"+low_var_id+"_attr"+i;

		//iframe 안에 있기 때문에 부모창 접근 방법
		//ClLayout.$owner(). 
		ClLayout.$owner().$("#"+cyl_id).val(eval("assy_list[0].th"+i));
		
		var a = ClLayout.$owner().$("#"+cyl_id).val();
	}
	ClPopup.fnModalClose();
}
</script>
