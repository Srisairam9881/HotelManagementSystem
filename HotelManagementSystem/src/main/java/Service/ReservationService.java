package Service;

import java.util.List;

import DAO.ReservationDao;
import Model.Reservation;
import Model.User;
import Model.payload.ReservationDetails;

public class ReservationService {
    private ReservationDao reservationDao;

	public ReservationService() {
		this.reservationDao=new ReservationDao();
	}
    public Reservation BookReservation(Reservation reservation) {
    	Reservation res= reservationDao.AddNewReservation(reservation);
    	return res;
    }
    public List<ReservationDetails> getReservationsByUserId(int userId) {
        return reservationDao.getReservationsByUserId(userId);
    }
    public void editReservationDetails(Reservation reservation) {
    	reservationDao.updateReservation(reservation);
    }
}
