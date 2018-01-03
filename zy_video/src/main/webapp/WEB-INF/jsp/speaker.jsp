<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- 上述3个meta标签*必须*放在最前面，任何其他内容都*必须*跟随其后！ -->
<title>公开课</title>

<!-- Bootstrap -->
<link href='<c:url value="/css/bootstrap.min.css"></c:url>'
	rel="stylesheet">
<link href='<c:url value="/css/bootstrap-table.min.css"></c:url>'
	rel="stylesheet">
<link href='<c:url value="/css/bootstrap-editable.css"></c:url>'
	rel="stylesheet">
<!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
<!--[if lt IE 9]>
      <script src="https://cdn.bootcss.com/html5shiv/3.7.3/html5shiv.min.js"></script>
      <script src="https://cdn.bootcss.com/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
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
						<li>
							<a href='<c:url value="/video"></c:url>'> 视频管理 </a>
						</li>
						<li class="active">
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
		<div class="panel  panel-primary">
			<!-- Default panel contents -->
			<div class="panel-heading">讲师管理</div>
				
			<div id="toolbar" class="btn-group" role="group" aria-label="...">
			
			</div>
				<button type="button" id="btn_add" class="btn btn-default"
					onclick="showAddModal()">
					<span class="glyphicon glyphicon-plus" aria-hidden="true"></span>
					添加
				</button>
				<button type="button" id="btn_delete" class="btn btn-default"
					onclick="deleteSomeSpeaker()">
					<span class="glyphicon glyphicon-trash" aria-hidden="true"></span>
					删除
				</button>


			<!-- Table -->
			<table class="table"></table>
		</div>
	</div>

	<div class="modal fade" id="modal_add" tabindex="-1" role="dialog"
		aria-labelledby="exampleModalLabel">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<h4 class="modal-title" id="exampleModalLabel">添加学科</h4>
				</div>
				<div class="modal-body">
					<form>
						<div class="form-group">
							<label for="recipient-name" class="control-label">姓名:</label>
							<input type="text" class="form-control" id="add_name">
						</div>
					</form>
				</div>
				<div class="modal-body">
					<form>
						<div class="form-group">
							<label for="recipient-name" class="control-label">职位:</label>
							<input type="text" class="form-control" id="add_job">
						</div>
					</form>
				</div>
				<div class="modal-body">
					<form>
						<div class="form-group">
							<label for="recipient-name" class="control-label">头像地址:</label>
							<input type="text" class="form-control" id="add_image_url">
						</div>
					</form>
				</div>
				<div class="modal-body">
					<form>
						<div class="form-group">
							<label for="recipient-name" class="control-label">简介:</label>
							<input type="text" class="form-control" id="add_describe">
						</div>
					</form>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
					<button type="button" class="btn btn-primary"
						onclick="addSpeaker()">添加</button>
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
					<h4 class="modal-title" id="exampleModalLabel">更新学科</h4>
				</div>
				<div class="modal-body">
					<form>
						<input type="hidden" id="update_id">

						<div class="form-group">
							<label for="recipient-name" class="control-label">名字：</label>
							<input type="text" class="form-control" id="update_name">
						</div>
						<div class="form-group">
							<label for="recipient-name" class="control-label">职位：</label>
							<input type="text" class="form-control" id="update_job">
						</div>
						<div class="form-group">
							<label for="recipient-name" class="control-label">头像地址：</label>
							<input type="text" class="form-control" id="update_image_url">
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
						onclick="updateSpeaker()">更新</button>
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

		// ----------------- 弹出添加模态框
		function showAddModal() {

			// 清空已经输入的内容
			// 选择器可以连接，进行多个条件限制
			// eg：选中 id = modal_add 标签内的 class = form-control 的标签
			$('#modal_add .form-control').val("");

			// 弹出模态框
			$('#modal_add').modal('show');
		}

		function addSpeaker() {
			var name = $('#add_name').val();
			var job = $('#add_job').val();
			var imageUrl = $('#add_image_url').val();
			var describe = $('#add_describe').val();

			$.ajax({

				url : '<c:url value="/v1/speaker/add"></c:url>',

				type : 'POST',

				data : JSON.stringify({
					'name' : name,
					'job' : job,
					'imageUrl' : imageUrl,
					'describe' : describe,

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

		function deleteSpeaker(id) {

			$.ajax({

				url : "<c:url value='/v1/speaker/" + id + "'></c:url>",

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
		function deleteSomeSpeaker(ids) {

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

					url : "<c:url value='/v1/speaker/" + ids + "'></c:url>",

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
				url : "<c:url value='/v1/speaker/get/" + id + "'></c:url>",

				success : function(responseVO) {

					if (responseVO.errorCode == 0) {

						// alert(JSON.stringify(responseVO.data));
						// 把商品信息放入输入框
						$('#update_name').val(responseVO.data.name);
						$('#update_job').val(responseVO.data.job);
						$('#update_image_url').val(responseVO.data.imageUrl);
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
		// ----------------- 更新商品
		function updateSpeaker() {
			// 获取输入的每一项的值
			var name = $('#update_name').val();
			var job = $('#update_job').val();
			var imageUrl = $('#update_image_url').val();
			var describe = $('#update_describe').val();

			var id = $('#update_id').val();

			// 使用 ajax 发送到服务器进行添加                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      
			$.ajax({

				url : "<c:url value='/v1/speaker/update/" + id + "'></c:url>",

				type : 'PUT',

				data : JSON.stringify({
					'name' : name,
					'job' : job,
					'imageUrl' : imageUrl,
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
$(document)
		.ready(
				function() {
					$('.table')
							.bootstrapTable(
			{
				/* toolbar : '#toolbar', */

				url : '<c:url value="/v1/speaker/list"></c:url>',

				columns : [
						{
							checkbox : true
						},
						{
							field : 'imageUrl',
							title : '头像',
							formatter:function(value,row,index){
								return '<img src='+value+' width="70px" height="74px">';
							}
						},
						{
							field : 'name',
							title : '名称',
							editable : {
								type : 'text',
								title : '讲师名称',
								validate : function(
										v) {
									if (!v)
										return '课程标题不能为空';

								}
							}
						},
						{
							field : 'job',
							title : '职位',
						},
						{
							field : 'describe',
							title : '简介',
						},
						{
							field : 'id',
							title : '操作',
							align : 'center',

							formatter : function(
									value, row,
									index) {
										var updateButton = "&emsp;<button class='btn btn-default ' type='button' onclick='showUpdateModal(" 
											+ row.id
											+ ")'> <span class='glyphicon glyphicon-pencil'  aria-hidden='true'></span></button>"
								var deleteButton = "&emsp;<button class='btn btn-default ' type='button'  onclick='deleteVideo("
											+ row.id
											+ ")'><span class='glyphicon glyphicon-trash'  aria-hidden='true'></span> </button>"
									

								return updateButton
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
				searchAlign:'left',

				sidePagination : 'server',

				pageSize : 3,

				pageList : [ 3, 5, 10 ],

				paginationLoop : false,

				paginationPreText : '上一页',

				paginationNextText : '下一页',

				dataField : 'data',

				search : true,
				
				/* queryParams : function(params) {

					// 设置传递给服务器的数据
					// params 默认包含 offset，limit，search，sort，order

					// 新增参数 speakerId
					params['speakerId'] = $(
							"#speaker_select")
							.val();

					return params;
				}, */

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
					$
							.ajax({
								url : "<c:url value='/v1/speaker/update/" + row.id + "'></c:url>",
								type : 'PUT',

								// 415 是 contentType 没有设置对
								contentType : 'application/json',
								data : JSON
										.stringify(row),

								success : function(
										responseVO) {

									alert("===============");
								},

								error : function(
										error) {

									alert("换句话说家");
								},
							});
				},
									});
				});
	</script>
</body>
</html>