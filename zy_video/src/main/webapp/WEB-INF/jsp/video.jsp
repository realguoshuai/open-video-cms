<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>视频管理</title>
<!-- Bootstrap -->
<link href='<c:url value="/css/bootstrap.min.css"></c:url>'
	rel="stylesheet">
<link href='<c:url value="/css/bootstrap-table.min.css"></c:url>'
	rel="stylesheet">
<link href='<c:url value="/css/bootstrap-editable.css"></c:url>'
	rel="stylesheet">
</head>
<body>
	<div class="container">
		<nav class="navbar navbar-default">
			<div class="container-fluid">
				<!-- Brand and toggle get grouped for better mobile display -->
				<div class="navbar-header">
					<button type="button" class="navbar-toggle collapsed"
						data-toggle="collapse" data-target="#bs-example-navbar-collapse-1"
						aria-expanded="false">
						<span class="sr-only">Toggle navigation</span>
						<span class="icon-bar"></span>
						<span class="icon-bar"></span>
						<span class="icon-bar"></span>
					</button>
					<a class="navbar-brand" href="#">智游公开课后台管理系统</a>
				</div>

				<!-- Collect the nav links, forms, and other content for toggling -->
				<div class="collapse navbar-collapse"
					id="bs-example-navbar-collapse-1">
					<ul class="nav navbar-nav">
						<li>
							<a href="index.jsp"> 首页 </a>
						</li>
						<li class="active">
							<a href='<c:url value="/video"></c:url>'> 视频管理 </a>
						</li>
						<li>
							<a href='<c:url value="/speaker"></c:url>'>讲师管理</a>
						</li>
						<li>
							<a href='<c:url value="/course"></c:url>'>课程管理</a>
						</li>
						<li>
							<a href='<c:url value="/subject"></c:url>'>学科管理</a>
						</li>
					</ul>
				</div>
			</div>
		</nav>
		
		
		<a id="username">用户名</a>
		
		<div class="panel panel-primary">
			<div class="panel-heading">视频管理</div>
			<div id="toolbar" class="btn-group" role="group" aria-label="...">
				
				<div id="toolbar">
					<select id="speaker_select">
						<option value="0">全部讲师</option>
						<c:forEach items="${speakers}" var="speaker">
							<option value="${speaker.id }">${speaker.name }</option>
						</c:forEach>
					</select>

					<select id="course_select">
						<option value="0">课程</option>
						<c:forEach items="${courses }" var="course">
							<option value="${course.id}">${course.name }</option>
						</c:forEach>
					</select>
				</div>
				
					<button type="button" id="btn_add" class="btn btn-default"
					onclick="showAddModal()">
					<span class="glyphicon glyphicon-plus" aria-hidden="true"></span>
					添加
				</button>
				<button type="button" id="btn_delete" class="btn btn-default"
					onclick="deleteSomeVideo()">
					<span class="glyphicon glyphicon-trash" aria-hidden="true"></span>
					删除
				</button>
				
			</div>

			<!-- Table -->
			<table class="table"></table>
		</div>
	</div>
