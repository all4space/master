<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 

<!DOCTYPE html>
<html>
<head>
	
	<!-- start: Meta -->
	<meta charset="utf-8">
	<title>TASK</title>
	<meta name="description" content="Bootstrap Metro Dashboard">
	<meta name="author" content="Dennis Ji">
	<meta name="keyword" content="Metro, Metro UI, Dashboard, Bootstrap, Admin, Template, Theme, Responsive, Fluid, Retina">
	<!-- end: Meta -->
	
	<!-- start: Mobile Specific -->
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<!-- end: Mobile Specific -->
	
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
	
</head>

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
				<li><a href="#">Task</a></li>
			</ul>

			<div class="row-fluid">
				
				<div class="span7">
					<h1>Tasks</h1>
					
					<div class="priority high"><span>high priority</span></div>
					
					<div class="task high">
						<div class="desc">
							<div class="title">Lorem Ipsum</div>
							<div>Neque porro quisquam est qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit</div>
						</div>
						<div class="time">
							<div class="date">Jun 1, 2012</div>
							<div> 1 day</div>
						</div>
					</div>
					<div class="task high">
						<div class="desc">
							<div class="title">Lorem Ipsum</div>
							<div>Neque porro quisquam est qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit</div>
						</div>
						<div class="time">
							<div class="date">Jun 1, 2012</div>
							<div>1 day</div>
						</div>
					</div>
					<div class="task high">
						<div class="desc">
							<div class="title">Lorem Ipsum</div>
							<div>Neque porro quisquam est qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit</div>
						</div>
						<div class="time">
							<div class="date">Jun 1, 2012</div>
							<div> 1 day</div>
						</div>
					</div>
					<div class="task high last">
						<div class="desc">
							<div class="title">Lorem Ipsum</div>
							<div>Neque porro quisquam est qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit</div>
						</div>
						<div class="time">
							<div class="date">Jun 1, 2012</div>
							<div>1 day</div>
						</div>
					</div>
					
					<div class="priority medium"><span>medium priority</span></div>
					
					<div class="task medium">
						<div class="desc">
							<div class="title">Lorem Ipsum</div>
							<div>Neque porro quisquam est qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit</div>
						</div>
						<div class="time">
							<div class="date">Jun 1, 2012</div>
							<div> 1 day</div>
						</div>
					</div>
					<div class="task medium last">
						<div class="desc">
							<div class="title">Lorem Ipsum</div>
							<div>Neque porro quisquam est qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit</div>
						</div>
						<div class="time">
							<div class="date">Jun 1, 2012</div>
							<div> 1 day</div>
						</div>
					</div>
					
					<div class="priority low"><span>low priority</span></div>
					
					<div class="task low">
						<div class="desc">
							<div class="title">Lorem Ipsum</div>
							<div>Neque porro quisquam est qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit</div>
						</div>
						<div class="time">
							<div class="date">Jun 1, 2012</div>
							<div> 1 day</div>
						</div>
					</div>
					<div class="task low">
						<div class="desc">
							<div class="title">Lorem Ipsum</div>
							<div>Neque porro quisquam est qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit</div>
						</div>
						<div class="time">
							<div class="date">Jun 1, 2012</div>
							<div> 1 day</div>
						</div>
					</div>
					<div class="task low">
						<div class="desc">
							<div class="title">Lorem Ipsum</div>
							<div>Neque porro quisquam est qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit</div>
						</div>
						<div class="time">
							<div class="date">Jun 1, 2012</div>
							<div> 1 day</div>
						</div>
					</div>
					<div class="task low">
						<div class="desc">
							<div class="title">Lorem Ipsum</div>
							<div>Neque porro quisquam est qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit</div>
						</div>
						<div class="time">
							<div class="date">Jun 1, 2012</div>
							<div> 1 day</div>
						</div>
					</div>
					<div class="task low">
						<div class="desc">
							<div class="title">Lorem Ipsum</div>
							<div>Neque porro quisquam est qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit</div>
						</div>
						<div class="time">
							<div class="date">Jun 1, 2012</div>
							<div> 1 day</div>
						</div>
					</div>
					<div class="task low">
						<div class="desc">
							<div class="title">Lorem Ipsum</div>
							<div>Neque porro quisquam est qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit</div>
						</div>
						<div class="time">
							<div class="date">Jun 1, 2012</div>
							<div> 1 day</div>
						</div>
					</div>
					<div class="common-modal modal fade" id="common-Modal1" tabindex="-1" role="dialog" aria-hidden="true">
						<div class="modal-content">
							<ul class="list-inline item-details">
								<li><a href="http://themifycloud.com">Admin templates</a></li>
								<li><a href="http://themescloud.org">Bootstrap themes</a></li>
							</ul>
						</div>
					</div>
					<div class="clearfix"></div>		
					
				</div>
				
				<div class="span5 noMarginLeft">
					
					<div class="dark">
					
					<h1>Timeline</h1>
					
					<div class="timeline">
						
					    <div class="timeslot">
					    	
							<div class="task">
					    		<span>
									<span class="type">appointment</span>
									<span class="details">
										Dennis Ji at Bootstrap Metro Dashboard HQ
									</span>
									<span>
										remaining time
										<span class="remaining">
											3h 38m 15s
										</span>	
									</span> 
								</span>
								<div class="arrow"></div>
							</div>							
							<div class="icon">
								<i class="icon-map-marker"></i>
							</div>
							<div class="time">
								3:43 PM
							</div>	
								
					    </div>
					
						<div class="clearfix"></div>
						
						<div class="timeslot alt">
					    	
							<div class="task">
					    		<span>
									<span class="type">phone call</span>
									<span class="details">
										Dennis Ji
									</span>
									<span>
										remaining time
										<span class="remaining">
											3h 38m 15s
										</span>	
									</span>
								</span>
								<div class="arrow"></div>
							</div>
							<div class="icon">
								<i class="icon-phone"></i>
							</div>
							<div class="time">
								3:43 PM
							</div>	
								
					    </div>
					
						<div class="timeslot">
					    	
							<div class="task">
					    		<span>
									<span class="type">mail</span>
									<span class="details">
										Dennis Ji
									</span>
									<span>
										remaining time
										<span class="remaining">
											3h 38m 15s
										</span>	
									</span> 
								</span>
								<div class="arrow"></div>
							</div>
							<div class="icon">
								<i class="icon-envelope"></i>
							</div>
							<div class="time">
								3:43 PM
							</div>	
								
					    </div>
					
						<div class="timeslot alt">
					    	
							<div class="task">
					    		<span>
									<span class="type">deadline</span>
									<span class="details">
										Fixed bugs
									</span>
									<span>
										remaining time
										<span class="remaining">
											3h 38m 15s
										</span>	
									</span> 
								</span>
								<div class="arrow"></div>
							</div>
							<div class="icon">
								<i class="icon-calendar"></i>
							</div>
							<div class="time">
								3:43 PM
							</div>	
								
					    </div>
					
						<div class="timeslot">
					    	
							<div class="task">
					    		<span>
									<span class="type">appointment</span>
									<span class="details">
										Dennis Ji at Bootstrap Metro Dashboard HQ
									</span>
									<span>
										remaining time
										<span class="remaining">
											3h 38m 15s
										</span>	
									</span> 
								</span>
								<div class="arrow"></div>
							</div>							
							<div class="icon">
								<i class="icon-map-marker"></i>
							</div>
							<div class="time">
								3:43 PM
							</div>	
								
					    </div>
					
						<div class="clearfix"></div>
						
						<div class="timeslot alt">
					    	
							<div class="task">
					    		<span>
									<span class="type">skype call</span>
									<span class="details">
										Dennis Ji
									</span>
									<span>
										remaining time
										<span class="remaining">
											3h 38m 15s
										</span>	
									</span>
								</span>
								<div class="arrow"></div>
							</div>
							<div class="icon">
								<i class="icon-phone"></i>
							</div>
							<div class="time">
								3:43 PM
							</div>	
								
					    </div>
					
						<div class="timeslot">
					    	
							<div class="task">
					    		<span>
									<span class="type">mail</span>
									<span class="details">
										Dennis Ji
									</span>
									<span>
										remaining time
										<span class="remaining">
											3h 38m 15s
										</span>	
									</span> 
								</span>
								<div class="arrow"></div>
							</div>
							<div class="icon">
								<i class="icon-envelope"></i>
							</div>
							<div class="time">
								3:43 PM
							</div>	
								
					    </div>
					
						<div class="timeslot alt">
					    	
							<div class="task">
					    		<span>
									<span class="type">project deadline</span>
									<span class="details">
										Fixed bugs
									</span>
									<span>
										remaining time
										<span class="remaining">
											3h 38m 15s
										</span>	
									</span> 
								</span>
								<div class="arrow"></div>
							</div>
							<div class="icon">
								<i class="icon-calendar"></i>
							</div>
							<div class="time">
								3:43 PM
							</div>	
								
					    </div>
					
						<div class="timeslot">
					    	
							<div class="task">
					    		<span>
									<span class="type">mail</span>
									<span class="details">
										Dennis Ji
									</span>
									<span>
										remaining time
										<span class="remaining">
											3h 38m 15s
										</span>	
									</span> 
								</span>
								<div class="arrow"></div>
							</div>
							<div class="icon">
								<i class="icon-envelope"></i>
							</div>
							<div class="time">
								3:43 PM
							</div>	
								
					    </div>
					    
					</div>
				</div>
				
				</div>	
						
			</div>
			
       

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
