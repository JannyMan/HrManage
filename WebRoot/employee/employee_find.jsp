<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page import="java.util.*"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>人才人力资源管理系统--员工管理</title>
<link rel="stylesheet" type="text/css" href="css/center.css">
</head>
<script language="JavaScript">
	function deleteForm(date) {
		if (confirm("确定要删除此部门信息吗？")) {
			window.location.href = "department.do?method=deleteDepartment&id="
					+ date;
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
       PADDING-TOP: 10px; BACKGROUND-REPEAT: repeat-x; HEIGHT: 47px; TEXT-ALIGN: center; 0px: ">员工管理
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
							<table height="19">
								<tr align="center">
									<td><b>部门查询</b>&nbsp;&nbsp; <c:choose>
											<c:when test="${empty departments}">
												<td>暂无部门</td>
											</c:when>
											<c:otherwise>
												<c:forEach items="${departments}" var="departments">
													<td><a
														href="employee_depsel.action?uids=${departments.id}">${departments.name}</a>
													</td>
												</c:forEach>
											</c:otherwise>
										</c:choose>
									<td><a href="employee_list.action"><b>全部员工<b>
									</a>
									</td>

								</tr>
							</table>

							<TABLE class=gridView id=ctl00_ContentPlaceHolder2_GridView1
								style="WIDTH: 100%; BORDER-COLLAPSE: collapse" cellSpacing=0
								rules=all border=1>
								<TBODY>
									<tr>
										<td colspan="8"><table width="100%" border="0"
												cellspacing="0" cellpadding="0">
												<tr class=gridViewHeader scope=col>
													<td width="2%" valign="middle"><div align="center">
															<img src="images/tb.gif" width="14" height="14" />
														</div></td>
													<td width="68%" valign="middle" class="STYLE1">员工列表</td>
													<td align="right" width="30%" valign="middle"
														class="STYLE1"><a href="employee_forwardadd.action">添加员工</a>
													</td>
												</tr>
											</table></td>
									</tr>
									<tr>
										<th class=gridViewHeader scope=col>员工编号</th>
										<th class=gridViewHeader scope=col>姓名</th>
										<th class=gridViewHeader scope=col>性别</th>
										<th class=gridViewHeader scope=col>部门</th>
										<th class=gridViewHeader scope=col>工种</th>
										<th class=gridViewHeader scope=col>学历</th>
										<th class=gridViewHeader scope=col>参加工作时间</th>
										<th class=gridViewHeader scope=col>操作</th>
									</tr>
									<c:choose>
										<c:when test="${empty employees}">
											<tr>
												<td class=gridViewItem colspan="8"><li>暂无相关数据</li>
												</td>
											</tr>
										</c:when>
										<c:otherwise>
											<c:forEach items="${employees}" var="employees">
												<tr align="center" bgcolor="#FFFFFF">
													<td class=gridViewItem>${employees.serialNumber}</td>
													<td class=gridViewItem>${employees.name}</td>
													<td class=gridViewItem>${employees.sex}</td>
													<td class=gridViewItem>${employees.depart.name}</td>
													<td class=gridViewItem>${employees.typeWork}</td>
													<td class=gridViewItem>${employees.culture}</td>
													<td class=gridViewItem>${employees.startTime}</td>
													<td class=gridViewItem><a
														href="employee_load.action?uids=${employees.serialNumber}">修改</a>
														<a
														href="employee_delete.action?uids=${employees.serialNumber}">删除</a>
													</td>
													<td><input type="hidden" id="com_id" value="${employees.depart.id}" /></td>
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
												href="employee_depsel.action?uids=${uids}&page=1&pageSize=${pageModel.pageSize}">首页</a>
											<a
												href="employee_depsel.action?uids=${uids}&page=${pageModel.page == 1 ? pageModel.page : (pageModel.page - 1)}&pageSize=${pageModel.pageSize}">上一页</a>
											<a
												href="employee_depsel.action?uids=${uids}&page=${pageModel.page == pageModel.pageCount ? pageModel.pageCount : (pageModel.page + 1) }&pageSize=${pageModel.pageSize}">下一页</a>
											<a
												href="employee_depsel.action?uids=${uids}&page=${pageModel.pageCount }&pageSize=${pageModel.pageSize}">尾页</a>
										</div>
									</td>
								</tr>
							</table>
						</DIV></TD>
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
