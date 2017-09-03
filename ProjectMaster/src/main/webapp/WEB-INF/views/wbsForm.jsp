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

// WBS

google.charts.load('current', {packages:['wordtree']});
google.charts.setOnLoadCallback(drawSimpleNodeChart);


function drawSimpleNodeChart(p_name, t_list) {
  

	function Data(id, child, parent, size, style){
	      this.id = id;
	      this.child = child;
	      this.parent = parent;
	      this.size = size;
	      this.style = style;
	      
	      this.getId = function() {
			  return this.id;
		  }
	      
	      this.getChild = function() {
			  return this.child;
		  }
	      
	      this.getParent = function() {
			  return this.parent;
		  }
	      
	      this.getSize = function() {
			  return this.size;
		  }
	      
	      this.getStyle = function() {
			  return this.style;
		  }
	      
	      this.toString = function(){
	    	  return this.id + "," + this.child + "," + this.parent + "," + this.size + "," + this.style;
	      }
	}  

/* 	
// 객체 생성 	  
    var nodeData = [];
	  $(t_list).each(function(index, item) {
           nodeData.push(new Data(item.taskNo, item.taskName, 0, 1, 'black'));
	  });// for each 
	
    	   
	var row = "";  
    for(var i = 0; i < nodeData.length; i++){
    
       row += "[" + nodeData[i].getId() + "," + nodeData[i].getChild() + "," + nodeData[i].getParent() + "," + nodeData[i].getSize() + "," + nodeData[i].getStyle() + "],";
       if(i == nodeData.length-1){
       row += "[" + nodeData[i].getId() + "," + nodeData[i].getChild() + "," + nodeData[i].getParent() + "," + nodeData[i].getSize() + "," + nodeData[i].getStyle() + "]";
       }   
    }// for
	  */
	  
    
    
	var nodeListData = new google.visualization.arrayToDataTable([
    ['id', 'childLabel', 'parent', 'size', { role: 'style' }],
    [0, p_name, -1, 1, 'black']
    /* 
    [index, item.taskName, 0, 1, 'black'],
    [index, item.taskName, 0, 1, 'black'],
    [index, item.taskName, 0, 1, 'black'],
    [index, item.taskName, 0, 1, 'black'],
    [index, item.taskName, 0, 1, 'black'],
    [index, item.taskName, 0, 1, 'black']
     */
    /* 
    [5, 'Euryarchaeota', 1, 1, 'black'],
    [6, 'Korarchaeota', 1, 1, 'black'],
    [7, 'Nanoarchaeota', 1, 1, 'black'],
    [8, 'Thaumarchaeota', 1, 1, 'black'] */
/*
    [9, 'Amoebae', 2, 1, 'black'],
    [10, 'Plants', 2, 1, 'black'],
    [11, 'Chromalveolata', 2, 1, 'black'],
    [12, 'Opisthokonta', 2, 5, 'black'],
    [13, 'Rhizaria', 2, 1, 'black'],
    [14, 'Excavata', 2, 1, 'black']
     */
    ]);
    	
    $(t_list).each(function(index, item) {  
    nodeListData.addRow([index+1, item.taskName, 0, 1, 'black']);
    });// for each 

    var options = {
    colors: ['black', 'black', 'black'],
    wordtree: {
      format: 'explicit',
      type: 'suffix'
    }
  };

  var wordtree = new google.visualization.WordTree(document.getElementById('wordtree_explicit'));
  wordtree.draw(nodeListData, options);
}
    	
    

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
                    drawChart(t_list);

				}, // succes
		  			
              /*  origin  
              function(result) {
		  		    
		  			var p_name2 = result.projectName;
		  			alert(p_name2);
		  			$("#p_name").append("<tr><td><button class='btn btn-large btn-primary'>" + p_name2 + "</button></td></tr>"); 
		  			
		  			var t_list = result.taskList; 
						  
		  			var totalSpace = 1000-(t_list.length*100); 
				    var subSpace = (totalSpace/t_list.length)*0.5;
				    
				    $(t_list).each(function(index, item) {
						  $("#t_name").append("<td><div style='margin-right:" + subSpace + "px; margin-left:" + subSpace + "px;'><button class='btn btn-large'>" + item.taskName + "</button><div></td>");
						  
					})
				}, 
				*/
		  		
		  		error: function() {
					alert("선택해 주세요...");
				}
		})
	}
					

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
								
								
													  
												
												
												
												
												
						
										  
					
								
			
	        <!-- WBS 트리 박스  -->
				
			<!-- Project List 페이지에서 하나의 프로젝트를 클릭하면, 해당 프로젝트의 projectNo을 넘기는 구조 -->
            
