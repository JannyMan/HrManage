<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>措滹人力资源管理系统--薪资管理</title>
<link rel="stylesheet" type="text/css" href="css/center.css">
<script language="javascript" type="text/javascript"
	src="js/My97DatePicker/WdatePicker.js"></script>
<script language="javascript">
	function checkEmptyForm(form) {
		for (i = 0; i < form.length; i++) {
			if (form.elements[i].value == "") {

				if (isNaN(form.pay_baseMoney.value)) {
					window.alert("基本工资只能为数字");
					return false;
				}
				if (isNaN(form.pay_overtime.value)) {
					window.alert("加班次数只能为数字");
					return false;
				}

				if (isNaN(form.pay_age.value)) {
					window.alert("工龄只能为数字");
					return false;
				}

				if (isNaN(form.pay_check.value)) {
					window.alert("全勤奖只能为数字");
					return false;
				}

				if (isNaN(form.pay_absent.value)) {
					window.alert("旷工费只能为数字");
					return false;
				}

				if (isNaN(form.pay_safety.value)) {
					window.alert("保险费只能为数字");
					return false;
				}

				alert(form.elements[i].title);
				return false;
			}
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
       PADDING-TOP: 10px; BACKGROUND-REPEAT: repeat-x; HEIGHT: 47px; TEXT-ALIGN: center; 0px: ">薪资管理
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
					<form action="pay_add.action" method="post">
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
											<td width="98%" valign="middle" class="STYLE1">薪资添加</td>
										</tr>
									</table></td>
							</tr>
							<tr>
								<td class=gridViewItem>姓名：</td>
								<td class=gridViewItem><input type="text" name="emName"
									value="${pay.emName}" /></td>
							</tr>
							<tr>
								<td class=gridViewItem>发放时间：</td>
								<td class=gridViewItem><fmt:formatDate value="${pay.month}"
										pattern="yyyy-MM-dd" var="month" /> <input type="text"
									name="month" class="Wdate"
									onClick="WdatePicker({dateFmt: 'yyyy-MM-dd'})"
									value="${pay.month}" readonly="readonly" /><br /></td>
							</tr>
							<tr>
								<td class=gridViewItem>基本工资：</td>
								<td class=gridViewItem><input type="text" name="baseMoney"
									value="${pay.baseMoney}" />
								</td>
							</tr>
							<tr>
								<td class=gridViewItem>加班次数：</td>
								<td class=gridViewItem><input type="text" name="overTime"
									value="${pay.overTime}" />
								</td>
							</tr>
							<tr>
								<td class=gridViewItem>工龄：</td>
								<td class=gridViewItem><input type="text" name="age"
									value="${pay.age}" />
								</td>
							</tr>
							<tr>
								<td class=gridViewItem>全勤奖：</td>
								<td class=gridViewItem><input type="text" name="check"
									value="${pay.check}" />
								</td>
							</tr>
							<tr>
								<td class=gridViewItem>旷工费：</td>
								<td class=gridViewItem><input type="text" name="absent"
									value="${pay.absent}" />
								</td>
							</tr>
							<tr>
								<td class=gridViewItem>保险费：</td>
								<td class=gridViewItem><input type="text" name="safety"
									value="${pay.safety}" />
								</td>
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
