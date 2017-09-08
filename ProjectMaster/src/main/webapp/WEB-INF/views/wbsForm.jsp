<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
<!DOCTYPE html>
<html>
<head>
	
	<!-- start: Meta -->
	<meta charset="utf-8">
	<title>WBS</title>
	<meta name="description" content="Bootstrap Metro Dashboard">
	<meta name="author" content="Dennis Ji">
	<meta name="keyword" content="Metro, Metro UI, Dashboard, Bootstrap, Admin, Template, Theme, Responsive, Fluid, Retina">
	<!-- end: Meta -->
	
	<!-- start: CSS -->
	<link id="bootstrap-style" href="/planbe/resources/bootstrap/css/bootstrap.min.css" rel="stylesheet">
	<link href="/planbe/resources/bootstrap/css/bootstrap-responsive.min.css" rel="stylesheet">
	<link id="base-style" href="/planbe/resources/bootstrap/css/style.css" rel="stylesheet">
	<link id="base-style-responsive" href="/planbe/resources/bootstrap/css/style-responsive.css" rel="stylesheet">
	<link href='http://fonts.googleapis.com/css?family=Open+Sans:300italic,400italic,600italic,700italic,800italic,400,300,600,700,800&subset=latin,cyrillic-ext,latin-ext' rel='stylesheet' type='text/css'>
	<!-- end: CSS -->
	

	<!-- The HTML5 shim, for IE6-8 support of HTML5 elements -->
	<!--[if lt IE 9]>
	  	<script src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script>
		<link id="ie-style" href="/planbe/resources/bootstrap/css/ie.css" rel="stylesheet">
	<![endif]-->
	
	<!--[if IE 9]>
		<link id="ie9style" href="/planbe/resources/bootstrap/css/ie9.css" rel="stylesheet">
	<![endif]-->
		
	<!-- start: Favicon -->
	<link rel="shortcut icon" href="/planbe/resources/bootstrap/img/favicon.ico">
	<!-- end: Favicon -->
		
<script src="/planbe/resources/js/jquery-3.2.1.min.js"></script>	
<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>		
</head>

<script>

/* WBS 트리 생성 */

google.charts.load('current', {packages:['wordtree']});
google.charts.setOnLoadCallback(drawSimpleNodeChart);

 var wordtree; /// 
 var nodeListData;
 var taskList;
 
function drawSimpleNodeChart(p_name, t_list) {
    
	taskList = t_list; 
	
	nodeListData = new google.visualization.arrayToDataTable([
    ['id', 'childLabel', 'parent', 'size', { role: 'style' }],

/* [1] Project 이름 : 최상위 parent 노드 */    
    
    [0, p_name, -1, 1, '#119455']
    
    ]);
	
/* [2] Task 이름 : 1단계 child 노드  */
	

    $(t_list).each(function(index, item) {  
    	nodeListData.addRow([index+1, item.taskName, 0, 1, '#3c43a7']);
    });// for each 


/* [3] Task 키워드 : 2단계 child 노드 */    

	var x = t_list.length; // 10
    var keyword = ['Content', 'Priority', 'Status', 'Start Date', 'Due Date', 'Total Time', 'Done Time'];
	var y = keyword.length; // 7
    /* 3단계 child 노드의 parent id를 담을 배열 선언 */
	var xx = [];
    /* 3단계 child 노드의 id 선언 및 초기화 */
    var j = x+(x*y); // 80 
     
    var init = x;
    
    $(t_list).each(function(index, item) {  
          var z = 0;
          for(var i = init+1; i < init+y+1; i++){
	   		     nodeListData.addRow([i, keyword[z], index+1, 1, '#b082f9']);
	   		     xx.push(i);
	             z += 1;
	      }
	   	  init += y;
     });// for each
          
	// alert(JSON.stringify(xx));
     
	
/* [4] Task 키워드의 각 컨텐츠 : 3단계 child 노드 */         

    /* 3단계 child 노드의 value를 담을 배열 선언 */
    var array = [];
    var due = [];

    $(t_list).each(function(index, item) {  
         array.push(item.taskContent);
         array.push(item.taskPriority);
         array.push(item.taskStatus);
         array.push(item.startDate);
         array.push(item.dueDate);
         due.push(item.dueDate.substr(0, 10));
         array.push(item.totalTime.toString());
         array.push(item.doneTime.toString());
         
    });// for each
    
    
/* sysdate : 보류 */    
   
    var today = new Date();
    var dd = today.getDate();
    var mm = today.getMonth()+1; //January is 0!
    var yyyy = today.getFullYear();

    if(dd<10) {
        dd = '0'+dd
    } 

    if(mm<10) {
        mm = '0'+mm
    } 

    today = yyyy + '-' + mm + '-' + dd;
    
    
  	for(var i = 0, q = j+1; i < array.length; i++, q++){
  		 nodeListData.addRow([q, array[i], xx[i], 1, '#a4b83c']);
	  	   /* 우선순위가 HIGH인 노드의 color는 red로 변경한다 */
  		   if(nodeListData.getValue(q, 1) == 'HIGH'){
	  	     	nodeListData.setValue(q, 4, 'red');
	  	   }
  	}
  	
         
    var options = {
	    colors: ['black', 'black', 'black'],
	    wordtree: {
	      format: 'explicit',
	      type: 'suffix'
	    }
    };
    
  
  wordtree = new google.visualization.WordTree(document.getElementById('wordtree_explicit'));
  wordtree.draw(nodeListData, options);  // draw 
  
  // google.visualization.events.addListener(wordtree, 'ready', onReady);  // ready 
   
/*   function onReady() {
	    google.visualization.events.addListener(wordtree.getDataTable(), 'onmouseover', usefulHandler);
   }
*/
/*    function usefulHandler() {
	    alert("Mouseover event!");
   }
*/
   
   google.visualization.events.addListener(wordtree, 'select', getWbsInfo); // addListener
   
} //drawSimpleNodeChart
 
