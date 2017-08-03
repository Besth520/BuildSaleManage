package cn.besth.bsm.service.imp;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import cn.besth.bsm.dao.IFunctionDao;
import cn.besth.bsm.service.IFunctionService;
import cn.besth.bsm.utils.PageBean;
import cn.besth.bsm.vo.Function;
import cn.besth.bsm.vo.User;

@Service
@Transactional
public class FunctionServiceImp implements IFunctionService{
	@Resource
	private IFunctionDao functionDao;

	public void findPageQuery(PageBean pageBean) {
		functionDao.pageQuery(pageBean);
	}

	public List<Function> findAll() {
		return functionDao.findAll();
	}

	@Override
	public List<Function> findMenu(User existUser) {
		List<Function> list = null;
		if (existUser.getUsername()=="admin") {
			list = functionDao.findAllMenu();
		}else {
			list = functionDao.findMenu(existUser.getId());
		}
		return list;
	}

	@Override
	public List<Function> findSysMenu(User existUser) {
		List<Function> list = null;
		list = functionDao.findSysMenu(existUser.getId());
		return list;
	}
	
	
}
