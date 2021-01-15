<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<script type="text/javascript">

// date format
Date.prototype.format = function(f) {
    if (!this.valueOf()) return " ";
 
    var weekName = ["일요일", "월요일", "화요일", "수요일", "목요일", "금요일", "토요일"];
    var d = this;
     
    return f.replace(/(yyyy|yy|MM|dd|E|hh|mm|ss|a\/p)/gi, function($1) {
        switch ($1) {
            case "yyyy": return d.getFullYear();
            case "yy": return (d.getFullYear() % 1000).zf(2);
            case "MM": return (d.getMonth() + 1).zf(2);
            case "dd": return d.getDate().zf(2);
            case "E": return weekName[d.getDay()];
            case "HH": return d.getHours().zf(2);
            case "hh": return ((h = d.getHours() % 12) ? h : 12).zf(2);
            case "mm": return d.getMinutes().zf(2);
            case "ss": return d.getSeconds().zf(2);
            case "a/p": return d.getHours() < 12 ? "오전" : "오후";
            default: return $1;
        }
    });
};
 
String.prototype.string = function(len){var s = '', i = 0; while (i++ < len) { s += this; } return s;};
String.prototype.zf = function(len){return "0".string(len - this.length) + this;};
Number.prototype.zf = function(len){return this.toString().zf(len);};


ClKendo.fnCreateGrid({
    selector: '#grid_reset',
    height: 340,
    toolbar: null,
    selectable: "single",
    columns: [
//                 {headerTemplate: '<input type="checkbox" id="checkAll" />', template: kendo.template($("#pk-template-tree").html()), attributes:{ 'class':"text-center"},  width:45},
                { field: "dvc_id", title: "Device ID",      width: 180, attributes:{ 'class':"text-center"}},
                { field: "var_id",  title: "Variable ID",      width: 140, attributes:{ 'class':"text-center"}},
                { field: "reset_date",  title: "Reset Date",      width: 140, attributes:{ 'class':"text-center"}},
                { field: "gen_dt",  title: "Reset Date",      width: 140, attributes:{ 'class':"text-center"}},
                { field: "mdfy_dt",  title: "Next Reset Date",      width: 140, attributes:{ 'class':"text-center"}},
    ],
    dataSource: ${resetDateList},
    scrollable: {
        virtual: false//가상스크롤 사용여부 - Boolean (default: false) 
    },
    pageable: false,
});


$("#grid_reset tbody").on("click", "tr", function(e) {

    var rowElement = this;
    var row = $(rowElement);
    var grid = $("#grid_reset").getKendoGrid();

    if (row.hasClass("k-state-selected")) {
      var selected = grid.select();
      selected = $.grep(selected,function(x){
        var itemToRemove = grid.dataItem(row);
        var currentItem = grid.dataItem(x);
        return itemToRemove.OrderID != currentItem.OrderID
      })

      grid.clearSelection();
      grid.select(selected);
      e.stopPropagation();
    }else{
      grid.select(row)
      e.stopPropagation();
    }
  });

function fnSearchIt(){
	var entityGrid = $("#grid_reset").data("kendoGrid");
	var rows = entityGrid.select();
	var start_date=null;
	var start_date_ymd=null;
	var end_date=null;
	var end_date_ymd=null;
	var reset_date=null;
	rows.each(function(index, row) {
	  var selectedItem = entityGrid.dataItem(row);
	  reset_date = selectedItem.reset_date;
	  start_date =  new Date(selectedItem.reset_date+" 00:00:00").format('yyyy-MM-dd HH:mm:ss');
// 	  start_date_ymd = selectedItem.reset_date;
	  start_date_ymd = selectedItem.gen_dt.substr(0,10);
	  if(typeof selectedItem.mdfy_dt == 'undefined'){
//    	      today = new Date();
//    	      end_date = today.format('yyyy-MM-dd HH:mm:ss')
   	      
	  }else {
	      end_date = selectedItem.mdfy_dt
	      end_date_ymd = selectedItem.mdfy_dt.substr(0,10);
	  }
	});
	
	var paramJsn = {
			           sdate : start_date,
			           edate : end_date,
			           start_date_ymd : start_date_ymd,
			           end_date_ymd : end_date_ymd,
			           reset_date : reset_date
			       };
	fnSendAajx(paramJsn);
        
	$(".is-close").eq(-1).trigger("click");
}

function fnSendAajx(paramJsn){
    kendo.ui.progress($('body'), true);
    ClAjax.fnCallAjax({
        url: '/custom/loadfactorADAlarmListAjax.do',
        paramJsn: paramJsn,
        sucFn: function(data){
            ClKendo.fnSetDataToKendoGrid({selector: '#grid', data: data.data.list, selPos: -1});
//             gridInterval=setTimeout(function(){ ClLayout.$owner().fnSearch(paramJsn); }, 60000);
            var dateStr = '';
            if(paramJsn.start_date_ymd!=null){
	            if(paramJsn.end_date_ymd!=null){
	            	dateStr=(paramJsn.start_date_ymd).concat(' ~ ').concat(paramJsn.end_date_ymd)
	            }else{
	            	dateStr=paramJsn.reset_date;
	            }
            }else{
            	dateStr="All";
            }
        	ClLayout.$owner().setResetDate(dateStr);
			ClLayout.$owner().fnSearch(paramJsn);
        },
        errHandle: true,
        compltFn: function(){
            kendo.ui.progress($('body'), false);
        },
    });

}
</script>
