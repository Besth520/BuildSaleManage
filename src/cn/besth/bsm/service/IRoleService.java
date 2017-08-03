package cn.besth.bsm.service;

import java.util.List;

import cn.besth.bsm.vo.Role;

public interface IRoleService {

	void save(Role model, String ids);

	List<Role> findAll();

}
