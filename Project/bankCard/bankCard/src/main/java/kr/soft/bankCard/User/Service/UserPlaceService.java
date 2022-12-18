package kr.soft.bankCard.User.Service;

import kr.soft.bankCard.VO.PlaceMstVO;

import java.util.List;

public interface UserPlaceService {


    //카드 혜택대상 브랜드의 그룹 출력
    List<PlaceMstVO> selectPlaceGroup(PlaceMstVO placeMstVO);

    List<PlaceMstVO> selectPlaceGroupList(PlaceMstVO placeMstVO);
}
