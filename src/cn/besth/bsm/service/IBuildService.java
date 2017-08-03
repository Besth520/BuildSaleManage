package cn.besth.bsm.service;

import java.util.List;

import cn.besth.bsm.utils.PageBean;
import cn.besth.bsm.vo.Build;

public interface IBuildService {

	void pageQuery(PageBean pageBean);

	void save(Build model);

	void update(Build model);

	List<Build> findAll();

}
