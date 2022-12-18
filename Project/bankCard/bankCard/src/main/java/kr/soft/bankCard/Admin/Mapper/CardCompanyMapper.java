package kr.soft.bankCard.Admin.Mapper;

import kr.soft.bankCard.VO.CardCompanyVO;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface CardCompanyMapper {

    List<CardCompanyVO> selectCardCompanyList();
}
