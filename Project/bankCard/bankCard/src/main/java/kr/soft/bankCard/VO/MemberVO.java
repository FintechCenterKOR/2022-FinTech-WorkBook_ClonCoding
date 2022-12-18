package kr.soft.bankCard.VO;

public class MemberVO extends PagingVO
{
	public MemberVO(int total, int nowPage, int cntPerPage)
	{
		super(total, nowPage, cntPerPage);
	}
	
	public MemberVO() {
		
	}
	
	public int memberSeq;
	public String memberId;
	public String memberPassword;
	public String memberCategory;
	public String memberNickname;
	public String memberPhone;
	public String memberState;
	public String memberInstDate;
	public String memberImage;
	public String memberLastlogin;
	public int getMemberSeq()
	{
		return memberSeq;
	}
	public void setMemberSeq(int memberSeq)
	{
		this.memberSeq = memberSeq;
	}
	public String getMemberId()
	{
		return memberId;
	}
	public void setMemberId(String memberId)
	{
		this.memberId = memberId;
	}
	public String getMemberPassword()
	{
		return memberPassword;
	}
	public void setMemberPassword(String memberPassword)
	{
		this.memberPassword = memberPassword;
	}
	public String getMemberCategory()
	{
		return memberCategory;
	}
	public void setMemberCategory(String memberCategory)
	{
		this.memberCategory = memberCategory;
	}
	public String getMemberNickname()
	{
		return memberNickname;
	}
	public void setMemberNickname(String memberNickname)
	{
		this.memberNickname = memberNickname;
	}
	public String getMemberPhone()
	{
		return memberPhone;
	}
	public void setMemberPhone(String memberPhone)
	{
		this.memberPhone = memberPhone;
	}
	public String getMemberState()
	{
		return memberState;
	}
	public void setMemberState(String memberState)
	{
		this.memberState = memberState;
	}
	public String getMemberInstDate()
	{
		return memberInstDate;
	}
	public void setMemberInstDate(String memberInstDate)
	{
		this.memberInstDate = memberInstDate;
	}
	public String getMemberImage()
	{
		return memberImage;
	}
	public void setMemberImage(String memberImage)
	{
		this.memberImage = memberImage;
	}
	public String getMemberLastlogin()
	{
		return memberLastlogin;
	}
	public void setMemberLastlogin(String memberLastlogin)
	{
		this.memberLastlogin = memberLastlogin;
	}
	@Override
	public String toString()
	{
		return "MemberVO [memberSeq=" + memberSeq + ", memberId=" + memberId + ", memberPassword=" + memberPassword
				+ ", memberCategory=" + memberCategory + ", memberNickname=" + memberNickname + ", memberPhone="
				+ memberPhone + ", memberState=" + memberState + ", memberInstDate=" + memberInstDate + ", memberImage="
				+ memberImage + ", memberLastlogin=" + memberLastlogin + "]";
	}
	
	
}
