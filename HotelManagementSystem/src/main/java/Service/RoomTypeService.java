package Service;

import DAO.RoomTypeDao;

public class RoomTypeService {
  private RoomTypeDao roomTypeDao;

public RoomTypeService() {
	this.roomTypeDao = new RoomTypeDao();
}
  public int getRoomId(String roomName) {
	  return roomTypeDao.getRoomId(roomName);
  }
}
