package com.genewisdom.controller.groupMemberInfo.groupmemberinfo;

import java.io.PrintWriter;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import javax.annotation.Resource;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import com.genewisdom.controller.base.BaseController;
import com.genewisdom.entity.Page;
import com.genewisdom.util.AppUtil;
import com.genewisdom.util.ObjectExcelView;
import com.genewisdom.util.PageData;
import com.genewisdom.util.Jurisdiction;
import com.genewisdom.util.Tools;
import com.genewisdom.service.groupMemberInfo.groupmemberinfo.GroupmemberinfoManager;

/** 
 * 说明：系客户群成员信息
 * 创建人：hongkai
 * 创建时间：2016-12-21
 * 邮箱地址：18611949252@163.com
 */
@Controller
@RequestMapping(value="/groupmemberinfo")
public class GroupmemberinfoController extends BaseController {
	
	String menuUrl = "groupmemberinfo/list.do"; //菜单地址(权限用)
	@Resource(name="groupmemberinfoService")
	private GroupmemberinfoManager groupmemberinfoService;
	
	/**保存
	 * @param
	 * @throws Exception
	 */
	@RequestMapping(value="/save")
	public ModelAndView save() throws Exception{
		logBefore(logger, Jurisdiction.getUsername()+"新增Groupmemberinfo");
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "add")){return null;} //校验权限
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		pd.put("GROUPMEMBERINFO_ID", this.get32UUID());	//主键
		groupmemberinfoService.save(pd);
		mv.addObject("msg","success");
		mv.setViewName("save_result");
		return mv;
	}
	
	/**删除
	 * @param out
	 * @throws Exception
	 */
	@RequestMapping(value="/delete")
	public void delete(PrintWriter out) throws Exception{
		logBefore(logger, Jurisdiction.getUsername()+"删除Groupmemberinfo");
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "del")){return;} //校验权限
		PageData pd = new PageData();
		pd = this.getPageData();
		groupmemberinfoService.delete(pd);
		out.write("success");
		out.close();
	}
	
	/**修改
	 * @param
	 * @throws Exception
	 */
	@RequestMapping(value="/edit")
	public ModelAndView edit() throws Exception{
		logBefore(logger, Jurisdiction.getUsername()+"修改Groupmemberinfo");
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "edit")){return null;} //校验权限
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		groupmemberinfoService.edit(pd);
		mv.addObject("msg","success");
		mv.setViewName("save_result");
		return mv;
	}
	
	/**列表
	 * @param page
	 * @throws Exception
	 */
	@RequestMapping(value="/list")
	public ModelAndView list(Page page) throws Exception{
		logBefore(logger, Jurisdiction.getUsername()+"列表Groupmemberinfo");
		//if(!Jurisdiction.buttonJurisdiction(menuUrl, "cha")){return null;} //校验权限(无权查看时页面会有提示,如果不注释掉这句代码就无法进入列表页面,所以根据情况是否加入本句代码)
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		String keywords = pd.getString("keywords");				//关键词检索条件
		if(null != keywords && !"".equals(keywords)){
			pd.put("keywords", keywords.trim());
		}
		page.setPd(pd);
		List<PageData>	varList = groupmemberinfoService.list(page);	//列出Groupmemberinfo列表
		mv.setViewName("groupMemberInfo/groupmemberinfo/groupmemberinfo_list");
		mv.addObject("varList", varList);
		mv.addObject("pd", pd);
		mv.addObject("QX",Jurisdiction.getHC());	//按钮权限
		return mv;
	}
	
	/**去新增页面
	 * @param
	 * @throws Exception
	 */
	@RequestMapping(value="/goAdd")
	public ModelAndView goAdd()throws Exception{
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		mv.setViewName("groupMemberInfo/groupmemberinfo/groupmemberinfo_edit");
		mv.addObject("msg", "save");
		mv.addObject("pd", pd);
		return mv;
	}	
	
	 /**去修改页面
	 * @param
	 * @throws Exception
	 */
	@RequestMapping(value="/goEdit")
	public ModelAndView goEdit()throws Exception{
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		pd = groupmemberinfoService.findById(pd);	//根据ID读取
		mv.setViewName("groupMemberInfo/groupmemberinfo/groupmemberinfo_edit");
		mv.addObject("msg", "edit");
		mv.addObject("pd", pd);
		return mv;
	}	
	
	 /**批量删除
	 * @param
	 * @throws Exception
	 */
	@RequestMapping(value="/deleteAll")
	@ResponseBody
	public Object deleteAll() throws Exception{
		logBefore(logger, Jurisdiction.getUsername()+"批量删除Groupmemberinfo");
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "del")){return null;} //校验权限
		PageData pd = new PageData();		
		Map<String,Object> map = new HashMap<String,Object>();
		pd = this.getPageData();
		List<PageData> pdList = new ArrayList<PageData>();
		String DATA_IDS = pd.getString("DATA_IDS");
		if(null != DATA_IDS && !"".equals(DATA_IDS)){
			String ArrayDATA_IDS[] = DATA_IDS.split(",");
			groupmemberinfoService.deleteAll(ArrayDATA_IDS);
			pd.put("msg", "ok");
		}else{
			pd.put("msg", "no");
		}
		pdList.add(pd);
		map.put("list", pdList);
		return AppUtil.returnObject(pd, map);
	}
	
	 /**导出到excel
	 * @param
	 * @throws Exception
	 */
	@RequestMapping(value="/excel")
	public ModelAndView exportExcel() throws Exception{
		logBefore(logger, Jurisdiction.getUsername()+"导出Groupmemberinfo到excel");
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "cha")){return null;}
		ModelAndView mv = new ModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		Map<String,Object> dataMap = new HashMap<String,Object>();
		List<String> titles = new ArrayList<String>();
		titles.add("数据日期");	//1
		titles.add("系编号");	//2
		titles.add("系名称");	//3
		titles.add("成员证件类型");	//4
		titles.add("成员证件代码");	//5
		titles.add("成员名称");	//6
		titles.add("成员属性；C-企业，P-个人");	//7
		titles.add("成员企业类型   1-龙头企业；2-核心企业；3-一般企业");	//8
		titles.add("成员层次");	//9
		titles.add("成员企业类型 ， 股份公司、其他。");	//10
		titles.add("成员企业工商登记状态	");	//11
		titles.add("成员企业工商注册资金	");	//12
		titles.add("成员企业工商注册时间	");	//13
		titles.add("成员企业所属行业国标编码，暂是保留小类，待工商数据出来后最后确定");	//14
		titles.add("成员企业所属行业国标名称");	//15
		titles.add("成员企业所属地区国标编码，暂时到市级别");	//16
		titles.add("成员企业所属地区国标名称");	//17
		dataMap.put("titles", titles);
		List<PageData> varOList = groupmemberinfoService.listAll(pd);
		List<PageData> varList = new ArrayList<PageData>();
		for(int i=0;i<varOList.size();i++){
			PageData vpd = new PageData();
			vpd.put("var1", varOList.get(i).getString("DATA_DATE"));	    //1
			vpd.put("var2", varOList.get(i).getString("GROUP_CODE"));	    //2
			vpd.put("var3", varOList.get(i).getString("GROUP_NAME"));	    //3
			vpd.put("var4", varOList.get(i).getString("MEMBER_CERT_TYPE"));	    //4
			vpd.put("var5", varOList.get(i).getString("MEMBER_CERT_CODE"));	    //5
			vpd.put("var6", varOList.get(i).getString("MEMBER_NAME"));	    //6
			vpd.put("var7", varOList.get(i).getString("MEMBER_ATTR"));	    //7
			vpd.put("var8", varOList.get(i).get("MEMBER_TYPE").toString());	//8
			vpd.put("var9", varOList.get(i).get("MEMBER_LEVEL").toString());	//9
			vpd.put("var10", varOList.get(i).get("MEMBER_CORP_LEVEL").toString());	//10
			vpd.put("var11", varOList.get(i).get("MEMBER_STATUS").toString());	//11
			vpd.put("var12", varOList.get(i).get("MEMBER_REGI_CAP").toString());	//12
			vpd.put("var13", varOList.get(i).getString("MEMBER_ES_DATE"));	    //13
			vpd.put("var14", varOList.get(i).getString("MEMBER_TRADE_CODE"));	    //14
			vpd.put("var15", varOList.get(i).getString("MEMBER_TRADE_NAME"));	    //15
			vpd.put("var16", varOList.get(i).getString("MEMBER_REGION_CODE"));	    //16
			vpd.put("var17", varOList.get(i).getString("MEMBER_REGION_NAME"));	    //17
			varList.add(vpd);
		}
		dataMap.put("varList", varList);
		ObjectExcelView erv = new ObjectExcelView();
		mv = new ModelAndView(erv,dataMap);
		return mv;
	}
	
	@InitBinder
	public void initBinder(WebDataBinder binder){
		DateFormat format = new SimpleDateFormat("yyyy-MM-dd");
		binder.registerCustomEditor(Date.class, new CustomDateEditor(format,true));
	}
}
