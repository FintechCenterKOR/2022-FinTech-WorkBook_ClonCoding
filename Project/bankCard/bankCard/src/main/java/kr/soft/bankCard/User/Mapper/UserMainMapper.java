package kr.soft.bankCard.User.Mapper;

import kr.soft.bankCard.VO.BenefitVO;
import kr.soft.bankCard.VO.CardVO;
import kr.soft.bankCard.VO.MileageVO;

import org.apache.ibatis.annotations.Mapper;

import java.util.HashMap;
import java.util.List;
import java.util.WeakHashMap;

@Mapper
public interface UserMainMapper {

    //카드 혜택 리스트 불러오기

    List<BenefitVO> SelectBestBenefitList(List<BenefitVO> BenefitVO);

    List<CardVO> selectBestCardList(HashMap<Integer, BenefitVO> map);
    
    List<MileageVO> selectBestMileageCardList(int result);

    List<CardVO> selectMileageCardList(HashMap<Integer, MileageVO> map);
    
    int selectRecommandMileage(int result);
    
    // 카드 조회 수 증가
    void cardHitCount(int cardSeq);
    
    // 카드 탑 10
    List<CardVO> cardTopTen();

    //카드 디테일 정보 가져오기
    CardVO cardDetailCheck(CardVO cardVO);

    //카드 디테일 가맹점 할인 정보 가져오기
    BenefitVO cardDeatailBenefit(BenefitVO benefitVO);

    //카드 디테일 마일리지 할인 정보 가져오기
    MileageVO cardDetailMileage(MileageVO mileageVO);
}
