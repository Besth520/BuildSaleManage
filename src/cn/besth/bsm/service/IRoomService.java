package cn.besth.bsm.service;

import java.util.List;

import cn.besth.bsm.utils.PageBean;
import cn.besth.bsm.vo.Room;

public interface IRoomService {

	void save(Room model);

	void pageQuery(PageBean pageBean);

	void update(Room model);

	List<Room> findAll();

	List<Room> findByAjaxCondition();

}
