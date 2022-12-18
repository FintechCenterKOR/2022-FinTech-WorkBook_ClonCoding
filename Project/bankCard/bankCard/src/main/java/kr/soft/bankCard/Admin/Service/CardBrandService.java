package kr.soft.bankCard.Admin.Service;

import kr.soft.bankCard.VO.CardBrandVO;
import kr.soft.bankCard.VO.CardCompanyVO;

import java.util.List;

public interface CardBrandService {

    List<CardBrandVO> selectCardBrandList();
}
