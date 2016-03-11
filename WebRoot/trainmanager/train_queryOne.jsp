<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<title>人力资源管理系统--培训管理</title>
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
       PADDING-TOP: 10px; BACKGROUND-REPEAT: repeat-x; HEIGHT: 47px; TEXT-ALIGN: center; 0px: ">培训管理
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
					<form action="train_add.action">
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
											<td width="98%" valign="middle" class="STYLE1">查看培训信息</td>
										</tr>
									</table></td>
							</tr>
							<tr>
								<td><input type="hidden" name="id" value="${train.id}" /></td>
							</tr>
							<tr>
								<td class=gridViewItem>培训人：</td>
								<td class=gridViewItem><input type="text" name="id"
									value="${train.man}" />
								</td>
							</tr>
							<tr>
								<td class=gridViewItem>培训宗旨：</td>
								<td class=gridViewItem><input type="text" name="content"
									value="${train.content}" />
								</td>
							</tr>
							<tr>
								<td class=gridViewItem>培训时间：</td>
								<td class=gridViewItem><fmt:formatDate
										value="${train.time}" pattern="yyyy年MM月dd日" var="time" /> <input
									type="text" name="time" class="Wdate"
									onClick="WdatePicker({dateFmt: 'yyyy年MM月dd日'})" value="${time}"
									readonly="readonly" />
								</td>
							</tr>
							<tr>
								<td class=gridViewItem>培训地点：</td>
								<td class=gridViewItem><input type="text" name="address"
									value="${train.address}" />
								</td>
							</tr>
							<tr>
								<td class=gridViewItem>是否参加：</td>
								<td class=gridViewItem><c:if test="${train.join=='1'}">
				  参加
				</c:if> <c:if test="${train.join=='0'}">
				不参加
			    </c:if></td>
							</tr>
							<tr>
								<td class=gridViewItem>备注信息：</td>
								<td class=gridViewItem><input type="text" name="bz"
									value="${train.bz}" />
								</td>
							</tr>
							<tr>
								<td colspan="2" class=gridViewItem><input type="button"
									value="返回" onclick="javascript:history.go(-1);" />
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
