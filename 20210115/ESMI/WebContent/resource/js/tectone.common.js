/**
 * 되도록 이곳에 추가를 하지않고, 분류별로 class를 만들어 사용
 */

// replaceAll
String.prototype.replaceAll = function(search, replacement) {
    var target = this;
    return target.split(search).join(replacement);
};

function sttParse(str){
	var y = str.substring(0, 4);
    var mon = str.substring(4, 6);
    var d = str.substring(6, 8);
    var h = str.substring(8, 10);
    var min = str.substring(10, 12);
    var s = str.substring(12, 14);
    
    return new Date(y,(mon-1),d,h,min,s);
}