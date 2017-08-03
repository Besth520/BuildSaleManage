package cn.besth.bsm.dao.base;

import java.io.Serializable;
import java.lang.reflect.ParameterizedType;
import java.lang.reflect.Type;
import java.util.List;

import javax.annotation.Resource;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.DetachedCriteria;
import org.hibernate.criterion.Projections;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

import cn.besth.bsm.utils.PageBean;



public class BaseDaoImp<T> extends HibernateDaoSupport	implements IBaseDao<T>{
	
	private Class<T> voClass;
	
	public BaseDaoImp(){
		ParameterizedType parameterizedType  = (ParameterizedType) this.getClass().getGenericSuperclass();
		Type[] actualTypeArguments = parameterizedType.getActualTypeArguments();
		voClass = (Class<T>) actualTypeArguments[0];
	}
	@Resource
	public void setSF(SessionFactory sessionFactory) {
		super.setSessionFactory(sessionFactory);
	}
	
	@Override
	public void save(T entity) {
		getHibernateTemplate().save(entity);
	}

	@Override
	public void delete(T entity) {
		getHibernateTemplate().delete(entity);
	}

	@Override
	public void update(T entity) {
		getHibernateTemplate().update(entity);
	}

	@Override
	public T findById(Serializable id) {
		return getHibernateTemplate().get(voClass, id);
	}

	@Override
	public List<T> findByCriteria(DetachedCriteria detachedCriteria) {
		return getHibernateTemplate().findByCriteria(detachedCriteria);
	}

	@Override
	public List<T> findByQueryName(String queryName, Object... args) {
		return getHibernateTemplate().findByNamedQuery(queryName, args);
	}

	@Override
	public void executeByQueryName(String queryName, Object... args) {
		Session session = this.getSession();
		Query query = session.getNamedQuery(queryName);
		if (args!=null && args.length>0) {
			int i = 0;
			for (Object arg : args) {
				query.setParameter(i++, arg);
			}
		}
		query.executeUpdate();
	}

	@Override
	public List<T> findAll() {
		String hql = "from "+voClass.getSimpleName();
		return getHibernateTemplate().find(hql);
	}
	
	@Override
	public void pageQuery(PageBean pageBean) {
		int currPage = pageBean.getCurrPage();
		int pageSize = pageBean.getPageSize();
		DetachedCriteria detachedCriteria = pageBean.getDetachedCriteria();
		
		detachedCriteria.setProjection(Projections.rowCount());
		List<Long> list = this.getHibernateTemplate().findByCriteria(detachedCriteria);
		Long total = list.get(0);
		
		detachedCriteria.setProjection(null);
		detachedCriteria.setResultTransformer(detachedCriteria.ROOT_ENTITY);
		int firstResult = (currPage-1)*pageSize;
		int maxResults = pageSize;
		List rows = this.getHibernateTemplate().findByCriteria(detachedCriteria, firstResult, maxResults);
		
		pageBean.setTotal(total.intValue());
		pageBean.setRows(rows);
		
	}
	

}
