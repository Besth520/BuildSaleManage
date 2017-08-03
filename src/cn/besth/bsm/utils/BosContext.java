package cn.besth.bsm.utils;

import org.apache.struts2.ServletActionContext;

import cn.besth.bsm.vo.User;



public class BosContext {
	public static User getExistUser(){
		return (User) ServletActionContext.getRequest().getSession().getAttribute("existUser");
	}
}
