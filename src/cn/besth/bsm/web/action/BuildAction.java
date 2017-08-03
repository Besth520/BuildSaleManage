package cn.besth.bsm.web.action;

import java.util.List;

import org.apache.commons.lang3.StringUtils;
import org.hibernate.criterion.DetachedCriteria;
import org.hibernate.criterion.Restrictions;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import cn.besth.bsm.vo.Build;
import cn.besth.bsm.vo.House;
import cn.besth.bsm.web.action.base.BaseAction;

@Controller
@Scope("prototype")
public class BuildAction extends BaseAction<Build>{
	
	public String pageQuery(){
		String name = model.getName();
		Integer construction = model.getConstruction();
		Integer direction = model.getDirection();
		Integer type = model.getType();
		House house = model.getHouse();
		DetachedCriteria bCriteria = pageBean.getDetachedCriteria();
		if (StringUtils.isNotBlank(name)) {
			bCriteria.add(Restrictions.like("name", "%"+name+"%"));
		}
		if (construction!=null) {
			bCriteria.add(Restrictions.eq("construction", construction));
		}
		if (type!=null) {
			bCriteria.add(Restrictions.eq("type", type));
		}
		if (house!=null) {
			String hname = house.getName();
			DetachedCriteria hCriteria = bCriteria.createCriteria("house");
			if (StringUtils.isNotBlank(hname)) {
				hCriteria.add(Restrictions.like("name", "%"+hname+"%"));
			}
		}
		buildService.pageQuery(pageBean);
		pageBeanToJson(pageBean, new String[]{"detachedCriteria","currPage","pageSize","rooms","builds"});
		return NONE;
	}
	
	public String save(){
		buildService.save(model);
		return "listAll";
	}
	
	public String update(){
		buildService.update(model);
		return "listAll";
	}
	
	public String findByAjax(){
		List<Build> list = buildService.findAll();
		listToJson(list, new String[]{"detachedCriteria","currPage","pageSize","house","rooms"});
		return NONE;
	}
}
