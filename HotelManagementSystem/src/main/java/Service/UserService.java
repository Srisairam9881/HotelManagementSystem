package Service;

import DAO.UserDao;
import Model.User;

public class UserService {
UserDao userDao=new UserDao();
public User Register(User user) {
	return userDao.Register(user);
}
}