/* 로직 개선중 */ 
function getWbsInfo() {
    var selectedNode = wordtree.getSelection();
    var item = selectedNode.word;
    var t_no = "";
        alert('The word selected was: ' + item);
        for(var i=0; i<taskList.length; i++){
            if(taskList[i].taskName == item){
            	 t_no = taskList[i].taskNo;
            }	
        }
     alert(t_no);   
    // getTaskInfo(item);
    getTaskInfo(t_no);
}
    	
/* TaskInfo 가져오기 */
function getTaskInfo(t_no){
	// alert(item);
	$.ajax({
  		url: "/planbe/wbs/getTaskInfo",
  		type: "post",
  		data: {"TaskNo": t_no, "projectNo" : $("#projectNo").val()},
  		datatype: "json",
  		success: function(result) {
            alert("success다 !!!");	
            $(".T_INFO").empty();
            $(".T_INFO").append("<tr><td>" + result.taskName + "</td><td>" + result.taskContent + "</td><td>" + result.taskPriority + "</td></tr>");
           
		}, // succes
    });
}       
	
  
  
/* TEST */  
 // alert(nodeListData.getColumnLabel(0)); // id 
 // alert(nodeListData.getColumnProperties(0));   // [object, Object]
 // alert(nodeListData.getProperties(0, 0));      // [object, Object] 
 // alert(nodeListData.getRowProperties(0));      //  
 // alert(nodeListData.getValue(0, 0));           // 0
 // alert(nodeListData.getNumberOfColumns());     // 5 
  


/* WBS 데이터 불러오기 */	
	
	function sendNo(){
		$.ajax({
		  		url: "/planbe/wbs/getWbs",
		  		type: "post",
		  		data: {"projectNo" : $("#projectNo").val()},
		  		datatype: "json",
		  		success: function(result) {
                    alert("success에 들어옴");	
                    
                    var p_name = result.projectName;
                    var t_list = result.taskList; 	
		  			
                    drawSimpleNodeChart(p_name, t_list);
				}, // succes
		});
	}

/* WBS 수정 : taskList 페이지로 이동 */	
	function updateWbs(){
		location.href="/planbe/task/taskForm?projectNo=" + $("#projectNo").val();
	}
	
/* Gantt : gantt 페이지로 이동 */	
	function showGantt(){
		location.href="/planbe/gantt/ganttForm?projectNo=" + $("#projectNo").val();
	}

	
/*========================================================================================================================================= 보류 */	

