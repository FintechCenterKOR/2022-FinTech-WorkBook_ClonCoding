package kr.soft.bankCard.Admin.Mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import kr.soft.bankCard.VO.BenefitVO;
import kr.soft.bankCard.VO.CardVO;
import kr.soft.bankCard.VO.MileageVO;
import kr.soft.bankCard.VO.PagingVO;

@Mapper
public interface CardMapper {

    int InsertCard(CardVO cardVO);

    // 카드 총 갯수
    int cardCount();
    
    // 카드 이름 검색 총 갯수
    int cardNameCount(String cardName);
    
    // 카드사 검색 총 갯수
    int cardCompanyCount(String cardCompany);
    
    List<CardVO> SelectCardList(PagingVO pagingVO);
    
    // 카드 이름 검색 총 List
    List<CardVO> selectCardNameList(PagingVO pagingVO);

    // 카드사 총 List
    List<CardVO> selectCardCompanyList(PagingVO pagingVO);
    
    List<BenefitVO> SelectBenefitList(BenefitVO benefitVO);

    int deleteBenefit(BenefitVO benefitVO);

    int InsertBenefit(BenefitVO benefitVO);

    int InsertMileage(MileageVO mileageVO);

    List<MileageVO> SelectMileageList(MileageVO mileageVO);

    int DeleteMileage(MileageVO mileageVO);

    CardVO selectCardDetail(CardVO cardVO);
    
    void cardState(int cardSeq);
}
