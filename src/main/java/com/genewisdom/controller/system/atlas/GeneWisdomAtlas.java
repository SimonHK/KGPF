package com.genewisdom.controller.system.atlas;

import com.genewisdom.controller.base.BaseController;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

/**
 * @User SimonKing
 * @Date 16/12/2.
 * @Time 18:58.
 * @Mail yuhongkai@nswt.com.cn
 */
@Controller
@RequestMapping(value="/atlas")
public class GeneWisdomAtlas extends BaseController {

    /**图表报表demo页面
     * @return
     * @throws Exception
     */
    @RequestMapping(value="/atlasMain")
    public ModelAndView atlasMain() throws Exception{
        ModelAndView mv = this.getModelAndView();
        //FusionCharts 报表demo  用的时候，循环拼字符串即可
        String strXML = "<graph caption='前12个月订单销量柱状图' xAxisName='月份' yAxisName='值' decimalPrecision='0' formatNumberScale='0'>"
                +"<set name='2013-05' value='4' color='AFD8F8'/>"
                +"<set name='2013-04' value='0' color='AFD8F8'/>"
                +"<set name='2013-03' value='0' color='AFD8F8'/>"
                +"<set name='2013-02' value='0' color='AFD8F8'/>"
                +"<set name='2013-01' value='0' color='AFD8F8'/>"
                +"<set name='2012-01' value='0' color='AFD8F8'/>"
                +"<set name='2012-11' value='0' color='AFD8F8'/>"
                +"<set name='2012-10' value='0' color='AFD8F8'/>"
                +"<set name='2012-09' value='0' color='AFD8F8'/>"
                +"<set name='2012-08' value='0' color='AFD8F8'/>"
                +"<set name='2012-07' value='0' color='AFD8F8'/>"
                +"<set name='2012-06' value='0' color='AFD8F8'/>"
                +"</graph>" ;
        mv.addObject("strXML", strXML);
        mv.setViewName("system/atlas/AtlasMain");
        return mv;
    }
}
