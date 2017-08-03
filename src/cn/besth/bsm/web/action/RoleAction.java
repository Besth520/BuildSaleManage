package cn.besth.bsm.web.action;

import java.util.List;

import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import cn.besth.bsm.vo.Role;
import cn.besth.bsm.web.action.base.BaseAction;



@Controller
@Scope("prototype")
public class RoleAction extends BaseAction<Role>{
	
	private String ids;
	public String getIds() {
		return ids;
	}
	public void setIds(String ids) {
		this.ids = ids;
	}


	public String save(){
		roleService.save(model,ids);
		return "list";
	}
	
	public String list(){
		List<Role> list = roleService.findAll();
		listToJson(list, new String[]{"users","functions",});
		return NONE;
	}
}
