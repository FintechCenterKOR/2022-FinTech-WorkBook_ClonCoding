package kr.soft.bankCard.Admin.Service;

import kr.soft.bankCard.VO.CardBrandVO;
import kr.soft.bankCard.VO.PlaceMstVO;

import java.util.List;

public interface PlaceService {

    List<PlaceMstVO> selectPlaceGroupList();

    List<PlaceMstVO> selectPlaceFindTypeList(PlaceMstVO placeMstVO);
}
