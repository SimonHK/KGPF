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
					
					<form action="groupmemberinfo/${msg }.do" name="Form" id="Form" method="post">
						<input type="hidden" name="GROUPMEMBERINFO_ID" id="GROUPMEMBERINFO_ID" value="${pd.GROUPMEMBERINFO_ID}"/>
						<div id="zhongxin" style="padding-top: 13px;">
						<table id="table_report" class="table table-striped table-bordered table-hover">
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">数据日期:</td>
								<td><input type="text" name="DATA_DATE" id="DATA_DATE" value="${pd.DATA_DATE}" maxlength="255" placeholder="这里输入数据日期" title="数据日期" style="width:98%;"/></td>
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
								<td style="width:75px;text-align: right;padding-top: 13px;">成员证件类型:</td>
								<td><input type="text" name="MEMBER_CERT_TYPE" id="MEMBER_CERT_TYPE" value="${pd.MEMBER_CERT_TYPE}" maxlength="2" placeholder="这里输入成员证件类型" title="成员证件类型" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">成员证件代码:</td>
								<td><input type="text" name="MEMBER_CERT_CODE" id="MEMBER_CERT_CODE" value="${pd.MEMBER_CERT_CODE}" maxlength="20" placeholder="这里输入成员证件代码" title="成员证件代码" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">成员名称:</td>
								<td><input type="text" name="MEMBER_NAME" id="MEMBER_NAME" value="${pd.MEMBER_NAME}" maxlength="300" placeholder="这里输入成员名称" title="成员名称" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">成员属性；C-企业，P-个人:</td>
								<td><input type="text" name="MEMBER_ATTR" id="MEMBER_ATTR" value="${pd.MEMBER_ATTR}" maxlength="2" placeholder="这里输入成员属性；C-企业，P-个人" title="成员属性；C-企业，P-个人" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">成员企业类型   1-龙头企业；2-核心企业；3-一般企业:</td>
								<td><input type="number" name="MEMBER_TYPE" id="MEMBER_TYPE" value="${pd.MEMBER_TYPE}" maxlength="32" placeholder="这里输入成员企业类型   1-龙头企业；2-核心企业；3-一般企业" title="成员企业类型   1-龙头企业；2-核心企业；3-一般企业" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">成员层次:</td>
								<td><input type="number" name="MEMBER_LEVEL" id="MEMBER_LEVEL" value="${pd.MEMBER_LEVEL}" maxlength="32" placeholder="这里输入成员层次" title="成员层次" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">成员企业类型 ， 股份公司、其他。:</td>
								<td><input type="number" name="MEMBER_CORP_LEVEL" id="MEMBER_CORP_LEVEL" value="${pd.MEMBER_CORP_LEVEL}" maxlength="32" placeholder="这里输入成员企业类型 ， 股份公司、其他。" title="成员企业类型 ， 股份公司、其他。" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">成员企业工商登记状态	:</td>
								<td><input type="number" name="MEMBER_STATUS" id="MEMBER_STATUS" value="${pd.MEMBER_STATUS}" maxlength="32" placeholder="这里输入成员企业工商登记状态	" title="成员企业工商登记状态	" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">成员企业工商注册资金	:</td>
								<td><input type="number" name="MEMBER_REGI_CAP" id="MEMBER_REGI_CAP" value="${pd.MEMBER_REGI_CAP}" maxlength="32" placeholder="这里输入成员企业工商注册资金	" title="成员企业工商注册资金	" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">成员企业工商注册时间	:</td>
								<td><input type="text" name="MEMBER_ES_DATE" id="MEMBER_ES_DATE" value="${pd.MEMBER_ES_DATE}" maxlength="8" placeholder="这里输入成员企业工商注册时间	" title="成员企业工商注册时间	" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">成员企业所属行业国标编码，暂是保留小类，待工商数据出来后最后确定:</td>
								<td><input type="text" name="MEMBER_TRADE_CODE" id="MEMBER_TRADE_CODE" value="${pd.MEMBER_TRADE_CODE}" maxlength="6" placeholder="这里输入成员企业所属行业国标编码，暂是保留小类，待工商数据出来后最后确定" title="成员企业所属行业国标编码，暂是保留小类，待工商数据出来后最后确定" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">成员企业所属行业国标名称:</td>
								<td><input type="text" name="MEMBER_TRADE_NAME" id="MEMBER_TRADE_NAME" value="${pd.MEMBER_TRADE_NAME}" maxlength="300" placeholder="这里输入成员企业所属行业国标名称" title="成员企业所属行业国标名称" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">成员企业所属地区国标编码，暂时到市级别:</td>
								<td><input type="text" name="MEMBER_REGION_CODE" id="MEMBER_REGION_CODE" value="${pd.MEMBER_REGION_CODE}" maxlength="6" placeholder="这里输入成员企业所属地区国标编码，暂时到市级别" title="成员企业所属地区国标编码，暂时到市级别" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">成员企业所属地区国标名称:</td>
								<td><input type="text" name="MEMBER_REGION_NAME" id="MEMBER_REGION_NAME" value="${pd.MEMBER_REGION_NAME}" maxlength="10" placeholder="这里输入成员企业所属地区国标名称" title="成员企业所属地区国标名称" style="width:98%;"/></td>
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
			if($("#MEMBER_CERT_TYPE").val()==""){
				$("#MEMBER_CERT_TYPE").tips({
					side:3,
		            msg:'请输入成员证件类型',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#MEMBER_CERT_TYPE").focus();
			return false;
			}
			if($("#MEMBER_CERT_CODE").val()==""){
				$("#MEMBER_CERT_CODE").tips({
					side:3,
		            msg:'请输入成员证件代码',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#MEMBER_CERT_CODE").focus();
			return false;
			}
			if($("#MEMBER_NAME").val()==""){
				$("#MEMBER_NAME").tips({
					side:3,
		            msg:'请输入成员名称',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#MEMBER_NAME").focus();
			return false;
			}
			if($("#MEMBER_ATTR").val()==""){
				$("#MEMBER_ATTR").tips({
					side:3,
		            msg:'请输入成员属性；C-企业，P-个人',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#MEMBER_ATTR").focus();
			return false;
			}
			if($("#MEMBER_TYPE").val()==""){
				$("#MEMBER_TYPE").tips({
					side:3,
		            msg:'请输入成员企业类型   1-龙头企业；2-核心企业；3-一般企业',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#MEMBER_TYPE").focus();
			return false;
			}
			if($("#MEMBER_LEVEL").val()==""){
				$("#MEMBER_LEVEL").tips({
					side:3,
		            msg:'请输入成员层次',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#MEMBER_LEVEL").focus();
			return false;
			}
			if($("#MEMBER_CORP_LEVEL").val()==""){
				$("#MEMBER_CORP_LEVEL").tips({
					side:3,
		            msg:'请输入成员企业类型 ， 股份公司、其他。',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#MEMBER_CORP_LEVEL").focus();
			return false;
			}
			if($("#MEMBER_STATUS").val()==""){
				$("#MEMBER_STATUS").tips({
					side:3,
		            msg:'请输入成员企业工商登记状态	',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#MEMBER_STATUS").focus();
			return false;
			}
			if($("#MEMBER_REGI_CAP").val()==""){
				$("#MEMBER_REGI_CAP").tips({
					side:3,
		            msg:'请输入成员企业工商注册资金	',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#MEMBER_REGI_CAP").focus();
			return false;
			}
			if($("#MEMBER_ES_DATE").val()==""){
				$("#MEMBER_ES_DATE").tips({
					side:3,
		            msg:'请输入成员企业工商注册时间	',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#MEMBER_ES_DATE").focus();
			return false;
			}
			if($("#MEMBER_TRADE_CODE").val()==""){
				$("#MEMBER_TRADE_CODE").tips({
					side:3,
		            msg:'请输入成员企业所属行业国标编码，暂是保留小类，待工商数据出来后最后确定',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#MEMBER_TRADE_CODE").focus();
			return false;
			}
			if($("#MEMBER_TRADE_NAME").val()==""){
				$("#MEMBER_TRADE_NAME").tips({
					side:3,
		            msg:'请输入成员企业所属行业国标名称',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#MEMBER_TRADE_NAME").focus();
			return false;
			}
			if($("#MEMBER_REGION_CODE").val()==""){
				$("#MEMBER_REGION_CODE").tips({
					side:3,
		            msg:'请输入成员企业所属地区国标编码，暂时到市级别',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#MEMBER_REGION_CODE").focus();
			return false;
			}
			if($("#MEMBER_REGION_NAME").val()==""){
				$("#MEMBER_REGION_NAME").tips({
					side:3,
		            msg:'请输入成员企业所属地区国标名称',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#MEMBER_REGION_NAME").focus();
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