package cn.besth.bsm.web.action;

import java.util.List;

import org.apache.commons.lang3.StringUtils;
import org.hibernate.criterion.DetachedCriteria;
import org.hibernate.criterion.Restrictions;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import cn.besth.bsm.vo.Customer;
import cn.besth.bsm.web.action.base.BaseAction;

@Controller
@Scope("prototype")
public class CustomerAction extends BaseAction<Customer>{
	
	public String pageQuery(){
		String name = model.getName();
		String job = model.getJob();
		String phone = model.getPhone();
		String style = model.getStyle();
		DetachedCriteria criteria = pageBean.getDetachedCriteria();
		if (StringUtils.isNotBlank(name)) {
			criteria.add(Restrictions.like("name", '%'+name+'%'));
		}
		if (StringUtils.isNotBlank(job)) {
			criteria.add(Restrictions.like("job", '%'+job+'%'));
		}
		if (StringUtils.isNotBlank(phone)) {
			criteria.add(Restrictions.like("phone", '%'+phone+'%'));
		}
		if (StringUtils.isNotBlank(style)) {
			criteria.add(Restrictions.like("style", '%'+style+'%'));
		}
		customerService.pageQuery(pageBean);
		this.pageBeanToJson(pageBean, new String[]{"detachedCriteria","currPage","pageSize","records"});
		return NONE;
	}
	
	public String save(){
		customerService.save(model);
		return "listAll";
	}
	
	public String update(){
		customerService.update(model);
		return "listAll";
	}
	
	public String findByAjax(){
		List<Customer> list = customerService.findAll();
		listToJson(list, new String[]{"detachedCriteria","currPage","pageSize","records"});
		return NONE;
	}
}
