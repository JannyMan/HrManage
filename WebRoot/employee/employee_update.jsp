<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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

<title>人力资源管理系统--员工管理修改</title>
<link rel="stylesheet" type="text/css" href="css/center.css">
<script language="JavaScript">
	
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
       PADDING-TOP: 10px; BACKGROUND-REPEAT: repeat-x; HEIGHT: 47px; TEXT-ALIGN: center; 0px: ">员工管理
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
					<form action="employee_update.action" method="post">
						<table class=gridView id=ctl00_ContentPlaceHolder2_GridView1
							style="WIDTH: 100%; BORDER-COLLAPSE: collapse" cellSpacing=0
							rules=all border=1>
							<tr>
								<td colspan="4"><table width="100%" border="0"
										cellspacing="0" cellpadding="0">
										<tr class=gridViewHeader scope=col>
											<td width="2%" valign="middle"><div align="center">
													<img src="images/tb.gif" width="14" height="14" />
												</div>
											</td>
											<td width="98%" valign="middle" class="STYLE1">员工修改</td>
										</tr>
									</table>
								</td>
							</tr>
							<tr>
								<td class=gridViewItem><input type="hidden" name="id"
									value="${employee.serialNumber}" />
								</td>
							</tr>
							<tr>
								<th class=gridViewHeader scope=col>员工编号：</th>
								<td class=gridViewItem><input type="text"
									name="serialNumber" value="${employee.id}" /></td>
								<th class=gridViewHeader scope=col>员工姓名：</th>
								<td class=gridViewItem><input type="text" name="name"
									value="${employee.name}" /></td>
							</tr>
							<tr>
								<th class=gridViewHeader scope=col>性&nbsp;&nbsp;别：</th>
								<td class=gridViewItem><input type="text" name="sex"
									value="${employee.sex}" /></td>
								<th class=gridViewHeader scope=col>年&nbsp;&nbsp;龄：</th>
								<td class=gridViewItem><input type="text" name="age"
									value="${employee.age}" /></td>
							</tr>
							<tr>
								<th class=gridViewHeader scope=col>身份&nbsp;证：</th>
								<td class=gridViewItem><input type="text"
									name="IDCard" value="${employee.IDCard}" /></td>
								<th class=gridViewHeader scope=col>备&nbsp;&nbsp;注：</th>
								<td class=gridViewItem><input type="text" name="bz"
									value="${employee.bz}" /></td>
							</tr>
							<tr>
								<th class=gridViewHeader scope=col>指定名称：</th>
								<td class=gridViewItem><input type="text" name="createName"
									value="${employee.createName}" /></td>
								<th class=gridViewHeader scope=col>创建时间：</th>
								<td class=gridViewItem><input type="text" name="createTime"
									value="${employee.createTime}" /></td>
							</tr>
							<tr>
								<th class=gridViewHeader scope=col>职&nbsp;&nbsp;务：</th>
								<td class=gridViewItem><select name="typeWork" value="${employee.typeWork}" >
							                   <option value="程序员">程序员</option>
							                   <option value="文档人员">文档人员</option>
							                   <option value="部门经理">部门经理</option>
							                </select></td>
								<th class=gridViewHeader scope=col>开始时间：</th>
								<td class=gridViewItem><input type="text" name="startTime"
									value="${employee.startTime}" /></td>
							</tr>
							<tr>
								<th class=gridViewHeader scope=col>学&nbsp;&nbsp;历：</th>
								<td class=gridViewItem><select name="culture" value="${employee.culture}">
												<option value="研究生">研究生</option>
												<option value="本科生">本科生</option>
												<option value="大专生">大专生</option>
										</select></td>
								<th class=gridViewHeader scope=col>专业：</th>
								<td class=gridViewItem><input type="text" name="speciality"
									value="${employee.speciality}" /></td>
							</tr>
							<tr>
								<th class=gridViewHeader scope=col>毕业学校：</th>
								<td class=gridViewItem><input type="text"
									name="afterSchool" value="${employee.afterSchool}" /></td>
								<th class=gridViewHeader scope=col>住&nbsp;&nbsp;址：</th>
								<td class=gridViewItem><input type="text" name="address"
									value="${employee.address}" /></td>
							</tr>
							<tr>
								<th class=gridViewHeader scope=col>电&nbsp;&nbsp;话：</th>
								<td class=gridViewItem><input type="text" name="tel"
									value="${employee.tel}" /></td>
								<th class=gridViewHeader scope=col>籍&nbsp;&nbsp;贯：</th>
								<td class=gridViewItem><input type="text"
									name="ancestralHome" value="${employee.ancestralHome}" />
								</td>
							</tr>
							<tr>
								<th class=gridViewHeader scope=col>政治面貌：</th>
								<td class=gridViewItem><input type="text" name="visage"
									value="${employee.visage}" /></td>
								<th class=gridViewHeader scope=col>婚&nbsp;&nbsp;否：</th>
								<td class=gridViewItem><input type="text" name="marriage"
									value="${employee.marriage}" /></td>
							</tr>
							<tr>
								<th class=gridViewHeader scope=col>民&nbsp;&nbsp;族：</th>
								<td class=gridViewItem><input type="text" name="nation"
									value="${employee.nation}" /></td>
								<th class=gridViewHeader scope=col>出生日期：</th>
								<td class=gridViewItem><input type="text" name="born"
									value="${employee.born}" /></td>
							</tr>
							<tr>
								<th class=gridViewHeader scope=col>部&nbsp;门ID：</th>
								<td class=gridViewItem >
								<select name="edtid" value="${employee.edtid}">
										<c:forEach items="${departments}" var="departments">
												<c:if test="${employee.edtid == departments.id}">
															<option value="${departments.id}" selected>${departments.name}</option>
														</c:if> <c:if test="${employee.edtid != departments.id}">
														<option value="${departments.id}">${departments.name}</option>
														</c:if>
										</c:forEach>
										</select>
							</tr>
							<tr>
								<td colspan="4" class=gridViewItem><input type="submit"
									value="提交" id="submit" /> <input name="cleak" type="reset"
									value="清空" /> <input type="button" value="返回"
									onclick="javascript:history.go(-1);" /></td>
							</tr>
						</table>
					</form>
				</td>
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
