package kr.soft.bankCard.VO;

public class BoardVO extends MemberVO
{
	private int boardSeq;
	private int memberSeq;
	private String boardTitle;
	private String boardContent;
	private String boardImageName;
	private int boardCount;
	private String boardPublic;
	private String boardState;
	private String boardTag;
	private String boardInsdate;
	private String boardUpdate;
	
	public BoardVO(int total, int nowPage, int cntPerPage)
	{
		super(total, nowPage, cntPerPage);
	}
	
	public BoardVO() {
		
	}
	
	public int getBoardSeq()
	{
		return boardSeq;
	}
	public void setBoardSeq(int boardSeq)
	{
		this.boardSeq = boardSeq;
	}
	public int getMemberSeq()
	{
		return memberSeq;
	}
	public void setMemberSeq(int memberSeq)
	{
		this.memberSeq = memberSeq;
	}
	public String getBoardTitle()
	{
		return boardTitle;
	}
	public void setBoardTitle(String boardTitle)
	{
		this.boardTitle = boardTitle;
	}
	public String getBoardContent()
	{
		return boardContent;
	}
	public void setBoardContent(String boardContent)
	{
		this.boardContent = boardContent;
	}
	
	public String getBoardImageName()
	{
		return boardImageName;
	}

	public void setBoardImageName(String boardImageName)
	{
		this.boardImageName = boardImageName;
	}

	public int getBoardCount()
	{
		return boardCount;
	}
	public void setBoardCount(int boardCount)
	{
		this.boardCount = boardCount;
	}
	public String getBoardPublic()
	{
		return boardPublic;
	}
	public void setBoardPublic(String boardPublic)
	{
		this.boardPublic = boardPublic;
	}
	public String getBoardState()
	{
		return boardState;
	}
	public void setBoardState(String boardState)
	{
		this.boardState = boardState;
	}
	public String getBoardTag()
	{
		return boardTag;
	}
	public void setBoardTag(String boardTag)
	{
		this.boardTag = boardTag;
	}
	public String getBoardInsdate()
	{
		return boardInsdate;
	}
	public void setBoardInsdate(String boardInsdate)
	{
		this.boardInsdate = boardInsdate;
	}
	public String getBoardUpdate()
	{
		return boardUpdate;
	}
	public void setBoardUpdate(String boardUpdate)
	{
		this.boardUpdate = boardUpdate;
	}

	@Override
	public String toString()
	{
		return "BoardVO [boardSeq=" + boardSeq + ", memberSeq=" + memberSeq + ", boardTitle=" + boardTitle
				+ ", boardContent=" + boardContent + ", boardImageName=" + boardImageName + ", boardCount=" + boardCount
				+ ", boardPublic=" + boardPublic + ", boardState=" + boardState + ", boardTag=" + boardTag
				+ ", boardInsdate=" + boardInsdate + ", boardUpdate=" + boardUpdate + "]";
	}
	
	
	
	
}
