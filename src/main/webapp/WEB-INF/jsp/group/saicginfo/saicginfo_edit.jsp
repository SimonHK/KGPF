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
					
					<form action="saicginfo/${msg }.do" name="Form" id="Form" method="post">
						<input type="hidden" name="SAICGINFO_ID" id="SAICGINFO_ID" value="${pd.SAICGINFO_ID}"/>
						<div id="zhongxin" style="padding-top: 13px;">
						<table id="table_report" class="table table-striped table-bordered table-hover">
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">数据日期:</td>
								<td><input class="span10 date-picker" name="DATA_DATE" id="DATA_DATE" value="${pd.DATA_DATE}" type="text" data-date-format="yyyy-mm-dd" readonly="readonly" placeholder="数据日期" title="数据日期" style="width:98%;"/></td>
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
								<td style="width:75px;text-align: right;padding-top: 13px;">龙头企业证件类型:</td>
								<td><input type="text" name="CORP_CHP_CERT_TYPE" id="CORP_CHP_CERT_TYPE" value="${pd.CORP_CHP_CERT_TYPE}" maxlength="2" placeholder="这里输入龙头企业证件类型" title="龙头企业证件类型" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">龙头企业证件代码:</td>
								<td><input type="text" name="CORP_CHP_CERT_CODE" id="CORP_CHP_CERT_CODE" value="${pd.CORP_CHP_CERT_CODE}" maxlength="20" placeholder="这里输入龙头企业证件代码" title="龙头企业证件代码" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">龙头企业名称:</td>
								<td><input type="text" name="CORP_CHP_NAME" id="CORP_CHP_NAME" value="${pd.CORP_CHP_NAME}" maxlength="300" placeholder="这里输入龙头企业名称" title="龙头企业名称" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">实际控制人证件类型:</td>
								<td><input type="text" name="CTRL_CERT_TYPE" id="CTRL_CERT_TYPE" value="${pd.CTRL_CERT_TYPE}" maxlength="2" placeholder="这里输入实际控制人证件类型" title="实际控制人证件类型" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">实际控制人证件代码:</td>
								<td><input type="text" name="CTRL_CERT_CODE" id="CTRL_CERT_CODE" value="${pd.CTRL_CERT_CODE}" maxlength="20" placeholder="这里输入实际控制人证件代码" title="实际控制人证件代码" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">实际控制人名称:</td>
								<td><input type="text" name="CTRL_NAME" id="CTRL_NAME" value="${pd.CTRL_NAME}" maxlength="300" placeholder="这里输入实际控制人名称" title="实际控制人名称" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">成员数量:</td>
								<td><input type="number" name="MEMBER_NUM" id="MEMBER_NUM" value="${pd.MEMBER_NUM}" maxlength="32" placeholder="这里输入成员数量" title="成员数量" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">系健康状况编码:</td>
								<td><input type="text" name="IS_HEALTH" id="IS_HEALTH" value="${pd.IS_HEALTH}" maxlength="2" placeholder="这里输入系健康状况编码" title="系健康状况编码" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">系健康状况名称:</td>
								<td><input type="text" name="IS_HEALTH_CN" id="IS_HEALTH_CN" value="${pd.IS_HEALTH_CN}" maxlength="10" placeholder="这里输入系健康状况名称" title="系健康状况名称" style="width:98%;"/></td>
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
			if($("#CORP_CHP_CERT_TYPE").val()==""){
				$("#CORP_CHP_CERT_TYPE").tips({
					side:3,
		            msg:'请输入龙头企业证件类型',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#CORP_CHP_CERT_TYPE").focus();
			return false;
			}
			if($("#CORP_CHP_CERT_CODE").val()==""){
				$("#CORP_CHP_CERT_CODE").tips({
					side:3,
		            msg:'请输入龙头企业证件代码',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#CORP_CHP_CERT_CODE").focus();
			return false;
			}
			if($("#CORP_CHP_NAME").val()==""){
				$("#CORP_CHP_NAME").tips({
					side:3,
		            msg:'请输入龙头企业名称',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#CORP_CHP_NAME").focus();
			return false;
			}
			if($("#CTRL_CERT_TYPE").val()==""){
				$("#CTRL_CERT_TYPE").tips({
					side:3,
		            msg:'请输入实际控制人证件类型',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#CTRL_CERT_TYPE").focus();
			return false;
			}
			if($("#CTRL_CERT_CODE").val()==""){
				$("#CTRL_CERT_CODE").tips({
					side:3,
		            msg:'请输入实际控制人证件代码',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#CTRL_CERT_CODE").focus();
			return false;
			}
			if($("#CTRL_NAME").val()==""){
				$("#CTRL_NAME").tips({
					side:3,
		            msg:'请输入实际控制人名称',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#CTRL_NAME").focus();
			return false;
			}
			if($("#MEMBER_NUM").val()==""){
				$("#MEMBER_NUM").tips({
					side:3,
		            msg:'请输入成员数量',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#MEMBER_NUM").focus();
			return false;
			}
			if($("#IS_HEALTH").val()==""){
				$("#IS_HEALTH").tips({
					side:3,
		            msg:'请输入系健康状况编码',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#IS_HEALTH").focus();
			return false;
			}
			if($("#IS_HEALTH_CN").val()==""){
				$("#IS_HEALTH_CN").tips({
					side:3,
		            msg:'请输入系健康状况名称',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#IS_HEALTH_CN").focus();
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