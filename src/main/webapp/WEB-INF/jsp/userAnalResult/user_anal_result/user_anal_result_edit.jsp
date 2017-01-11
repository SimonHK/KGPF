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
					
					<form action="user_anal_result/${msg }.do" name="Form" id="Form" method="post">
						<input type="hidden" name="USER_ANAL_RESULT_ID" id="USER_ANAL_RESULT_ID" value="${pd.USER_ANAL_RESULT_ID}"/>
						<div id="zhongxin" style="padding-top: 13px;">
						<table id="table_report" class="table table-striped table-bordered table-hover">
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">保存结果ID:</td>
								<td><input type="text" name="RESULT_ID" id="RESULT_ID" value="${pd.RESULT_ID}" maxlength="100" placeholder="这里输入保存结果ID" title="保存结果ID" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">保存结果名称:</td>
								<td><input type="text" name="RESULT_NAME" id="RESULT_NAME" value="${pd.RESULT_NAME}" maxlength="300" placeholder="这里输入保存结果名称" title="保存结果名称" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">保存人编码:</td>
								<td><input type="text" name="RESULT_USER_CODE" id="RESULT_USER_CODE" value="${pd.RESULT_USER_CODE}" maxlength="20" placeholder="这里输入保存人编码" title="保存人编码" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">保存人名称:</td>
								<td><input type="text" name="RESULT_USER_NAME" id="RESULT_USER_NAME" value="${pd.RESULT_USER_NAME}" maxlength="100" placeholder="这里输入保存人名称" title="保存人名称" style="width:98%;"/></td>
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
								<td style="width:75px;text-align: right;padding-top: 13px;">保存时间:</td>
								<td><input class="span10 date-picker" name="RESULT_DATE" id="RESULT_DATE" value="${pd.RESULT_DATE}" type="text" data-date-format="yyyy-mm-dd" readonly="readonly" placeholder="保存时间" title="保存时间" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">FROM节点系编码:</td>
								<td><input type="text" name="FROM_GROUP_CODE" id="FROM_GROUP_CODE" value="${pd.FROM_GROUP_CODE}" maxlength="30" placeholder="这里输入FROM节点系编码" title="FROM节点系编码" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">FROM节点编码:</td>
								<td><input type="text" name="FROM_MEMBER_CODE" id="FROM_MEMBER_CODE" value="${pd.FROM_MEMBER_CODE}" maxlength="20" placeholder="这里输入FROM节点编码" title="FROM节点编码" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">FROM节点X值:</td>
								<td><input type="number" name="FROM_MEMBER_X" id="FROM_MEMBER_X" value="${pd.FROM_MEMBER_X}" maxlength="32" placeholder="这里输入FROM节点X值" title="FROM节点X值" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">FROM节点Y值:</td>
								<td><input type="number" name="FROM_MEMBER_Y" id="FROM_MEMBER_Y" value="${pd.FROM_MEMBER_Y}" maxlength="32" placeholder="这里输入FROM节点Y值" title="FROM节点Y值" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">FROM节点是否为系标志:</td>
								<td><input type="number" name="FROM_IS_GROUP" id="FROM_IS_GROUP" value="${pd.FROM_IS_GROUP}" maxlength="32" placeholder="这里输入FROM节点是否为系标志" title="FROM节点是否为系标志" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">TO节点系编码:</td>
								<td><input type="text" name="TO_GROUP_CODE" id="TO_GROUP_CODE" value="${pd.TO_GROUP_CODE}" maxlength="30" placeholder="这里输入TO节点系编码" title="TO节点系编码" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">TO节点编码:</td>
								<td><input type="text" name="TO_MEMBER_CODE" id="TO_MEMBER_CODE" value="${pd.TO_MEMBER_CODE}" maxlength="20" placeholder="这里输入TO节点编码" title="TO节点编码" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">TO节点X值:</td>
								<td><input type="number" name="TO_MEMBER_X" id="TO_MEMBER_X" value="${pd.TO_MEMBER_X}" maxlength="32" placeholder="这里输入TO节点X值" title="TO节点X值" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">TO节点Y值:</td>
								<td><input type="number" name="TO_MEMBER_Y" id="TO_MEMBER_Y" value="${pd.TO_MEMBER_Y}" maxlength="32" placeholder="这里输入TO节点Y值" title="TO节点Y值" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">TO节点是否为系标志:</td>
								<td><input type="number" name="TO_IS_GROUP" id="TO_IS_GROUP" value="${pd.TO_IS_GROUP}" maxlength="32" placeholder="这里输入TO节点是否为系标志" title="TO节点是否为系标志" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">关系类型编码:</td>
								<td><input type="text" name="RELA_TYPE_CODE" id="RELA_TYPE_CODE" value="${pd.RELA_TYPE_CODE}" maxlength="6" placeholder="这里输入关系类型编码" title="关系类型编码" style="width:98%;"/></td>
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
			if($("#RESULT_ID").val()==""){
				$("#RESULT_ID").tips({
					side:3,
		            msg:'请输入保存结果ID',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#RESULT_ID").focus();
			return false;
			}
			if($("#RESULT_NAME").val()==""){
				$("#RESULT_NAME").tips({
					side:3,
		            msg:'请输入保存结果名称',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#RESULT_NAME").focus();
			return false;
			}
			if($("#RESULT_USER_CODE").val()==""){
				$("#RESULT_USER_CODE").tips({
					side:3,
		            msg:'请输入保存人编码',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#RESULT_USER_CODE").focus();
			return false;
			}
			if($("#RESULT_USER_NAME").val()==""){
				$("#RESULT_USER_NAME").tips({
					side:3,
		            msg:'请输入保存人名称',
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
		            msg:'请输入保存时间',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#RESULT_DATE").focus();
			return false;
			}
			if($("#FROM_GROUP_CODE").val()==""){
				$("#FROM_GROUP_CODE").tips({
					side:3,
		            msg:'请输入FROM节点系编码',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#FROM_GROUP_CODE").focus();
			return false;
			}
			if($("#FROM_MEMBER_CODE").val()==""){
				$("#FROM_MEMBER_CODE").tips({
					side:3,
		            msg:'请输入FROM节点编码',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#FROM_MEMBER_CODE").focus();
			return false;
			}
			if($("#FROM_MEMBER_X").val()==""){
				$("#FROM_MEMBER_X").tips({
					side:3,
		            msg:'请输入FROM节点X值',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#FROM_MEMBER_X").focus();
			return false;
			}
			if($("#FROM_MEMBER_Y").val()==""){
				$("#FROM_MEMBER_Y").tips({
					side:3,
		            msg:'请输入FROM节点Y值',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#FROM_MEMBER_Y").focus();
			return false;
			}
			if($("#FROM_IS_GROUP").val()==""){
				$("#FROM_IS_GROUP").tips({
					side:3,
		            msg:'请输入FROM节点是否为系标志',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#FROM_IS_GROUP").focus();
			return false;
			}
			if($("#TO_GROUP_CODE").val()==""){
				$("#TO_GROUP_CODE").tips({
					side:3,
		            msg:'请输入TO节点系编码',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#TO_GROUP_CODE").focus();
			return false;
			}
			if($("#TO_MEMBER_CODE").val()==""){
				$("#TO_MEMBER_CODE").tips({
					side:3,
		            msg:'请输入TO节点编码',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#TO_MEMBER_CODE").focus();
			return false;
			}
			if($("#TO_MEMBER_X").val()==""){
				$("#TO_MEMBER_X").tips({
					side:3,
		            msg:'请输入TO节点X值',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#TO_MEMBER_X").focus();
			return false;
			}
			if($("#TO_MEMBER_Y").val()==""){
				$("#TO_MEMBER_Y").tips({
					side:3,
		            msg:'请输入TO节点Y值',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#TO_MEMBER_Y").focus();
			return false;
			}
			if($("#TO_IS_GROUP").val()==""){
				$("#TO_IS_GROUP").tips({
					side:3,
		            msg:'请输入TO节点是否为系标志',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#TO_IS_GROUP").focus();
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