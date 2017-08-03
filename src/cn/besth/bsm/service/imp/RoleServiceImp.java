package cn.besth.bsm.service.imp;

import java.util.List;

import javax.annotation.Resource;

import org.activiti.engine.ProcessEngine;
import org.activiti.engine.identity.Group;
import org.activiti.engine.impl.persistence.entity.GroupEntity;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import cn.besth.bsm.dao.IRoleDao;
import cn.besth.bsm.service.IRoleService;
import cn.besth.bsm.vo.Function;
import cn.besth.bsm.vo.Role;

@Service
@Transactional
public class RoleServiceImp implements IRoleService{
	@Resource
	private IRoleDao roleDao;
	
	public void save(Role model, String ids) {
		String[] fids = ids.split(",");
		for (String fid : fids) {
			Function function = new Function();
			function.setId(fid);
			model.getFunctions().add(function);
		}
		roleDao.save(model);
	}

	public List<Role> findAll() {
		return roleDao.findAll();
	}

}
