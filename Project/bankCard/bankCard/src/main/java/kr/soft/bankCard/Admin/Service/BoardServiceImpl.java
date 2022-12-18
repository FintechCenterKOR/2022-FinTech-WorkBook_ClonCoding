package kr.soft.bankCard.Admin.Service;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import kr.soft.bankCard.Admin.Mapper.BoardMapper;
import kr.soft.bankCard.VO.BoardVO;

@Service
public class BoardServiceImpl implements BoardService
{
	@Autowired
	BoardMapper boardMapper;
	
	// 세션 아이디의 시퀀스 가져오기
	@Override
	public int sessionSequence(String admin_id)
	{
		return boardMapper.sessionSequence(admin_id);
	}
	
	// 매거진 등록하기
	@Override
	public void boardInsertAction(BoardVO boardVO, HttpServletRequest request, MultipartFile multipartFile)
	{
		String contextPath = request.getSession().getServletContext().getRealPath("/");
		String board_image = "";
		
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy년MM월dd일HH시mm분ss초");
		Calendar c1 = Calendar.getInstance();
		String strToday = sdf.format(c1.getTime());
		
		File dest = new File(
				contextPath + "../resources/static/board/" + strToday + "_" + multipartFile.getOriginalFilename());

		if (!(multipartFile.getOriginalFilename().equals("")))
		{
			board_image = strToday + "_" + multipartFile.getOriginalFilename();
		} else
		{
			board_image = "";
		}

		try
		{
			multipartFile.transferTo(dest);
		} catch (Exception e)
		{
			e.printStackTrace();
		}
		
		boardVO.setBoardImageName(board_image);
		
		boardMapper.boardInsertAction(boardVO);
	}
	
	// 매거진 전체 등록 글 갯수
	@Override
	public int boardEntireCount()
	{
		return boardMapper.boardEntireCount();
	}
	
	// 매거진 전체 제목 검색 갯수
	@Override
	public int boardEntireTitleSearchCount(String board_title)
	{
		return boardMapper.boardEntireTitleSearchCount(board_title);
	}
	
	// 매거진 전체 닉네임 검색 갯수
	@Override
	public int boardEntireNickSearchCount(String member_nickname)
	{
		return boardMapper.boardEntireNickSearchCount(member_nickname);
	}
	
	// 매거진 자신의 글 갯수
	@Override
	public int boardICount(BoardVO boardVO)
	{
		return boardMapper.boardICount(boardVO);
	}
	
	// 매거진 전체 등록글 리스트
	@Override
	public List<BoardVO> boardEntireList(BoardVO boardVO)
	{
		return boardMapper.boardEntireList(boardVO);
	}
	
	// 매거진 전체 제목 검색 리스트
	@Override
	public List<BoardVO> boardEntireTitleSearchList(BoardVO boardVO)
	{
		return boardMapper.boardEntireTitleSearchList(boardVO);
	}
	
	// 매거진 전체 닉네임 검색 리스트
	@Override
	public List<BoardVO> boardEntireNickSearchList(BoardVO boardVO)
	{
		return boardMapper.boardEntireNickSearchList(boardVO);
	}
	
	// 매거진 자신의 글 리스트
	@Override
	public List<BoardVO> boardIList(BoardVO boardVO)
	{
		return boardMapper.boardIList(boardVO);
	}
	
	// 매거진 글 상태 변경
	@Override
	public void boardState(int board_seq)
	{
		boardMapper.boardState(board_seq);
	}
	
	
	// 매거진 공개 여부
	@Override
	public void boardPublicState(int board_seq, String member_public)
	{
		boardMapper.boardPublicState(board_seq, member_public);
	}
	
	// 매거진 글 상세보기
	@Override
	public BoardVO boardContent(int board_seq)
	{
		return boardMapper.boardContent(board_seq);
	}
	
	// 매거진 글 조회수 증가
	@Override
	public void boardCount(int board_seq) {
		boardMapper.boardCount(board_seq);
	}
	
	// 매거진 자기글 수정하기
	@Override
	public void boardContentUpdate(BoardVO boardVO, HttpServletRequest request, MultipartFile multipartFile)
	{
		String contextPath = request.getSession().getServletContext().getRealPath("/");
		String board_image = "";
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy년MM월dd일HH시mm분ss초");
		Calendar c1 = Calendar.getInstance();
		String strToday = sdf.format(c1.getTime());
		
		String imageName = boardMapper.boardContent(boardVO.getBoardSeq()).getBoardImageName();
		
		File imageDelete = new File(contextPath + "../resources/static/board/" + imageName);
		imageDelete.delete();
		
		File dest = new File(
				contextPath + "../resources/static/board/" + strToday + "_" + multipartFile.getOriginalFilename());

		if (!(multipartFile.getOriginalFilename().equals("")))
		{
			board_image = strToday + "_" + multipartFile.getOriginalFilename();
		} else
		{
			board_image = "";
		}

		try
		{
			multipartFile.transferTo(dest);
		} catch (Exception e)
		{
			e.printStackTrace();
		}
		
		boardVO.setBoardImageName(board_image);
		
		boardMapper.boardCotentUpdate(boardVO);
		
	}
	
	// 매거진 자신의 글 인지 확인
	@Override
	public boolean boardContentState(String member_id, int board_seq)
	{
		BoardVO boardVO = boardMapper.boardContent(board_seq);
		
		if (member_id.equals(boardVO.getMemberId()))
		{
			return true;
		}
		return false;
	}
}
