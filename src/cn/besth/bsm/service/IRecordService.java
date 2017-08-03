package cn.besth.bsm.service;

import cn.besth.bsm.utils.PageBean;
import cn.besth.bsm.vo.Record;

public interface IRecordService {

	void pageQuery(PageBean pageBean);

	void update(Record model);

	void save(Record model);

}
