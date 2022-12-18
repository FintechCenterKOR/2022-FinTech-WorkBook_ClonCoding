package kr.soft.bankCard.Admin.Controller;

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

import kr.soft.bankCard.Admin.Service.MemberService;
import kr.soft.bankCard.Admin.Service.PagingCountService;
import kr.soft.bankCard.VO.MemberVO;
import kr.soft.bankCard.VO.PagingVO;

@Controller
@RequestMapping("/admin/member")
public class AdminMemberController
{
	Logger logger = LoggerFactory.getLogger(this.getClass());
	
	@Autowired
	private MemberService memberService;
	
	@Autowired
	private PagingCountService pagingCountService;
	
	
	
	// 에디터 등록
	@PostMapping("/MemberInsert.do")
	public String memberInsertAction(@RequestParam MultipartFile member_image, HttpServletRequest request, String member_id) {
		
		memberService.memberInsert(member_id, request, member_image);
		
		
		return "redirect:/admin/member/memberList.do";
	}
	
	// 에디터 리스트 출력
	@GetMapping("/memberList.do")
	public String memberSearchList(@RequestParam(value = "nowPage", required = false) String nowPage,
									@RequestParam(value = "cntPerPage", required = false) String cntPerPage,
									@RequestParam(value = "searchSelect", required = false) String searchSelect,
									@RequestParam(value = "searchInput", required = false) String searchInput, Model model) {
		
		if (nowPage == null && cntPerPage == null) {
            nowPage = "1";
            cntPerPage = "10";
        } else if (nowPage == null) {
            nowPage = "1";
        } else if (cntPerPage == null) {
            cntPerPage = "10";
        }
		
		if (searchSelect == null || searchInput == null || searchInput.equals("")) // 전체 리스트 출력 (검색어 X)
		{
			int completeCount = pagingCountService.memberEditorCount();
			
			PagingVO completePaging = new PagingVO(completeCount, Integer.parseInt(nowPage), Integer.parseInt(cntPerPage));
			model.addAttribute("completePaging", completePaging);
			
			List<MemberVO> memberList = memberService.memberList(completePaging);
			model.addAttribute("memberList", memberList);
		} else if(searchSelect.equals("searchId")) {	// 아이디 검색 출력
			
			int completeCount = pagingCountService.memberEditorIdCount(searchInput);
			System.out.println("아이디 : " + completeCount);
				
			MemberVO completePaging = new MemberVO(completeCount, Integer.parseInt(nowPage), Integer.parseInt(cntPerPage));
			model.addAttribute("completePaging", completePaging);
			
			completePaging.setMemberId(searchInput);
			
			List<MemberVO> memberVO = memberService.memberIdSearch(completePaging);
			model.addAttribute("memberList", memberVO);
			model.addAttribute("searchSelect", "searchId");
			model.addAttribute("searchInput", searchInput);
		} else if(searchSelect.equals("searchNick")) {	// 닉네임 검색 출력
			
			int completeCount = pagingCountService.memberEditorNickCount(searchInput);
			
			MemberVO completePaging = new MemberVO(completeCount, Integer.parseInt(nowPage), Integer.parseInt(cntPerPage));
			model.addAttribute("completePaging", completePaging);
			
			completePaging.setMemberNickname(searchInput);
			
			List<MemberVO> memberVO = memberService.memberNickSearch(completePaging);
			model.addAttribute("memberList", memberVO);
			model.addAttribute("searchSelect", "searchNick");
			model.addAttribute("searchInput", searchInput);
		}
		
		return "admin/member/member_list";
	}

	// 에디터 가능한 아이디 유효성 검사
    @ResponseBody
    @RequestMapping("/editorVali.ajax")
    public MemberVO memberEditorVali(@RequestParam(required = false) String member_id) {
    	
    	return memberService.memberEditorVali(member_id);
    }
    
    // 에디터 상태 변경
    @ResponseBody
    @RequestMapping("/memberState.ajax")
    public String memberState(@RequestParam(required = false) int member_seq,
    							@RequestParam(required = false) String member_state){
    	
    	memberService.memberState(member_seq, member_state);
    	
    	return "success";
    }
    
    // 에디터 비밀번호 초기화
    @ResponseBody
    @RequestMapping("/passwordInitialization.ajax")
    public String memberPasswordInitialization(@RequestParam(required = false) int member_seq) {
    	
    	memberService.memberPasswordInitialization(member_seq);
    	
    	return "success";
    }
    
    
    // 관리자 로그인
    @ResponseBody
    @RequestMapping("/adminLoginProcess.ajax")
    public String adminLoginProcess(HttpServletRequest request, HttpSession session) {
    	
    	return memberService.adminLoginProcess(request, session);
    }
    
    

}