/* DONE 키워드를 클릭하면 option 붙이기=== 이건 아닌거 같아... 구글 차트를 쓰자... */	
    function done() {
    	$("#keyList").empty();
		$("#keyList").append("<div style='background-color: #CC6666;'><a href='/test/wbs/doneList?projectNo=1&key=0'><tr><td>0 %<td><tr></a></div>"
		                   + "<div style='background-color: #CC9999;'><a href='/test/wbs/doneList?projectNo=1&key=20'><tr><td>20 %<td><tr></a></div>"
		                   + "<div style='background-color: #FFCC99;'><a href='/test/wbs/doneList?projectNo=1&key=40'><tr><td>40 %<td><tr></a></div>"
		                   + "<div style='background-color: #FFFFCC;'><a href='/test/wbs/doneList?projectNo=1&key=60'><tr><td>60 %<td><tr></a></div>"
		                   + "<div style='background-color: #CCFF99;'><a href='/test/wbs/doneList?projectNo=1&key=80'><tr><td>80 %<td><tr></a></div>"
		                   + "<div style='background-color: #99FF99;'><a href='/test/wbs/doneList?projectNo=1&key=100'><tr><td>100 %<td><tr></a></div>");
	}	 
	 
/* PRIORITY 키워드를 클릭하면 option 붙이기 */	 
    function priority() {
    	$("#keyList").empty();
		$("#keyList").append("<tr><td>LOW<td><tr>"
		                   + "<tr><td>NORMAL<td><tr>"
		                   + "<tr><td>HIGH<td><tr>"
		                   + "<tr><td>DO IT NOW<td><tr>");
	}	
    
/* PRIORITY 키워드를 클릭하면 option 붙이기 */    
    function status() {
    	$("#keyList").empty();
		$("#keyList").append("<tr><td>NEW<td><tr>"
		                   + "<tr><td>ING<td><tr>"
		                   + "<tr><td>DONE<td><tr>");
	}	
    
    function member(){
    	$.ajax({
	  		url: "/planbe/wbs/getMemberList",
	  		type: "post",
	  		data: {"projectNo" : $("#projectNo").val()},
	  		datatype: "json",
	  		success: function(result) {
	  			$("#keyList").empty();
			    $(result).each(function(index, item) {
			    	alert("멤버 function");
			    	$("#keyList").append("<tr><td>" + item +"<td><tr>");
				})
			},
	  		error: function() {
				alert("선택해 주세요...");
			}
	   })
    }
/*======================================================================================================================== 보류   */	  
    
</script>

<body>

<!-- Head Menu -->
	<div>
	<%@include file="headMenu.jsp"%>
    </div>
	
		<div class="container-fluid-full">
		<div class="row-fluid">
		
<!-- Side Menu -->
	<div>
     <%@include file="sideMenu.jsp"%>
    </div>	
			
			<noscript>
				<div class="alert alert-block span10">
					<h4 class="alert-heading">Warning!</h4>
					<p>You need to have <a href="http://en.wikipedia.org/wiki/JavaScript" target="_blank">JavaScript</a> enabled to use this site.</p>
				</div>
			</noscript>
			
			<!-- start: Content -->
			<div id="content" class="span10">
			
						
			<ul class="breadcrumb">
				<li>
					<i class="icon-home"></i>
					<a href="index.jsp">Main</a>
					<i class="icon-angle-right"></i> 
				</li>
				<li>
					<i class="icon-list-alt"></i>
					<a href="#">WBS</a>
				</li>
			</ul>
			
	
<!-- ========================================================================================================================== -->

			<!-- 키워드 드롭다운 박스 -->
			
			<div class="row-fluid">	
					<div class="box span4">
							<div class="box-header">
								<h2><i class="halflings-icon white plus"></i><span class="break"></span>Show by Keyword</h2>
									<div class="box-icon">
										<a href="#" class="btn-setting"><i class="halflings-icon white wrench"></i></a>
										<a href="#" class="btn-minimize"><i class="halflings-icon white chevron-up"></i></a>
										<a href="#" class="btn-close"><i class="halflings-icon white remove"></i></a>
									</div>
							</div>
							
							<div class="box-content">
								<table class="table table-bordered table-striped">
									  <div class="btn-group">
											<button class="btn btn-large">Select Keyword</button>
											<button class="btn btn-large dropdown-toggle" data-toggle="dropdown"><span class="caret"></span></button>
											<ul class="dropdown-menu">
												<li onclick="done()">% DONE</li>
												<li onclick="priority()"> PRIORITY </li>
												<li onclick="status()"> STATUS </li>
												<li onclick="member()"> MEMBER </li>
											</ul>
						             </div>
								</table>
												
								<table id="keyList">
								</table>
						   </div>	
				   </div>
			</div><!--키워드 드롭다운 박스 -->	
								
								
				
