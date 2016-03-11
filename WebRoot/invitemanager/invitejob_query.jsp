<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
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
<title>人力资源管理系统--招聘管理</title>
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
       PADDING-TOP: 10px; BACKGROUND-REPEAT: repeat-x; HEIGHT: 47px; TEXT-ALIGN: center; 0px: ">招聘管理
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
										<td colspan="7"><table width="100%" border="0"
												cellspacing="0" cellpadding="0">
												<tr class=gridViewHeader scope=col>
													<td width="2%" valign="middle"><div align="center">
															<img src="images/tb.gif" width="14" height="14" />
														</div></td>
													<td width="68%" valign="middle" class="STYLE1">应聘人员列表</td>
													<td align="right" width="30%" valign="middle"
														class="STYLE1"><a href="inviteJob_add.action">添加应聘人信息</a>
													</td>
												</tr>
											</table></td>
									</tr>
									<tr>
										<th class=gridViewHeader scope=col>编号</th>
										<th class=gridViewHeader scope=col>姓名</th>
										<th class=gridViewHeader scope=col>性别</th>
										<th class=gridViewHeader scope=col>应聘职务</th>
										<th class=gridViewHeader scope=col>学历</th>
										<th class=gridViewHeader scope=col>工作经验</th>
										<th class=gridViewHeader scope=col>操作</th>
									</tr>
									<c:choose>
										<c:when test="${empty inviteJobs}">
											<tr>
												<td class=gridViewItem colspan="5"><li>暂无相关数据</li></td>
											</tr>
										</c:when>
										<c:otherwise>

											<c:forEach items="${inviteJobs}" var="invitejobs">
												<tr>
													<td class=gridViewItem>${invitejobs.id }</td>
													<td class=gridViewItem>${invitejobs.name }</td>
													<td class=gridViewItem>${invitejobs.sex }</td>
													<td class=gridViewItem>${invitejobs.job }</td>
													<td class=gridViewItem>${invitejobs.teachSchool }</td>
													<td class=gridViewItem>${invitejobs.experience }</td>
													<td class=gridViewItem><a
														href="inviteJob_queryOne.action?id=${invitejobs.id }">详细查看</a>
														<a href="inviteJob_del.action?id=${invitejobs.id }">删除</a>
														<c:if test="${invitejobs.isstock=='0'}">
															<a href="inviteJob_employ.action?id=${invitejobs.id}">录用</a>
														</c:if> <c:if test="${invitejobs.isstock=='1'}">
														已录
														</c:if>
													</td>
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
												href="inviteJob_list.action?page=1&pageSize=${pageModel.pageSize}">首页</a>
											<a
												href="inviteJob_list.action?page=${pageModel.page == 1 ? pageModel.page : (pageModel.page - 1)}&pageSize=${pageModel.pageSize}">上一页</a>
											<a
												href="inviteJob_list.action?page=${pageModel.page == pageModel.pageCount ? pageModel.pageCount : (pageModel.page + 1) }&pageSize=${pageModel.pageSize}">下一页</a>
											<a
												href="inviteJob_list.action?page=${pageModel.pageCount }&pageSize=${pageModel.pageSize}">尾页</a>
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