<!-- gantt -->            
            <div id="chart_div"></div>
            
            
<!-- projectNo을 넘기기 위한 임시 form -->
			   <form>
			     <input type="text" name="projectNo" id="projectNo">
			     <input type="button" value="데이터 불러오기" onclick="sendNo()"> 
			   </form>
			
 <div id="wordtree_explicit" style="width: 900px; height: 500px;"></div>			
			   
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
	                               <!-- 1ST // 프로젝트 이름 -->
								    <div style="width: 1000px; height: 50px; margin-right: 450px; margin-left: 450px;">
								            <table id="p_name">
								            </table>
								    </div>
								    
								   <!--  2ND // 선 그리기 -->
								    <div style="width: 1000px; height: 50px; ">
								    </div>
								    
								    <!-- 3RD // 업무 이름  -->
									<div id="t_div" style="width: 1000px; height: 50px;">
									    <table>
									      <tr id="t_name"></tr> 
									    </table>
									</div>
									
									<!-- 4TH // 선 그리기 -->
								    <div style="width: 1000px; height: 50px; ">
								    </div>
								    
								    <!-- 5TH // 세부 업무 이름 -->
								    <div style="width: 1000px; height: 50px; ">
								    </div>
							</div>
			      </div>
			  </div><!-- WBS 트리 박스 -->
							    
							    
							        
			  <!-- 노드 정보 박스 -->				    
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
							
							
							
								
							
				

			
		<!-- 	 
			<div class="row-fluid">	
				<div class="box blue span12">
					<div class="box-header">
						<h2><i class="halflings-icon white white hand-top"></i><span class="break"></span>Quick Buttons</h2>
					</div>
					<div class="box-content">
						
						<a class="quick-button span2">
							<i class="icon-group"></i>
							<p>Users</p>
							<span class="notification blue">1.367</span>
						</a>
						<a class="quick-button span2">
							<i class="icon-comments-alt"></i>
							<p>Comments</p>
							<span class="notification green">167</span>
						</a>
						<a class="quick-button span2">
							<i class="icon-shopping-cart"></i>
							<p>Orders</p>
						</a>
						<a class="quick-button span2">
							<i class="icon-barcode"></i>
							<p>Products</p>
						</a>
						<a class="quick-button span2">
							<i class="icon-envelope"></i>
							<p>Messages</p>
						</a>
						<a class="quick-button span2">
							<i class="icon-calendar"></i>
							<p>Calendar</p>
							<span class="notification red">68</span>
						</a>
						<div class="clearfix"></div>
					</div>	
				</div>/span
				
			</div>/row
			 -->
			
		<!-- 	
			<div class="row-fluid">	
				<div class="box span12">
					<div class="box-header">
						<h2><i class="halflings-icon white white hand-top"></i><span class="break"></span>Small Quick Buttons</h2>
					</div>
					<div class="box-content">
						
						<a class="quick-button-small span1">
							<i class="icon-group"></i>
							<p>Users</p>
							<span class="notification blue">7</span>
						</a>
						<a class="quick-button-small span1">
							<i class="icon-comments-alt"></i>
							<p>Comments</p>
							<span class="notification green">4</span>
						</a>
						<a class="quick-button-small span1">
							<i class="icon-shopping-cart"></i>
							<p>Orders</p>
						</a>
						<a class="quick-button-small span1">
							<i class="icon-barcode"></i>
							<p>Products</p>
						</a>
						<a class="quick-button-small span1">
							<i class="icon-envelope"></i>
							<p>Messages</p>
						</a>
						<a class="quick-button-small span1">
							<i class="icon-calendar"></i>
							<p>Calendar</p>
							<span class="notification red">8</span>
						</a>
						<a class="quick-button-small span1">
							<i class="icon-beaker"></i>
							<p>Projects</p>
						</a>
						<a class="quick-button-small span1">
							<i class="icon-thumbs-up"></i>
							<p>Likes</p>
							<span class="notification green">1</span>
						</a>
						<a class="quick-button-small span1">
							<i class="icon-heart-empty"></i>
							<p>Favorites</p>
						</a>
						<a class="quick-button-small span1">
							<i class="icon-bullhorn"></i>
							<p>Notifications</p>
							<span class="notification yellow">7</span>
						</a>
						<a class="quick-button-small span1">
							<i class="icon-cogs"></i>
							<p>Settings</p>
						</a>
						<a class="quick-button-small span1">
							<i class="icon-dashboard"></i>
							<p>Dashboard</p>
						</a>
						
						<div class="clearfix"></div>
					</div>	
				</div>/span
				
			</div>/row
		
			
				 -->
					
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
