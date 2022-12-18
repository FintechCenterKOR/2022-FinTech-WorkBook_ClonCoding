package kr.soft.bankCard.Admin.Service;

public interface PagingCountService
{
	// 에디터 총원 수
	public int memberEditorCount();
	
	// 에디터 아이디 검색 총원 수
	public int memberEditorIdCount(String searchInput);
	
	// 에디터 닉네임 검색 총원 수
	public int memberEditorNickCount(String searchInput);
	
}
