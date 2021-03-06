package cn.besth.bsm.vo;

import java.util.HashSet;
import java.util.Set;

/**
 * Function entity. @author MyEclipse Persistence Tools
 */

public class Function implements java.io.Serializable {

	// Fields

	private String id;
	private Function parentFunction;
	private String name;
	private String code;
	private String description;
	private String page;
	private String generatemenu;
	private Integer zindex;
	private Integer statu;
	private Set roles = new HashSet(0);
	private Set children = new HashSet(0);
	
	private String pId;
	
	
	public String getpId() {
		if (parentFunction!=null) {
			return parentFunction.getId();
		}
		return "0";
	}
	public void setpId(String pId) {
		this.pId = pId;
	}
	
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public Function getParentFunction() {
		return parentFunction;
	}
	public void setParentFunction(Function parentFunction) {
		this.parentFunction = parentFunction;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getCode() {
		return code;
	}
	public void setCode(String code) {
		this.code = code;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public String getPage() {
		return page;
	}
	public void setPage(String page) {
		this.page = page;
	}
	public String getGeneratemenu() {
		return generatemenu;
	}
	public void setGeneratemenu(String generatemenu) {
		this.generatemenu = generatemenu;
	}
	public Integer getZindex() {
		return zindex;
	}
	public void setZindex(Integer zindex) {
		this.zindex = zindex;
	}
	public Set getRoles() {
		return roles;
	}
	public void setRoles(Set roles) {
		this.roles = roles;
	}
	public Set getChildren() {
		return children;
	}
	public void setChildren(Set children) {
		this.children = children;
	}
	public Integer getStatu() {
		return statu;
	}
	public void setStatu(Integer statu) {
		this.statu = statu;
	}

	

}