package kr.soft.bankCard.Admin.Mapper;

import kr.soft.bankCard.VO.CardBrandVO;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface CardBrandMapper {

    List<CardBrandVO> selectCardBrandList();
}
