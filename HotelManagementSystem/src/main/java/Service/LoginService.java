	package Service;
	
	
	import DAO.LoginDao;
	import Model.User;
	
	public class LoginService {
	    private LoginDao loginDao;
	
	    public LoginService() {
	        this.loginDao = new LoginDao();
	    }
	
	    public boolean validateLogin(int uid, String password) {
	        return loginDao.login(uid, password);
	    }
	
	    public String getUserRole(int uid) {
	        return loginDao.getUserRole(uid);
	    }
	    public String getUserName(int uid) {
	        return loginDao.getUserName(uid);
	    }
	    public User getUser(int uid) {
	        return loginDao.getUser(uid);
	    }
	   
	}
