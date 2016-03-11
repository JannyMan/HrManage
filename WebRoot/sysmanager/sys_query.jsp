<%@ page contentType="text/html; charset=utf-8" language="java"
	import="java.sql.*" errorPage=""%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>措滹人力资源管理系统--用户管理</title>
<link rel="stylesheet" type="text/css" href="css/center.css">
</head>
<script language="JavaScript">
	function deleteForm() {
		if (confirm("确定要删除此用户信息吗？")) {
			window.location.href = "manager_list.action";
		}
	}
</script>
<body
	style="BACKGROUND-POSITION-Y: -120px; BACKGROUND-IMAGE: url(images/bg.gif); BACKGROUND-REPEAT: repeat-x">
	<DIV>
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
       PADDING-TOP: 10px; BACKGROUND-REPEAT: repeat-x; HEIGHT: 47px; TEXT-ALIGN: center; 0px: ">用户管理
					</SPAN><SPAN
						style="FLOAT: left; BACKGROUND-IMAGE: url(images/main_hr.gif); WIDTH: 60px; BACKGROUND-REPEAT: no-repeat; HEIGHT: 47px"></SPAN>
					</TD>
					<TD
						style="BACKGROUND-POSITION: 50% bottom; BACKGROUND-IMAGE: url(images/main_rc.gif)"
						width=10></TD>
				</TR>
				<TR>
					<TD style="BACKGROUND-IMAGE: url(images/main_ls.gif)">&nbsp;</TD>
					<TD
						style="PADDING-RIGHT: 10px; PADDING-LEFT: 10px; PADDING-BOTTOM: 10px; COLOR: #566984; PADDING-TOP: 10px; BACKGROUND-COLOR: white"
						vAlign=top align=middle>
						<DIV>
							<TABLE class=gridView id=ctl00_ContentPlaceHolder2_GridView1
								style="WIDTH: 100%; BORDER-COLLAPSE: collapse" cellSpacing=0
								rules=all border=1>
								<TBODY>
								<tr>
								<td colspan="5"><table width="100%" border="0"
										cellspacing="0" cellpadding="0">
										<tr class=gridViewHeader scope=col>
											<td width="2%" valign="middle"><div align="center">
													<img src="images/tb.gif" width="14" height="14" />
												</div></td>
											<td width="68%" valign="middle" class="STYLE1">系统用户列表</td>
											<td align="right" width="30%" valign="middle"
														class="STYLE1"><a href="manager_add.action">添加用户信息</a>
													</td>
										</tr>
									</table></td>
							</tr>
									<tr>
										<th class=gridViewHeader scope=col>编号</th>
										<th class=gridViewHeader scope=col>用户名</th>
										<th class=gridViewHeader scope=col>密码</th>
										<th class=gridViewHeader scope=col>管理级别</th>
										<th class=gridViewHeader scope=col>操作</th>
									</tr>
									<c:choose>
										<c:when test="${empty managers}">
											<tr>
												<td colspan="5"><li>暂无相关数据</li>
												</td>
											</tr>
										</c:when>
										<c:otherwise>
											<c:forEach items="${managers}" var="managers">
												<tr align="center" bgcolor="#FFFFFF">
													<td class=gridViewItem>${managers.id}</td>
													<td class=gridViewItem>${managers.account}</td>
													<td class=gridViewItem>${managers.pwd}</td>
													<td class=gridViewItem>${managers.managerLevel}</td>
													<td class=gridViewItem><a
														href="manager_load.action?uids=${managers.id}">修改</a> <a
														href="manager_delete.action?uids=${managers.id}">删除</a></td>
												</tr>
											</c:forEach>
										</c:otherwise>
									</c:choose>
								</TBODY>
							</TABLE>
							<table align="right">
								<tr>
									<td><div align="right">
											总共${pageModel.count}条记录，当前第${pageModel.page}/${pageModel.pageCount}页，
											<a
												href="manager_list.action?page=1&pageSize=${pageModel.pageSize}">首页</a>
											<a
												href="manager_list.action?page=${pageModel.page == 1 ? pageModel.page : (pageModel.page - 1)}&pageSize=${pageModel.pageSize}">上一页</a>
											<a
												href="manager_list.action?page=${pageModel.page == pageModel.pageCount ? pageModel.pageCount : (pageModel.page + 1) }&pageSize=${pageModel.pageSize}">下一页</a>
											<a
												href="manager_list.action?page=${pageModel.pageCount }&pageSize=${pageModel.pageSize}">尾页</a>
										</div>
									</td>
								</tr>
							</table>
						</DIV>
					</TD>
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
		</TABLE>
	</DIV>
</body>
