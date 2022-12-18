package kr.soft.bankCard.User.Mapper;

import org.apache.ibatis.annotations.Mapper;

import kr.soft.bankCard.VO.BoardVO;

@Mapper
public interface UserBoardMapper {
	
	// User 매거진 글이 자신의 것이 아니라면 조회수 +1
	public void userBoardCount(int boardSeq);
	
	// User 게시글 상세보기
	public BoardVO userBoardContent(int boardSeq);
	
	// User 게시글 최소 번호
	public int userBoardMin();
	
	// User 게시글 최대 번호
	public int userBoardMax();
	
	// User 게시판 상태
	public String userBoardState(int boardSeq);
}
