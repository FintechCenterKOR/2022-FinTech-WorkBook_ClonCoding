package kr.soft.bankCard.User.Mapper;

import kr.soft.bankCard.VO.PlaceMstVO;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface UserPlaceMapper {

    //카드 혜택대상 브랜드의 그룹 출력
    List<PlaceMstVO> selectPlaceGroup(PlaceMstVO placeMstVO);

    //카드 혜택대상 그룹별 브랜드 리스트
    List<PlaceMstVO> selectPlaceGroupList(PlaceMstVO placeMstVO);
}
