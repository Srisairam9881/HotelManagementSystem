package Service;


import DAO.LoginDao;

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
}
