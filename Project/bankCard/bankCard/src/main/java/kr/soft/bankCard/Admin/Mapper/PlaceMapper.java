package kr.soft.bankCard.Admin.Mapper;

import kr.soft.bankCard.VO.PlaceMstVO;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface PlaceMapper {

    List<PlaceMstVO> selectPlaceGroupList();

    List<PlaceMstVO> selectPlaceFindTypeList(PlaceMstVO placeMstVO);
}
