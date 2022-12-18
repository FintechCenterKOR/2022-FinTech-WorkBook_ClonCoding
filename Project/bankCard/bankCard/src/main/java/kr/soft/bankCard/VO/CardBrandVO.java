package kr.soft.bankCard.VO;

public class CardBrandVO extends PlaceMstVO{

    private int cardSeq;
    private int brandSeq;

    private String brandName;

    private String brandState;

    private String[] Arr_BrandName;

    public String[] getArr_BrandName() {
        return Arr_BrandName;
    }

    public void setArr_BrandName(String[] arr_BrandName) {
        Arr_BrandName = arr_BrandName;
    }

    public int getCardSeq() {
        return cardSeq;
    }

    public void setCardSeq(int cardSeq) {
        this.cardSeq = cardSeq;
    }

    public int getBrandSeq() {
        return brandSeq;
    }

    public String getBrandName() {
        return brandName;
    }

    public String getBrandState() {
        return brandState;
    }

    public void setBrandSeq(int brandSeq) {
        this.brandSeq = brandSeq;
    }

    public void setBrandName(String brandName) {
        this.brandName = brandName;
    }

    public void setBrandState(String brandState) {
        this.brandState = brandState;
    }
}
