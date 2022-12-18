package kr.soft.bankCard.VO;

import java.util.List;

public class CardCompanyVO extends CardBrandVO {

    private int cardCompanySeq;

    private String cardCompanyName;

    private String cardCompanyState;

    private String[] Arr_cardCompanyName;

    public String[] getArr_cardCompanyName() {
        return Arr_cardCompanyName;
    }

    public void setArr_cardCompanyName(String[] arr_cardCompanyName) {
        Arr_cardCompanyName = arr_cardCompanyName;
    }

    public int getCardCompanySeq() {
        return cardCompanySeq;
    }

    public void setCardCompanySeq(int cardCompanySeq) {
        this.cardCompanySeq = cardCompanySeq;
    }

    public String getCardCompanyName() {
        return cardCompanyName;
    }

    public void setCardCompanyName(String cardCompanyName) {
        this.cardCompanyName = cardCompanyName;
    }

    public String getCardCompanyState() {
        return cardCompanyState;
    }

    public void setCardCompanyState(String cardCompanyState) {
        this.cardCompanyState = cardCompanyState;
    }
}
