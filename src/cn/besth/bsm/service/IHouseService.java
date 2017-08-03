package cn.besth.bsm.service;

import java.util.List;

import cn.besth.bsm.utils.PageBean;
import cn.besth.bsm.vo.House;

public interface IHouseService {

	void pageQuery(PageBean pageBean);

	void save(House model);

	void update(House model);

	List<House> findAll();

}
