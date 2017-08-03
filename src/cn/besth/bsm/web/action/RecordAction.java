package cn.besth.bsm.web.action;

import org.apache.commons.lang3.StringUtils;
import org.hibernate.criterion.DetachedCriteria;
import org.hibernate.criterion.Restrictions;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import cn.besth.bsm.utils.BosContext;
import cn.besth.bsm.vo.Customer;
import cn.besth.bsm.vo.Record;
import cn.besth.bsm.vo.Room;
import cn.besth.bsm.vo.User;
import cn.besth.bsm.web.action.base.BaseAction;

@Controller
@Scope("prototype")
public class RecordAction extends BaseAction<Record>{
	
	public String pageQuery(){
		Room room = model.getRoom();
		Customer customer = model.getCustomer();
		/*User user = model.getUser();*/
		DetachedCriteria criteria = pageBean.getDetachedCriteria();
		if (room!=null) {
			Integer rid = room.getId();
			Integer state = room.getState();
			DetachedCriteria rCriteria = criteria.createCriteria("room");
			if (rid!=null) {
				rCriteria.add(Restrictions.eq("id", rid));
			}
			if (state!=null) {
				rCriteria.add(Restrictions.eq("state", state));
			}
		}
		if (customer!=null) {
			Integer cid = customer.getId();
			String phone = customer.getPhone();
			DetachedCriteria cCriteria = criteria.createCriteria("customer");
			if (cid!=null) {
				cCriteria.add(Restrictions.eq("id", cid));
			}
			if (StringUtils.isNotBlank(phone)) {
				cCriteria.add(Restrictions.eq("phone", phone));
			}
		}
		/*if (user!=null) {
			String uid = user.getId();
			DetachedCriteria uCriteria = criteria.createCriteria("user");
			if (uid!=null) {
				uCriteria.add(Restrictions.eq("id", uid));
			}
		}*/
		recordService.pageQuery(pageBean);
		pageBeanToJson(pageBean, new String[]{"detachedCriteria","currPage","pageSize","roles","records","builds","rooms"});
		return NONE;
	}
	
	public String pageQueryByUser(){
		Room room = model.getRoom();
		Customer customer = model.getCustomer();
		User user = BosContext.getExistUser();
		DetachedCriteria criteria = pageBean.getDetachedCriteria();
		DetachedCriteria uCriteria = criteria.createCriteria("User");
		uCriteria.add(Restrictions.eq("id", user.getId()));
		if (room!=null) {
			Integer rid = room.getId();
			Integer state = room.getState();
			DetachedCriteria rCriteria = criteria.createCriteria("room");
			if (rid!=null) {
				rCriteria.add(Restrictions.eq("id", rid));
			}
			if (state!=null) {
				rCriteria.add(Restrictions.eq("state", state));
			}
		}
		if (customer!=null) {
			Integer cid = customer.getId();
			String phone = customer.getPhone();
			DetachedCriteria cCriteria = criteria.createCriteria("customer");
			if (cid!=null) {
				cCriteria.add(Restrictions.eq("id", cid));
			}
			if (StringUtils.isNotBlank(phone)) {
				cCriteria.add(Restrictions.eq("phone", phone));
			}
		}
		/*if (user!=null) {
			String uid = user.getId();
			DetachedCriteria uCriteria = criteria.createCriteria("user");
			if (uid!=null) {
				uCriteria.add(Restrictions.eq("id", uid));
			}
		}*/
		recordService.pageQuery(pageBean);
		pageBeanToJson(pageBean, new String[]{"detachedCriteria","currPage","pageSize","roles","records","builds","rooms"});
		return NONE;
	}
	
	public String update(){
		recordService.update(model);
		return "listAll";
	}
	
	public String save(){
		recordService.save(model);
		return "list";
	}
}
