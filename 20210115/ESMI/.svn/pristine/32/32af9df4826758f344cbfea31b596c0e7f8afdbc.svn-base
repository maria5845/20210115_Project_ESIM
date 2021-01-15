/**
 * ClEcharts 함수 목록
 */
/**
 * // echarts 생성
 * ClEcharts.fnCreateEcharts(_params) 
 * 
 * 
 */
	

/**
 * Class 선언
 */
if(parent.ClEcharts != null){
	ClEcharts = parent.ClEcharts;
} else{
	ClEcharts = {
	
			/**
			 * 기본 변수 선언
			 */
			json: {
				line: {
					defOpt: {
						animation:false,
						textStyle: {
							fontFamily: 'LGSmHaR',
						},
						grid: {top:60,right:120,bottom:60,left:70},
						title:{
							text: '',
							left: 'center',
						},
						tooltip: {
							trigger: 'axis',
							axisPointer: {
					            type: 'cross',
					            label: {
					                backgroundColor: '#6a7985'
					            }
					        }
						},
						legend: {
							type : 'scroll',
							itemGap : 20,
							itemHeight: 12,
							textStyle:{
								fontSize: 12
							}
						},
						dataZoom: [
							{
								type: 'slider',
								show: true,
								showDetail: false,
								xAxisIndex: 0,
							},
							{
								type: 'slider',
								show: true,
								showDetail: false,
								yAxisIndex: 0,
								right: 65,
							},
							{
								type: 'inside',
							}
						],
						xAxis: {
							type: 'category',
							name: '',
							nameLocation: 'end',
							axisLabel: {
								showMinLabel: false,
								showMaxLabel: false,
							}
						},
						yAxis: {
							type: 'value',
							name: '',
							nameLocation: 'end',
							position: 'bottom',
							axisLabel: {
								showMinLabel: false,
								showMaxLabel: false,
							},
						},
					},
					seriesOpt: {
						type: 'line',
					},
				},
				boxplot: {
					defOpt: {
						animation:false,
						textStyle: {
							fontFamily: 'LGSmHaR',
						},
						grid: {top:40,right:70,left:80},
						title:{
							text: '',
							left: 'center',
						},
						tooltip: {
							show:true,
							trigger: 'item',
						},
						legend: {
							show:false,
						},
						dataZoom: [
							{
								type: 'slider',
								show: true,
								showDetail: false,
								xAxisIndex: 0,
							},
							{
								type: 'slider',
								show: true,
								showDetail: false,
								yAxisIndex: 0,
							},
							{
								type: 'inside',
							}
						],
						xAxis: {
							type: 'category',
							name: '',
							nameLocation: 'end',
							axisLabel: {
								showMinLabel: false,
								showMaxLabel: false,
							},
						},
						yAxis: {
							type: 'value',
							name: '',
							nameLocation: 'end',
							position: 'bottom',
							min: 'dataMin',
							max: 'dataMax',
							axisLabel: {
								showMinLabel: false,
								showMaxLabel: false,
							},
						},
					},
					seriesOpt: {
						type: 'boxplot',
						markLine : {
							symbolSize: 0,
							lineStyle: {
								normal: {
									type: 'solid'
								},
							},
							data : [
								{
									lineStyle: {
										color: 'yellow',
									},
								}, {
									lineStyle: {
										color: 'red',
									},
								},
							],
						}
					},
				},
				scatter: {
					seriesOpt: {
						type: 'scatter',
					},
				},
				bar: {
					defOpt: {
						animation:false,
						textStyle: {
							fontFamily: 'LGSmHaR',
						},
						legend: {
							type : 'scroll',
							width : 500,
							height : 100,
						},
						title:{
							text: '',
							left: 'center',
						},
					    grid: {top:70,right:70,bottom:100,left:100},
						dataZoom: [
							{
								type: 'slider',
								show: true,
								showDetail: false,
								xAxisIndex: 0,
							},
							{
								type: 'slider',
								show: true,
								showDetail: false,
								yAxisIndex: 0,
							},
							{
								type: 'inside',
							}
						],
						xAxis: {
							type: 'category',
							name: '',
							nameLocation: 'end',
						},
						yAxis: {
							type: 'value',
							name: '',
							nameLocation: 'end',
							position: 'bottom',
							boundaryGap: [0.01, 0.01],
						},
					},
					seriesOpt: {
						type: 'bar',
						markLine : {
			                data : [
			                    {type : 'average', name: 'average'}
			                ]
			            }
					},
				},
				heatmap: {
					defOpt: {
						animation:false,
						textStyle: {
							fontFamily: 'LGSmHaR',
						},
						grid: {
							top: 70 ,
							bottom: 100 ,
							left: '15%' 
						},
						title:{
							text: '',
							left: 'center',
						},
						tooltip: {
					        position: 'top'
					    },
					    label: {
				            show: true
				        },
						visualMap: {
					        min: 0,
					        max: 1000,
					        type: 'piecewise',
					        orient: 'horizontal',
					        left: 'center',
					    },
					    xAxis: {
					        type: 'category',
					    },
					    yAxis: {
					        type: 'category',
					    },
					},
					seriesOpt: [{
				        type: 'heatmap',
				        itemStyle: {
				            emphasis: {
				                shadowBlur: 10,
				                shadowColor: 'rgba(0, 0, 0, 0.5)'
				            }
				        }
				    }]
				},
				pie: {
					defOpt: {
						tooltip : {
					        trigger: 'item',
					        formatter: "{b} : {c} ({d}%)"
					    },
					    legend: {
					        show : true
					    },
					    grid: { top:70,right:70,bottom:100,left:100 },
					    seriesOpt : [
					        {
					            type: 'pie',
					            radius : '55%',
					            center: ['50%', '50%'],
					            itemStyle: {
					            	color: ['#d9ff66','#ffff66','#ffd966','#ff8c66','#ff6666'],
					                emphasis: {
					                    shadowBlur: 10,
					                    shadowOffsetX: 0,
					                    shadowColor: 'rgba(0, 0, 0, 0.5)'
					                }
					            }
					        }
					    ]
					}
				},
				gauge: {
					defOpt: {
						axisLine: {            
			                lineStyle: {       
			                    width: 10
			                }
			            },
			            axisTick: {            
			                length: 15,        
			                lineStyle: {       
			                    color: 'auto'
			                }
			            },
						tooltip : {
					        formatter: "{a} <br/>{b} : {c}%"
					    },
					    grid: { top:20,right:20,bottom:20,left:20 },
					    seriesOpt : [
					        {
					        	title: {
									show: false
								},
					            type: 'gauge',
					            radius : '75%',
					            detail: {formatter:'{value}%'},
					        }
					    ]
					}
				}
			},
			
			/**
			 * echarts 생성
			 * @param _params 		: 	selector(필수) 			dom 선택자
			 * 							type(선택)				차트타입(기본값: line)
			 * 							opt_overwrite(선택) 	존재한다면, 기본 차트옵션 덮어쓰기(반드시 Json형식)
			 * 
			 * 대시보드에 생성된 차트의 옵션을 변경시 삭제 후 확인 필요
			 */
			fnCreateEcharts: function(_params){
				var dom = ClLayout.fnGetSelector(_params).get(0);
				
				// 이미 echarts가 생성되어 있다면 초기화
				var c = echarts.getInstanceByDom(dom);
				if(c != null) c.dispose();
				
				// 차트 생성
//				c = echarts.init(dom);
				var currTheme = $.cookie('PIE_theme');
				
				if(currTheme == 'black' || currTheme == null){
					c = echarts.init(dom, 'dark');
				}else{
					c = echarts.init(dom);
				}
				
				c.setOption($.extend(true, {}, ClEcharts.json[_params.type == null ? 'line' : _params.type].defOpt, _params.opt_overwrite));
				
				return c;
			},
			
			/**
			 * echarts 에 데이터가 없을때 메세지 표출
			 * @Params chartId : echarts.init(document.getElementById('main')) 사용한 차트의 객체
			 *		   infoStr : String 형식, 화면에 보여줄 메시지		
			 */
			fnNoData: function (_chartId, _Str) {
				
//				console.log(_chartId)
				var c = _chartId;
				var _Str = typeof infoStr !== 'undefined' ?  infoStr : 'NO RECORD FOUND';
				var msgOption = {
					title: {
						show: true,
						textStyle:{
						  color:'grey',
						  fontSize:24
						},
						text: _Str,
						left: 'center',
						top: 'center'
					},
					xAxis: {
		                show: false
		            },
		            yAxis: {
		                show: false
		            },
				};
				if(c != null){
					c.clear();
					c.hideLoading();
					c.setOption(msgOption, false);
				}
			}
	}
}	
