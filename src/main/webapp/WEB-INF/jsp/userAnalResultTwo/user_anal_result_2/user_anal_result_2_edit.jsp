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
					
					<form action="user_anal_result_2/${msg }.do" name="Form" id="Form" method="post">
						<input type="hidden" name="USER_ANAL_RESULT_2_ID" id="USER_ANAL_RESULT_2_ID" value="${pd.USER_ANAL_RESULT_2_ID}"/>
						<div id="zhongxin" style="padding-top: 13px;">
						<table id="table_report" class="table table-striped table-bordered table-hover">
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">用户编码:</td>
								<td><input type="text" name="RESULT_USER_CODE" id="RESULT_USER_CODE" value="${pd.RESULT_USER_CODE}" maxlength="20" placeholder="这里输入用户编码" title="用户编码" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">用户名称:</td>
								<td><input type="text" name="RESULT_USER_NAME" id="RESULT_USER_NAME" value="${pd.RESULT_USER_NAME}" maxlength="100" placeholder="这里输入用户名称" title="用户名称" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">所属机构编码:</td>
								<td><input type="text" name="RESULT_BRANCH_CODE" id="RESULT_BRANCH_CODE" value="${pd.RESULT_BRANCH_CODE}" maxlength="20" placeholder="这里输入所属机构编码" title="所属机构编码" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">所属机构名称:</td>
								<td><input type="text" name="RESULT_BRANCH_NAME" id="RESULT_BRANCH_NAME" value="${pd.RESULT_BRANCH_NAME}" maxlength="300" placeholder="这里输入所属机构名称" title="所属机构名称" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">添加关注时间时间:</td>
								<td><input class="span10 date-picker" name="RESULT_DATE" id="RESULT_DATE" value="${pd.RESULT_DATE}" type="text" data-date-format="yyyy-mm-dd" readonly="readonly" placeholder="添加关注时间时间" title="添加关注时间时间" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">关注的系编码:</td>
								<td><input type="text" name="GROUP_CODE" id="GROUP_CODE" value="${pd.GROUP_CODE}" maxlength="30" placeholder="这里输入关注的系编码" title="关注的系编码" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">关注的系名称:</td>
								<td><input type="text" name="GROUP_NAME" id="GROUP_NAME" value="${pd.GROUP_NAME}" maxlength="300" placeholder="这里输入关注的系名称" title="关注的系名称" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">是否移除:</td>
								<td><input type="number" name="IS_DELETE" id="IS_DELETE" value="${pd.IS_DELETE}" maxlength="32" placeholder="这里输入是否移除" title="是否移除" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">群类型:</td>
								<td><input type="text" name="GROUP_TYPE" id="GROUP_TYPE" value="${pd.GROUP_TYPE}" maxlength="10" placeholder="这里输入群类型" title="群类型" style="width:98%;"/></td>
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
			if($("#RESULT_USER_CODE").val()==""){
				$("#RESULT_USER_CODE").tips({
					side:3,
		            msg:'请输入用户编码',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#RESULT_USER_CODE").focus();
			return false;
			}
			if($("#RESULT_USER_NAME").val()==""){
				$("#RESULT_USER_NAME").tips({
					side:3,
		            msg:'请输入用户名称',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#RESULT_USER_NAME").focus();
			return false;
			}
			if($("#RESULT_BRANCH_CODE").val()==""){
				$("#RESULT_BRANCH_CODE").tips({
					side:3,
		            msg:'请输入所属机构编码',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#RESULT_BRANCH_CODE").focus();
			return false;
			}
			if($("#RESULT_BRANCH_NAME").val()==""){
				$("#RESULT_BRANCH_NAME").tips({
					side:3,
		            msg:'请输入所属机构名称',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#RESULT_BRANCH_NAME").focus();
			return false;
			}
			if($("#RESULT_DATE").val()==""){
				$("#RESULT_DATE").tips({
					side:3,
		            msg:'请输入添加关注时间时间',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#RESULT_DATE").focus();
			return false;
			}
			if($("#GROUP_CODE").val()==""){
				$("#GROUP_CODE").tips({
					side:3,
		            msg:'请输入关注的系编码',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#GROUP_CODE").focus();
			return false;
			}
			if($("#GROUP_NAME").val()==""){
				$("#GROUP_NAME").tips({
					side:3,
		            msg:'请输入关注的系名称',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#GROUP_NAME").focus();
			return false;
			}
			if($("#IS_DELETE").val()==""){
				$("#IS_DELETE").tips({
					side:3,
		            msg:'请输入是否移除',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#IS_DELETE").focus();
			return false;
			}
			if($("#GROUP_TYPE").val()==""){
				$("#GROUP_TYPE").tips({
					side:3,
		            msg:'请输入群类型',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#GROUP_TYPE").focus();
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