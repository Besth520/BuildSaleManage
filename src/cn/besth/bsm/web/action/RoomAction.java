package cn.besth.bsm.web.action;

import java.util.List;

import org.apache.commons.lang3.StringUtils;
import org.hibernate.criterion.DetachedCriteria;
import org.hibernate.criterion.Restrictions;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import cn.besth.bsm.vo.Build;
import cn.besth.bsm.vo.House;
import cn.besth.bsm.vo.Room;
import cn.besth.bsm.web.action.base.BaseAction;

@Controller
@Scope("prototype")
public class RoomAction extends BaseAction<Room>{

	
	public String save(){
		roomService.save(model);
		return "listAll";
	}
	
	public String pageQuery(){
		String name = model.getName();
		Integer type = model.getType();
		Integer direction = model.getDirection();
		Integer style = model.getStyle();
		Float tarea = model.getTarea();
		Float price = model.getPrice();
		Build build = model.getBuild();
		DetachedCriteria rCriteria = pageBean.getDetachedCriteria();
		if (StringUtils.isNotBlank(name)) {
			rCriteria.add(Restrictions.like("name", "%"+name+"%"));
		}
		if (type!=null) {
			rCriteria.add(Restrictions.eq("type", type));
		}
		if (direction!=null) {
			rCriteria.add(Restrictions.eq("direction", direction));
		}
		if (style!=null) {
			rCriteria.add(Restrictions.eq("style", style));
		}
		if (tarea!=null) {
			rCriteria.add(Restrictions.eq("tarea", tarea));
		}
		if (price!=null) {
			rCriteria.add(Restrictions.eq("price", price));
		}
		if (build!=null) {
			Integer id = build.getId();
			DetachedCriteria bCriteria = rCriteria.createCriteria("build");
			if (id!=null) {
				bCriteria.add(Restrictions.eq("id",id));
			}
		}
		roomService.pageQuery(pageBean);
		pageBeanToJson(pageBean,new String[]{"detachedCriteria","currPage","pageSize","records","rooms","builds"});
		return NONE;
	}
	
	public String update(){
		roomService.update(model);
		return "listAll";
	}
	
	public String findByAjax(){
		List<Room> list = roomService.findAll();
		listToJson(list, new String[]{"detachedCriteria","currPage","pageSize","records","build"});
		return NONE;
	}
	
	public String findByAjaxCondition(){
		List<Room> list = roomService.findByAjaxCondition();
		listToJson(list, new String[]{"detachedCriteria","currPage","pageSize","records","build"});
		return NONE;
	}
}
