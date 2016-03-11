package com.whgghr.action;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts2.ServletActionContext;
import org.apache.struts2.interceptor.ServletRequestAware;
import org.apache.struts2.interceptor.ServletResponseAware;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;
import com.whgghr.hrm.dao.MagerDAOImpl;
import com.whgghr.hrm.dao.util.PageModel;
import com.whgghr.hrm.model.po.Manager;

public class ManagerAction extends ActionSupport implements
		ModelDriven<Manager>, ServletRequestAware,ServletResponseAware {
	private HttpServletRequest request;

	private HttpServletResponse response;
	private static final String LIST = "list";

	private static final String LOAD = "load";

	private static final String LIST_LOAD = "list_load";

	private List<Manager> managers;

	private Manager manager;

	private int uids;

//	private static final long serialVersionUID=57214681;
//	private static final int BUFFER_SIZE=16*1024;
//	private File myFile;
//	private String contentType;
//	private String fileName;
//	private String imageFileName;
//	private String caption;
	 private File file;
	 private List<String> fileFileName;
	 private String fileContentType;

	// Ϊ����ҳ���ϻ�ȡ��Ӧ��ҳ����Ϣ
	
	private PageModel pageModel;

	// Ϊ�˼�ҳ�洫�ݵĲ���
	private int page;

	private int pageSize;

	private MagerDAOImpl MgerMgr;
	

	public void setMgerMgr(MagerDAOImpl mgerMgr) {
		MgerMgr = mgerMgr;
	}


	public File getFile() {
		return file;
	}


	public void setFile(File file) {
		this.file = file;
	}


	public List<String> getFileFileName() {
		return fileFileName;
	}


	public void setFileFileName(List<String> fileFileName) {
		this.fileFileName = fileFileName;
	}


	public String getFileContentType() {
		return fileContentType;
	}


	public void setFileContentType(String fileContentType) {
		this.fileContentType = fileContentType;
	}

	public PageModel getPageModel() {
		return pageModel;
	}

	public int getPage() {
		return page;
	}

	public int getPageSize() {
		return pageSize;
	}

	public List<Manager> getManagers() {
		return managers;
	}

	public void setManagers(List<Manager> managers) {
		this.managers = managers;
	}

	public void setPageModel(PageModel pageModel) {
		this.pageModel = pageModel;
	}

	public void setPage(int page) {
		this.page = page;
	}

	public void setPageSize(int pageSize) {
		this.pageSize = pageSize;
	}

	public Manager getManager() {
		return manager;
	}

	public void setManager(Manager manager) {
		this.manager = manager;
	}

	public int getUids() {
		return uids;
	}

	public void setUids(int uids) {
		this.uids = uids;
	}

	public static String getList() {
		return LIST;
	}

	public static String getLoad() {
		return LOAD;
	}

	public static String getListLoad() {
		return LIST_LOAD;
	}

	public String list() throws Exception {//ִ����ʾ���ķ���
		this.pageModel = new PageModel();
		if (page != 0) {
			this.pageModel.setPage(this.page);
		}
		if (pageSize != 0) {
			this.pageModel.setPageSize(this.pageSize);
		}

		this.managers = MgerMgr.list(pageModel);

		return LIST;
	}  
	public String add() throws Exception {//ִ���ύ�ķ���
//		   response.setHeader("content-type","text/html;charset=UTF-8");
//		   response.setDateHeader("expries", -1);  //ȥ����������棡
//		   response.setHeader("Cache-Control", "no-cache");
//		   response.setHeader("Pragma", "no-cache"); 
		if (request.getParameter("account") == null
				|| request.getParameter("account") == "") {
			   return "input";
		}
		if (request.getParameter("pwd") == null
				|| request.getParameter("pwd") == "") {
			return "input";
		}
		if (request.getParameter("pwd1") == null
				|| request.getParameter("pwd1") == "") {
			return "input";
		}
		if (request.getParameter("pwd1") != request.getParameter("pwd1")) {
			return "input";
		}
		if (request.getParameter("managerLevel") == null
				|| request.getParameter("managerLevel") == "") {
			return "input";
		} else {
//			 //�õ����̱���ͼƬ��·��	
//			 String root =
//			 ServletActionContext.getRequest().getRealPath("/upload");
//			 System.out.println("...root:"+root);
//			 InputStream is = new FileInputStream(file);
//			 System.out.println("...is:"+is);
//			 //�õ�ͼƬ�����λ��(����root���õ�ͼƬ�����·����tomcat�µĸù�����)
//			 File destFile = new File(root,this.getFileFileName().toString());
//			 System.out.println("...destFile:"+destFile);
//			 //��ͼƬд�뵽�������õ�·����
//			 OutputStream os = new FileOutputStream(destFile);
//			 System.out.println("...os:"+os);
//			 byte[] buffer = new byte[400];
//			 System.out.println("...buffer:"+buffer);
//			 int length = 0 ;
//			 while((length = is.read(buffer))>0){
//			 os.write(buffer, 0, length);
//			 }
//			 System.out.println("...is.read(buffer):"+is.read(buffer));
//			 is.close();
//			 os.close();
//			imageFileName=new Date().getTime()+getExtention(fileName);
//			File imageFile=new File(ServletActionContext.getServletContext().getRealPath(
//					"/UploadImages"+"/"+imageFileName));
//			copy(myFile, imageFile);
			String account1=request.getParameter("account");
			   List<Manager> rs= MgerMgr.check(account1);
			   if(rs.size()>0){
				   HttpServletResponse response=ServletActionContext.getResponse();   
				   response.setCharacterEncoding("UTF-8");
				   response.setHeader("content-type","text/html;charset=UTF-8");
				   response.setDateHeader("expries", 0);  //ȥ����������棡
				   response.setHeader("Cache-Control", "no-cache");
				   response.setHeader("Pragma", "no-cache"); 
			    return "input";
			   }else{
			this.MgerMgr.add(manager);
			this.managers = MgerMgr.listAll();
			return LIST_LOAD;
			}
		}
	}
	public String check() throws Exception {//��֤�û����Ƿ��ظ�
		 try{   
			        String responseText="";   
					   String account=request.getParameter("account").trim();
					   List<Manager> rs= MgerMgr.check(account);
			       if(rs.size()<=0){   
			            responseText="��ϲ,�û�������";   
			      }else  
			           responseText="���û����ѱ�ʹ��";   
			           HttpServletResponse response=ServletActionContext.getResponse();   
					   response.setCharacterEncoding("UTF-8");
					   response.setHeader("content-type","text/html;charset=UTF-8");
					   response.setDateHeader("expries", -1);  //ȥ����������棡
					   response.setHeader("Cache-Control", "no-cache");
					   response.setHeader("Pragma", "no-cache"); 
			         PrintWriter out=response.getWriter();   
			         out.print(responseText); 			         
			         out.flush();   
			         out.close();   
			    }catch(IOException e){   
			       e.printStackTrace();   
			    }   

		return "input";
	}
	public String update() throws Exception {//ִ���޸ĵķ���
		String resultCode = INPUT;
		if (this.manager.getAccount() == null) {
			return resultCode;
		} else {
			this.manager = this.MgerMgr.update(manager);
			this.managers = MgerMgr.listAll();
			return LIST_LOAD;
		}
	}

	public String show() throws Exception {//ִ����ʾ��ϸ��Ϣ�ķ���
		this.manager = MgerMgr.show(uids);
		return "query";
	}

	public String load() throws Exception {
		this.manager = MgerMgr.load(uids);
		return LOAD;
	}

	public String listAll() throws Exception { // �б���ʾȫ������Ƹ��Ϣ
		this.managers = MgerMgr.listAll();
		return LIST;
	}

	public String delete() throws Exception {//ִ��ɾ���ķ���
		this.MgerMgr.delete((Integer) uids);
		return LIST_LOAD;
	}

	public Manager getModel() {   //���Manager��ģ��
		this.manager = new Manager();
		return this.manager;
	}

	public void setServletRequest(HttpServletRequest req) {  //���request
		this.request = req;

	}
	@Override
	public void setServletResponse(HttpServletResponse res) {//���response
		this.response=res;
	}

}