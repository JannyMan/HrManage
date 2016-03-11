<%@ page language="java" import="java.util.*" pageEncoding="utf-8" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML>
<HEAD>
<TITLE>人力资源管理系统</TITLE>
<META http-equiv=Content-Type content="text/html; charset=utf-8">
<STYLE type=text/css> 
{
	FONT-SIZE: 12px
}
#menuTree A {
	COLOR: #566984; TEXT-DECORATION: none
}
</STYLE>
<SCRIPT src="left/TreeNode.js" type=text/javascript></SCRIPT>
<SCRIPT src="left/Tree.js" type=text/javascript></SCRIPT>
<META content="MSHTML 6.00.2900.5848" name=GENERATOR>
</HEAD>
<BODY 
style="BACKGROUND-POSITION-Y: -120px; BACKGROUND-IMAGE: url(images/bg.gif); BACKGROUND-REPEAT: repeat-x">
<TABLE height="100%" cellSpacing=0 cellPadding=0 width="100%">
  <TBODY>
    <TR>
      <TD width=10 height=29><IMG src="left/bg_left_tl.gif"></TD>
      <TD 
    style="FONT-SIZE: 18px; BACKGROUND-IMAGE: url(images/bg_left_tc.gif); COLOR: white; FONT-FAMILY: system">功能列表</TD>
      <TD width=10><IMG src="left/bg_left_tr.gif"></TD>
    </TR>
    <TR>
      <TD style="BACKGROUND-IMAGE: url(images/bg_left_ls.gif)"></TD>
      <TD id=menuTree 
    style="PADDING-RIGHT: 10px; PADDING-LEFT: 10px; PADDING-BOTTOM: 10px; PADDING-TOP: 10px; HEIGHT: 100%; BACKGROUND-COLOR: white" 
    vAlign=top></TD>
      <TD style="BACKGROUND-IMAGE: url(images/bg_left_rs.gif)"></TD>
    </TR>
    <TR>
      <TD width=10><IMG src="left/bg_left_bl.gif"></TD>
      <TD style="BACKGROUND-IMAGE: url(images/bg_left_bc.gif)"></TD>
      <TD width=10><IMG 
src="left/bg_left_br.gif"></TD>
    </TR>
  </TBODY>
</TABLE>
<SCRIPT type=text/javascript>
var tree = null;var root = new TreeNode('系统菜单');
var fun1 = new TreeNode('部门管理','department_list.action', 'tree_node.gif', null, 'tree_node.gif', null);
root.add(fun1);

var fun2 = new TreeNode('员工管理','employee_list.action', 'tree_node.gif', null, 'tree_node.gif', null);
root.add(fun2);

var fun3 = new TreeNode('招聘管理','inviteJob_list.action', 'tree_node.gif', null, 'tree_node.gif', null);
root.add(fun3);

var fun4 = new TreeNode('培训管理','train_list.action', 'tree_node.gif', null, 'tree_node.gif', null);
root.add(fun4);

var fun6 = new TreeNode('资薪管理','pay_list.action', 'tree_node.gif', null, 'tree_node.gif', null);
root.add(fun6);

var fun5 = new TreeNode('奖惩设置','rewards_list.action', 'tree_node.gif', null, 'tree_node.gif', null);
root.add(fun5);

var fun7 = new TreeNode('系统管理','manager_list.action', 'tree_node.gif', null, 'tree_node.gif', null);
root.add(fun7);

tree = new Tree(root);tree.show('menuTree')
</SCRIPT>
</BODY>
</HTML>
