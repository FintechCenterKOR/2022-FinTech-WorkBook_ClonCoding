package kr.soft.bankCard.User.Service;

import kr.soft.bankCard.VO.BoardVO;

public interface UserBoardService {
	
	// User 자신의 글이 아니라면 조회수 +1
	public void userBoardCount(int boardSeq);

	// User 매거진 조회
	public BoardVO userBoardContent(int boardSeq);
	
	// User 게시판 최소 번호
	public int userBoardMin();
	
	// User 게시판 최대 번호
	public int userBoardMax();
	
	// User 게시판 상태
	public String userBoardState(int boardSeq);
}
