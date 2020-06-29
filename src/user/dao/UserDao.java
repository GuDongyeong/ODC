package user.dao;

import java.util.List;
import java.util.Map;

import dto.AskBoard;
import dto.ReviewBoard;
import dto.UserInfo;

public interface UserDao {

	int idCheck(String id);

	void insertUser(UserInfo user);

	int userLogin(String id, String pw);

	int userIdChkByEN(String email, String name);

	String selectUserIdByEN(String email, String name);

	int userPwChkByEN(String email, String name, String id);

	String selectUserPwByEN(String email, String name, String id);

	List<Map<String, Object>> getDetailReview(int classno);

	void insertReview(ReviewBoard board);

	int getUserIdById(String id);

	void insertAskBoard(AskBoard a);

	List<AskBoard> selectAskByClassno(int classno);

}
