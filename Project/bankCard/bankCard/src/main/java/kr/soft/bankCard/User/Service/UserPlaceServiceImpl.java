package kr.soft.bankCard.User.Service;

import kr.soft.bankCard.User.Mapper.UserPlaceMapper;
import kr.soft.bankCard.VO.PlaceMstVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class UserPlaceServiceImpl implements UserPlaceService {


    @Autowired
    UserPlaceMapper placeMapper;

    @Override
    public List<PlaceMstVO> selectPlaceGroup(PlaceMstVO placeMstVO) {
        return placeMapper.selectPlaceGroup(placeMstVO);
    }

    @Override
    public List<PlaceMstVO> selectPlaceGroupList(PlaceMstVO placeMstVO) {
        return placeMapper.selectPlaceGroupList(placeMstVO);
    }


}
