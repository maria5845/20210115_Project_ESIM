<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>

<c:set var="rootPath" value="${pageContext.request.contextPath}" scope="application"/>
<c:set var="userSession" value="${sessionScope.userSession}" scope="session"/>


/**
 * ClKendo 함수 목록
 */
/**
 * // Kendo Grid 생성
 * ClKendo.fnCreateGrid(_params) 
 * 
 * // Kendo Grid에 데이터 Set
 * ClKendo.fnSetDataToKendoGrid(_params)
 * 
 * // Kendo Grid Refresh 
 * ClKendo.fnGridRefresh(_selector, _page)
 *  
 * // Excelfile Export시 호출
 * ClKendo.fnExcelDownFromServer(selector)
 *  
 * // kendo Grid td 합치기 - KendoGrid 옵션의 dataBound 안에서 쓴다
 * ClKendo.fnMergeGridRows(sender, colTitles, colMergerCustomFn)
 * 
 * // Kendo DatePicker 생성 
 * ClKendo.fnCreateDatePicker(_params)
 * 
 * // Kendo DatePicker의 값 설정
 * ClKendo.fnSetDatePickerVal(_selector, _date)
 * 
 * // Kendo DatePicker의 값을 포맷(기본값 yyyyMMdd) 형식으로 획득
 * ClKendo.fnGetDatePickerFormatVal(_selector, _format)
 * 
 * // Kendo TimePicker 생성 
 * ClKendo.fnCreateTimePicker(_params)
 * 
 * // Kendo TimePicker의 값 설정
 * ClKendo.fnSetTimePickerVal(_selector, _date)
 * 
 * // Kendo 차트 그리기(사용 x)
 * ClKendo.fnCreateChart(_params)
 * 
 * // Kendo Tab 생성
 * ClKendo.fnCreateTab(_params)
 * 
 * // Kendo Checkbox 데이터 가져오기
 * ClKendo.fnGetGridCheckData(_gridSel, _data_key)
 * 
 * // Kendo Notification 메시지
 * ClKendo.fnErrorNotification(_params)
 * 
 * // Kendo Row 클릭 이벤트
 * ClKendo.fnOnDataBoundClickEvent(_params)
 * 
 * // Kendo 해당 Row Checkbox 체크
 * ClKendo.fnOnClick(_params)
 * 
 */
	

/**
 * Class 선언
 */
