<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html>
<html lang="en">
	<head>
	<base href="<%=basePath%>">
	<!-- 下拉框 -->
	<link rel="stylesheet" href="static/ace/css/chosen.css" />
	<!-- jsp文件头和头部 -->
	<%@ include file="../../system/index/top.jsp"%>
	<!-- 日期框 -->
	<link rel="stylesheet" href="static/ace/css/datepicker.css" />
</head>
<body class="no-skin">
<!-- /section:basics/navbar.layout -->
<div class="main-container" id="main-container">
	<!-- /section:basics/sidebar -->
	<div class="main-content">
		<div class="main-content-inner">
			<div class="page-content">
				<div class="row">
					<div class="col-xs-12">
					
					<form action="group_region_info/${msg }.do" name="Form" id="Form" method="post">
						<input type="hidden" name="GROUP_REGION_INFO_ID" id="GROUP_REGION_INFO_ID" value="${pd.GROUP_REGION_INFO_ID}"/>
						<div id="zhongxin" style="padding-top: 13px;">
						<table id="table_report" class="table table-striped table-bordered table-hover">
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">数据日期:</td>
								<td><input type="text" name="DATA_DATE" id="DATA_DATE" value="${pd.DATA_DATE}" maxlength="8" placeholder="这里输入数据日期" title="数据日期" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">系编号:</td>
								<td><input type="text" name="GROUP_CODE" id="GROUP_CODE" value="${pd.GROUP_CODE}" maxlength="30" placeholder="这里输入系编号" title="系编号" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">系名称:</td>
								<td><input type="text" name="GROUP_NAME" id="GROUP_NAME" value="${pd.GROUP_NAME}" maxlength="300" placeholder="这里输入系名称" title="系名称" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">集中地区国标编码:</td>
								<td><input type="text" name="REGION_S_CODE" id="REGION_S_CODE" value="${pd.REGION_S_CODE}" maxlength="6" placeholder="这里输入集中地区国标编码" title="集中地区国标编码" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">集中地区国标名称:</td>
								<td><input type="text" name="REGION_S_NAME" id="REGION_S_NAME" value="${pd.REGION_S_NAME}" maxlength="10" placeholder="这里输入集中地区国标名称" title="集中地区国标名称" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">集中地区级别:</td>
								<td><input type="number" name="REGION_LEVEL" id="REGION_LEVEL" value="${pd.REGION_LEVEL}" maxlength="32" placeholder="这里输入集中地区级别" title="集中地区级别" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="text-align: center;" colspan="10">
									<a class="btn btn-mini btn-primary" onclick="save();">保存</a>
									<a class="btn btn-mini btn-danger" onclick="top.Dialog.close();">取消</a>
								</td>
							</tr>
						</table>
						</div>
						<div id="zhongxin2" class="center" style="display:none"><br/><br/><br/><br/><br/><img src="static/images/jiazai.gif" /><br/><h4 class="lighter block green">提交中...</h4></div>
					</form>
					</div>
					<!-- /.col -->
				</div>
				<!-- /.row -->
			</div>
			<!-- /.page-content -->
		</div>
	</div>
	<!-- /.main-content -->
</div>
<!-- /.main-container -->


	<!-- 页面底部js¨ -->
	<%@ include file="../../system/index/foot.jsp"%>
	<!-- 下拉框 -->
	<script src="static/ace/js/chosen.jquery.js"></script>
	<!-- 日期框 -->
	<script src="static/ace/js/date-time/bootstrap-datepicker.js"></script>
	<!--提示框-->
	<script type="text/javascript" src="static/js/jquery.tips.js"></script>
		<script type="text/javascript">
		$(top.hangge());
		//保存
		function save(){
			if($("#DATA_DATE").val()==""){
				$("#DATA_DATE").tips({
					side:3,
		            msg:'请输入数据日期',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#DATA_DATE").focus();
			return false;
			}
			if($("#GROUP_CODE").val()==""){
				$("#GROUP_CODE").tips({
					side:3,
		            msg:'请输入系编号',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#GROUP_CODE").focus();
			return false;
			}
			if($("#GROUP_NAME").val()==""){
				$("#GROUP_NAME").tips({
					side:3,
		            msg:'请输入系名称',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#GROUP_NAME").focus();
			return false;
			}
			if($("#REGION_S_CODE").val()==""){
				$("#REGION_S_CODE").tips({
					side:3,
		            msg:'请输入集中地区国标编码',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#REGION_S_CODE").focus();
			return false;
			}
			if($("#REGION_S_NAME").val()==""){
				$("#REGION_S_NAME").tips({
					side:3,
		            msg:'请输入集中地区国标名称',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#REGION_S_NAME").focus();
			return false;
			}
			if($("#REGION_LEVEL").val()==""){
				$("#REGION_LEVEL").tips({
					side:3,
		            msg:'请输入集中地区级别',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#REGION_LEVEL").focus();
			return false;
			}
			$("#Form").submit();
			$("#zhongxin").hide();
			$("#zhongxin2").show();
		}
		
		$(function() {
			//日期框
			$('.date-picker').datepicker({autoclose: true,todayHighlight: true});
		});
		</script>
</body>
</html>