package com.genewisdom.controller.groupInfo.group_info;

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
import com.genewisdom.service.groupInfo.group_info.GROUP_INFOManager;

/** 
 * 说明：系客户群基本信息
 * 创建人：hongkai
 * 创建时间：2016-12-21
 * 邮箱地址：18611949252@163.com
 */
@Controller
@RequestMapping(value="/group_info")
public class GROUP_INFOController extends BaseController {
	
	String menuUrl = "group_info/list.do"; //菜单地址(权限用)
	@Resource(name="group_infoService")
	private GROUP_INFOManager group_infoService;
	
	/**保存
	 * @param
	 * @throws Exception
	 */
	@RequestMapping(value="/save")
	public ModelAndView save() throws Exception{
		logBefore(logger, Jurisdiction.getUsername()+"新增GROUP_INFO");
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "add")){return null;} //校验权限
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		pd.put("GROUP_INFO_ID", this.get32UUID());	//主键
		group_infoService.save(pd);
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
		logBefore(logger, Jurisdiction.getUsername()+"删除GROUP_INFO");
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "del")){return;} //校验权限
		PageData pd = new PageData();
		pd = this.getPageData();
		group_infoService.delete(pd);
		out.write("success");
		out.close();
	}
	
	/**修改
	 * @param
	 * @throws Exception
	 */
	@RequestMapping(value="/edit")
	public ModelAndView edit() throws Exception{
		logBefore(logger, Jurisdiction.getUsername()+"修改GROUP_INFO");
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "edit")){return null;} //校验权限
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		group_infoService.edit(pd);
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
		logBefore(logger, Jurisdiction.getUsername()+"列表GROUP_INFO");
		//if(!Jurisdiction.buttonJurisdiction(menuUrl, "cha")){return null;} //校验权限(无权查看时页面会有提示,如果不注释掉这句代码就无法进入列表页面,所以根据情况是否加入本句代码)
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		String keywords = pd.getString("keywords");				//关键词检索条件
		if(null != keywords && !"".equals(keywords)){
			pd.put("keywords", keywords.trim());
		}
		page.setPd(pd);
		List<PageData>	varList = group_infoService.list(page);	//列出GROUP_INFO列表
		mv.setViewName("groupInfo/group_info/group_info_list");
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
		mv.setViewName("groupInfo/group_info/group_info_edit");
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
		pd = group_infoService.findById(pd);	//根据ID读取
		mv.setViewName("groupInfo/group_info/group_info_edit");
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
		logBefore(logger, Jurisdiction.getUsername()+"批量删除GROUP_INFO");
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "del")){return null;} //校验权限
		PageData pd = new PageData();		
		Map<String,Object> map = new HashMap<String,Object>();
		pd = this.getPageData();
		List<PageData> pdList = new ArrayList<PageData>();
		String DATA_IDS = pd.getString("DATA_IDS");
		if(null != DATA_IDS && !"".equals(DATA_IDS)){
			String ArrayDATA_IDS[] = DATA_IDS.split(",");
			group_infoService.deleteAll(ArrayDATA_IDS);
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
		logBefore(logger, Jurisdiction.getUsername()+"导出GROUP_INFO到excel");
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "cha")){return null;}
		ModelAndView mv = new ModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		Map<String,Object> dataMap = new HashMap<String,Object>();
		List<String> titles = new ArrayList<String>();
		titles.add("数据日期");	//1
		titles.add("系编号");	//2
		titles.add("系名称");	//3
		titles.add("龙头企业证件类型");	//4
		titles.add("龙头企业证件代码");	//5
		titles.add("龙头企业名称");	//6
		titles.add("实际控制人证件类型");	//7
		titles.add("实际控制人证件代码");	//8
		titles.add("实际控制人名称");	//9
		titles.add("成员数量");	//10
		titles.add("系健康状况编码");	//11
		titles.add("系健康状况名称");	//12
		dataMap.put("titles", titles);
		List<PageData> varOList = group_infoService.listAll(pd);
		List<PageData> varList = new ArrayList<PageData>();
		for(int i=0;i<varOList.size();i++){
			PageData vpd = new PageData();
			vpd.put("var1", varOList.get(i).getString("DATA_DATE"));	    //1
			vpd.put("var2", varOList.get(i).getString("GROUP_CODE"));	    //2
			vpd.put("var3", varOList.get(i).getString("GROUP_NAME"));	    //3
			vpd.put("var4", varOList.get(i).getString("CORP_CHP_CERT_TYPE"));	    //4
			vpd.put("var5", varOList.get(i).getString("CORP_CHP_CERT_CODE"));	    //5
			vpd.put("var6", varOList.get(i).getString("CORP_CHP_NAME"));	    //6
			vpd.put("var7", varOList.get(i).getString("CTRL_CERT_TYPE"));	    //7
			vpd.put("var8", varOList.get(i).getString("CTRL_CERT_CODE"));	    //8
			vpd.put("var9", varOList.get(i).getString("CTRL_NAME"));	    //9
			vpd.put("var10", varOList.get(i).get("MEMBER_NUM").toString());	//10
			vpd.put("var11", varOList.get(i).getString("IS_HEALTH"));	    //11
			vpd.put("var12", varOList.get(i).getString("IS_HEALTH_CN"));	    //12
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
