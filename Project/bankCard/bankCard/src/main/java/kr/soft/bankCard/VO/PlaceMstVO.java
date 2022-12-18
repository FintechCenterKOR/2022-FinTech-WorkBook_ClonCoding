package kr.soft.bankCard.VO;

public class PlaceMstVO {

    private int placeMstSeq;

    private String placeType;

    private String placeName;

    private String placeState;

    private String placeImage;

    private int placeLimit;

    public int getPlaceMstSeq() {
        return placeMstSeq;
    }

    public void setPlaceMstSeq(int placeMstSeq) {
        this.placeMstSeq = placeMstSeq;
    }

    public String getPlaceType() {
        return placeType;
    }

    public void setPlaceType(String placeType) {
        this.placeType = placeType;
    }

    public String getPlaceName() {
        return placeName;
    }

    public void setPlaceName(String placeName) {
        this.placeName = placeName;
    }

    public String getPlaceState() {
        return placeState;
    }

    public void setPlaceState(String placeState) {
        this.placeState = placeState;
    }

    public String getPlaceImage() {
        return placeImage;
    }

    public void setPlaceImage(String placeImage) {
        this.placeImage = placeImage;
    }

    public int getPlaceLimit() {
        return placeLimit;
    }

    public void setPlaceLimit(int placeLimit) {
        this.placeLimit = placeLimit;
    }
}
