package kr.soft.bankCard.User.Service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.soft.bankCard.User.Mapper.UserBoardMapper;
import kr.soft.bankCard.VO.BoardVO;

@Service
public class UserBoardServiceImpl implements UserBoardService{

	@Autowired
	UserBoardMapper userBoardMapper;
	
	// User 매거진 글이 자신의 것이 아니라면 조회수 +1
	@Override
	public void userBoardCount(int boardSeq)
	{
		userBoardMapper.userBoardCount(boardSeq);
	}
	
	// User 매거진 상세보기
	@Override
	public BoardVO userBoardContent(int boardSeq) {
		
		BoardVO boardVO = userBoardMapper.userBoardContent(boardSeq);
		
		return boardVO;
	}
	
	// User 게시판 최소 번호
	@Override
	public int userBoardMin()
	{
		return userBoardMapper.userBoardMin();
	}
	
	// User 게시판 최대 번호
	@Override
	public int userBoardMax()
	{
		return userBoardMapper.userBoardMax();
	}
	
	// User 게시판 상태
	@Override
	public String userBoardState(int boardSeq)
	{
		return userBoardMapper.userBoardState(boardSeq);
	}
	
}