<!-- 点击添加,跳出的模态框 -->
	<div class="modal fade" id="modal_add" tabindex="-1" role="dialog"
		aria-labelledby="exampleModalLabel">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<h4 class="modal-title" id="exampleModalLabel">添加视频</h4>
				</div>
				<div class="modal-body">
					<form>
						<div class="form-group">
							<label for="recipient-name" class="control-label">标题：</label>
							<input type="text" class="form-control" id="add_name">
						</div>
					</form>
				</div>
				<select id="add_speakerId">
					<option >选择主讲人</option>
					<c:forEach items="${ speakers}" var="speaker">
						<option  value="${speaker.id}">${speaker.name }</option>
					</c:forEach>
				</select>

				<select id="add_courseId">
					<option >选择所属课程</option>
					<c:forEach items="${courses}" var="course">
						<option  value="${course.id}">${course.name }</option>
					</c:forEach>
				</select>
				<div class="modal-body">
							<label for="recipient-name" class="control-label">时长:</label>
							<input type="number" class="form-control" id="add_length">
						</div>
				<div class="modal-body">
					<label for="recipient-name" class="control-label">播放次数:</label>
					<input type="number" class="form-control" id="add_play_count">
				</div>
				<div class="modal-body">
					<form>
						<div class="form-group">
							<label for="recipient-name" class="control-label">封面地址：</label>
							<input type="text" class="form-control" id="add_cover_url">
						</div>
					</form>
				</div>
				<div class="modal-body">
					<form>
						<div class="form-group">
							<label for="recipient-name" class="control-label">视频地址：</label>
							<input type="text" class="form-control" id="add_video_url">
						</div>
					</form>
				</div>
				<div class="modal-body">
					<form>
						<div class="form-group">
							<label for="recipient-name" class="control-label">视频介绍：</label>
							<input type="text" class="form-control" id="add_describe">
						</div>
					</form>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
					<button type="button" class="btn btn-primary" onclick="addVideo()">添加</button>
				</div>
			</div>
		</div>
	</div>
	<div class="modal fade" id="modal_update" tabindex="-1" role="dialog"
		aria-labelledby="exampleModalLabel">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<h4 class="modal-title" id="exampleModalLabel">更新视频</h4>
				</div>
				<div class="modal-body">
					<form>
						<input type="hidden" id="update_id">

						<div class="form-group">
							<label for="recipient-name" class="control-label">名字：</label>
							<input type="text" class="form-control" id="update_name">
						</div>
						<div class="form-group">
							<label for="recipient-name" class="control-label">时长：</label>
							<input type="text" class="form-control" id="update_length">
						</div>
						<select id="update_speakerId">
							<option >选择主讲人</option>
							<c:forEach items="${speakers }" var="speaker">
								<option  value="${speaker.id}">${speaker.name }</option>
							</c:forEach>
						</select>

						<select id="update_courseId">
							<option>选择所属课程</option>
							<c:forEach items="${courses }" var="course">
								<option  value="${course.id}">${course.name }</option>
							</c:forEach>
						</select>
						<div class="form-group">
							<label for="recipient-name" class="control-label">播放次数：</label>
							<input type="text" class="form-control" id="update_play_count">
						</div>
						<div class="form-group">
							<label for="recipient-name" class="control-label">封面地址：</label>
							<input type="text" class="form-control" id="update_cover_url">
						</div>
						<div class="form-group">
							<label for="recipient-name" class="control-label">视频地址：</label>
							<input type="text" class="form-control" id="update_video_url">
						</div>
						<div class="form-group">
							<label for="recipient-name" class="control-label">简介：</label>
							<input type="text" class="form-control" id="update_describe">
						</div>

					</form>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
					<button type="button" class="btn btn-primary"
						onclick="updateVideo()">更新</button>
				</div>
			</div>
		</div>
	</div>
	<div>
		<div class="modal fade" id="modal_detail" tabindex="-1" role="dialog"
			aria-labelledby="exampleModalLabel">
			<div class="modal-dialog" role="document">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal"
							aria-label="Close">
							<span aria-hidden="true">&times;</span>
						</button>
						<h4 class="modal-title" id="exampleModalLabel">视频详情</h4>
					</div>
					<div class="modal-body">
						<form>
						<input type="hidden" id="detail_id">

						<div class="form-group">
							<label for="recipient-name" class="control-label">名字：</label>
							<input type="text" class="form-control" id="detail_name">
						</div>
						<div class="form-group">
							<label for="recipient-name" class="control-label">课程：</label>
							<input type="text" class="form-control" id="detail_course">
						</div>
						<div class="form-group">
							<label for="recipient-name" class="control-label">学科：</label>
							<input type="text" class="form-control" id="detail_subject">
						</div>
						<div class="form-group">
							<label for="recipient-name" class="control-label">时长：</label>
							<input type="text" class="form-control" id="detail_length">
						</div>
						<div class="form-group">
							<label for="recipient-name" class="control-label">播放次数：</label>
							<input type="text" class="form-control" id="detail_play_count">
						</div>
						<div class="form-group">
							<label for="recipient-name" class="control-label">封面地址：</label>
							<input type="text" class="form-control" id="detail_cover_url">
						</div>
						<div class="form-group">
							<label for="recipient-name" class="control-label">视频地址：</label>
							<input type="text" class="form-control" id="detail_video_url">
						</div>
						<div class="form-group">
							<label for="recipient-name" class="control-label">简介：</label>
							<input type="text" class="form-control" id="detail_describe">
						</div>

						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
	<script src='<c:url value="/js/jquery-3.2.1.min.js"></c:url>'></script>
	<!-- Include all compiled plugins (below), or include individual files as needed -->
	<script src='<c:url value="/js/bootstrap.min.js"></c:url>'></script>
	<script src='<c:url value="/js/bootstrap-table.min.js"></c:url>'></script>
	<script src='<c:url value="/js/bootstrap-table-zh-CN.min.js"></c:url>'></script>
	<script src='<c:url value="/js/bootstrap-editable.min.js"></c:url>'></script>
	<script
		src='<c:url value="/js/bootstrap-table-editable.min.js"></c:url>'></script>


	<script>
		// 声明一个方法，不需要设置返回值，参数随意写，只写名字，不写类型

		// 弹出添加模态框
		function showAddModal() {

			// 清空已经输入的内容
			// 选择器可以连接，进行多个条件限制
			// eg：选中 id = modal_add 标签内的 class = form-control 的标签
			$('#modal_add .form-control').val("");

			// 弹出模态框
			$('#modal_add').modal('show');
		}

		function addVideo() {
			var name = $('#add_name').val();
			var speakerId = $('#add_speakerId').val();
			var courseId = $('#add_courseId').val();
			var coverId = $('#add_cover_id').val();
			var videoId = $('#add_video_id').val();
			var describe = $('#add_describe').val();
			var length = $('#add_length').val();
			var playCount = $('#add_play_count').val();
			var coverUrl = $('#add_cover_url').val();
			var videoUrl = $('#add_video_url').val();
			
			/* alert(name) */
			$.ajax({

				url : '<c:url value="/v1/video/add"></c:url>',

				type : 'POST',

				data : JSON.stringify({
					'name' : name,
					'speakerId' : speakerId,
					'courseId' : courseId,
					'coverId' : coverId,
					'videoId' : videoId,
					'describe' : describe,
					'length' : length,
					'playCount' : playCount,
					'coverUrl' : coverUrl,
					'videoUrl' : videoUrl,
				}),

				dateType : 'json',

				contentType : 'application/json',

				success : function(responseVO) {

					if (responseVO.errorCode == 0) {
						// 添加成功，收回模态框
						$('#modal_add').modal('hide');

						// 刷新表格
						$('.table').bootstrapTable('refresh');
					}
				},
				error : function(error) {
					alert(error);
				}
			});
		}
	/* 单选删除   */
		function deleteVideo(id) {

			$.ajax({

				url : "<c:url value='/v1/video/" + id + "'></c:url>",

				type : 'DELETE',

				success : function(responseVO) {

					if (responseVO.errorCode == 0) {

						// 刷新表格
						$('.table').bootstrapTable('refresh');
					}
				},

				error : function(error) {

					alert(error);
				}
			});

		}
		/*  批量删除 */
		function deleteSomeVideo(ids) {

			var list = $('.table').bootstrapTable('getSelections');

			if (list != null) {

				var idArray = new Array();
				// $.each(需要遍历的集合对象, function(索引，值){});
				$.each(list, function(index, value) {

					// 遍历 list 取出每一个的 id 放入 idArray 这个数组
					idArray[index] = value.id;
				});

				// 生成拼接后的 id 字符串
				var ids = idArray.join(",");

				$.ajax({

					url : "<c:url value='/v1/video/" + ids + "'></c:url>",

					type : 'DELETE',

					success : function(responseVO) {

						if (responseVO.errorCode == 0) {

							// 刷新表格
							$('.table').bootstrapTable('refresh');
						}
					},

					error : function(error) {

						alert(error);
					}
				});
			}
		}
		// ----------------- 弹出更新模态框，需要指定 id
		function showUpdateModal(id) {

			// 发送 ajax 请求获取指定商品的信息
			$.ajax({
				url : "<c:url value='/v1/video/get/" + id + "'></c:url>",

				success : function(responseVO) {

					if (responseVO.errorCode == 0) {

						// alert(JSON.stringify(responseVO.data));
						// 把商品信息放入输入框
						$('#update_name').val(responseVO.data.name);
						$('#update_length').val(responseVO.data.length);
						$('#update_speakerId').val(responseVO.data.speakerId);
						$('#update_courseId').val(responseVO.data.courseId);
						$('#update_play_count').val(responseVO.data.playCount);
						$('#update_cover_url').val(responseVO.data.coverUrl);
						$('#update_video_url').val(responseVO.data.videoUrl);
						$('#update_describe').val(responseVO.data.describe);

						$('#update_id').val(responseVO.data.id);

						// 弹出模态框
						$('#modal_update').modal('show');
					}
				},

				error : function(error) {

					alert(error);
				}
			});
		}
