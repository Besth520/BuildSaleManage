package cn.besth.bsm.service.imp;

import java.util.List;

import javax.annotation.Resource;

import org.activiti.engine.ProcessEngine;
import org.activiti.engine.impl.persistence.entity.UserEntity;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import cn.besth.bsm.dao.IRoleDao;
import cn.besth.bsm.dao.IUserDao;
import cn.besth.bsm.service.IUserService;
import cn.besth.bsm.utils.MD5Utils;
import cn.besth.bsm.vo.Role;
import cn.besth.bsm.vo.User;

@Service
@Transactional
public class UserServiceImp implements IUserService{
	@Resource
	private IUserDao userDao;

	public User login(User model) {
		String username = model.getUsername();
		String password = MD5Utils.md5(model.getPassword());
		List<User> users = userDao.findByQueryName("findByUandP", username,password);
		if (users!=null && users.size()>0) {
			return users.get(0);
		}
		return null;
	}

	@Override
	public void editPassword(String password, String id) {
		password = MD5Utils.md5(password);
		userDao.executeByQueryName("editPassword", password,id);
	}
	@Resource
	private IRoleDao roleDao;

	@Override
	public void save(User model, String[] roleIds) {
		String password = model.getPassword();
		password = MD5Utils.md5(password);
		model.setPassword(password);
		userDao.save(model);
		
		if (roleIds!=null && roleIds.length>0) {
			for (String id : roleIds) {
				Role role = roleDao.findById(id);
				model.getRoles().add(role);
			}
		}
		
		
	}

	@Override
	public List<User> findAll() {
		return userDao.findAll();
	}

}
