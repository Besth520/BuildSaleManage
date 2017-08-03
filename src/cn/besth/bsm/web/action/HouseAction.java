package cn.besth.bsm.web.action;

import java.util.List;

import org.apache.commons.lang3.StringUtils;
import org.hibernate.criterion.DetachedCriteria;
import org.hibernate.criterion.Restrictions;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import cn.besth.bsm.vo.House;
import cn.besth.bsm.web.action.base.BaseAction;

@Controller
@Scope("prototype")
public class HouseAction extends BaseAction<House>{
	
	public String pageQuery(){
		String name = model.getName();
		String position = model.getPosition();
		Integer sum = model.getSum();
		DetachedCriteria criteria = pageBean.getDetachedCriteria();
		if (StringUtils.isNotBlank(name)) {
			criteria.add(Restrictions.like("name",'%'+name+'%'));
		}
		if (StringUtils.isNotBlank(position)) {
			criteria.add(Restrictions.like("position",'%'+position+'%'));
		}
		if (sum!=null) {
			criteria.add(Restrictions.eq("sum", sum));
		}
		houseService.pageQuery(pageBean);
		this.pageBeanToJson(pageBean, new String[]{"detachedCriteria","currPage","pageSize","builds"});
		return null;
	}
	
	public String save(){
		houseService.save(model);
		return "listAll";
	}
	
	public String update(){
		houseService.update(model);
		return "listAll";
	}
	
	public String findByAjax(){
		List<House> list = houseService.findAll();
		listToJson(list, new String[]{"builds"});
		return NONE;
	}
}
