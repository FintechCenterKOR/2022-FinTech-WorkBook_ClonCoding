package kr.soft.bankCard.Admin.Service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.web.multipart.MultipartFile;

import kr.soft.bankCard.VO.BoardVO;

public interface BoardService
{
	// 세션 아이디의 시퀀스 가져오기
	public int sessionSequence(String admin_id);
	
	// 매거진 등록하기
	public void boardInsertAction(BoardVO boardVO, HttpServletRequest request, MultipartFile multipartFile);
	
	// 매거진 전체 글 갯수
	public int boardEntireCount();
	
	// 매거진 에디터 자신의 글 갯수
	public int boardICount(BoardVO boardVO);
	
	// 매거진 전체 제목 검색 갯수
	public int boardEntireTitleSearchCount(String board_title);
	
	// 매거진 전체 닉네임 검색 갯수
	public int boardEntireNickSearchCount(String member_nickname);
	
	// 매거진 전체 등록글
	public List<BoardVO> boardEntireList(BoardVO boardVO);
	
	// 매거진 전체 제목 검색 리스트
	public List<BoardVO> boardEntireTitleSearchList(BoardVO boardVO);
	
	// 매거진 전체 닉네임 검색 리스트
	public List<BoardVO> boardEntireNickSearchList(BoardVO boardVO);
	
	// 매거진 자신의 글 리스트
	public List<BoardVO> boardIList(BoardVO boardVO);

	// 매거진 글 상태 변경(삭제)
	public void boardState(int board_seq);
	
	// 매거진 공개여부 변경
	public void boardPublicState(int board_seq, String member_public);
	
	// 매거진 글 상세보기
	public BoardVO boardContent(int board_seq);
	
	// 매거진 글 조회수 증가
	public void boardCount(int board_seq);
	
	// 메거진 자신의 글 이면 수정상태로 변경
	public boolean boardContentState(String member_id, int board_seq);
	
	// 매거진 자기글 수정하기
	public void boardContentUpdate(BoardVO boardVO, HttpServletRequest ruquest, MultipartFile multipartFile);
	
}
