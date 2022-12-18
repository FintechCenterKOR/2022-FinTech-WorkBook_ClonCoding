package kr.soft.bankCard.Admin.Mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import kr.soft.bankCard.VO.MemberVO;
import kr.soft.bankCard.VO.PagingVO;

@Mapper
public interface MemberMapper
{
	// 관리자 에디터 추가하기
	public void memberInsert(String member_id, String member_image);
	
	// 회원가입이 된 아이디인지 유효성 검사
	public int memberEditorIdCheckVali(String member_id);
	
	// 에디터 유효성 검사
	public int memberEditorVali(String member_id);
	
	// 에디터 유효성 검사 후 닉네임, 핸드폰 번호 가져오기
	public MemberVO memberEditorValiGet(String member_id);
	
	// 에디터 총원 수
	public int memberEditorMemberCount();
	
	// 에디터 아이디 검색 총원 수
	public int memberEditorIdCount(String searchInput);
	
	// 에디터 닉네임 검색 총원 수
	public int memberEditorNickCount(String searchInput);
	
	// 에디터 리스트
	public List<MemberVO> memberList(PagingVO pagingVO);
	
	// 에디터 아이디 검색
	public List<MemberVO> memberIdSearch(MemberVO memberVO);
	
	// 에디터 닉네임 검색
	public List<MemberVO> memberNickSearch(MemberVO memberVO);
	
	// 에디터 상태 변경
	public void memberState(int member_seq, String member_state);
	
	// 에디터 비밀번호 초기화
	public void memberPasswordInitialization(int member_seq);
	
	// 관리자 조건
	public int adminVali(String member_id);
	
	// 관리자 로그인
	public String adminLogin(String member_id);
	
	// 에디터 로그인
	public String memberEditLogin(String member_id);
	
	// 마지막 로그인 날짜 수정
	public void memberEditLastLogin(String member_id);
}