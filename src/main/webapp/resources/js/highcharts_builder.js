/* UTF-8 */


    //时间格式的转换
	function timetofloat(pharse){
	  var oldTime = (new Date(pharse)).getTime(); //得到毫秒数  
      var newTime = new Date(oldTime); //就得到普通的时间了
      var hour=newTime.getHours();
      var minute = (newTime.getMinutes())/60;   
      var second = (newTime.getSeconds())/3600;
      var time = hour+minute+second;
      return(time.toFixed(2));
	}
	
	function float_time(pharse){
		if(pharse == null){ return "";}
		else{
			var h=Math.floor(pharse);
			var m=Math.floor((pharse-h)*60);
			var str = m.toString();
			if(str.length<2){
				str ="0" + str;
				}
			return (h+":"+str);
		}
	}	
	
	//初始化单位
	var unit = {
	   '文件大小':'KB',
	   '文件创立时间':'ms',
	   '文件去标签大小':'KB',
	   '建索引时间':'ms',
	   '比例':"%",
	   };
	
	//初始化X轴名称
	
	
	//初始化tooltip
	function tooltipFomatter() {
		var s = '文件'+this.x+'</b>';
		$.each(this.points, function(i, point) {
			s += '<br/>' + point.series.name + ' : ' + point.y.toFixed(2)+' '+unit[point.series.name];
		});
		return s;
	};

	//重绘
	function clearPlot() {  
        //console.log("clear plot data!!!");  
        var series=chart.series;                   
        chart.redraw();  
    };  

var chart;

//饼图
function buildPiecharts(render,charts_data){
	  var total = 0;
	  for(var i =0 ; i<charts_data.length;i++){
		  total += charts_data[i][1];
	  }
	  var options ={
            chart: {
            	renderTo: render,
                plotBackgroundColor: null,
                plotBorderWidth: null,
                plotShadow: false
            },
            title: {
                text: '文件占比分析'
            },
            tooltip: {
            	formatter : function() {
					return '<b>' + this.point.name + '</b><br/>' + '占比：'
							+ this.percentage.toFixed(2) + "%<br/>" + '文件个数：'
							+ this.point.y;

				},
				percentageDecimals : 1
            },
            colors : ["#5D8CC0","#C25F5B","#8DC153","#967ADC","#3AACD9","#36BA99","#F6BA41","#EA583E","#DB4352","#3AACD9","#D86FAC"],
            legend : {
			    enable:true,
				layout: 'horizontal',
				align: 'center',
				verticalAlign : 'bottom',

				itemWidth:150,
				borderWidth:1,
				//rtl: true,
				//floating: true,
		        labelFormatter : function() {
		            percentage = (this.y/total*100).toFixed(2);
					return this.name+'      '+percentage+'%';
				},
				itemStyle : {
							color : "#323232",
							//fontSize:'1em'
						},
				itemHoverStyle:{
				color : "#000",
				}
			},
            plotOptions: {
                pie: {
                	point:{
				        events:{
				             legendItemClick:function(event) {return false; }
				        }
				       },
			        center : ['50%','50%'],
					cursor : 'pointer',
					size : '90%',
					innerSize:'30%',
                    dataLabels: {
                        enabled: false
                    },
                    showInLegend: true
                }
            },
            series: [{
                type: 'pie',
                name: '文件比例',
                data: charts_data,
            }]
        };

        var piechart = new Highcharts.Chart(options);
	  
	}

//x,y轴对调图标，一般用于启停时间图
function buildcharts_inverte(x_categories,charts_data){
	
	
	   
	   var options ={
			   chart: {
				    renderTo: 'stop_run',
			        type: 'columnrange',
			        inverted: true,
			        backgroundColor: '#000',
		            style: {
		                color: '#666'
		            },
			    },
			    
			    title: {
			        text: '24小时主机启停时间图',
			        margin: 0,
		            align: 'left',
		            x:60,
				    style: {
				            fontSize:'120%',
			                align: 'left',
			                color: '#999',
			                fontWeight: 'bold'
			                
		              }
			    },
			    credits: {
		            enabled: false
		        },
		        
			    xAxis: {
			        categories: x_categories,
		            tickWidth: 2,
		            tickInterval:1,
		            lineColor: '#8b8b8b',
		            tickmarkPlacement: 'on',
		            tickColor: '#8b8b8b',
		            labels: {
	                      
	                      
	                      style: {
	                          color: '#999',//颜色
	                          fontWeight: 'bold',
	                          //fontSize:'14px'  //字体
	                      }
	                  },
			    },

			    yAxis: {
			    	  lineColor: '#8b8b8b',
			          lineWidth: 1,
			          tickmarkPlacement: 'on',
			          tickColor: '#8b8b8b',
			          tickWidth: 2,
			          tickLength: 8,
			          gridLineWidth:0,
			          max:24,
			          min: 0,
			          labels: {
			                format: '{value}时',
			            },
		              alternateGridColor: 'rgba(255,255,255,0.1)',
		              title: {
			             text: ''
			            }
			    },
			    
			    
			    plotOptions: {
			    	series: {
			    		colorByPoint: true,
			    		borderWidth:0
		            },
		            
			        columnrange: {
			        	grouping:false,
			        	dataLabels: {
			        		enabled: true,
			        		color:'#ccc',
			        		borderColor: '#000',
			        		formatter: function () {
			        			return float_time(this.y);
			        		}
			        	}
			        	
			        }
			        
			    },
			    
			    legend: {
			        enabled: false
			    },
			    
			    tooltip: {
			    	valueSuffix: 'h',
		        	valueDecimals:2,
		        	shared: true
		        },
		        
			    series: []
			           
			        
			
			};
	   
	    options.series = new Array();
	    var n = charts_data.length;
	    for(i=0;i<n;i++)
	      {
	         options.series[i] = new Object();
	         options.series[i].name = charts_data[i].name;
	         options.series[i].data = charts_data[i].data;
	       }  
        chart = new Highcharts.Chart(options);
	    
	}


