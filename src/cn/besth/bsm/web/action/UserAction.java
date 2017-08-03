package cn.besth.bsm.web.action;

import java.io.IOException;
import java.util.List;

import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.AuthenticationToken;
import org.apache.shiro.authc.IncorrectCredentialsException;
import org.apache.shiro.authc.UnknownAccountException;
import org.apache.shiro.authc.UsernamePasswordToken;
import org.apache.shiro.subject.Subject;
import org.apache.struts2.ServletActionContext;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import cn.besth.bsm.utils.BosContext;
import cn.besth.bsm.utils.MD5Utils;
import cn.besth.bsm.vo.User;
import cn.besth.bsm.web.action.base.BaseAction;

@Controller
@Scope("prototype")
public class UserAction extends BaseAction<User>{
	
	private String checkcode;
	public String getCheckcode() {
		return checkcode;
	}
	public void setCheckcode(String checkcode) {
		this.checkcode = checkcode;
	}

	public String login(){
		String validatecode = (String) ServletActionContext.getRequest().getSession().getAttribute("key");
		if ("".equals(checkcode) || !validatecode.equals(checkcode)) {
			this.addActionError(this.getText("CheckCodeError"));
			return "login";
		}
		Subject subject = SecurityUtils.getSubject();
		String username = model.getUsername();
		String password = model.getPassword();
		password = MD5Utils.md5(password);
		AuthenticationToken token = new UsernamePasswordToken(username, password);
		try {
			subject.login(token);
			User existUser = (User) subject.getPrincipal();
			ServletActionContext.getRequest().getSession().setAttribute("existUser", existUser);
		} catch (UnknownAccountException e) {
			this.addActionError("用户名不存在");
			return "login";
		}catch (IncorrectCredentialsException e) {
			e.printStackTrace();
			this.addActionError("密码错误");
			return "login";
		}
		
		return "login_success";
	}
	
	public String logout(){
		ServletActionContext.getRequest().getSession().invalidate();
		return "login";
	}
	
	public String editPassword() throws IOException{
		String password = model.getPassword();
		String id = BosContext.getExistUser().getId();
		String flag = "1";
		try {
			userService.editPassword(password,id);
		} catch (Exception e) {
			e.printStackTrace();
			flag = "0";
		}
		ServletActionContext.getResponse().setContentType("text/html;charset=UTF-8");
		ServletActionContext.getResponse().getWriter().print(flag);
		return NONE;
	}
	
	private String[] roleIds;
	public void setRoleIds(String[] roleIds) {
		this.roleIds = roleIds;
	}
	
	public String save(){
		userService.save(model,roleIds);
		return "list";
	}
	
	public String list(){
		List<User> list = userService.findAll();
		listToJson(list, new String[]{"roles","records"});
		return NONE;
	}
	
	public String findByAjax(){
		List<User> list = userService.findAll();
		listToJson(list, new String[]{"detachedCriteria","currPage","pageSize","roles","records"});
		return NONE;
	}
}
