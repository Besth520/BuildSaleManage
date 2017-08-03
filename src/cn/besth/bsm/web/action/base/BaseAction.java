package cn.besth.bsm.web.action.base;

import java.io.IOException;
import java.lang.reflect.ParameterizedType;
import java.lang.reflect.Type;
import java.util.List;

import javax.annotation.Resource;

import org.apache.struts2.ServletActionContext;
import org.hibernate.criterion.DetachedCriteria;

import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;

import cn.besth.bsm.service.IBuildService;
import cn.besth.bsm.service.ICustomerService;
import cn.besth.bsm.service.IFunctionService;
import cn.besth.bsm.service.IHouseService;
import cn.besth.bsm.service.IRecordService;
import cn.besth.bsm.service.IRoleService;
import cn.besth.bsm.service.IRoomService;
import cn.besth.bsm.service.IUserService;
import cn.besth.bsm.utils.DateJsonValueProcessor;
import cn.besth.bsm.utils.PageBean;
import net.sf.json.JSONArray;
import net.sf.json.JSONObject;
import net.sf.json.JsonConfig;

public class BaseAction<T> extends ActionSupport implements ModelDriven<T>{
	
	protected T model;
	
	public T getModel() {
		return model;
	}
	
	protected PageBean pageBean = new PageBean();
	protected DetachedCriteria detachedCriteria;
	
	public void setPage(Integer page) {
		pageBean.setCurrPage(page);
	}
	public void setRows(Integer rows) {
		pageBean.setPageSize(rows);
	}
	@Resource
	protected IFunctionService functionService;
	@Resource
	protected IRoleService roleService;
	@Resource
	protected IUserService userService;
	@Resource
	protected ICustomerService customerService;
	@Resource
	protected IHouseService houseService;
	@Resource
	protected IBuildService buildService;
	@Resource
	protected IRoomService roomService;
	@Resource
	protected IRecordService recordService;
	
	public BaseAction(){
		ParameterizedType genericSuperclass = null;
		Type genericSuperclass2 = this.getClass().getGenericSuperclass();
		if (genericSuperclass2 instanceof ParameterizedType) {
			genericSuperclass = (ParameterizedType) genericSuperclass2;
		}else {
			genericSuperclass = (ParameterizedType) this.getClass().getSuperclass().getGenericSuperclass();
		}
		Type[] actualTypeArguments = genericSuperclass.getActualTypeArguments();
		Class<T> voClass = (Class<T>) actualTypeArguments[0];
		detachedCriteria = DetachedCriteria.forClass(voClass);
		pageBean.setDetachedCriteria(detachedCriteria);
		try {
			model = voClass.newInstance();
		} catch (InstantiationException e) {
			e.printStackTrace();
		} catch (IllegalAccessException e) {
			e.printStackTrace();
		}
	}
	
	public void pageBeanToJson(PageBean pageBean,String[] config){
		JsonConfig jsonConfig = new JsonConfig();
		jsonConfig.setExcludes(config);
		jsonConfig.registerJsonValueProcessor(java.sql.Timestamp.class, new DateJsonValueProcessor());  
		jsonConfig.registerJsonValueProcessor(java.util.Date.class, new DateJsonValueProcessor());  
		JSONObject jsonObject = JSONObject.fromObject(pageBean, jsonConfig);
		String json = jsonObject.toString();
		ServletActionContext.getResponse().setContentType("text/json;charset=utf-8");
		try {
			ServletActionContext.getResponse().getWriter().print(json);
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	public void listToJson(List list,String[] config){
		JsonConfig jsonConfig = new JsonConfig();
		jsonConfig.setExcludes(config);
		jsonConfig.registerJsonValueProcessor(java.sql.Timestamp.class, new DateJsonValueProcessor());  
		jsonConfig.registerJsonValueProcessor(java.util.Date.class, new DateJsonValueProcessor());
		JSONArray jsonObject = JSONArray.fromObject(list, jsonConfig);
		String json = jsonObject.toString();
		ServletActionContext.getResponse().setContentType("text/json;charset=utf-8");
		try {
			ServletActionContext.getResponse().getWriter().print(json);
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	public void objectToJson(Object object,String[] config){
		JsonConfig jsonConfig = new JsonConfig();
		jsonConfig.setExcludes(config);
		jsonConfig.registerJsonValueProcessor(java.sql.Timestamp.class, new DateJsonValueProcessor());  
		jsonConfig.registerJsonValueProcessor(java.util.Date.class, new DateJsonValueProcessor());
		JSONObject jsonObject = JSONObject.fromObject(object, jsonConfig);
		String json = jsonObject.toString();
		ServletActionContext.getResponse().setContentType("text/json;charset=utf-8");
		try {
			ServletActionContext.getResponse().getWriter().print(json);
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

}
