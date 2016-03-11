<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
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
<title>企业人力资源管理系统--招聘人员详细查看</title>
<link rel="stylesheet" type="text/css" href="css/center.css">
<script language="javascript" type="text/javascript"
	src="js/My97DatePicker/WdatePicker.js"></script>
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
       PADDING-TOP: 10px; BACKGROUND-REPEAT: repeat-x; HEIGHT: 47px; TEXT-ALIGN: center; 0px: ">招聘管理
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
					vAlign=top align=middle>
					<form action="inviteJob_show.action" method="post">
						<table class=gridView id=ctl00_ContentPlaceHolder2_GridView1
							style="WIDTH: 100%; BORDER-COLLAPSE: collapse" cellSpacing=0
							rules=all border=1>
							<tr>
								<td colspan="4"><table width="100%" border="0"
										cellspacing="0" cellpadding="0">
										<tr class=gridViewHeader scope=col>
											<td width="2%" valign="middle"><div align="center">
													<img src="images/tb.gif" width="14" height="14" />
												</div></td>
											<td width="98%" valign="middle" class="STYLE1">招聘人员详细查询</td>
										</tr>
									</table></td>
							</tr>
							<tr>
								<th class=gridViewHeader scope=col>姓名：</th>
								<td class=gridViewItem><input type="text" name="name"
									value="${inviteJobDto.name}" /></td>
								<th class=gridViewHeader scope=col>性别：</th>
								<td class=gridViewItem>&nbsp;&nbsp;&nbsp;&nbsp;<input
									type="radio" name="sex" value="男" checked="checked" />男&nbsp;&nbsp;&nbsp;&nbsp;<input
									type="radio" name="sex" value="女" />女</td>
							</tr>
							<tr>
								<th class=gridViewHeader scope=col>年龄：</th>
								<td class=gridViewItem><input type="text" name="age"
									value="${inviteJobDto.age}" /></td>
								<th class=gridViewHeader scope=col>出生日期：</th>
								<td class=gridViewItem><fmt:formatDate
										value="${inviteJobDto.born}" pattern="yyyy年MM月dd日" var="born" />
									<input type="text" name="born" class="Wdate"
									onClick="WdatePicker({dateFmt: 'yyyy年MM月dd日'})" value="${born}" /><br />
								</td>
							</tr>
							<tr>
								<th class=gridViewHeader scope=col>应聘职位：</th>
								<td class=gridViewItem><input type="text" name="job"
									value="${inviteJobDto.job}" /></td>
								<th class=gridViewHeader scope=col>所学专业：</th>
								<td class=gridViewItem><input type="text" name="specialty"
									value="${inviteJobDto.specialty}" /></td>
							</tr>
							<tr>
								<th class=gridViewHeader scope=col>工作经验：</th>
								<td class=gridViewItem><input type="text" name="experience"
									value="${inviteJobDto.experience}" /></td>
								<th class=gridViewHeader scope=col>文化程度：</th>
								<td class=gridViewItem><select name="teachSchool">
										<option value="研究生">研究生</option>
										<option value="本科生">本科生</option>
										<option value="大专生">大专生</option>
								</select>
								</td>
							</tr>
							<tr>
								<th class=gridViewHeader scope=col>联系电话：</th>
								<td class=gridViewItem><input type="text" name="tel"
									value="${inviteJobDto.tel}" /></td>
								<th class=gridViewHeader scope=col>毕业学校：</th>
								<td class=gridViewItem><input type="text"
									name="afterSchool" value="${inviteJobDto.afterSchool}" /></td>
							</tr>
							<tr>
								<th class=gridViewHeader scope=col>家庭住址：</th>
								<td class=gridViewItem><input type="text" name="address"
									value="${inviteJobDto.address}" /></td>
								<th class=gridViewHeader scope=col>登记时间：</th>
								<td class=gridViewItem><fmt:formatDate
										value="${inviteJobDto.createTime}" pattern="yyyy年MM月dd日"
										var="createTime" /> <input type="text" name="createTime"
									class="Wdate" onClick="WdatePicker({dateFmt: 'yyyy年MM月dd日'})"
									value="${createTime}" /><br />
								</td>
							</tr>
							<tr>
								<td><input type="hidden" name="isstock" value="0" /></td>
							</tr>
							<tr>
								<th class=gridViewHeader scope=col>个人简介:</th>
								<td colspan="3" class=gridViewItem><textarea rows="10"
										cols="56" name="content">${inviteJobDto.content}</textarea>
								</td>
							</tr>
							<tr>
								<td colspan="4" class=gridViewItem><input type="button"  value="返回"
					onclick="location.href='inviteJob_list.action'" />
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
