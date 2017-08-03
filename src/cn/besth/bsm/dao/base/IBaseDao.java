package cn.besth.bsm.dao.base;

import java.io.Serializable;
import java.util.List;

import org.hibernate.criterion.DetachedCriteria;

import cn.besth.bsm.utils.PageBean;



public interface IBaseDao<T> {
	
	void save(T entity);
	
	void delete(T entity);
	
	void update(T entity);
	
	T findById(Serializable id);
	
	List<T> findAll();
	
	List<T> findByCriteria(DetachedCriteria detachedCriteria);
	
	List<T> findByQueryName(String queryName,Object... args);
	
	void executeByQueryName(String queryName,Object... args);
	
	void pageQuery(PageBean pageBean);
}
