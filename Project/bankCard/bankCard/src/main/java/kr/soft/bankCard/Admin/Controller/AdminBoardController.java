package kr.soft.bankCard.Admin.Controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import kr.soft.bankCard.Admin.Service.BoardService;
import kr.soft.bankCard.VO.BoardVO;

@Controller
@RequestMapping("/admin/board")
public class AdminBoardController
{
	Logger logger = LoggerFactory.getLogger(this.getClass());
	
	@Autowired
	private BoardService boardService;
	
	// 매거진 등록 액션
	@PostMapping("/boardInsertAction.do")
	public String boardInsertAction(@RequestParam MultipartFile board_image_name, 
									HttpServletRequest request,  HttpSession session, BoardVO boardVO) {
		
		boardVO.setMemberSeq(boardService.sessionSequence((String)session.getAttribute("admin_id")));
		
		boardService.boardInsertAction(boardVO, request, board_image_name);
		
		return "redirect:/admin/board/boardList.do";
	}
	
	
	// 매거진 목록
	@GetMapping("/boardList.do")
    public String boardList(@RequestParam(value = "nowPage", required = false) String nowPage,
								@RequestParam(value = "cntPerPage", required = false) String cntPerPage, 
								@RequestParam(value = "searchSelect", required = false) String searchSelect,
								@RequestParam(value = "searchInput", required = false) String searchInput,
								HttpServletRequest request, HttpSession session , Model model) throws IOException {
		
		session = request.getSession();
		String memberId = (String)session.getAttribute("admin_id");
		
		if (memberId == null || memberId.equals(""))
		{
			return "redirect:/admin/loginCheck.do";
		}
		
		if (nowPage == null && cntPerPage == null) {
            nowPage = "1";
            cntPerPage = "10";
        } else if (nowPage == null) {
            nowPage = "1";
        } else if (cntPerPage == null) {
            cntPerPage = "10";
        }
		
		if (memberId.equals("admin"))
		{
			if (searchSelect == null || searchInput == null || searchInput.equals("")) // 전체 리스트 출력 (검색어 X)
			{
				int completeCount = boardService.boardEntireCount();
				
				BoardVO completePaging = new BoardVO(completeCount, Integer.parseInt(nowPage), Integer.parseInt(cntPerPage));
				model.addAttribute("completePaging", completePaging);
				
				
				List<BoardVO> boardList = boardService.boardEntireList(completePaging); 
				model.addAttribute("boardList", boardList);
			} else if(searchSelect.equals("searchTitle")) {
				int completeCount = boardService.boardEntireTitleSearchCount(searchInput);
				
				BoardVO completePaging = new BoardVO(completeCount, Integer.parseInt(nowPage), Integer.parseInt(cntPerPage));
				model.addAttribute("completePaging", completePaging);
				
				completePaging.setBoardTitle(searchInput);
				
				List<BoardVO> boardList = boardService.boardEntireTitleSearchList(completePaging);
				model.addAttribute("boardList", boardList);
				model.addAttribute("searchSelect", "searchTitle");
				model.addAttribute("searchInput", searchInput);
			} else if(searchSelect.equals("searchNick")) {
				int completeCount = boardService.boardEntireNickSearchCount(searchInput);
				
				BoardVO completePaging = new BoardVO(completeCount, Integer.parseInt(nowPage), Integer.parseInt(cntPerPage));
				model.addAttribute("completePaging", completePaging);
				
				completePaging.setMemberNickname(searchInput);
				
				List<BoardVO> boardList = boardService.boardEntireNickSearchList(completePaging);
				
				model.addAttribute("boardList", boardList);
				model.addAttribute("searchSelect", "searchNick");
				model.addAttribute("searchInput", searchInput);
			}
		} else {
			
			BoardVO boardVO = new BoardVO();
			boardVO.setMemberId(memberId);
			boardVO.setSelectboxType(searchSelect);
			boardVO.setSelectValue(searchInput);
			
			int completeCount = boardService.boardICount(boardVO);
			
			BoardVO completePaging = new BoardVO(completeCount, Integer.parseInt(nowPage), Integer.parseInt(cntPerPage));
			model.addAttribute("completePaging", completePaging);
			
			completePaging.setMemberId(memberId);
			completePaging.setSelectboxType(searchSelect);
			completePaging.setSelectValue(searchInput);
			
			List<BoardVO> boardList = boardService.boardIList(completePaging);
			
			model.addAttribute("boardList", boardList);
			model.addAttribute("searchSelect", searchSelect);
			model.addAttribute("searchInput", searchInput);
		}
        return "admin/board/board_list";
    }
	
	// 매거진 상세글 보기
	@GetMapping("/boardContent.do")
	public String boardContent(@RequestParam(value = "boardSeq") String board_seq,
							   	@RequestParam(value = "contentState") String contentState,
								HttpServletRequest request, HttpSession session, Model model) {
		
		session = request.getSession();
		String memberId = (String)session.getAttribute("admin_id");
		boolean myBoard = false;
		
		myBoard = boardService.boardContentState(memberId, Integer.parseInt(board_seq));
		BoardVO boardVO = boardService.boardContent(Integer.parseInt(board_seq));
		if (myBoard == false) {
			boardService.boardCount(Integer.parseInt(board_seq));
		}
		
		model.addAttribute("BoardVO", boardVO);
		model.addAttribute("boardContentState", myBoard);
		model.addAttribute("contentState", contentState);
		
		return "admin/board/board_content";
	}
	
	// 매거진 자기글 수정하기
	@PostMapping("/boardUpdateAction.do")
	public String boardContentUpdate(@RequestParam MultipartFile board_image_name, HttpServletRequest request, BoardVO boardVO) {
		
		boardService.boardContentUpdate(boardVO, request, board_image_name);
		
		
		return "redirect:boardContent.do?boardSeq="+boardVO.getBoardSeq()+"&contentState=false";
	}
	
	
	// 매거진 상태(삭제 여부)
	@ResponseBody
    @RequestMapping("/boardState.ajax")
	public void boardState(@RequestParam(required = false) int board_seq) {
		boardService.boardState(board_seq);
	}
	
	// 매거진 공개여부
	@ResponseBody
	@RequestMapping("/boardPublicState.ajax")
	public void boardPublicState(@RequestParam(required = false) int board_seq, String board_public) {
		boardService.boardPublicState(board_seq, board_public);
	}
	
	@GetMapping("/logout.do")
    public String cardLogout(HttpSession session) {
    	
    	session.invalidate();
    	
    	return "redirect:/admin/adminLogin.do";
    }
	
}
