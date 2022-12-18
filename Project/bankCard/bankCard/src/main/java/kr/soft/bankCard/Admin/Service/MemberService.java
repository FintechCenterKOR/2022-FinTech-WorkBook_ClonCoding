package kr.soft.bankCard.Admin.Service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.web.multipart.MultipartFile;

import kr.soft.bankCard.VO.MemberVO;
import kr.soft.bankCard.VO.PagingVO;

public interface MemberService
{
	// 에디터 등록 Action
	public void memberInsert(String member_id, HttpServletRequest request, MultipartFile multipartFile);
	
	// 에디터 리스트 출력
	public List<MemberVO> memberList(PagingVO pagingVO);
	
	// 에디터 상태 변경
	public void memberState(int member_seq, String member_state);
	
	// 에디터 비밀번호 초기화
	public void memberPasswordInitialization(int member_seq);
	
	// 에디터 아이디 검색
	public List<MemberVO> memberIdSearch(MemberVO memberVO);
	
	// 에디터 닉네임 검색
	public List<MemberVO> memberNickSearch(MemberVO memberVO);
	
	// 관리자 로그인
	public String adminLoginProcess(HttpServletRequest request, HttpSession session);
	
	// 에디터 유효성 검사
	public MemberVO memberEditorVali(String member_id);
	
}
