package kr.soft.bankCard.VO;

public class CardTypeVO extends CardCompanyVO {

    private int cardTypeSeq;
    private String cardTypeName;
    private String cardTypeState;

    private String[] Arr_cardTypeName;

    public int getCardTypeSeq() {
        return cardTypeSeq;
    }

    public String getCardTypeName() {
        return cardTypeName;
    }

    public String getCardTypeState() {
        return cardTypeState;
    }

    public void setCardTypeSeq(int cardTypeSeq) {
        this.cardTypeSeq = cardTypeSeq;
    }

    public void setCardTypeName(String cardTypeName) {
        this.cardTypeName = cardTypeName;
    }

    public void setCardTypeState(String cardTypeState) {
        this.cardTypeState = cardTypeState;
    }

    public String[] getArr_cardTypeName() {
        return Arr_cardTypeName;
    }

    public void setArr_cardTypeName(String[] arr_cardTypeName) {
        Arr_cardTypeName = arr_cardTypeName;
    }
}
