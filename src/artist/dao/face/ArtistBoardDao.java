package artist.dao.face;

import java.util.List;
import java.util.Map;

import dto.AskBoardComm;
import util.Paging;

public interface ArtistBoardDao {

	//작가번호 조회
	int selectArtNoByArtId(String artid);

	//ReviewBoard 값 추출
	int selectCntReviewByArtNo(String search, int artno);

	List<Map<String, Object>> selectReviewByArtNo(Paging paging, int artNo);

	//AskBoard 값 추출
	int selectCntAskByArtNo(String search, int artno);

	List<Map<String, Object>> selectAskByArtNo(Paging paging, int artno);

	Map<String, Object> selectAskByAskNo(int askno);

	List<AskBoardComm> selectCommByAskNo(int askno);

	void insertComment(AskBoardComm comm);

	Map<String, Object> selectReviewByReviewNo(int reviewno);

	int deleteComm(int commNo);

}