<!-- Project List 페이지에서 하나의 프로젝트를 클릭하면, 해당 프로젝트의 projectNo을 넘기는 구조 -->
            
<!-- projectNo을 넘기기 위한 임시 form -->
            
			   <form>
			     <input type="text" name="projectNo" id="projectNo">
			     <input type="button" value="데이터 불러오기" onclick="sendNo()"> 
			   </form>
			   
<!-- start: WBS 트리 박스 -->			   
			<div class="row-fluid">	
	             <div class="box span12">
							<div class="box-header" />
								  <h2><i class="halflings-icon white list"></i><span class="break"></span>WBS</h2>
								  <div class="box-icon">
									<a href="#" class="btn-setting"><i class="halflings-icon white wrench"></i></a>
									<a href="#" class="btn-minimize"><i class="halflings-icon white chevron-up"></i></a>
									<a href="#" class="btn-close"><i class="halflings-icon white remove"></i></a>
								  </div>
							</div>
	                        <div class="box-content" />
                                  
                                  <div id="wordtree_explicit" style="width: 900px; height: 500px;"></div>	
                                    <button class="btn btn-small btn-primary" onclick="selectHandler()">getWbsInfo</button>
									<button class="btn btn-small btn-danger" onclick="deleteWbs()">Delete WBS</button>
									<button class="btn btn-small btn-warning" onclick="showGantt()">Show Gantt</button>
							</div>
			      </div>
							<div>
						<!-- 	     <input type=button value="changeForm" onclick="changeFormat()"> -->
							</div>
			  </div>
<!-- end: WBS 트리 박스 -->
	
<!-- start: WBS 노드 정보 박스 -->	
		<div class="row-fluid sortable">		
				<div class="box span12">
					<div class="box-header" data-original-title>
						<h2><i class="halflings-icon white user"></i><span class="break"></span>Task Info</h2>
						<div class="box-icon">
							<a href="#" class="btn-setting"><i class="halflings-icon white wrench"></i></a>
							<a href="#" class="btn-minimize"><i class="halflings-icon white chevron-up"></i></a>
							<a href="#" class="btn-close"><i class="halflings-icon white remove"></i></a>
						</div>
					</div>
					<div class="box-content">
						<table class="table table-striped table-bordered bootstrap-datatable datatable">
						  <thead>
							  <tr>
								  <th>Username</th>
								  <th>Date registered</th>
								  <th>Role</th>
								  <th>Status</th>
								  <th>Actions</th>
							  </tr>
						  </thead>   
						  <tbody class="T_INFO">
							<tr>
								<td>Dennis Ji</td>
								<td class="center">2012/01/01</td>
								<td class="center">Member</td>
								<td class="center">
									<span class="label label-success">Active</span>
								</td>
								<td class="center">
									<a class="btn btn-success" href="#">
										<i class="halflings-icon white zoom-in"></i>  
									</a>
									<a class="btn btn-info" href="#">
										<i class="halflings-icon white edit"></i>  
									</a>
									<a class="btn btn-danger" href="#">
										<i class="halflings-icon white trash"></i> 
									</a>
								</td>
							</tr>
			
						  </tbody>
					  </table>            
					</div>
				</div><!--/span-->
			
			</div><!--/row-->
