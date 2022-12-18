package kr.soft.bankCard.Admin.Service;

import kr.soft.bankCard.VO.CardTypeVO;

import java.util.List;

public interface CardTypeService {

    List<CardTypeVO> selectCardTypeList();
}
