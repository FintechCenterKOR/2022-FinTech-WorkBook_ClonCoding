package kr.soft.bankCard.VO;

import java.util.List;

public class CardVO extends CardTypeVO{

	
    private int cardPointSel;

    private int cardCompanySeq;

    private String cardImage;

    private String cardPath;

    private String cardInstDate;

    private String cardBrand;

    private List<String> cardBrandList;

    private String cardName;
    
    private String cardState;
    
    private int cardCount;

    private int cardMoneyValue; //카드 사용 요금
    
    private String[] arrPriceValue;

    public String[] getArrPriceValue()
	{
		return arrPriceValue;
	}

	public void setArrPriceValue(String[] arrPriceValue)
	{
		this.arrPriceValue = arrPriceValue;
	}

    public int getCardMoneyValue() {
        return cardMoneyValue;
    }

    public void setCardMoneyValue(int cardMoneyValue) {
        this.cardMoneyValue = cardMoneyValue;
    }

    public String getCardName() {
        return cardName;
    }

    public void setCardName(String cardName) {
        this.cardName = cardName;
    }

    public int getCardPointSel() {
        return cardPointSel;
    }

    public void setCardPointSel(int cardPointSel) {
        this.cardPointSel = cardPointSel;
    }

    public int getCardCompanySeq() {
        return cardCompanySeq;
    }

    public void setCardCompanySeq(int cardCompanySeq) {
        this.cardCompanySeq = cardCompanySeq;
    }

    public String getCardImage() {
        return cardImage;
    }

    public void setCardImage(String cardImage) {
        this.cardImage = cardImage;
    }

    public String getCardPath() {
        return cardPath;
    }

    public void setCardPath(String cardPath) {
        this.cardPath = cardPath;
    }

    public String getCardInstDate() {
        return cardInstDate;
    }

    public void setCardInstDate(String cardInstDate) {
        this.cardInstDate = cardInstDate;
    }

    public String getCardBrand() {
        return cardBrand;
    }

    public void setCardBrand(String cardBrand) {
        this.cardBrand = cardBrand;
    }

    public List<String> getCardBrandList() {
        return cardBrandList;
    }

    public void setCardBrandList(List<String> cardBrandList) {
        this.cardBrandList = cardBrandList;
    }
    
    public String getCardState() {
		return cardState;
	}

	public void setCardState(String cardState) {
		this.cardState = cardState;
	}
	
	public int getCardCount()
	{
		return cardCount;
	}

	public void setCardCount(int cardCount)
	{
		this.cardCount = cardCount;
	}

	@Override
	public String toString()
	{
		return "CardVO [cardPointSel=" + cardPointSel + ", cardCompanySeq=" + cardCompanySeq + ", cardImage="
				+ cardImage + ", cardPath=" + cardPath + ", cardInstDate=" + cardInstDate + ", cardBrand=" + cardBrand
				+ ", cardBrandList=" + cardBrandList + ", cardName=" + cardName + ", cardState=" + cardState
				+ ", cardCount=" + cardCount + "]";
	}
	
}
