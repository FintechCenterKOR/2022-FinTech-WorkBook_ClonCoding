package kr.soft.bankCard.Admin.Service;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import kr.soft.bankCard.Admin.Mapper.MemberMapper;
import kr.soft.bankCard.VO.MemberVO;
import kr.soft.bankCard.VO.PagingVO;

@Service
public class MemberServiceImpl implements MemberService, PagingCountService
{

	@Autowired
	MemberMapper memberMapper;

	// 에디터 등록
	@Override
	public void memberInsert(String member_id, HttpServletRequest request, MultipartFile multipartFile)
	{
		String contextPath = request.getSession().getServletContext().getRealPath("/");
		String member_image = "";
		System.out.println("contextPath : " + contextPath);
		System.out.println("new_file : " + multipartFile);

		SimpleDateFormat sdf = new SimpleDateFormat("yyyy년MM월dd일HH시mm분ss초");
		Calendar c1 = Calendar.getInstance();
		String strToday = sdf.format(c1.getTime());

		File dest = new File(
				contextPath + "../resources/static/profile/" + strToday + "_" + multipartFile.getOriginalFilename());

		if (!(multipartFile.getOriginalFilename().equals("")))
		{
			member_image = strToday + "_" + multipartFile.getOriginalFilename();
		} else
		{
			member_image = "";
		}

		try
		{
			multipartFile.transferTo(dest);
		} catch (Exception e)
		{
			e.printStackTrace();
		}

		System.out.println("dest : " + dest);

		memberMapper.memberInsert(member_id, member_image);
	}

	// 에디터 총원 수
	@Override
	public int memberEditorCount()
	{
		return memberMapper.memberEditorMemberCount();
	}
	
	// 에디터 아이디 검색 총원 수
	@Override
	public int memberEditorIdCount(String searchInput)
	{
		return memberMapper.memberEditorIdCount(searchInput);
	}
	
	// 에디터 닉네임 검색 총원 수
	@Override
	public int memberEditorNickCount(String searchInput)
	{
		return memberMapper.memberEditorNickCount(searchInput);
	}

	// 에디터 리스트
	@Override
	public List<MemberVO> memberList(PagingVO pagingVO)
	{
		return memberMapper.memberList(pagingVO);
	}
	
	// 에디터 아이디 검색
	@Override
	public List<MemberVO> memberIdSearch(MemberVO memberVO)
	{
		return memberMapper.memberIdSearch(memberVO);
	}
	
	// 에디터 닉네임 검색
	@Override
	public List<MemberVO> memberNickSearch(MemberVO memberVO)
	{
		return memberMapper.memberNickSearch(memberVO);
	}

	// 에디터 상태 변경
	@Override
	public void memberState(int member_seq, String member_state)
	{
		memberMapper.memberState(member_seq, member_state);
	}
	

	// 에디터 비밀번호 초기화
	@Override
	public void memberPasswordInitialization(int member_seq)
	{
		memberMapper.memberPasswordInitialization(member_seq);
	}


	// 관리자 로그인
	@Override
	public String adminLoginProcess(HttpServletRequest request, HttpSession session)
	{
		
		String userpw = "";
		int choice = 0;
		
		if (memberMapper.adminLogin(request.getParameter("adminId")) == null){
			return "fail";
		} else if (memberMapper.adminVali(request.getParameter("adminId")) == 0 && memberMapper.memberEditorIdCount(request.getParameter("adminId")) == 0){
			return "fail";
		} else if (memberMapper.adminLogin(request.getParameter("adminId")).equals("admin")){
			userpw = memberMapper.adminLogin(request.getParameter("adminId"));
			choice = 0;
		} else if (memberMapper.memberEditorIdCount(request.getParameter("adminId")) != 0) {
			userpw = memberMapper.memberEditLogin(request.getParameter("adminId"));
			choice = 1;
		}

		if (userpw.equals(request.getParameter("adminPassword"))){
			memberMapper.memberEditLastLogin(request.getParameter("adminId"));
			session = request.getSession();
			session.setAttribute("admin_id", request.getParameter("adminId"));
			if (choice == 0){
				return "admin";
			} else if(choice == 1) {
				return "editor";
			}
		}
		
		return "fail";
	}
	
	// 에디터 유효성 검사
	@Override
	public MemberVO memberEditorVali(String member_id)
	{
		
		MemberVO memberVO = new MemberVO();
		
		if (memberMapper.memberEditorIdCheckVali(member_id) == 0)
		{
			memberVO.setMemberSeq(2);
		} else {
			
			int cnt = memberMapper.memberEditorVali(member_id);
			
			
			if (cnt == 0)
			{
				memberVO = memberMapper.memberEditorValiGet(member_id);
			}
			memberVO.setMemberSeq(cnt);
		}
		
		
		return memberVO;
		
	}
	

}
