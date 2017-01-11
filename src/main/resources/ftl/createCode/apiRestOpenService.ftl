package com.knowlegene.apirequest.${packageName};

import com.knowlegene.apiservice.entity.Page;
import com.knowlegene.apiservice.service.${packageName}.${objectNameLower}.${objectName}Manager;
import com.knowlegene.apiservice.util.PageData;
import com.knowlegene.sample.AbstractUserService;
import com.knowlegene.sample.request.LogonRequest;
import com.knowlegene.sample.response.LogonResponse;
import com.knowlegene.sample.response.UserListResponse;
import com.rop.Constants;
import com.rop.RopRequest;
import com.rop.annotation.*;
import com.rop.session.SimpleSession;
import org.springframework.core.io.ClassPathResource;
import org.springframework.util.FileCopyUtils;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletResponse;
import java.util.List;

/**
* 说明： ${TITLE}
* 创建人：${USERNAME}
* 创建时间：${nowDate?string("yyyy-MM-dd")}
* 邮箱地址：${USERMAILL}
* @version
*/

//标注Rop的注解，使${objectName}ApiService成为一个Rop的服务
@ServiceMethodBean(version = "1.0")
public class ${objectName}ApiService extends AbstractUserService {

  @Resource(name="${objectNameLower}Service")
  private ${objectName}Manager ${objectNameLower}Service;

  //使该服务方法成为一个webService的方法
  @ServiceMethod(method = "${objectNameLower}.getSession",version ="1.0",needInSession = NeedInSessionType.NO)
  public Object getSession(LogonRequest request) {
    //创建一个会话
    SimpleSession session = new SimpleSession();
    session.setAttribute("userName", request.getUserName());
    request.getRopRequestContext().addSession("mockSessionId1", session);
    Page p = new Page();
    PageData pd = new PageData();
    try {
        List<PageData> ${objectNameLower}List = ${objectNameLower}Service.listAll(pd);
    } catch (Exception e) {
        e.printStackTrace();
    }
    //返回响应
    LogonResponse logonResponse = new LogonResponse();
    logonResponse.setSessionId("mockSessionId1");
    return logonResponse;
  }

  @ServiceMethod(method = "${objectNameLower}.list",version = "1.0",ignoreSign = IgnoreSignType.YES,needInSession = NeedInSessionType.NO,httpAction = HttpAction.GET)
  public Object ${objectNameLower}List(RopRequest ropRequest) throws Throwable {
    PageData pd = new PageData();
    Page page = new Page();page.setPd(pd);
    List<PageData> ${objectNameLower}List = null;
        try {
            ${objectNameLower}List = ${objectNameLower}Service.list(page);	//列出HkCore列表
        } catch (Exception e) {
            e.printStackTrace();
        }
        return ${objectNameLower}List;
  }
}
