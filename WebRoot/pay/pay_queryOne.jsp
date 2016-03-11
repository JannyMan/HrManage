<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage="" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>措滹人力资源管理系统--薪资管理</title>
<link rel="stylesheet" type="text/css" href="css/center.css">
<script language="javascript" type="text/javascript" src="js/My97DatePicker/WdatePicker.js"></script>
</head>
<body>
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
												</div>
											</td>
											<td width="98%" valign="middle" class="STYLE1">详细显示</td>
										</tr>
									</table>
								</td>
							</tr>
              
              <tr>
              <td class=gridViewItem><input type="hidden" name="id" value="${cj.id}"/></td>
              </tr>
              <tr>
                <td class=gridViewItem>姓名：</td>
                <td class=gridViewItem>${pay.emName}</td>
              </tr>
              <tr>
                <td class=gridViewItem>发放时间：</td>
                <td class=gridViewItem>${pay.month}         
                   </td>
              </tr>
              <tr>
                <td class=gridViewItem>基本工资：</td>
                <td class=gridViewItem>${pay.baseMoney}</td>
              </tr>
              <tr>
                <td class=gridViewItem>加班次数：</td>
                <td class=gridViewItem>${pay.overTime}</td>
              </tr>
              <tr>
                <td class=gridViewItem>工龄：</td>
                <td class=gridViewItem>${pay.age}</td>
              </tr>
              <tr>
                <td class=gridViewItem>考勤费：</td>
                <td class=gridViewItem>${pay.check}</td>
              </tr>
              <tr>
                <td class=gridViewItem>旷工费</td>
                <td class=gridViewItem>${pay.absent}</td>
              </tr>
              <tr>
                <td class=gridViewItem>保险费:</td>
                <td class=gridViewItem>${pay.safety}</td>
              </tr>
              
              
              
              
							<tr>
								<td colspan="2" class=gridViewItem><input type="submit"
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





<form action="pay_show.action" method="post">
<table width="100%" height="100%"  border="0" cellpadding="0" cellspacing="0">
  <tr>
    <td align="center">
    
	     <table width="801" height="48" border="0" cellpadding="0" cellspacing="0" background="images/center1.jpg">
        <tr>
          <td valign="top">		  <table width="494">
            <tr>
              <td width="45" height="25">&nbsp;</td>
              <td width="437" valign="bottom"><font color="#66583D"><b>薪资管理&nbsp;</b></font>&gt; <font color="#FF0000"> 详细显示</font></td>
            </tr>
          </table></td>
        </tr>
      </table>
      <table width="801" height="436" border="0" cellpadding="0" cellspacing="0" background="images/center2.jpg">
        <tr>
          <td height="436" valign="top" align="center">                  
            <table width="355" border="1" cellpadding="1" cellspacing="1" bordercolor="#FFFFFF" bgcolor="66583D">
              <tr>
              <td><input type="hidden" name="id" value="${cj.id}"/></td>
              </tr>
              <tr>
                <th width="79" height="30"><span class="word_white">姓名：</span></th>
                <td width="263" bgcolor="#FFFFFF">${pay.emName}</td>
              </tr>
              <tr>
                <th height="30"><span class="word_white">发放时间：</span></th>
                <td bgcolor="#FFFFFF">${pay.month}         
                   </td>
              </tr>
              <tr>
                <th height="30"><span class="word_white">基本工资：</span></th>
                <td bgcolor="#FFFFFF">${pay.baseMoney}</td>
              </tr>
              <tr>
                <th height="30"><span class="word_white">加班次数：</span></th>
                <td bgcolor="#FFFFFF">${pay.overTime}</td>
              </tr>
              <tr>
                <th height="30"><span class="word_white">工龄：</span></th>
                <td bgcolor="#FFFFFF">${pay.age}</td>
              </tr>
              <tr>
                <th width="79" height="30"><span class="word_white">考勤费：</span></th>
                <td width="263" bgcolor="#FFFFFF">${pay.check}</td>
              </tr>
              <tr>
                <th height="30"><span class="word_white">旷工费</span></th>
                <td bgcolor="#FFFFFF">${pay.absent}</td>
              </tr>
              <tr>
                <th height="30"><span class="word_white">保险费:</span></th>
                <td bgcolor="#FFFFFF">${pay.safety}</td>
              </tr>
            </table><br>   
			    <input type="button" value="返回" onclick="javascript:history.go(-1);"/></td>
        </tr>
      </table>
    </td>
  </tr>
</table>
</form>
</body>
