<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML>
<HEAD>
<TITLE>人力资源管理系统</TITLE>
<META http-equiv=Content-Type content="text/html; charset=utf-8">
<LINK href="images/public.css" type=text/css rel=stylesheet>
<LINK href="images/login.css" type=text/css rel=stylesheet>
<script language="JavaScript">
	function checkManager() {
		var a = document.getElementById("mgr.account");
		var b = document.getElementById("mgr.pwd");
		if (a.value == "") {
			window.alert("请输入账号");
			return false;
		} else if (b.value == "") {
			window.alert("请输入密码");
			return false;
		} else
			return true;
	}
</script>
<STYLE type=text/css>
</STYLE>
<META content="MSHTML 6.00.2900.5848" name=GENERATOR>
</HEAD>
<BODY>
	<DIV id=div1>
		<form action="login.action" method="post">
			<TABLE id=login height="600" cellSpacing=0 cellPadding=0 width=800
				align=center>
				<TBODY>
					<TR id=main>
						<TD>
							<TABLE height="100%" cellSpacing=0 cellPadding=0 width="100%">
								<TBODY>
									<TR>
										<TD colSpan=4>&nbsp;</TD>
									</TR>
									<TR height=30>
										<TD width=380>&nbsp;</TD>
										<TD>&nbsp;</TD>
										<TD>&nbsp;</TD>
										<TD>&nbsp;</TD>
									</TR>
									<TR height=40>
										<TD rowSpan=4>&nbsp;</TD>
										<TD>用户名：</TD>
										<TD><INPUT class=textbox id="mgr.account"
											name="mgr.account"></TD>
										<TD width=120>&nbsp;</TD>
									</TR>
									<TR height=40>
										<TD>密 码：</TD>
										<TD><INPUT class=textbox type=password id="mgr.pwd"
											name="mgr.pwd"></TD>
										<TD width=120>&nbsp;</TD>
									</TR>

									<TR height=40>
										<TD></TD>
										<TD align=right><INPUT id=btnLogin type=submit
											value=" 登 录 " name=btnLogin></TD>
										<TD width=120>&nbsp;</TD>
									</TR>
									<TR height=110>
										<TD colSpan=4>&nbsp;</TD>
									</TR>
								</TBODY>
							</TABLE>
						</TD>
					</TR>
					<TR id=root height=104>
						<TD>&nbsp;</TD>
					</TR>
				</TBODY>
			</TABLE>
		</form>
	</DIV>
	<DIV id=div2 style="DISPLAY: none"></DIV>
	</CONTENTTEMPLATE>
</BODY>
</HTML>
