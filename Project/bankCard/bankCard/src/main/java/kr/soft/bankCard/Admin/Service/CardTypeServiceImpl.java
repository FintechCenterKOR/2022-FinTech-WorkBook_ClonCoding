package kr.soft.bankCard.Admin.Service;

import kr.soft.bankCard.Admin.Mapper.CardTypeMapper;
import kr.soft.bankCard.VO.CardTypeVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class CardTypeServiceImpl implements CardTypeService{

    @Autowired
    CardTypeMapper cardTypeMapper;

    public List<CardTypeVO> selectCardTypeList() {
        return cardTypeMapper.selectCardTypeList();
    }

}
