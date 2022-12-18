package kr.soft.bankCard.Admin.Mapper;

import kr.soft.bankCard.VO.CardTypeVO;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface CardTypeMapper {

    List<CardTypeVO> selectCardTypeList();
}