//单Y轴图标，几乎支持所有表格类型，数据通过char_data传入
function buildcharts(chartname,charts_data){
	  var options ={
	        chart: {
	            renderTo: chartname,
	            backgroundColor: '#f8f8f8',
	            style: {
	                color: '#666'
	            },
	        },
	        title: {
		        text: charts_data[0].title,
		        margin: 0,
              align: 'left',
              x:60,
		        style: {
		            fontSize:'120%',
	                align: 'left',
	                color: '#999',
	                fontWeight: 'bold'
	                
              }
		    },
	        credits: {
	            enabled: false
	        },
			legend: {
				align: 'right',
	            verticalAlign: 'top',
	            floating: false,
	            x:-10,
	            borderWidth: 0,
	            itemStyle: {
	                color: '#666',
	                fontWeight: 'bold'
	            },
	            itemHoverStyle: {
	                color: '#333'
	            }
	        },
	        xAxis: {
	            tickPosition: 'outside',
	            tickWidth: 2,
	            tickInterval:1,
	            lineColor: '#8b8b8b',
	            labels: {
                      y: 20, //x轴刻度往下移动20px
                      style: {
                          color: '#999',//颜色
                          fontWeight: 'bold',
                          //fontSize:'14px'  //字体
                      }
                  },
	        },
	        
	        tooltip: {
	        	formatter: tooltipFomatter,
	        	valueDecimals:2,
	            shared: true
	        },
	        
	        plotOptions: {
		    	series: {
		    		borderWidth:1,
		    		borderColor: '#000',
	            },
	        },
	        
	        yAxis: {
	          lineColor: '#8b8b8b',
		      lineWidth: 1,
	          gridLineWidth:0,
	          tickmarkPlacement: 'on',
	          tickColor: '#8b8b8b',
	          tickWidth: 2,
	          tickLength: 8,
              alternateGridColor: 'rgba(255,255,255,0.1)',
              title: {
	             text: ''
	            },
	        },
	        
			series:[]
	    };
	    
	  options.series = new Array();
      var n = charts_data.length;
      for(i=0;i<n;i++)
      {
         options.series[i] = new Object();
         options.series[i].type = charts_data[i].type;
         options.series[i].name = charts_data[i].name;
         options.series[i].data = charts_data[i].data;
       }
     chart = new Highcharts.Chart(options);
	  
	}

//多Y轴图表
function builddoubleYcharts(chartname,charts_data){
	  var options ={
	        chart: {
	            renderTo: chartname,
	            backgroundColor: 'transparent',
	        },
	        colors: ['#058DC7', '#EA583E', '#6AF9C4','#DDDF00', '#50B432','#ED561B', '#24CBE5', '#64E572', '#FF9655'],
	        title: {
		        text: charts_data[0].title,
		        margin: 15,
	            align: 'left',
	            x:60,
			    style: {
		            fontSize:'18px',
	                color: '#333',
	                fontWeight: 'bold'
	              }
		    },
	        credits: {
	            enabled: false
	        },
	        tooltip: {
	        	formatter: tooltipFomatter,
	        	valueDecimals:2,
	            shared: true
	        },
			legend: {
				align: 'center',
	            verticalAlign: 'bottom',
	            floating: false,
	            borderWidth: 0,
	            itemStyle: {
	                color: '#666',
	                fontWeight: 'bold'
	            },
	            itemHoverStyle: {
	                color: '#333'
	            }
	        },
	        xAxis: {
	            tickPosition: 'outside',
	            categories: charts_data[0].categories,
	            tickWidth: 2,
	            tickInterval:1,
	            lineColor: '#666',
	            labels: {
                      y: 20, //x轴刻度往下移动20px
                      style: {
                          color: '#333',//颜色
                          fontSize: "5px",
                          fontWeight: 'bold',
                         
                      }
                  },
	        },
	        
	        plotOptions: {
	        	line:{
	        		events:{ legendItemClick:function(event) {return false; } }
	        		},
	        	areaspline:{
	        		events:{ legendItemClick:function(event) {return false; } }
	        		}
	        },
	        
	        yAxis: [{
	          gridLineWidth:0,
	          alternateGridColor: '#F8F8F8',
	          lineColor: '#8b8b8b',
		      lineWidth: 1,
		      tickmarkPlacement: 'on',
	          tickColor: '#8b8b8b',
	          tickWidth: 2,
	          tickLength: 8,
              title: {
	             text: '大小'
	            }
	            
	        },
	        {
	           gridLineWidth:0,
	           lineColor: '#8b8b8b',
			   lineWidth: 1, 
			   tickmarkPlacement: 'on',
	           tickColor: '#8b8b8b',
	           tickWidth: 2,
	           tickLength: 8,
	           opposite: true,
	           min: 0,
	           title: {
		             text: '时间'
		            }
		            
		     }],
	        
			series:[]
	    };
	    
	    options.series = new Array();
      var n = charts_data.length;
      for(i=0;i<n;i++)
      {
         options.series[i] = new Object();
         options.series[i].type = charts_data[i].type;
         options.series[i].name = charts_data[i].name;
         options.series[i].data = charts_data[i].data;
         options.series[i].yAxis = charts_data[i].yAxis;
       }
     chart = new Highcharts.Chart(options);
	  
	}




