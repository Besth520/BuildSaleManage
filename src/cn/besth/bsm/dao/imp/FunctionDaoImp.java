package cn.besth.bsm.dao.imp;

import java.util.List;

import org.springframework.stereotype.Repository;

import cn.besth.bsm.dao.IFunctionDao;
import cn.besth.bsm.dao.base.BaseDaoImp;
import cn.besth.bsm.vo.Function;

@Repository
public class FunctionDaoImp extends BaseDaoImp<Function> implements IFunctionDao {

	public List<Function> findFunctionByUserID(String id) {
		String hql = "from Function f left outer join fetch f.roles r left outer join fetch r.users u where u.id=?";
		return getHibernateTemplate().find(hql, id);
	}

	@Override
	public List<Function> findAllMenu() {
		String hql = "from Function f where f.generatemenu = '1' order by f.zindex desc";
		return getHibernateTemplate().find(hql);
	}

	@Override
	public List<Function> findMenu(String id) {
		String hql = "from Function f inner join fetch f.roles r inner join fetch r.users u where u.id=? and f.generatemenu = '1' and f.statu='0' order by f.zindex desc";
		return getHibernateTemplate().find(hql,id);
	}

	@Override
	public List<Function> findSysMenu(String id) {
		String hql = "from Function f inner join fetch f.roles r inner join fetch r.users u where u.id=? and f.generatemenu = '1' and f.statu='1' order by f.zindex desc";
		return getHibernateTemplate().find(hql,id);
	}

}