// 展示更新模态框 
//function showUpdateModal() {
	//触发模态框的同时调用此方法  
	/* var show=function(obj) { 
		alert('000');
	    var id = $(obj).attr("id");  
	    //id没进来 
	    //获取表格中的一行数据  
	    var name = document.getElementById("table").rows[id].cells[0].innerText; 
	    var courseId = document.getElementById("table").rows[id].cells[1].innerText;  
	    var speakerId = document.getElementById("table").rows[id].cells[2].innerText;  
	    var length = document.getElementById("table").rows[id].cells[3].innerText;  
	    var playCount = document.getElementById("table").rows[id].cells[3].innerText;  
	    //向模态框中传值  
	    $('#name').val(name);  
	    $('#courseId').val(courseId);  
	    $('#speakerId').val(speakerId);  
	    $('#length').val(length);  
	    $('#playCount').val(playCount);  
	  	 alert('bbb');
	   $('#modal_update').modal('show')
	}  */
	
	//$('#modal_update').modal('show') 
//}

	/* 展示详情 */
	function showDetailModal(id) {

		// 发送 ajax 请求获取指定商品的信息
		$.ajax({
			url : "<c:url value='/v1/video/get/" + id + "'></c:url>",

			success : function(responseVO) {

				if (responseVO.errorCode == 0) {
//alert(responseVO.data)
					//alert(JSON.stringify(responseVO.data));
					// 把商品信息放入输入框
					$('#detail_name').val(responseVO.data.name);
					$('#detail_length').val(responseVO.data.length);
					$('#detail_subject').val(responseVO.data.subjectId);
					$('#detail_course').val(responseVO.data.courseId);
					$('#detail_play_count').val(responseVO.data.playCount);
					$('#detail_cover_url').val(responseVO.data.coverUrl);
					$('#detail_video_url').val(responseVO.data.videoUrl);
					$('#detail_describe').val(responseVO.data.describe);

					$('#detail_id').val(responseVO.data.id);

					// 弹出模态框
					$('#modal_detail').modal('show');
				}
			},

			error : function(error) {

				alert(error);
			}
		});
	}
	// ----------------- 更新商品
	function updateVideo() {
		// 获取输入的每一项的值
		var name = $('#update_name').val();
		var length = $('#update_length').val();
		var speakerId = $('#update_speakerId').val();
		var courseId = $('#update_courseId').val();
		var playCount = $('#update_play_count').val();
		var coverId = $('#update_cover_id').val();
		var videoId = $('#update_video_id').val();
		var describe = $('#update_describe').val();
		var coverUrl = $('#detail_cover_url').val();
		var videoUrl = $('#detail_video_url').val();

		var id = $('#update_id').val();

		// 使用 ajax 发送到服务器进行添加
		$.ajax({

			url : "<c:url value='/v1/video/update/" + id + "'></c:url>",

			type : 'PUT',

			data : JSON.stringify({
				'name' : name,
				'length' : length,
				'speakerId' : speakerId,
				'courseId' : courseId,
				'playCount' : playCount,
				'coverId' : coverId,
				'videoId' : videoId,
				'describe' : describe,
			}),

			dataType : 'json',

			contentType : 'application/json',

			success : function(responseVO) {

				if (responseVO.errorCode == 0) {

					// 添加成功，收回模态框
					$('#modal_update').modal('hide');

					// 刷新表格
					$('.table').bootstrapTable('refresh');
				}
			},

			error : function(error) {

				alert(error);
			}
		});
	}

		$(document).ready(
			function() {

			$('#speaker_select').change(function() {

				// 选择讲师后，自动刷新 table
				$('.table').bootstrapTable('refresh');
			})
			$('#course_select').change(function() {

				// 选择讲师后，自动刷新 table
				$('.table').bootstrapTable('refresh');
			})
			$('.table').bootstrapTable(
			  {
				toolbar : '#toolbar',

				url : '<c:url value="/v1/video/list"></c:url>',

				columns : [{
							checkbox : true
							},
							{
							 title : '标题',
							 field : 'name',
							 align : 'center',
							//sortable : true,
							editable : {
							           type : 'text',
									   title : '课程标题',
										validate : function(v) {
													if (!v)
													return '课程标题不能为空';
												}
											}
										},
										{
											title : '课程',
											field : 'courseName',
											align : 'center',
											sortable : true,
										},
										{
											title : '学科',
											field : 'subjectName',
											align : 'center',
											sortable : true,
										},
										{
											title : '讲师',
											field : "speakerName",
											align : 'center',
											sortable : true,
										},
										{
											title : '时长',
											field : 'length',
											align : 'center',
											sortable : true,
										},
										{
											title : '播放次数',
											field : 'playCount',
											align : 'center',
											sortable : true,
										},
										{
											field : 'id',
											title : '操作',
											align : 'center',

						formatter : function(
								value, row,
								index) {

							var detailButton = "<button class='btn btn-default ' type='button' onclick='showDetailModal("
									+ row.id
									+ ")'><span class='glyphicon glyphicon-eye-open'  aria-hidden='true'></span></button>";

							var updateButton = "&emsp;<button class='btn btn-default ' type='button' onclick='showUpdateModal(" 
										+ row.id
										+ ")'> <span class='glyphicon glyphicon-pencil'  aria-hidden='true'></span></button>"
							var deleteButton = "&emsp;<button class='btn btn-default ' type='button'  onclick='deleteVideo("
										+ row.id
										+ ")'><span class='glyphicon glyphicon-trash'  aria-hidden='true'></span> </button>"
								
							return detailButton
									+ updateButton
									+ deleteButton;
						}
					} ],

								cache : false,

								pagination : true,

								// 启用搜索
								search : true,
								// 模糊查询 
								strictSearch :false,
								//搜索框右置 
								searchAlign:'right',

								queryParams : function(params) {

									// 设置传递给服务器的数据
									// params 默认包含 offset，limit，search，sort，order

									// 新增参数 speakerId
									params['speakerId'] = $(
											"#speaker_select")
											.val();
									params['courseId'] = $(
											"#course_select")
											.val();

									return params;
								},

								sidePagination : 'server',

								pageSize : 5,

								pageList : [ 3, 5, 10 ],

								paginationLoop : false,

								paginationPreText : '上一页',

								paginationNextText : '下一页',

								dataField : "data",

								responseHandler : function(
										responseVO) {
									// 在ajax获取到数据，渲染表格之前，修改数据源  
									return {
										'total' : responseVO.data.count,
										'data' : responseVO.data.rows
									};
								},
								onEditableSave : function(
										field, row, oldValue,
										$el) {
										$.ajax({
												url : "<c:url value='/v1/video/update/" + row.id + "'></c:url>",
												type : 'PUT',
												// 415 是 contentType 没有设置对
												contentType : 'application/json',
												data : JSON.stringify(row),

												success : function(responseVO) {

												},

												error : function(error) {
													alert(error);
												},
											});
								},
							});
		});
</script>
</body>
</html>