<!-- end: WBS 노드 정보 박스 -->		
	
	
	
	
							
							
<!-- WBS 노드 정보 박스 : 후보  -->				    
			  <div class="row-fluid">
				
				<div class="box span12">
						<div class="box-header">
							<h2><i class="halflings-icon white th"></i><span class="break"></span>Info</h2>
						</div>
						
						<div class="box-content">
							<ul class="nav tab-menu nav-tabs" id="myTab">
								<li class="active"><a href="#info">Info</a></li>
								<li><a href="#custom">Custom</a></li>
								<li><a href="#messages">Messages</a></li>
							</ul>
							 
								<div id="myTabContent" class="tab-content">
										<div class="tab-pane active" id="info">
											<p>
			
												Duis autem vel eum iriure dolor in hendrerit in vulputate velit esse molestie consequat, vel illum dolore eu feugiat nulla facilisis at vero eros et accumsan et iusto odio dignissim qui blandit praesent luptatum zzril delenit augue duis dolore te feugait nulla facilisi. Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpat.   
											</p>
			
										</div>
										
										<div class="tab-pane" id="custom">
											<p>
												Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet. Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet. Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet.   
											</p>
										</div>
										
										<div class="tab-pane" id="messages">
											<p>
												Ut wisi enim ad minim veniam, quis nostrud exerci tation ullamcorper suscipit lobortis nisl ut aliquip ex ea commodo consequat. Duis autem vel eum iriure dolor in hendrerit in vulputate velit esse molestie consequat, vel illum dolore eu feugiat nulla facilisis at vero eros et accumsan et iusto odio dignissim qui blandit praesent luptatum zzril delenit augue duis dolore te feugait nulla facilisi.   
											</p>
											<p>
												Nam liber tempor cum soluta nobis eleifend option congue nihil imperdiet doming id quod mazim placerat facer
											</p>
										</div>
								</div>
						</div>
				</div><!--/span-->
			
			</div><!--/row-->			
							
<!-- 필요한 버튼 쓰려고 남겨둠 -->					
				<div class="box span6">
					<div class="box-header">
						<h2><i class="halflings-icon white list"></i><span class="break"></span>Buttons</h2>
						<div class="box-icon">
							<a href="#" class="btn-setting"><i class="halflings-icon white wrench"></i></a>
							<a href="#" class="btn-minimize"><i class="halflings-icon white chevron-up"></i></a>
							<a href="#" class="btn-close"><i class="halflings-icon white remove"></i></a>
						</div>
					</div>
					<div class="box-content buttons">
						<p>
							<button class="btn btn-large">Large button</button>
							<button class="btn btn-large btn-primary">Large button</button>
							<button class="btn btn-large btn-danger">Large button</button>
							<button class="btn btn-large btn-warning">Large button</button>
						</p>
						<p>
							<button class="btn btn-large btn-success">Large button</button>
							<button class="btn btn-large btn-info">Large button</button>
							<button class="btn btn-large btn-inverse">Large button</button>
						</p>
						<p>
							
						</p>
						<div class="btn-group">
							<button class="btn btn-large">Large Dropdown</button>
							<button class="btn btn-large dropdown-toggle" data-toggle="dropdown"><span class="caret"></span></button>
							<ul class="dropdown-menu">
								<li><a href="#"><i class="halflings-icon white star"></i> Action</a></li>
								<li><a href="#"><i class="halflings-icon white tag"></i> Another action</a></li>
								<li><a href="#"><i class="halflings-icon white download-alt"></i> Something else here</a></li>
								<li class="divider"></li>
								<li><a href="#"><i class="halflings-icon white tint"></i> Separated link</a></li>
							</ul>
						</div>
						
						<hr>
						
						<p class="btn-group">
							  <button class="btn">Left</button>
							  <button class="btn">Middle</button>
							  <button class="btn">Right</button>
						</p>
						<p>
							<button class="btn btn-small"><i class="halflings-icon white white star"></i> Icon button</button>
							<button class="btn btn-small btn-primary">Small button</button>
							<button class="btn btn-small btn-danger">Small button</button>
							<button class="btn btn-small btn-warning">Small button</button>
							<button class="btn btn-small btn-success">Small button</button>
							
						</p>
						<p>
							<button class="btn btn-small btn-info">Small button</button>
							<button class="btn btn-small btn-inverse">Small button</button>
							<button class="btn btn-large btn-primary btn-round">Round button</button>
							<button class="btn btn-large btn-round"><i class="halflings-icon white white ok"></i></button>
							<button class="btn btn-primary"><i class="halflings-icon white white edit"></i></button>
						</p>
						<p>
							<button class="btn btn-mini">Mini button</button>
							<button class="btn btn-mini btn-primary">Mini button</button>
							<button class="btn btn-mini btn-danger">Mini button</button>
							<button class="btn btn-mini btn-warning">Mini button</button>
							<button class="btn btn-mini btn-info">Mini button</button>
							<button class="btn btn-mini btn-success">Mini button</button>
							<button class="btn btn-mini btn-inverse">Mini button</button>
						</p>
						
					</div>
				</div><!--/span-->
				
			</div><!--/row-->
			

	</div><!--/.fluid-container-->
	
			<!-- end: Content -->
		</div><!--/#content.span10-->
		</div><!--/fluid-row-->
		
	<div class="modal hide fade" id="myModal">
		<div class="modal-header">
			<button type="button" class="close" data-dismiss="modal">Ã</button>
			<h3>Settings</h3>
		</div>
		<div class="modal-body">
			<p>Here settings can be configured...</p>
		</div>
		<div class="modal-footer">
			<a href="#" class="btn" data-dismiss="modal">Close</a>
			<a href="#" class="btn btn-primary">Save changes</a>
		</div>
	</div>
	
	<div class="clearfix"></div>
	
	<footer>
		
		<p>
			<span style="text-align:left;float:left">&copy; 2017 <a href="/planbe/ourTeam" alt="Bootstrap_Metro_Dashboard">SCIT MASTER 33rd CLASS B TEAM 2 </a></span>
			
		</p>

	</footer>
	
	
