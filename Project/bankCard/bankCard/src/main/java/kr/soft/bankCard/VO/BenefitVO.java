package kr.soft.bankCard.VO;

import java.util.Arrays;

public class BenefitVO extends CardVO{

    private int benefitSeq;  //카드 할인 정보

    private String benefitState;    //카드혜택 상태
    private int cardPrice;      //카드 세일기준 가격
    private String cardSale;       //카드 세일 가격

    private String[] arrPriceValue;

    private String[] arrPriceName;

    public String[] getArrPriceValue() {
        return arrPriceValue;
    }

    public void setArrPriceValue(String[] arrPriceValue) {
        this.arrPriceValue = arrPriceValue;
    }

    public String[] getArrPriceName() {
        return arrPriceName;
    }

    public void setArrPriceName(String[] arrPriceName) {
        this.arrPriceName = arrPriceName;
    }

    public int getBenefitSeq() {
        return benefitSeq;
    }

    public void setBenefitSeq(int benefitSeq) {
        this.benefitSeq = benefitSeq;
    }

    public String getBenefitState() {
        return benefitState;
    }

    public void setBenefitState(String benefitState) {
        this.benefitState = benefitState;
    }

    public int getCardPrice() {
        return cardPrice;
    }

    public void setCardPrice(int cardPrice) {
        this.cardPrice = cardPrice;
    }

    public String getCardSale() {
        return cardSale;
    }

    public void setCardSale(String cardSale) {
        this.cardSale = cardSale;
    }

    @Override
    public String toString() {
        return "BenefitVO{" +
                "benefitSeq=" + benefitSeq +
                ", benefitState='" + benefitState + '\'' +
                ", cardPrice=" + cardPrice +
                ", cardSale='" + cardSale + '\'' +
                ", arrPriceValue=" + Arrays.toString(arrPriceValue) +
                ", arrPriceName=" + Arrays.toString(arrPriceName) +
                '}';
    }
}