if(parent.ClKendo != null){
	ClKendo = parent.ClKendo;
} else{
	ClKendo = {
	
			/**
			 * 기본 변수 선언
			 */
			json: {
					grid: {
						option: {
							selPos: -1, // 기본값으로 selector의 가장 마지막 객체를 선택
							height: 605,
							toolbar: ["excel"],
							excel: {
								fileName: "Export",//다운로드 파일명
								filterable: false,//헤더 정렬기능 추가여부 - Boolean |Object (default: true) 
								allPages: true//전체페이지 출력여부 - Boolean (default: false) 
							},
							dataBound: function(e){},
							// page 바꿀때 호출
							page: function(e) {
								ClLayout.fnGetSelector({selector: '#page'}).val(e.page); // 바뀐 페이지 저장
							},
							pageable: {
//								pageSize: 100,
								numeric: true,
								previousNext: true,
								buttonCount: 10,
								messages: {
									display: "All {2:#,##} items", //default: "{0} - {1} of {2} items"
									empty: 'All 0 items'
								},
							},
							sortable: false,//정렬 가능여부 - Boolean (default: true)
							allowCopy : true,//row 복사 가능여부 - Boolean (default: false) 
							resizable : true,//열 사이즈 조정 가능 여부 - Boolean (default:false)
							columnMenu: false,//헤더 메뉴 여부 - Boolean (default:false)
							filterable: false,//필터 메뉴 여부 - Boolean (default:false)
						   	selectable: false, // 선택 가능여부(row 또는 다중) - String (default: false) //row| cell| multiple, row | multiple, cell
							noRecords: {
						   		template:	'# if ("${serverLocale }".toUpperCase().indexOf("EN") > -1) { #' 
						   				  + '<div style="padding:20px 0px; font-size: 1.5em; width: 240px; margin: 0 auto;">No results were retrieved.</div> #' 
						   				  + '} else { #'
						   				  + '<div style="padding:20px 0px; font-size: 1.5em; width: 240px; margin: 0 auto;">조회된 결과가 없습니다.</div> #'
						   				  + '} #' 
										},
							dataSource: {
								serverPaging: false,
//								pageSize: 100,			
//								schema: {
//									data: function(response) {
//										if(response && response.data && response.data.list){
//											return response.data.list;
//										}else{
//											return [];
//										}
//									},
//									total: function(response) {
//										if(response && response.data && response.data.page && response.data.page.cnt) {
//											return response.data.page.cnt;
//										}
//										return Number.MAX_VALUE;
//									},
//								},
								transport: {
									read: {
										type: 'POST',
										dataType: 'json',
									},
									cache: false,
								},
								error: function(e) {
									console.error("Kendo Grid DataSource Error", e);
									ClAjax.fnAjaxErrHandle(e.xhr);
								},
							}
						},
					},
					datepicker: {
						option: {
							min: new Date(),
							max: null,
							format: "yyyy-MM-dd",
							dateInput: true,
							depth: "month",
							start: "month",
						},
					},
					timepicker: {
						option: {
							min: null,
							max: null,
							format: "HH:mm",
							dateInput: false,
						},
					},
					chart: {
						defOpt: {
							renderAs: "canvas",
							title: { text: "" },
							legend: {
								position: "bottom", // top, bottom, left, right
							},
							chartArea: {
								height: 480
							},
							categoryAxis: {
					            majorGridLines: {
					                visible: false
					            },
					            labels: {
					                rotation: "auto"
					            }
					        },
							tooltip: {
								visible: true,
								shared: true,
							},
						},
						line: {
							option: {
								yAxis: {
									visible: true
								},
								seriesDefaults: {
									type: "line",
								},
								valueAxis: {
									line: {
										visible: false
									},
									axisCrossingValue: -10
								},
							}
						},
						bar: {
							option: {
								seriesDefaults: {
								    area: {
								    	color: "green",
								    	opacity: 0.1
								    },
								    type: "column"
								},
							},
						},
						pie: {
							seriesDefaults: {
								labels: {
									visible: true,
									background: "transparent",
									template: "#= category #: \n #= value#%",
								},
							},
							series: [{
								type: 'pie',
								startAngle: 90,
							}],
						},
					},
					tab: {
						tabPosition: "top",
						animation: { open: { effects: "" } }
					},
					autoComplete: {
							option:{
								dataTextField: "search_result",
								dataValueField: "search_result",
								filter: "contains",
								delay: 500,
								minLength: 2,
								dataSource:{
									transport: {
							            read: {
							                dataType: "json",
							                url: "${rootPath}/helper/getAutoComplete.do",
							            },
									},
									serverFiltering: true,
									schema: {
						                data: function(response) {
						                   if(response && response.data && response.data.list){
						                      return response.data.list;
						                   }else{
						                      return [];
						                   }
						                }
						            },
								},
							}
					}
			},
			
			/**
			 * Kendo Grid 생성
			 * @Param _params : json형식
			 */
			fnCreateGrid: function(_params){
				
				if(!_params.selector){
					console.log('필수값을 넣어주세요.');
					return;
				}
				
				// 기본 옵션과 변경옵션 합치기
				var opt = $.extend(true, {}, ClKendo.json.grid.option, _params);
				
				// 넘긴 값이 없으면 transport부분은 제거
				if(typeof _params.dataSource == 'undefined' || typeof _params.dataSource.transport == 'undefined'){
					opt.dataSource.transport = null;
				}
				
				//그리드 생성
				var $g = ClLayout.fnGetSelector(opt);
				$g.kendoGrid(opt);
				
				var $chkAll = $g.find('#checkAll');
				if($chkAll.length > 0){
					// header의 check박스 클릭액션 이벤트 등록
					$chkAll.change(function(){
						$g.find("tbody input[type=checkbox]:enabled").prop("checked", this.checked);
					});
					
					// grid내부의 check박스가 전체다 체크되어 있는지 여부 체크하여, checkAll 체크하는 이벤트 등록
					var $chk = $g.find('input[type=checkbox]:not("#checkAll")');
					if($chk.length > 0){
						$chk.change(function(){
							if($chk.length == $g.find('input[type=checkbox]:not("#checkAll"):checked').length){
								$chkAll.prop("checked", true);
							}else{
								$chkAll.prop("checked", false);
							}
						});
						
						// 처음에 전체 체크여부 확인하여 chkall 체크
						if($chk.length == $g.find('input[type=checkbox]:not("#checkAll"):checked').length){
							$chkAll.prop("checked", true);
						}
					}
				}
				
				// EXCEL버튼에 excel 다운로드 바인딩
				if(typeof opt.excelExportBtnSelector == 'string' && $(opt.excelExportBtnSelector).length > 0){
					var exP = {selector: opt.excelExportBtnSelector, selPos: opt.selPos};
					ClLayout.fnGetSelector(exP).off("click").on("click", function(){
						var grid = $g.getKendoGrid();
						if(grid.getOptions().dataSource.serverPaging == true){
							fnExcelDownFromServer(opt.selector);
						}else{
							grid.saveAsExcel();
						}
					});
				}
			},
			
			/**
			 * Kendo Grid에 데이터 Set
			 * @param _params 		: 	selector(필수) 	dom 선택자
			 * 							data(필수) 		반드시 Json형식
			 * 							selPos(선택) 	기본값 -1(가장 마지막 selector)
			 */
			fnSetDataToKendoGrid: function(_params){
				
				if(_params.selPos == null) _params.selPos = -1;
				
				var $div = ClLayout.fnGetSelector(_params);
				
				if($div.length < 1) return false;
				
				var json = typeof _params.data == "string" ? JSON.parse(_params.data) : _params.data;
				var grid = $div.data("kendoGrid");
				
				grid.dataSource.data(json);
				
				// 이전에 보던 페이지가 있다면 해당페이지로 이동
				if($div.parent().find('#page').length > 0 && typeof $div.parent().find('#page').val() != 'undefined'){
					grid.dataSource.page(eval($div.parent().find('#page').val()));
				}
	
				var $chkAll = $div.find('#checkAll');
				if($chkAll.length > 0){
					$chkAll.prop('checked', false);
					
					// grid내부의 check박스가 전체다 체크되어 있는지 여부 체크하여, checkAll 체크 이벤트 등록
					var $chk = $div.find('input[type=checkbox]:not("#checkAll")');
					if($chk.length > 0){
						$chk.unbind('change').change(function(){
							if($chk.length == $div.find('input[type=checkbox]:not("#checkAll"):checked').length){
								$chkAll.prop("checked", true);
							}else{
								$chkAll.prop("checked", false);
							}
						});
						
						// 처음에 전체 체크여부 확인하여 chkall 체크
						if($chk.length == $div.find('input[type=checkbox]:not("#checkAll"):checked').length){
							$chkAll.prop("checked", true);
						}
					}
				}
			},
			
			/**
			 * Kendo Grid Refresh
			 * @param _params 		: 	selector(필수) 	dom 선택자
			 * 							page(선택) 		표시할 페이지(필수아님)
			 * 							selPos(선택) 	기본값 -1(가장 마지막 selector)
			 */
			fnGridRefresh: function(_params){
				
				if(_params.selPos == null) _params.selPos = -1;
				
				// 조회영역 제어 조건이 필요하면, fnSearchBeforeCheck 함수를 생성해서 정의한다.
				if(typeof fnSearchBeforeCheck == 'function'){
					var ret = fnSearchBeforeCheck();
					if(ret == false) return;
				}
				
				var grid = ClLayout.fnGetSelector(_params).getKendoGrid();
			
				// Page가 넘어오지않으면 현재페이지 그대로
				if(typeof _params.page != 'undefined') {
					grid.dataSource.page(_params.page);
				 }else{
					grid.dataSource.read();
				}
			},
			
			/**
			 * Excelfile Export시 호출
			 * @param _params 		: 	selector(필수) 	dom 선택자
			 * 							selPos(선택) 	기본값 -1(가장 마지막 selector)
			 */
			fnExcelDownFromServer: function(_params){
				
				if(_params.selPos == null) _params.selPos = -1;
				
				var grid = ClLayout.fnGetSelector(_params).data("kendoGrid"); 
				var titleList="";
				var columnList="";
				for(var idx = 0; idx < grid.columns.length; idx++){
					if(grid.columns[idx].hidden!=true && grid.columns[idx].title!=null && grid.columns[idx].field!=null){
						titleList+=grid.columns[idx].title+"|";
						columnList+=grid.columns[idx].field+"|";
					}
				}
					
				var f = document.createElement('form');
				var _data = grid.dataSource.transport.parameterMap({},{});
				_data.excelFileName = grid.options.excel.fileName.split('.')[0];
				_data.excelFileDown = "Y";
				_data.startRowNum 	= 1,
				_data.cntPerPage 	= grid.dataSource._total;
				_data.columnList 	= columnList;
				_data.titleList 	= titleList;
				
				for (var key in _data) {
					var value = _data[key];
					if(typeof value != "undefined"){ 
						var objs = document.createElement('input');
						objs.setAttribute('type', 'hidden');
						objs.setAttribute('name', key);
						objs.setAttribute('value', value);
						f.appendChild(objs);
					}
				}
				
				f.method = "POST";
				f.action = grid.dataSource.transport.options.read.url;
				f.target = "winExcelFrame";
				
				$('body')[0].appendChild(f);
				f.submit();	
				$('body')[0].removeChild(f);
			},
			
			/**
			 * kendo Grid td 합치기 - KendoGrid 옵션의 dataBound 안에서 쓴다
			 * ex) dataBound: function(e){
			 *  		fnMergeGridRows(e.sender, ["Division", "Category", "Product Family"] );
			 * 	   },
			 */
			fnMergeGridRows : function(sender, colTitles, colMergerCustomFn) {
				var cols = [];
				var $th = sender.thead.find("th");
				for(var i = 0; i< colTitles.length; i++) {
					$th.each(function(index,item){
						if($(this).text() == colTitles[i]) {
							cols.push($(this).index());
							return;
						}
					})
				}
	
				if(cols.length < 1) return;
			
				var colMergerFnExecutor = null;
				if(colMergerCustomFn != null && typeof colMergerCustomFn == "function") {
					colMergerFnExecutor = colMergerCustomFn;
				}
			
				var first_instance = [];
				sender.tbody.find("tr").each(function(index, item){
					var isChanged = false, mergedCnt = 0;
					var $tr = $(item);
					if(colMergerFnExecutor != null) colMergerFnExecutor($tr);
					
					for(var i = 0; i< cols.length; i++) {
						var $td = $tr.find("td:eq("+(cols[i]-mergedCnt)+")")
						
						
						if(first_instance.length <= i){
							first_instance.push({td:$td, alt:0});
							continue;
						}
						
						if(isChanged || $td.text() != first_instance[i].td.text()) {
							first_instance[i].td = $td;
							first_instance[i].alt++;
							isChanged = true;
						}else {
							var rowspan = 2;
							if(typeof first_instance[i].td.attr('rowspan') !== "undefined"){
								rowspan = +(first_instance[i].td.attr('rowspan')) + 1;
							}
							first_instance[i].td.attr('rowspan', rowspan);
							first_instance[i].td.css("font-weight","bold")
							if(first_instance[i].alt % 2 == 1){
								first_instance[i].td.addClass("k-alt")
							}else{
								first_instance[i].td.css("background-color","white")
							}
							if($td.is("td:first-child")){
								//console.log($tr.find("td:eq("+(cols[i]-mergedCnt+1)+")"))
								$tr.find("td:eq("+(cols[i]-mergedCnt+1)+")").css("border-left", "1px solid #d5d5d5");
							}
							$td.remove();
							mergedCnt++;
						}
					}
				})
			},
			
			/**
			 * Kendo DatePicker 생성
			 * @Param _params		: 	selector(필수) 	dom 선택자
			 * 							selPos(선택) 	기본값 -1(가장 마지막 selector)
			 */
			fnCreateDatePicker: function(_params){
				
				if(_params.selector == null){
					console.log('필수값을 넣어주세요.');
					return;
				}
	
				var opt = $.extend(true, {}, ClKendo.json.datepicker.option, _params);
				var _defaultValue = null;
<!-- 				if(opt.value) { -->
<!-- 					_defaultValue = opt.value; -->
<!-- 					delete opt.value; -->
<!-- 				} -->
				
				if(opt.min == null) opt.min = new Date(2000,0,1);
				if(opt.max == null) opt.max = new Date(2100,11,31);
				
				ClLayout.fnGetSelector(opt).kendoDatePicker(opt);
				var dp = ClLayout.fnGetSelector(opt).data("kendoDatePicker");
				if(_defaultValue != null) return this.fnSetDatePickerVal(opt.selector, _defaultValue);
				return dp;
			},

			/**
			 * Kendo DatePicker에 날짜 설정
			 * @Param _selector
			 *        _value : Date Object or 문자열날짜(yyyy-MM-dd 형식)
			 */
			fnSetDatePickerVal: function(_selector, _date) {
				var dp = ClLayout.fnGetSelector(_selector).data("kendoDatePicker");
				
				if(dp == null ) return;
				var type = typeof _date;
				
				if(type == "object") {
					dp.value(_date);
				} else if(type == "string") {
					dp.value(ClDate.fnParseDate(_date));
				}
				dp.trigger("change");
				return dp;
			},
			
			/**
			 * Kendo DatePicker의 값을 yyyyMMdd 형식으로 반환
			 * @Param _selector : selector
			 *        _format : 반환할 포맷(기본값 : yyyyMMdd)
			 */
			fnGetDatePickerFormatVal: function(_selector, _format) {
				var dp = ClLayout.fnGetSelector(_selector).data("kendoDatePicker");
				if(dp == null ) return "";
				var d = dp.value();
				if(typeof _format == "undefined") _format = "yyyyMMdd";
				return ClDate.fnDateFormat(_format, d);
			},
			
			/**
			 * Kendo TimePicker 생성
			 * @Param _params		: 	selector(필수) 	dom 선택자
			 * 							selPos(선택) 	기본값 -1(가장 마지막 selector)
			 */
			fnCreateTimePicker: function(_params){
				
				if(_params.selector == null){
					console.log('필수값을 넣어주세요.');
					return;
				}
	
				var opt = $.extend(true, {}, ClKendo.json.timepicker.option, _params);
				var _defaultValue = null;
				/*
				if(opt.value) {
					_defaultValue = opt.value;
					delete opt.value;
				}
				*/
				
				if(opt.min == null) opt.min = new Date(2000,0,1);
				if(opt.max == null) opt.max = new Date(2100,11,31);
				
				
				ClLayout.fnGetSelector(opt).kendoTimePicker(opt);
				var dp = ClLayout.fnGetSelector(opt).data("kendoTimePicker");
				if(_defaultValue != null) return this.fnSetDatePickerVal(opt.selector, _defaultValue);
				return dp;
			},
			
			/**
			 * Kendo TimePicker에 날짜 설정
			 * @Param _selector
			 *        _value : Date Object or 문자열날짜(hh:mm 형식)
			 */
			fnSetTimePickerVal: function(_selector, _date) {
				var dp = ClLayout.fnGetSelector(_selector).data("kendoTimePicker");
				
				if(dp == null ) return;
				dp.value(_date);
				dp.trigger("change");
				return dp;
			},

			/**
			 * Kendo 차트 그리기
			 * @Param _params : json형식(selector 필수, type 필수-line/bar/pie) 
			 */
			fnCreateChart: function(_params){
				
				if(_params.selector == null){
					console.log('필수값을 넣어주세요.');
					return;
				}
	
				var opt = $.extend(true, {}, ClKendo.json.chart.defOpt, ClKendo.json.chart[_params.type].option, _params);
				
				ClLayout.fnGetSelector(opt).kendoChart(opt);
			},
			
			/**
			 * Kendo Tab 생성
			 * @Param _params : json형식(selector 필수) 
			 */
			fnCreateTab: function(_params){
				
				var opt = $.extend(true, {}, ClKendo.json.tab, _params);

				var kts = ClLayout.fnGetSelector(opt).kendoTabStrip(opt);

				// Tab 내부 Content 높이 조절(fit하게)
				var $d = kts.children(".k-content");
				var $d_v = $d.filter(":visible");
				var h = 0;
				if(_params.tabPosition == 'left'){
					h = kts.innerHeight();
				}else{
					h = kts.innerHeight()
						- kts.children(".k-tabstrip-items").outerHeight()
						- parseFloat($d_v.css("padding-top"))
						- parseFloat($d_v.css("padding-bottom"))
						- parseFloat($d_v.css("border-top-width"))
						- parseFloat($d_v.css("border-bottom-width"))
						- parseFloat($d_v.css("margin-bottom"))
					;
				}
				
				$d.height(h);
			},
			
			/**
			 * Kendo Checkbox 데이터 가져오기
			 * @Param _gridSel: 	Grid Selector
			 * 		  _data_key: 	가져올 데이터의 Key값
			 * @Return str:			선택된 체크박스의 값들(ex: a,b,c,d)
			 */
			fnGetGridCheckData: function(_gridSel, _data_key){
				
				var grid = ClLayout.fnGetSelector({selector: _gridSel}).data("kendoGrid");
				var checked = grid.tbody.find("input[type=checkbox]:checked");
				
				var str = "";
				for(var i = 0; i < checked.length; i++){
					
					var d = grid.dataItem($(checked[i]).closest("tr"));
					if( "" != str ) str += ",";
					str += d[_data_key];
				}
				
				return str;
			},
			
			/**
			 * Kendo Notification 메시지 출력
			 * @Param _params json 형태
			 * selector	: 원하는 위치(기본 값 : #popupNoti, mng_frame에 생성)
			 * msg		: notification 메시지
			 * level	: ["info" , "error"]
			 * opt 예제:
			 {
					width: 100,
					height: 40,
					position: {
						top: 450,
						left: 910,
						bottom: 500,
						right: 910,
					}
			 }
			 */
			fnErrorNotification: function(_params){
				if(_params.selector == null) _params.selector = "#popupNoti";
				var _noti = ClLayout.fnGetSelector({selector: _params.selector}).kendoNotification(_params.opt).data("kendoNotification");

				_noti.show(_params.msg, _params.level);
			},
			/**
			 * Kendo Checkbox 데이터 가져오기
			 * @Param _gridSel: 	Grid Selector
			 * 		  _data_key: 	가져올 데이터의 Key값
			 * @Return str:			선택된 체크박스의 값들(ex: a,b,c,d)
			 */
			fnCreateAutoComplete: function(_params){
				if(!_params.selector){
					console.log('Please enter the required value.');
					return;
				}

				// 기본 옵션과 변경옵션 합치기
				var opt = $.extend(true, {}, ClKendo.json.autoComplete.option, _params);
				
				// 넘긴 값이 없으면 transport부분은 제거
<!-- 				if(typeof _params.dataSource == 'undefined' || typeof _params.dataSource.transport == 'undefined'){ -->
<!-- 					opt.dataSource.transport = null; -->
<!-- 				} -->
				
				//그리드 생성
				var $g = ClLayout.fnGetSelector(opt);
				$g.kendoAutoComplete(opt);
			},
			/**
             * Kendo Row 클릭 이벤트
             * @Param _gridSel:     Grid sender
             */
			fnOnDataBoundClickEvent: function(_params){
			    var grid = _params.sender;
			    var rows = grid.tbody.find("[role='row']");
			    rows.unbind("click");
			    rows.on("click", this.fnOnClick)
			
			},
			/**
             * Kendo 해당 Row Checkbox 체크 
             * @Param _gridSel:     Grid target
             */
			fnOnClick: function(_params){
			    if ($(_params.target).hasClass("k-checkbox-label")) {
			        return;
			    }
			    var row = $(_params.target).closest("tr");
			    var checkbox = $(row).find('[type=checkbox]');
			    checkbox.click();
			},
	}
}	
