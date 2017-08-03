package cn.besth.bsm.service.imp;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import cn.besth.bsm.dao.ICustomerDao;
import cn.besth.bsm.service.ICustomerService;
import cn.besth.bsm.utils.PageBean;
import cn.besth.bsm.vo.Customer;

@Service
@Transactional
public class CustomerServiceImp implements ICustomerService{
	@Resource
	private ICustomerDao customerDao;

	@Override
	public void pageQuery(PageBean pageBean) {
		customerDao.pageQuery(pageBean);
	}

	@Override
	public void save(Customer model) {
		customerDao.save(model);
	}

	@Override
	public void update(Customer model) {
		customerDao.update(model);
	}

	@Override
	public List<Customer> findAll() {
		return customerDao.findAll();
	}

}
