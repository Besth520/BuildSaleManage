package cn.besth.bsm.service;

import java.util.List;

import cn.besth.bsm.utils.PageBean;
import cn.besth.bsm.vo.Function;
import cn.besth.bsm.vo.User;

public interface IFunctionService {


	void findPageQuery(PageBean pageBean);

	List<Function> findAll();

	List<Function> findMenu(User existUser);

	List<Function> findSysMenu(User existUser);

}
