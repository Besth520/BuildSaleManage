package cn.besth.bsm.service;

import java.util.List;

import cn.besth.bsm.vo.User;



public interface IUserService {

	User login(User model);

	void editPassword(String password, String id);

	void save(User model, String[] roleIds);

	List<User> findAll();

}
