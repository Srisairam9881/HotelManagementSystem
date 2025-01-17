package Service;

import DAO.UserDao;
import Model.User;

public class UserService {
 private UserDao userDao;
 
 public UserService() {
	super();
	this.userDao = new UserDao();
}

public User Register(User user) {
	return userDao.Register(user);
}
}
