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
<title>人力资源管理系统--新姿管理</title>
<link rel="stylesheet" type="text/css" href="css/center.css">
</head>
<script language="JavaScript">
	function deleteForm(date) {
		if (confirm("确定要删除此员工的工资信息吗？")) {
			// window.location.href="pays.do?method=deletePay&id="+date;
		}
	}
	function checkform1() {
		if (document.form1.pay_month.value != ""&&form1.pay_month.value.length > 11) {
			window.alert("请输入要查询的年月，例如：2007-12");
			return false;
		}
		return true;
	}
</script>
<body
	style="BACKGROUND-POSITION-Y: -120px; BACKGROUND-IMAGE: url(images/bg.gif); BACKGROUND-REPEAT: repeat-x">
	<form name="form1" method="post" action="" onsubmit="checkform1()">
		<DIV>
			<TABLE height="100%" cellSpacing=0 cellPadding=0 width="100%"
				border=0>
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
       PADDING-TOP: 10px; BACKGROUND-REPEAT: repeat-x; HEIGHT: 47px; TEXT-ALIGN: center; 0px: ">薪资管理
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
								<form action="pay_list.action" method="post">
									<table width="481">
										<tr>
											<td width="224">

												<table width="233">
													<tr>
														<td><input name="sumbit1" type="submit" value="年月查询">
														</td>
														<td><input type="text" name="pay_month"></td>
													</tr>
												</table>
											</td>
											<td width="283">
												<table width="233">
													<tr>
														<td><input name="sumbit2" type="submit" value="员工查询">
														</td>
														<td><input type="text" name="pay_name"></td>
													</tr>
												</table>
											</td>
										</tr>
									</table>
								</form>

								<TABLE class=gridView id=ctl00_ContentPlaceHolder2_GridView1
									style="WIDTH: 100%; BORDER-COLLAPSE: collapse" cellSpacing=0
									rules=all border=1>
									<TBODY>
									<tr>
								<td colspan="11"><table width="100%" border="0"
										cellspacing="0" cellpadding="0">
										<tr class=gridViewHeader scope=col>
											<td width="2%" valign="middle"><div align="center">
													<img src="images/tb.gif" width="14" height="14" />
												</div></td>
											<td width="68%" valign="middle" class="STYLE1">薪资列表</td>
											<td align="right" width="30%" valign="middle"
														class="STYLE1"><a href="pay_add.action">添加薪资</a>
													</td>
										</tr>
									</table></td>
							</tr>
										<tr>
											<th class=gridViewHeader scope=col>员工编号</th>
											<th class=gridViewHeader scope=col>员工姓名</th>
											<th class=gridViewHeader scope=col>当前月份</th>
											<th class=gridViewHeader scope=col>基本工资</th>
											<th class=gridViewHeader scope=col>加班费</th>
											<th class=gridViewHeader scope=col>工龄费</th>
											<th class=gridViewHeader scope=col>考勤费</th>
											<th class=gridViewHeader scope=col>旷工费</th>
											<th class=gridViewHeader scope=col>保险费</th>
											<th class=gridViewHeader scope=col>实发工资</th>
											<th class=gridViewHeader scope=col>操作</th>
										</tr>
										<c:choose>
											<c:when test="${empty pays}">
												<tr>
													<td colspan="5"><li>暂无相关数据</li></td>
												</tr>
											</c:when>
											<c:otherwise>
												<c:forEach items="${pays}" var="pays">
													<tr align="center" bgcolor="#FFFFFF">
														<td class=gridViewItem>${pays.id}</td>
														<td class=gridViewItem>${pays.emName}</td>
														<td class=gridViewItem>${pays.month}</td>
														<td class=gridViewItem>${pays.baseMoney}</td>
														<td class=gridViewItem>${pays.overTime*20}</td>
														<td class=gridViewItem>${pays.age*50}</td>
														<td class=gridViewItem>${pays.check}</td>
														<td class=gridViewItem>${pays.absent}</td>
														<td class=gridViewItem>${pays.safety}</td>
														<td class=gridViewItem>${pays.baseMoney+pays.overTime*20+pays.age*50+pays.check-pays.absent-pays.safety}</td>
														<td class=gridViewItem><a
															href="pay_show.action?uids=${pays.id}">查看详情</a> <a
															href="pay_delete.action?uids=${pays.id}">删除</a> <!-- 								onClick="deleteForm()" -->
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
													href="pay_list.action?page=1&pageSize=${pageModel.pageSize}">首页</a>
												<a
													href="pay_list.action?page=${pageModel.page == 1 ? pageModel.page : (pageModel.page - 1)}&pageSize=${pageModel.pageSize}">上一页</a>
												<a
													href="pay_list.action?page=${pageModel.page == pageModel.pageCount ? pageModel.pageCount : (pageModel.page + 1) }&pageSize=${pageModel.pageSize}">下一页</a>
												<a
													href="pay_list.action?page=${pageModel.pageCount }&pageSize=${pageModel.pageSize}">尾页</a>
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
	</form>
</body>
