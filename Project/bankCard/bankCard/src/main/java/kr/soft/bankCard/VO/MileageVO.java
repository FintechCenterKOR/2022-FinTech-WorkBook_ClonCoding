package kr.soft.bankCard.VO;

public class MileageVO extends CardVO{

    private int mileageSeq; //마일리지 PK

    private int cardPrice;  //카드 할인 기준

    private int mileageValue;   //카드 마일리지 적립 금
    
    private String mileageState;    //마일리지 사용 여부

    private String mileageInstDate; //마일리지 값, 등록 날짜
    
	public int getMileageSeq() {
        return mileageSeq;
    }

    public void setMileageSeq(int mileageSeq) {
        this.mileageSeq = mileageSeq;
    }

    public int getCardPrice() {
        return cardPrice;
    }

    public void setCardPrice(int cardPrice) {
        this.cardPrice = cardPrice;
    }

    public int getMileageValue() {
        return mileageValue;
    }

    public void setMileageValue(int mileageValue) {
        this.mileageValue = mileageValue;
    }

    public String getMileageState() {
        return mileageState;
    }

    public void setMileageState(String mileageState) {
        this.mileageState = mileageState;
    }

    public String getMileageInstDate() {
        return mileageInstDate;
    }

    public void setMileageInstDate(String mileageInstDate) {
        this.mileageInstDate = mileageInstDate;
    }

    @Override
    public String toString() {
        return "MileageVO{" +
                "mileageSeq=" + mileageSeq +
                ", cardPrice=" + cardPrice +
                ", mileageValue=" + mileageValue +
                ", mileageState='" + mileageState + '\'' +
                ", mileageInstDate='" + mileageInstDate + '\'' +
                '}';
    }
}

