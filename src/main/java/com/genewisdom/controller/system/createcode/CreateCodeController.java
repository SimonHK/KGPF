package com.genewisdom.controller.system.createcode;

import java.io.File;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletResponse;

import com.genewisdom.util.*;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.genewisdom.controller.base.BaseController;
import com.genewisdom.entity.Page;
import com.genewisdom.service.system.createcode.CreateCodeManager;

/** 
 * 类名称： 代码生成器
 * 创建人：HongKai
 * 修改时间：2015年11月23日
 * @version
 */
@Controller
@RequestMapping(value="/createCode")
public class CreateCodeController extends BaseController {
	
	String menuUrl = "createcode/list.do"; //菜单地址(权限用)
	@Resource(name="createcodeService")
	private CreateCodeManager createcodeService;
	
	/**列表
	 * @param page
	 * @return
	 */
	@RequestMapping(value="/list")
	public ModelAndView list(Page page) throws Exception{
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "cha")){} 		//校验权限
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		String keywords = pd.getString("keywords");	//检索条件
		if(null != keywords && !"".equals(keywords)){
			keywords = keywords.trim();
			pd.put("keywords", keywords);
		}
		page.setPd(pd);
		List<PageData>	varList = createcodeService.list(page);	//列出CreateCode列表
		mv.setViewName("system/createcode/createcode_list");
		mv.addObject("varList", varList);
		mv.addObject("pd", pd);
		mv.addObject("QX",Jurisdiction.getHC());	//按钮权限
		return mv;
	}
	
	/**去代码生成器页面(进入弹窗)
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/goProductCode")
	public ModelAndView goProductCode() throws Exception{
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		String CREATECODE_ID = pd.getString("CREATECODE_ID");
		if(!"add".equals(CREATECODE_ID)){
			pd = createcodeService.findById(pd);
			mv.addObject("pd", pd);
			mv.addObject("msg", "edit");
			
		}else{
			mv.addObject("msg", "add");
		}
		List<PageData> varList = createcodeService.listFa(); //列出所有主表结构的
		mv.addObject("varList", varList);
		mv.setViewName("system/createcode/productCode");
		return mv;
	}
	
	/**生成代码
	 * @param response
	 * @throws Exception
	 */
	@RequestMapping(value="/proCode")
	public void proCode(HttpServletResponse response) throws Exception{
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "add")){} 		//校验权限
		logBefore(logger, Jurisdiction.getUsername()+"执行代码生成器");
		PageData pd = new PageData();
		pd = this.getPageData();
		save(pd);	//保存到数据库
		/* ============================================================================================= */
		String faobject = pd.getString("faobject");  				//主表名				========参数0-1 主附结构用
		String FHTYPE = pd.getString("FHTYPE");  					//模块类型			========参数0-2 类型，单表、树形结构、主表明细表
		String TITLE = pd.getString("TITLE");  						//说明				========参数0
		String packageName = pd.getString("packageName");  			//包名				========参数1
		String objectName = pd.getString("objectName");	   			//类名				========参数2
		String tabletop = pd.getString("tabletop");	   				//表前缀				========参数3
		tabletop = null == tabletop?"":tabletop.toUpperCase();		//表前缀转大写
		String zindext = pd.getString("zindex");	   	   			//属性总数
		String USERNAME = "hongkai";								//创建人
		String USERMAILL = "18611949252@163.com";					//创建人MAILL
		int zindex = 0;
		if(null != zindext && !"".equals(zindext)){
			zindex = Integer.parseInt(zindext);
		}
		List<String[]> fieldList = new ArrayList<String[]>();   	//属性集合			========参数4
		for(int i=0; i< zindex; i++){
			fieldList.add(pd.getString("field"+i).split(",fh,"));	//属性放到集合里面
		}
		Map<String,Object> root = new HashMap<String,Object>();		//创建数据模型
		root.put("fieldList", fieldList);
		root.put("faobject", faobject.toUpperCase());				//主附结构用，主表名
		root.put("TITLE", TITLE);									//说明
		root.put("USERNAME",USERNAME);								//创建人
		root.put("USERMAILL",USERMAILL);								//创建人MAILL
		root.put("packageName", packageName);						//包名
		root.put("objectName", objectName);							//类名
		root.put("objectNameLower", objectName.toLowerCase());		//类名(全小写)
		root.put("objectNameUpper", objectName.toUpperCase());		//类名(全大写)
		root.put("tabletop", tabletop);								//表前缀	
		root.put("nowDate", new Date());							//当前日期
		
		DelAllFile.delFolder(PathUtil.getClasspath()+"admin/ftl"); //生成代码前,先清空之前生成的代码
		/* ============================================================================================= */
		String filePath = "admin/ftl/code/";						//存放路径
		String ftlPath = "createCode";								//ftl路径
		if("tree".equals(FHTYPE)){
			ftlPath = "createTreeCode";
			/*生成实体类*/
			Freemarker.printFile("entityTemplate.ftl", root, "entity/"+packageName+"/"+objectName+".java", filePath, ftlPath);
			/*生成jsp_tree页面*/
			Freemarker.printFile("jsp_tree_Template.ftl", root, "jsp/"+packageName+"/"+objectName.toLowerCase()+"/"+objectName.toLowerCase()+"_tree.jsp", filePath, ftlPath);
		}else if("fathertable".equals(FHTYPE)){
			ftlPath = "createFaCode";	//主表
		}else if("sontable".equals(FHTYPE)){
			ftlPath = "createSoCode";	//明细表
		}
		/*String copytosrcpath = "/Users/lijinyan/MyWork/ZYZH/GeneWisdomPlatForm/src/main/java/com/genewisdom";
		String copytoresource ="/Users/lijinyan/MyWork/ZYZH/GeneWisdomPlatForm/src/main/resources";
		String copytojsppath = "/Users/lijinyan/MyWork/ZYZH/GeneWisdomPlatForm/src/main/webapp/WEB-INF/jsp";*/

		/*生成controller*/
		Freemarker.printFile("controllerTemplate.ftl", root, "controller/"+packageName+"/"+objectName.toLowerCase()+"/"+objectName+"Controller.java", filePath, ftlPath);
		/*生成service*/
		Freemarker.printFile("serviceTemplate.ftl", root, "service/"+packageName+"/"+objectName.toLowerCase()+"/impl/"+objectName+"Service.java", filePath, ftlPath);
		/*生成manager*/
		Freemarker.printFile("managerTemplate.ftl", root, "service/"+packageName+"/"+objectName.toLowerCase()+"/"+objectName+"Manager.java", filePath, ftlPath);
		/*生成mybatis xml*/
		Freemarker.printFile("mapperMysqlTemplate.ftl", root, "mybatis_mysql/"+packageName+"/"+objectName+"Mapper.xml", filePath, ftlPath);
		Freemarker.printFile("mapperOracleTemplate.ftl", root, "mybatis_oracle/"+packageName+"/"+objectName+"Mapper.xml", filePath, ftlPath);
		Freemarker.printFile("mapperSqlserverTemplate.ftl", root, "mybatis_sqlserver/"+packageName+"/"+objectName+"Mapper.xml", filePath, ftlPath);
		/*生成SQL脚本*/
		Freemarker.printFile("mysql_SQL_Template.ftl", root, "mysql数据库脚本/"+tabletop+objectName.toUpperCase()+".sql", filePath, ftlPath);
		Freemarker.printFile("oracle_SQL_Template.ftl", root, "oracle数据库脚本/"+tabletop+objectName.toUpperCase()+".sql", filePath, ftlPath);
		Freemarker.printFile("sqlserver_SQL_Template.ftl", root, "sqlserver数据库脚本/"+tabletop+objectName.toUpperCase()+".sql", filePath, ftlPath);
		/*生成jsp页面*/
		Freemarker.printFile("jsp_list_Template.ftl", root, "jsp/"+packageName+"/"+objectName.toLowerCase()+"/"+objectName.toLowerCase()+"_list.jsp", filePath, ftlPath);
		Freemarker.printFile("jsp_edit_Template.ftl", root, "jsp/"+packageName+"/"+objectName.toLowerCase()+"/"+objectName.toLowerCase()+"_edit.jsp", filePath, ftlPath);
		/* ============================================================================================= */
		/*生成API服务接口层*/
		Freemarker.printFile("apiRestOpenService.ftl", root, "api/com/knowlegene/apirequest/"+packageName+"/"+objectName.toLowerCase()+"/"+objectName+"ApiService.java", filePath, ftlPath);
		/*生成API服务service层*/
		Freemarker.printFile("apiServiceTemplate.ftl", root, "api/com/knowlegene/apiservice/service/"+packageName+"/"+objectName.toLowerCase()+"/impl/"+objectName+"Service.java", filePath, ftlPath);
		/*生成API服务service层manager*/
		Freemarker.printFile("apiManagerTemplate.ftl", root, "api/com/knowlegene/apiservice/service/"+packageName+"/"+objectName.toLowerCase()+"/"+objectName+"Manager.java", filePath, ftlPath);
		/*生成API数据mybatis xml*/
		Freemarker.printFile("mapperMysqlTemplate.ftl", root, "api/mybatis/mybatis_mysql/"+packageName+"/"+objectName+"Mapper.xml", filePath, ftlPath);
		Freemarker.printFile("mapperOracleTemplate.ftl", root, "api/mybatis/mybatis_oracle/"+packageName+"/"+objectName+"Mapper.xml", filePath, ftlPath);
		Freemarker.printFile("mapperSqlserverTemplate.ftl", root, "api/mybatis/mybatis_sqlserver/"+packageName+"/"+objectName+"Mapper.xml", filePath, ftlPath);
		/*生成API服务数据库脚本SQL*/
		Freemarker.printFile("mysql_SQL_Template.ftl", root, "api/sqldb/mysql/"+tabletop+objectName.toUpperCase()+".sql", filePath, ftlPath);
		Freemarker.printFile("oracle_SQL_Template.ftl", root, "api/sqldb/oracle/"+tabletop+objectName.toUpperCase()+".sql", filePath, ftlPath);
		Freemarker.printFile("sqlserver_SQL_Template.ftl", root, "api/sqldb/sqlserver/"+tabletop+objectName.toUpperCase()+".sql", filePath, ftlPath);

		/*生成说明文档*/


		/*拷贝controller到工程目录下*/
		//FileUtil.copyDir(new File(PathUtil.getClasspath()+filePath+"controller/"),copytosrcpath+"/controller/");
		/*拷贝service到工程目录下*/
		//FileUtil.copyDir(new File(PathUtil.getClasspath()+filePath+"service/"),copytosrcpath+"/service/");
		/*拷贝mybatis xml 到工程目录下*/
		//FileUtil.copyDir(new File(PathUtil.getClasspath()+filePath+"mybatis_mysql/"),copytoresource+"/mybatis/");
		/*拷贝JSP 到工程目录下*/
		//FileUtil.copyDir(new File(PathUtil.getClasspath()+filePath+"jsp/"),copytojsppath+"/jsp/");

		//this.print("oracle_SQL_Template.ftl", root);  控制台打印
		/*生成的全部代码压缩成zip文件*/
		if(FileZip.zip(PathUtil.getClasspath()+"admin/ftl/code", PathUtil.getClasspath()+"admin/ftl/code.zip")){
			/*下载代码*/
			FileDownload.fileDownload(response, PathUtil.getClasspath()+"admin/ftl/code.zip", "code.zip");
		}
	}
	
	/**保存到数据库
	 * @throws Exception
	 */
	public void save(PageData pd) throws Exception{
		pd.put("PACKAGENAME", pd.getString("packageName"));	//包名
		pd.put("OBJECTNAME", pd.getString("objectName"));	//类名
		pd.put("TABLENAME", pd.getString("tabletop")+",fh,"+pd.getString("objectName").toUpperCase());	//表名
		pd.put("FIELDLIST", pd.getString("FIELDLIST"));		//属性集合
		pd.put("CREATETIME", DateUtil.getTime());			//创建时间
		pd.put("TITLE", pd.getString("TITLE"));				//说明
		pd.put("CREATECODE_ID", this.get32UUID());			//主键
		createcodeService.save(pd);
	}
	
	/**
	 * 通过ID获取数据
	 */
	@RequestMapping(value="/findById")
	@ResponseBody
	public Object findById() throws Exception {
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "cha")){return null;} //校验权限
		PageData pd = new PageData();
		pd = this.getPageData();
		Map<String,Object> map = new HashMap<String,Object>();
		try {
			pd = createcodeService.findById(pd);
		} catch (Exception e) {
			logger.error(e.toString(), e);
		} finally {
			logAfter(logger);
		}
		map.put("pd", pd);
		return AppUtil.returnObject(pd, map);
	}
	
	/**删除
	 * @param out
	 */
	@RequestMapping(value="/delete")
	public void delete(PrintWriter out) throws Exception{
		logBefore(logger, Jurisdiction.getUsername()+"删除CreateCode");
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "del")){return;} //校验权限
		PageData pd = new PageData();
		pd = this.getPageData();
		createcodeService.delete(pd);
		out.write("success");
		out.close();
	}
	
	/**
	 * 批量删除
	 */
	@RequestMapping(value="/deleteAll")
	@ResponseBody
	public Object deleteAll() throws Exception {
		logBefore(logger, Jurisdiction.getUsername()+"批量删除CreateCode");
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "dell")){return null;} //校验权限
		PageData pd = new PageData();		
		Map<String,Object> map = new HashMap<String,Object>();
		try {
			pd = this.getPageData();
			List<PageData> pdList = new ArrayList<PageData>();
			String DATA_IDS = pd.getString("DATA_IDS");
			if(null != DATA_IDS && !"".equals(DATA_IDS)){
				String ArrayDATA_IDS[] = DATA_IDS.split(",");
				createcodeService.deleteAll(ArrayDATA_IDS);
				pd.put("msg", "ok");
			}else{
				pd.put("msg", "no");
			}
			pdList.add(pd);
			map.put("list", pdList);
		} catch (Exception e) {
			logger.error(e.toString(), e);
		} finally {
			logAfter(logger);
		}
		return AppUtil.returnObject(pd, map);
	}
	
}