package kr.soft.bankCard.Admin.Service;

import kr.soft.bankCard.Admin.Mapper.CardCompanyMapper;
import kr.soft.bankCard.VO.CardCompanyVO;
import kr.soft.bankCard.VO.CardTypeVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class CardCompanyServiceImpl implements CardCompanyService{

    @Autowired
    CardCompanyMapper cardCompanyMapper;

    public List<CardCompanyVO> selectCardCompanyList() {

        return cardCompanyMapper.selectCardCompanyList();
    }



}
