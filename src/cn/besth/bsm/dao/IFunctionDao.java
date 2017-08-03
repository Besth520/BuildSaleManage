package cn.besth.bsm.dao;

import java.util.List;

import cn.besth.bsm.dao.base.IBaseDao;
import cn.besth.bsm.vo.Function;

public interface IFunctionDao extends IBaseDao<Function>{

	List<Function> findFunctionByUserID(String id);

	List<Function> findAllMenu();

	List<Function> findMenu(String id);

	List<Function> findSysMenu(String id);

}
