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
					
					<form action="agroupmap/${msg }.do" name="Form" id="Form" method="post">
						<input type="hidden" name="AGROUPMAP_ID" id="AGROUPMAP_ID" value="${pd.AGROUPMAP_ID}"/>
						<div id="zhongxin" style="padding-top: 13px;">
						<table id="table_report" class="table table-striped table-bordered table-hover">
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">系编号:</td>
								<td><input type="number" name="GROUPID" id="GROUPID" value="${pd.GROUPID}" maxlength="32" placeholder="这里输入系编号" title="系编号" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">系名称:</td>
								<td><input type="text" name="GROUPNAME" id="GROUPNAME" value="${pd.GROUPNAME}" maxlength="255" placeholder="这里输入系名称" title="系名称" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">龙头企业:</td>
								<td><input type="text" name="GROUPCOMP" id="GROUPCOMP" value="${pd.GROUPCOMP}" maxlength="255" placeholder="这里输入龙头企业" title="龙头企业" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">实际控股人:</td>
								<td><input type="text" name="CONTROLLERPERSON" id="CONTROLLERPERSON" value="${pd.CONTROLLERPERSON}" maxlength="255" placeholder="这里输入实际控股人" title="实际控股人" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">成员数量:</td>
								<td><input type="number" name="PAPERCONT" id="PAPERCONT" value="${pd.PAPERCONT}" maxlength="32" placeholder="这里输入成员数量" title="成员数量" style="width:98%;"/></td>
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
			if($("#GROUPID").val()==""){
				$("#GROUPID").tips({
					side:3,
		            msg:'请输入系编号',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#GROUPID").focus();
			return false;
			}
			if($("#GROUPNAME").val()==""){
				$("#GROUPNAME").tips({
					side:3,
		            msg:'请输入系名称',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#GROUPNAME").focus();
			return false;
			}
			if($("#GROUPCOMP").val()==""){
				$("#GROUPCOMP").tips({
					side:3,
		            msg:'请输入龙头企业',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#GROUPCOMP").focus();
			return false;
			}
			if($("#CONTROLLERPERSON").val()==""){
				$("#CONTROLLERPERSON").tips({
					side:3,
		            msg:'请输入实际控股人',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#CONTROLLERPERSON").focus();
			return false;
			}
			if($("#PAPERCONT").val()==""){
				$("#PAPERCONT").tips({
					side:3,
		            msg:'请输入成员数量',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#PAPERCONT").focus();
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