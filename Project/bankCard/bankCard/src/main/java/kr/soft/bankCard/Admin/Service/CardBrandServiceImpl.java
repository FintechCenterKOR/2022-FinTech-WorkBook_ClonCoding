package kr.soft.bankCard.Admin.Service;

import kr.soft.bankCard.Admin.Mapper.CardBrandMapper;
import kr.soft.bankCard.Admin.Mapper.CardCompanyMapper;
import kr.soft.bankCard.VO.CardBrandVO;
import kr.soft.bankCard.VO.CardCompanyVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class CardBrandServiceImpl implements CardBrandService{

    @Autowired
    CardBrandMapper cardBrandMapper;

    public List<CardBrandVO> selectCardBrandList() {

        return cardBrandMapper.selectCardBrandList();
    }

}
