<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>">

<title>人力资源管理系统--用户修改</title>
<link rel="stylesheet" type="text/css" href="css/center.css">
<script language="JavaScript">
	var xmlHttp;
	function createXMLHttp() {
		xmlHttp = new XMLHttpRequest();
		if (window.XMLHttpRequest) {
			xmlHttp = new XMLHttpRequest();
		} else {
			xmlHttp = new ActiveXobject("Microsoft.XMLHTTP");
		}
	}
	function checkAccount(account) {
		createXMLHttp();
		xmlHttp.open("POST", "manager_check.action?account=" + account);
		xmlHttp.onreadystatechange = checkNameCallback;
		xmlHttp.send(null);
		document.getElementById("msg").innerHTML = " 正在验证...";
	}
	function checkNameCallback() {
		if (xmlHttp.readyState == 4) {
			if (xmlHttp.status == 200) {
				document.getElementById("msg").innerText = xmlHttp.responseText;
			}
		}
	}
	function sub() {
		if (xmlHttp.responseText = "此用户名已被使用") {
			window.location = "/sysmanager/sys_insert.jsp";
		}
	}
</script>

</head>
<body
	style="BACKGROUND-POSITION-Y: -120px; BACKGROUND-IMAGE: url(images/bg.gif); BACKGROUND-REPEAT: repeat-x">
	<TABLE height="100%" cellSpacing=0 cellPadding=0 width="100%" border=0>
		<TBODY>
			<TR
				style="BACKGROUND-IMAGE: url(images/bg_header.gif); BACKGROUND-REPEAT: repeat-x"
				height=47>
				<TD width=10><SPAN
					style="FLOAT: left; BACKGROUND-IMAGE: url(images/main_hl.gif); WIDTH: 15px; BACKGROUND-REPEAT: no-repeat; HEIGHT: 47px"></SPAN>
				</TD>
				<TD><SPAN
					style="FLOAT: left; BACKGROUND-IMAGE: url(images/main_hl2.gif); WIDTH: 15px; BACKGROUND-REPEAT: no-repeat; HEIGHT: 47px"></SPAN><SPAN
					style="PADDING-RIGHT: 10px; PADDING-LEFT: 10px; FLOAT: left; BACKGROUND-IMAGE: url(images/main_hb.gif); PADDING-BOTTOM: 10px; COLOR: white;
       PADDING-TOP: 10px; BACKGROUND-REPEAT: repeat-x; HEIGHT: 47px; TEXT-ALIGN: center; 0px: ">系统管理
				</SPAN><SPAN
					style="FLOAT: left; BACKGROUND-IMAGE: url(images/main_hr.gif); WIDTH: 60px; BACKGROUND-REPEAT: no-repeat; HEIGHT: 47px"></SPAN>
				</TD>
				<TD
					style="BACKGROUND-POSITION: 50% bottom; BACKGROUND-IMAGE: url(images/main_rc.gif)"
					width=10></TD>
			</TR>
			<tr>
				<TD style="BACKGROUND-IMAGE: url(images/main_ls.gif)">&nbsp;</TD>
				<TD
					style="PADDING-RIGHT: 10px; PADDING-LEFT: 10px; PADDING-BOTTOM: 10px; COLOR: #566984; PADDING-TOP: 10px; BACKGROUND-COLOR: white"
					vAlign=top align=middle><form name="form"
						action="manager_add.action" method="post"
						enctype="multipart/form-data">
						<table class=gridView id=ctl00_ContentPlaceHolder2_GridView1
							style="WIDTH: 100%; BORDER-COLLAPSE: collapse" cellSpacing=0
							rules=all border=1>
							<tr>
								<td colspan="2"><table width="100%" border="0"
										cellspacing="0" cellpadding="0">
										<tr class=gridViewHeader scope=col>
											<td width="2%" valign="middle"><div align="center">
													<img src="images/tb.gif" width="14" height="14" />
												</div></td>
											<td width="98%" valign="middle" class="STYLE1">系统用户添加</td>
										</tr>
									</table></td>
							</tr>
							<tr>
								<td class=gridViewItem>用户名：</td>
								<td class=gridViewItem><input type="text" name="account"
									value="${manager.account}" onblur="checkAccount(this.value)" /><span
									id="msg"></span><br /></td>
							</tr>
							<tr>
								<td class=gridViewItem>密码：</td>
								<td class=gridViewItem><input type="text" name="pwd"
									value="${manager.pwd}" /></td>
							</tr>
							<tr>
								<td class=gridViewItem>重复密码：</td>
								<td class=gridViewItem><input type="text" name="pwd1"
									value="${manager.pwd}" /></td>
							</tr>
							<tr>
								<td class=gridViewItem>管理级别：</td>
								<td class=gridViewItem><input type="text"
									name="managerLevel" value="${manager.managerLevel}" /></td>
							</tr>
							<tr>
								<td colspan="2" class=gridViewItem><input type="submit"
									value="提交" id="submit" /> <input name="cleak" type="reset"
									value="清空" /> <input type="button" value="返回"
									onclick="javascript:history.go(-1);" />
								</td>
							</tr>
						</table>
					</form></td>
				<TD style="BACKGROUND-IMAGE: url(images/main_rs.gif)"></TD>
			</TR>
			<TR
				style="BACKGROUND-IMAGE: url(images/main_fs.gif); BACKGROUND-REPEAT: repeat-x"
				height=10>
				<TD style="BACKGROUND-IMAGE: url(images/main_lf.gif)"></TD>
				<TD style="BACKGROUND-IMAGE: url(images/main_fs.gif)"></TD>
				<TD style="BACKGROUND-IMAGE: url(images/main_rf.gif)"></TD>
			</TR>
		</TBODY>
	</table>
</body>
</html>