<!-- start: JavaScript-->

		<script src="/planbe/resources/bootstrap/js/jquery-1.9.1.min.js"></script>
	    <script src="/planbe/resources/bootstrap/js/jquery-migrate-1.0.0.min.js"></script>
	
		<script src="/planbe/resources/bootstrap/js/jquery-ui-1.10.0.custom.min.js"></script>
	
		<script src="/planbe/resources/bootstrap/js/jquery.ui.touch-punch.js"></script>
	
		<script src="/planbe/resources/bootstrap/js/modernizr.js"></script>
	
		<script src="/planbe/resources/bootstrap/js/bootstrap.min.js"></script>
	
		<script src="/planbe/resources/bootstrap/js/jquery.cookie.js"></script>
	
		<script src='/planbe/resources/bootstrap/js/fullcalendar.min.js'></script>
	
		<script src='/planbe/resources/bootstrap/js/jquery.dataTables.min.js'></script>

		<script src="/planbe/resources/bootstrap/js/excanvas.js"></script>
		<script src="/planbe/resources/bootstrap/js/jquery.flot.js"></script>
		<script src="/planbe/resources/bootstrap/js/jquery.flot.pie.js"></script>
		<script src="/planbe/resources/bootstrap/js/jquery.flot.stack.js"></script>
		<script src="/planbe/resources/bootstrap/js/jquery.flot.resize.min.js"></script>
		
		<script src="/planbe/resources/bootstrap/js/jquery.chosen.min.js"></script>
	
		<script src="/planbe/resources/bootstrap/js/jquery.uniform.min.js"></script>
		
		<script src="/planbe/resources/bootstrap/js/jquery.cleditor.min.js"></script>
	
		<script src="/planbe/resources/bootstrap/js/jquery.noty.js"></script>
	
		<script src="/planbe/resources/bootstrap/js/jquery.elfinder.min.js"></script>
	
		<script src="/planbe/resources/bootstrap/js/jquery.raty.min.js"></script>
	
		<script src="/planbe/resources/bootstrap/js/jquery.iphone.toggle.js"></script>
	
		<script src="/planbe/resources/bootstrap/js/jquery.uploadify-3.1.min.js"></script>
	
		<script src="/planbe/resources/bootstrap/js/jquery.gritter.min.js"></script>
	
		<script src="/planbe/resources/bootstrap/js/jquery.imagesloaded.js"></script>
	
		<script src="/planbe/resources/bootstrap/js/jquery.masonry.min.js"></script>
	
		<script src="/planbe/resources/bootstrap/js/jquery.knob.modified.js"></script>
	
		<script src="/planbe/resources/bootstrap/js/jquery.sparkline.min.js"></script>
	
		<script src="/planbe/resources/bootstrap/js/counter.js"></script>
	
		<script src="/planbe/resources/bootstrap/js/retina.js"></script>

		<script src="/planbe/resources/bootstrap/js/custom.js"></script>
<!-- end: JavaScript-->
	
</body>
</html>
