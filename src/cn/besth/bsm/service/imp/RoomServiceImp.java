package cn.besth.bsm.service.imp;

import org.springframework.transaction.annotation.Transactional;

import java.util.List;

import javax.annotation.Resource;

import org.hibernate.criterion.DetachedCriteria;
import org.hibernate.criterion.Restrictions;
import org.springframework.stereotype.Service;

import cn.besth.bsm.dao.IRoomDao;
import cn.besth.bsm.service.IRoomService;
import cn.besth.bsm.utils.PageBean;
import cn.besth.bsm.vo.Room;

@Service
@Transactional
public class RoomServiceImp implements IRoomService{
	@Resource
	private IRoomDao roomDao;

	@Override
	public void save(Room model) {
		roomDao.save(model);
	}

	@Override
	public void pageQuery(PageBean pageBean) {
		roomDao.pageQuery(pageBean);
	}

	@Override
	public void update(Room model) {
		roomDao.update(model);
	}

	@Override
	public List<Room> findAll() {
		return roomDao.findAll();
	}

	@Override
	public List<Room> findByAjaxCondition() {
		DetachedCriteria detachedCriteria = DetachedCriteria.forClass(Room.class);
		detachedCriteria.add(Restrictions.eq("state",1));
		return roomDao.findByCriteria(detachedCriteria );
	}

	

}
