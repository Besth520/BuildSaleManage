package cn.besth.bsm.shiro;

import java.util.List;

import javax.annotation.Resource;

import org.apache.shiro.authc.AuthenticationException;
import org.apache.shiro.authc.AuthenticationInfo;
import org.apache.shiro.authc.AuthenticationToken;
import org.apache.shiro.authc.SimpleAuthenticationInfo;
import org.apache.shiro.authc.UsernamePasswordToken;
import org.apache.shiro.authz.AuthorizationInfo;
import org.apache.shiro.authz.SimpleAuthorizationInfo;
import org.apache.shiro.realm.AuthorizingRealm;
import org.apache.shiro.subject.PrincipalCollection;

import cn.besth.bsm.dao.IFunctionDao;
import cn.besth.bsm.dao.IUserDao;
import cn.besth.bsm.vo.Function;
import cn.besth.bsm.vo.User;

public class BSMRealm extends AuthorizingRealm{
	@Resource
	private IUserDao userDao;
	@Resource
	private IFunctionDao functionDao;
	@Override
	protected AuthorizationInfo doGetAuthorizationInfo(PrincipalCollection principal) {
		SimpleAuthorizationInfo info = new SimpleAuthorizationInfo();
		User user = (User) principal.getPrimaryPrincipal();
		if (user.getUsername().equals("admin")) {
			List<Function> list = functionDao.findAll();
			for (Function function : list) {
				info.addStringPermission(function.getCode());
			}
		}else {
			List<Function> list = functionDao.findFunctionByUserID(user.getId());
			for (Function function : list) {
				info.addStringPermission(function.getCode());
			}
		}
		return info;
	}
	
	//хож╓
	protected AuthenticationInfo doGetAuthenticationInfo(AuthenticationToken token) throws AuthenticationException {
		UsernamePasswordToken myToken = (UsernamePasswordToken) token;
		String username = myToken.getUsername();
		List<User> list = userDao.findByQueryName("findByUsername", username);
		if (list.size()==0) {
			return null;
		}
		User user = list.get(0);
		SimpleAuthenticationInfo info = new SimpleAuthenticationInfo(user, user.getPassword(), this.getClass().getName());
		return info;
	}

}
