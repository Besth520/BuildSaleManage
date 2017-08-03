package cn.besth.bsm.web.action;

import java.util.List;

import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import cn.besth.bsm.utils.BosContext;
import cn.besth.bsm.vo.Function;
import cn.besth.bsm.web.action.base.BaseAction;



@Controller
@Scope("prototype")
public class FunctionAction extends BaseAction<Function>{


	public String pageQuery(){
		pageBean.setCurrPage(Integer.parseInt(model.getPage()));
		functionService.findPageQuery(pageBean);
		pageBeanToJson(pageBean, new String[]{"parentFunction","roles","children"});
		return NONE;
	}
	
	public String list(){
		List<Function> list = functionService.findAll();
		listToJson(list, new String[]{"parentFunction","roles","children"});
		return NONE;
	}
	
	public String findMenu(){
		List<Function> list = functionService.findMenu(BosContext.getExistUser());
		listToJson(list, new String[]{"parentFunction","roles","children"});
		return NONE;
	}
	
	public String findSysMenu(){
		List<Function> list = functionService.findSysMenu(BosContext.getExistUser());
		listToJson(list, new String[]{"parentFunction","roles","children"});
		return NONE;
	}
}
