# 开发背景
hrm系统是一个综合的员工管理系统，系统主页面左边由导航树构成，分为：部门管理、员工管理、招聘管理、培训管理、薪资管理、以及系统设置模块，
模块功能主要包含CRUD操作，详情查看等操作。

# 数据库（hibernate 的c3p0连接数据库使用说明）  

<hibernate-configuration>
	<session-factory >
	<property name="hibernate.connection.driver_class">com.mysql.jdbc.Driver</property>
	<property name="hibernate.connection.url">jdbc:mysql://localhost:3306/hrm</property>
	<property name="hibernate.connection.username">root</property>
	<property name="hibernate.connection.password">123456</property>
		<property name="show_sql">true</property>
		<property name="format_sql">true</property>
		<!--配置数据库的方言 -->
		<property name="hibernate.dialect">org.hibernate.dialect.MySQL5Dialect</property>       
<property name="hibernate.current_session_context_class">org.springframework.orm.hibernate4.SpringSessionContext</property>    
      <!--   映射文件 -->
        <mapping resource="com/whgghr/hrm/model/po/CJ.hbm.xml"/>
        <mapping resource="com/whgghr/hrm/model/po/Department.hbm.xml"/>
        <mapping resource="com/whgghr/hrm/model/po/Employee.hbm.xml"/>
        <mapping resource="com/whgghr/hrm/model/po/InviteJob.hbm.xml"/>
        <mapping resource="com/whgghr/hrm/model/po/Manager.hbm.xml"/>
        <mapping resource="com/whgghr/hrm/model/po/Pay.hbm.xml"/>
        <mapping resource="com/whgghr/hrm/model/po/Train.hbm.xml"/>

	</session-factory>
</hibernate-configuration>

# 实现效果
![ABC](https://github.com/xiangzhihong/HrManage/blob/master/WebRoot/sreen/login.png) 
![ABC](https://github.com/xiangzhihong/HrManage/blob/master/WebRoot/sreen/main_depart.png) 
![ABC](https://github.com/xiangzhihong/HrManage/blob/master/WebRoot/sreen/main_detail.png) 
![ABC](https://github.com/xiangzhihong/HrManage/blob/master/WebRoot/sreen/person_detail.png) 


  
  
 
  
  
