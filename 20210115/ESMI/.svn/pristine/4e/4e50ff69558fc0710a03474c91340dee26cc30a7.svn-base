<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>


<script type="text/javascript" charset="utf-8">

//date format
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


var pkg4Jsn = {
	<c:forEach var="i" items="${dvcList}" varStatus="idx">
		unit${idx.index+1} : {
			name: '${i.dvc_nm}',
			dvc_id : '${i.dvc_id}',
			dvc_id_list : '${i.dvc_id_list}',
			idx : ${idx.index+1}
		},
	</c:forEach>
}

var loadfactor_type = '${bean.loadfactor_type}';
var tree_nm = '${bean.tree_nm}';
// var alarm_var_id = ClString.isEmpty('${bean.var_id}')?'':'${bean.var_nm}'+'|'+'${bean.var_id}';
var alarm_var_id = ClString.isEmpty('${bean.var_id}')?'':'${bean.var_id}';
loadfactor_type = ClString.isEmpty(loadfactor_type)?"LOAD_FACTOR":loadfactor_type;
var tree_nm = ClString.isEmpty(tree_nm)?"CWA_PKG4":tree_nm;
var parent_url = '${bean.parent_url}';
var viewType = '${bean.view_type}';
</script>