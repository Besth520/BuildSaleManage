package cn.besth.bsm.service.imp;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import cn.besth.bsm.dao.IBuildDao;
import cn.besth.bsm.service.IBuildService;
import cn.besth.bsm.utils.PageBean;
import cn.besth.bsm.vo.Build;

@Service
@Transactional
public class BuildServiceImp implements IBuildService{
	@Resource
	private IBuildDao buildDao;

	@Override
	public void pageQuery(PageBean pageBean) {
		buildDao.pageQuery(pageBean);
	}

	@Override
	public void save(Build model) {
		buildDao.save(model);
	}

	@Override
	public void update(Build model) {
		buildDao.update(model);
	}

	@Override
	public List<Build> findAll() {
		return buildDao.findAll();
	}

}
