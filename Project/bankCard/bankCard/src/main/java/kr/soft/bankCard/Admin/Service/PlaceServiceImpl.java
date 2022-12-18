package kr.soft.bankCard.Admin.Service;

import kr.soft.bankCard.Admin.Mapper.CardBrandMapper;
import kr.soft.bankCard.Admin.Mapper.PlaceMapper;
import kr.soft.bankCard.VO.CardBrandVO;
import kr.soft.bankCard.VO.PlaceMstVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class PlaceServiceImpl implements PlaceService{

    @Autowired
    PlaceMapper placeMapper;

    public List<PlaceMstVO> selectPlaceGroupList() {

        return placeMapper.selectPlaceGroupList();
    }

    @Override
    public List<PlaceMstVO> selectPlaceFindTypeList(PlaceMstVO placeMstVO) {
        return placeMapper.selectPlaceFindTypeList(placeMstVO);
    }

}
