<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>">
<title>企业人力资源管理系统--密码修改详细查看</title>
<link rel="stylesheet" type="text/css" href="styles.css">
<script language="javascript" type="text/javascript"
	src="js/My97DatePicker/WdatePicker.js"></script>
</head>
<body>
	<form action="manager_show.action" method="post">
		<table width="100%" height="100%" border="0" cellpadding="0"
			cellspacing="0">
			<tr>
				<td align="center">

					<table width="801" height="48" border="0" cellpadding="0"
						cellspacing="0" background="images/center1.jpg">
						<tr>
							<td valign="top">
								<table width="494">
									<tr>
										<td width="45" height="25">&nbsp;</td>
										<td width="437" valign="bottom"><font color="#66583D"><b>系统管理</b>
										</font>&gt; <font color="#FF0000">详细查看</font></td>
									</tr>
								</table>
							</td>
						</tr>
					</table>
					<table width="801" height="436" border="0" cellpadding="0"
						cellspacing="0" background="images/center2.jpg">
						<tr>
							<td height="436" valign="top" align="center">
								<table width="355" border="1" cellpadding="1" cellspacing="1"
									bordercolor="#FFFFFF" bgcolor="66583D">
									<tr>
										<td><input type="hidden" name="id" value="${manager.id}" />
										</td>
									</tr>
									<tr>
										<th width="86" height="30" class="word_white">用户名：</th>
										<td width="150" bgcolor="#FFFFFF"><input type="text"
											name="account" value="${manager.account}" /></td>
									</tr>
									<tr>
										<th width="86" height="30" class="word_white">密码：</th>
										<td width="150" bgcolor="#FFFFFF"><input type="text"
											name="pwd" value="${manager.pwd}" /></td>
									</tr>
									<tr>
										<th width="86" height="30" class="word_white">管理级别：</th>
										<td width="150" bgcolor="#FFFFFF"><input type="text"
											name="managerLevel" value="${manager.managerLevel}" /></td>
									</tr>
<!-- 									<tr> -->
<!-- 									   <th width="86" height="30" class="word_white">管理员图片：</th> -->
<!-- 									  <td> -->
<!--                                       <img src='upload/<s:property value="fileFileName.get(#length.index)"/>'> -->
<!-- 									  </td> -->
<!-- 									</tr> -->
								</table> 
							</td>
						</tr>
					</table> </td>
			</tr>
		</table>
	</form>
</body>
</html>
