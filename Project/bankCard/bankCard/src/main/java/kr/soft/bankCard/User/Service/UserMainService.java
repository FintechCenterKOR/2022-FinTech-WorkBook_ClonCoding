package kr.soft.bankCard.User.Service;

import kr.soft.bankCard.VO.BenefitVO;
import kr.soft.bankCard.VO.CardVO;
import kr.soft.bankCard.VO.MileageVO;

import java.util.List;

public interface UserMainService {


    List<CardVO> SelectBestBenefitList(BenefitVO benefitVO);
    

    List<CardVO> selectBestMileageList(MileageVO mileageVO);
    
    int selectRecommandMileage(MileageVO mileageVO);

    //카드 디테일 정보 가져오기
    CardVO cardDetailCheck(CardVO cardVO);

    //카드 디테일 적립 가져오기
    BenefitVO cardDeatailBenefit(BenefitVO benefitVO);

    //카드 디테일 마일리지 가져오기
    MileageVO cardDetailMileage(MileageVO mileageVO);
    
    //카드 탑 10 가져오기
    List<CardVO> cardTopTen();
}
