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
					
					<form action="allrelationinfo/${msg }.do" name="Form" id="Form" method="post">
						<input type="hidden" name="ALLRELATIONINFO_ID" id="ALLRELATIONINFO_ID" value="${pd.ALLRELATIONINFO_ID}"/>
						<div id="zhongxin" style="padding-top: 13px;">
						<table id="table_report" class="table table-striped table-bordered table-hover">
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">数据日期:</td>
								<td><input type="text" name="DATA_DATE" id="DATA_DATE" value="${pd.DATA_DATE}" maxlength="8" placeholder="这里输入数据日期" title="数据日期" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">FROM节点所属系编码:</td>
								<td><input type="text" name="FROM_GROUP_CODE" id="FROM_GROUP_CODE" value="${pd.FROM_GROUP_CODE}" maxlength="30" placeholder="这里输入FROM节点所属系编码" title="FROM节点所属系编码" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">FROM节点所属系名称:</td>
								<td><input type="text" name="FROM_GROUP_NAME" id="FROM_GROUP_NAME" value="${pd.FROM_GROUP_NAME}" maxlength="300" placeholder="这里输入FROM节点所属系名称" title="FROM节点所属系名称" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">FROM节点证件类型:</td>
								<td><input type="text" name="FROM_MEMBER_CERT_TYPE" id="FROM_MEMBER_CERT_TYPE" value="${pd.FROM_MEMBER_CERT_TYPE}" maxlength="2" placeholder="这里输入FROM节点证件类型" title="FROM节点证件类型" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">FROM节点证件代码:</td>
								<td><input type="text" name="FROM_MEMBER_CERT_CODE" id="FROM_MEMBER_CERT_CODE" value="${pd.FROM_MEMBER_CERT_CODE}" maxlength="20" placeholder="这里输入FROM节点证件代码" title="FROM节点证件代码" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">FROM节点名称:</td>
								<td><input type="text" name="FROM_MEMBER_NAME" id="FROM_MEMBER_NAME" value="${pd.FROM_MEMBER_NAME}" maxlength="300" placeholder="这里输入FROM节点名称" title="FROM节点名称" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">FROM节点属性,预留字段，拼接字符串:</td>
								<td><input type="text" name="FROM_MEMBER_ATTR" id="FROM_MEMBER_ATTR" value="${pd.FROM_MEMBER_ATTR}" maxlength="20" placeholder="这里输入FROM节点属性,预留字段，拼接字符串" title="FROM节点属性,预留字段，拼接字符串" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">FROM节点类型,C-企业；P-个人:</td>
								<td><input type="text" name="FROM_MEMBER_TYPE" id="FROM_MEMBER_TYPE" value="${pd.FROM_MEMBER_TYPE}" maxlength="2" placeholder="这里输入FROM节点类型,C-企业；P-个人" title="FROM节点类型,C-企业；P-个人" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">TO节点所属系编码:</td>
								<td><input type="text" name="TO_GROUP_CODE" id="TO_GROUP_CODE" value="${pd.TO_GROUP_CODE}" maxlength="30" placeholder="这里输入TO节点所属系编码" title="TO节点所属系编码" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">TO节点所属系名称:</td>
								<td><input type="text" name="TO_GROUP_NAME" id="TO_GROUP_NAME" value="${pd.TO_GROUP_NAME}" maxlength="300" placeholder="这里输入TO节点所属系名称" title="TO节点所属系名称" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">TO节点证件类型:</td>
								<td><input type="text" name="TO_MEMBER_CERT_TYPE" id="TO_MEMBER_CERT_TYPE" value="${pd.TO_MEMBER_CERT_TYPE}" maxlength="2" placeholder="这里输入TO节点证件类型" title="TO节点证件类型" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">TO节点证件代码:</td>
								<td><input type="text" name="TO_MEMBER_CERT_CODE" id="TO_MEMBER_CERT_CODE" value="${pd.TO_MEMBER_CERT_CODE}" maxlength="20" placeholder="这里输入TO节点证件代码" title="TO节点证件代码" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">TO节点名称:</td>
								<td><input type="text" name="TO_MEMBER_NAME" id="TO_MEMBER_NAME" value="${pd.TO_MEMBER_NAME}" maxlength="30" placeholder="这里输入TO节点名称" title="TO节点名称" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">TO节点属性 预留字段，拼接字符串:</td>
								<td><input type="text" name="TO_MEMBER_ATTR" id="TO_MEMBER_ATTR" value="${pd.TO_MEMBER_ATTR}" maxlength="20" placeholder="这里输入TO节点属性 预留字段，拼接字符串" title="TO节点属性 预留字段，拼接字符串" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">TO节点类型 C-企业；P-个人:</td>
								<td><input type="text" name="TO_MEMBER_TYPE" id="TO_MEMBER_TYPE" value="${pd.TO_MEMBER_TYPE}" maxlength="2" placeholder="这里输入TO节点类型 C-企业；P-个人" title="TO节点类型 C-企业；P-个人" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">关系类型编码:</td>
								<td><input type="text" name="RELA_TYPE_CODE" id="RELA_TYPE_CODE" value="${pd.RELA_TYPE_CODE}" maxlength="6" placeholder="这里输入关系类型编码" title="关系类型编码" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">关系类型名称:</td>
								<td><input type="text" name="RELA_TYPE_NAME" id="RELA_TYPE_NAME" value="${pd.RELA_TYPE_NAME}" maxlength="10" placeholder="这里输入关系类型名称" title="关系类型名称" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">投资比例:</td>
								<td><input type="number" name="RELAINDICATORS" id="RELAINDICATORS" value="${pd.RELAINDICATORS}" maxlength="32" placeholder="这里输入投资比例" title="投资比例" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">关系建立时间:</td>
								<td><input type="text" name="RELA_DATE" id="RELA_DATE" value="${pd.RELA_DATE}" maxlength="8" placeholder="这里输入关系建立时间" title="关系建立时间" style="width:98%;"/></td>
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
			if($("#FROM_GROUP_CODE").val()==""){
				$("#FROM_GROUP_CODE").tips({
					side:3,
		            msg:'请输入FROM节点所属系编码',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#FROM_GROUP_CODE").focus();
			return false;
			}
			if($("#FROM_GROUP_NAME").val()==""){
				$("#FROM_GROUP_NAME").tips({
					side:3,
		            msg:'请输入FROM节点所属系名称',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#FROM_GROUP_NAME").focus();
			return false;
			}
			if($("#FROM_MEMBER_CERT_TYPE").val()==""){
				$("#FROM_MEMBER_CERT_TYPE").tips({
					side:3,
		            msg:'请输入FROM节点证件类型',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#FROM_MEMBER_CERT_TYPE").focus();
			return false;
			}
			if($("#FROM_MEMBER_CERT_CODE").val()==""){
				$("#FROM_MEMBER_CERT_CODE").tips({
					side:3,
		            msg:'请输入FROM节点证件代码',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#FROM_MEMBER_CERT_CODE").focus();
			return false;
			}
			if($("#FROM_MEMBER_NAME").val()==""){
				$("#FROM_MEMBER_NAME").tips({
					side:3,
		            msg:'请输入FROM节点名称',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#FROM_MEMBER_NAME").focus();
			return false;
			}
			if($("#FROM_MEMBER_ATTR").val()==""){
				$("#FROM_MEMBER_ATTR").tips({
					side:3,
		            msg:'请输入FROM节点属性,预留字段，拼接字符串',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#FROM_MEMBER_ATTR").focus();
			return false;
			}
			if($("#FROM_MEMBER_TYPE").val()==""){
				$("#FROM_MEMBER_TYPE").tips({
					side:3,
		            msg:'请输入FROM节点类型,C-企业；P-个人',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#FROM_MEMBER_TYPE").focus();
			return false;
			}
			if($("#TO_GROUP_CODE").val()==""){
				$("#TO_GROUP_CODE").tips({
					side:3,
		            msg:'请输入TO节点所属系编码',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#TO_GROUP_CODE").focus();
			return false;
			}
			if($("#TO_GROUP_NAME").val()==""){
				$("#TO_GROUP_NAME").tips({
					side:3,
		            msg:'请输入TO节点所属系名称',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#TO_GROUP_NAME").focus();
			return false;
			}
			if($("#TO_MEMBER_CERT_TYPE").val()==""){
				$("#TO_MEMBER_CERT_TYPE").tips({
					side:3,
		            msg:'请输入TO节点证件类型',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#TO_MEMBER_CERT_TYPE").focus();
			return false;
			}
			if($("#TO_MEMBER_CERT_CODE").val()==""){
				$("#TO_MEMBER_CERT_CODE").tips({
					side:3,
		            msg:'请输入TO节点证件代码',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#TO_MEMBER_CERT_CODE").focus();
			return false;
			}
			if($("#TO_MEMBER_NAME").val()==""){
				$("#TO_MEMBER_NAME").tips({
					side:3,
		            msg:'请输入TO节点名称',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#TO_MEMBER_NAME").focus();
			return false;
			}
			if($("#TO_MEMBER_ATTR").val()==""){
				$("#TO_MEMBER_ATTR").tips({
					side:3,
		            msg:'请输入TO节点属性 预留字段，拼接字符串',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#TO_MEMBER_ATTR").focus();
			return false;
			}
			if($("#TO_MEMBER_TYPE").val()==""){
				$("#TO_MEMBER_TYPE").tips({
					side:3,
		            msg:'请输入TO节点类型 C-企业；P-个人',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#TO_MEMBER_TYPE").focus();
			return false;
			}
			if($("#RELA_TYPE_CODE").val()==""){
				$("#RELA_TYPE_CODE").tips({
					side:3,
		            msg:'请输入关系类型编码',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#RELA_TYPE_CODE").focus();
			return false;
			}
			if($("#RELA_TYPE_NAME").val()==""){
				$("#RELA_TYPE_NAME").tips({
					side:3,
		            msg:'请输入关系类型名称',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#RELA_TYPE_NAME").focus();
			return false;
			}
			if($("#RELAINDICATORS").val()==""){
				$("#RELAINDICATORS").tips({
					side:3,
		            msg:'请输入投资比例',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#RELAINDICATORS").focus();
			return false;
			}
			if($("#RELA_DATE").val()==""){
				$("#RELA_DATE").tips({
					side:3,
		            msg:'请输入关系建立时间',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#RELA_DATE").focus();
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