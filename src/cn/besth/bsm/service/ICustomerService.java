package cn.besth.bsm.service;

import java.util.List;

import cn.besth.bsm.utils.PageBean;
import cn.besth.bsm.vo.Customer;

public interface ICustomerService {

	void pageQuery(PageBean pageBean);

	void save(Customer model);

	void update(Customer model);

	List<Customer> findAll();

}
