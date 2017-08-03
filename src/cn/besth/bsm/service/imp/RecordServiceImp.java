package cn.besth.bsm.service.imp;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import cn.besth.bsm.dao.ICustomerDao;
import cn.besth.bsm.dao.IRecordDao;
import cn.besth.bsm.dao.IRoomDao;
import cn.besth.bsm.service.IRecordService;
import cn.besth.bsm.utils.PageBean;
import cn.besth.bsm.vo.Customer;
import cn.besth.bsm.vo.Record;
import cn.besth.bsm.vo.Room;

@Service
@Transactional
public class RecordServiceImp implements IRecordService{
	@Resource
	private IRecordDao recordDao;
	@Resource
	private ICustomerDao customerDao;
	@Resource
	private IRoomDao roomDao;
	@Override
	public void pageQuery(PageBean pageBean) {
		recordDao.pageQuery(pageBean);
	}

	@Override
	public void update(Record model) {
		recordDao.update(model);
		Customer customer = customerDao.findById(model.getCustomer().getId());
		customer.setPhone(model.getCustomer().getPhone());
		customerDao.update(customer);
		
		Room room = roomDao.findById(model.getRoom().getId());
		room.setState(model.getRoom().getState());
		roomDao.update(room);
		
		
	}

	@Override
	public void save(Record model) {
		Room room = roomDao.findById(model.getRoom().getId());
		room.setState(model.getRoom().getState());
		recordDao.save(model);
	}

}
