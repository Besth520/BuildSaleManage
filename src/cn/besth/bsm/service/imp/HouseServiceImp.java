package cn.besth.bsm.service.imp;

import org.springframework.transaction.annotation.Transactional;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import cn.besth.bsm.dao.IHouseDao;
import cn.besth.bsm.service.IHouseService;
import cn.besth.bsm.utils.PageBean;
import cn.besth.bsm.vo.House;

@Service
@Transactional
public class HouseServiceImp implements IHouseService{
	@Resource
	private IHouseDao houseDao;

	@Override
	public void pageQuery(PageBean pageBean) {
		houseDao.pageQuery(pageBean);
	}

	@Override
	public void save(House model) {
		houseDao.save(model);
	}

	@Override
	public void update(House model) {
		houseDao.update(model);
	}

	@Override
	public List<House> findAll() {
		return houseDao.findAll();
	}

}
