package com.genewisdom.controller.genemain;

import com.genewisdom.controller.base.BaseController;
import com.genewisdom.entity.Page;
import com.genewisdom.util.PageData;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;

/**
 *  业务首页访问
 *
 * @User SimonKing
 * @Date 16/12/5.
 * @Time 12:21.
 * @Mail yuhongkai@nswt.com.cn
 */
@Controller
@RequestMapping(value="/genemain")
public class GeneMain extends BaseController {
        /**显示主页信息
         * @param page
         * @return
         */
        @RequestMapping(value="/main")
        public ModelAndView listUsers(Page page){
            ModelAndView mv = this.getModelAndView();
            PageData pd = new PageData();
            try{
                pd = this.getPageData();
                String keywords = pd.getString("keywords");							//检索条件 关键词
                if(null != keywords && !"".equals(keywords)){
                    pd.put("keywords", keywords.trim());
                }
                page.setPd(pd);
                mv.setViewName("genemain/index");
            } catch(Exception e){
                logger.error(e.toString(), e);
            }
            return mv;
        }

    }
