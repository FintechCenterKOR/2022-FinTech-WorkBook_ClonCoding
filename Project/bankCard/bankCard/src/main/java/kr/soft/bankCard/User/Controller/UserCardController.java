package kr.soft.bankCard.User.Controller;

import java.util.ArrayList;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import kr.soft.bankCard.User.Service.UserMainService;
import kr.soft.bankCard.User.Service.UserPlaceService;
import kr.soft.bankCard.VO.BenefitVO;
import kr.soft.bankCard.VO.CardVO;
import kr.soft.bankCard.VO.MileageVO;
import kr.soft.bankCard.VO.PlaceMstVO;

@Controller
@RequestMapping("/user/best")
public class UserCardController {

    Logger logger = LoggerFactory.getLogger(this.getClass());

    @Autowired
    UserPlaceService userplaceService;

    @Autowired
    UserMainService userMainService;


    /**
     * 목차 종류 불러오기
     * @param placeMstVO
     * @return
     */
    @PostMapping("/placeGroup.ajax")
    public ModelAndView placeGroup(PlaceMstVO placeMstVO) {

        ModelAndView mv = new ModelAndView("jsonView");

        try {

            //그룹 가져오기
            List<PlaceMstVO> placeGroupList = userplaceService.selectPlaceGroup(placeMstVO);

            mv.addObject("placeGroupList", placeGroupList);

        }
        catch (Exception e) {
            e.printStackTrace();
        }

        return mv;
    }


    /**
     * 목차별 리스트 출력하기
     * @param placeMstVO
     * @return
     */
    @PostMapping("/placeGroupList.ajax")
    public ModelAndView placeGroupList(PlaceMstVO placeMstVO) {
        ModelAndView mv = new ModelAndView("jsonView");

        try {

            List<PlaceMstVO> placeList = userplaceService.selectPlaceGroupList(placeMstVO);
            mv.addObject("placeList", placeList);

        }
        catch (Exception e) {
            e.printStackTrace();
        }

        return mv;
    }


    /**
     * 카드 적립 혜택 복록 불러오기
     * @param cardVO
     * @return
     */
    @PostMapping("/SelectcardList.ajax")
    public ModelAndView SelectBestCardList(BenefitVO benefitVO) {

        ModelAndView mv = new ModelAndView("jsonView");

        try {
            logger.info("user/SelectcardList.ajax");

            logger.info(benefitVO.toString());

            List<CardVO> resultCard = userMainService.SelectBestBenefitList(benefitVO);

            if(resultCard != null && resultCard.size() != 0) {

                mv.addObject("result", resultCard);
                mv.addObject("RST_CD", 0);

            }
            else {

                mv.addObject("RST_CD", -1);
            }



        }
        catch (Exception e) {
            e.printStackTrace();
        }

        return mv;
    }
    
    // 혜택/적립 예상 월 혜택
    @PostMapping("/SelectRecommandBenefit.ajax")
    public ModelAndView selectRecommandBenefit(BenefitVO benefitVO) {
    	
    	ModelAndView mv = new ModelAndView("jsonView");

        logger.info("/SelectRecommandBenefit.ajax");

        List<CardVO> resultCard = userMainService.SelectBestBenefitList(benefitVO);
    	
    	if(resultCard != null && resultCard.size() != 0) {

            logger.info("개수 : "+resultCard.size());
            mv.addObject("result", resultCard.get(0).getCardMoneyValue());
            mv.addObject("RST_CD", 0);

        }
        else {

            mv.addObject("RST_CD", -1);
        }
    	
    	
    	return mv;
    }
    
    
    /**
     * 카드 마일리지 목록
     * @param BenefitVO benefitVO
     * @return
     */
    @PostMapping("/SelectMileageList.ajax")
    public ModelAndView selectBestMileageList(MileageVO mileageVO) {
    	
    	ModelAndView mv = new ModelAndView("jsonView");
    	
    	System.out.println("마일리지 목록");
    	try {
            logger.info("user/SelectMileageCardList.ajax");

            logger.info(mileageVO.toString());

            List<CardVO> resultCard = userMainService.selectBestMileageList(mileageVO);

            if(resultCard != null && resultCard.size() != 0) {

                mv.addObject("result", resultCard);
                mv.addObject("RST_CD", 0);

            }
            else {

                mv.addObject("RST_CD", -1);
            }



        }
        catch (Exception e) {
            e.printStackTrace();
        }
    	
    	
    	
    	return mv;
    }
    
    // 마일리지 예상 월 혜택
    @PostMapping("/SelectRecommandMileage.ajax")
    public ModelAndView selectRecommandMileage(MileageVO mileageVO) {
    	
    	ModelAndView mv = new ModelAndView("jsonView");
    	
    	Integer recommandResult = userMainService.selectRecommandMileage(mileageVO);
    	
    	if(recommandResult != null && recommandResult != 0) {

            mv.addObject("result", recommandResult);
            mv.addObject("RST_CD", 0);

        }
        else {

            mv.addObject("RST_CD", -1);
        }
    	
    	return mv;
    }


    @PostMapping("/cardDetail.ajax")
    public ModelAndView cardDetail(CardVO cardVO) {

        ModelAndView mv = new ModelAndView("jsonView");

        logger.info("cardDetail.ajax");
        try {

            CardVO cardDetail = userMainService.cardDetailCheck(cardVO);
            if(cardDetail != null) {
                mv.addObject("RST_CD", 0);
                mv.addObject("result", cardDetail);
            }
            else {
                mv.addObject("RST_CD", -1);
            }

        }
        catch (Exception e) {
            e.printStackTrace();
            logger.error(e.getMessage());
        }

        return mv;
    }

    @PostMapping("/cardPoint.ajax")
    public ModelAndView cardDeatailPoint(BenefitVO benefitVO) {

        ModelAndView mv = new ModelAndView("jsonView");

        //HashMap<String, Object> map = new HashMap<String, Object>();

        logger.info("cardPoint.ajax");

        try {

            List<BenefitVO> resultList = new ArrayList<BenefitVO>();

            int totalPrice = 0; //월 혜택 금액 총 금액

            for(int i = 0; i < benefitVO.getArrPriceName().length; i++) {

                benefitVO.setPlaceName(benefitVO.getArrPriceName()[i]);
                benefitVO.setCardPrice(Integer.parseInt(benefitVO.getArrPriceValue()[i]));

                BenefitVO beneVO = userMainService.cardDeatailBenefit(benefitVO);

                //결과가 없을 경우
                if(beneVO != null) {
                    resultList.add(beneVO);
                    totalPrice += beneVO.getCardMoneyValue();
                }

            }


            if(resultList.size() > 0) {
                mv.addObject("RST_CD", 0);
                mv.addObject("list", resultList);
                mv.addObject("totalPrice", totalPrice);
            }


        }
        catch (Exception e) {
            logger.error(e.getMessage());
        }

        return mv;

    }


    @PostMapping("/cardMileage.ajax")
    public ModelAndView cardDeatailMileage(MileageVO mileageVO) {

        ModelAndView mv = new ModelAndView("jsonView");

        try {

            mileageVO = userMainService.cardDetailMileage(mileageVO);

            mv.addObject("RST_CD", 0);
            mv.addObject("result", mileageVO);

        }
        catch (Exception e) {
            logger.error(e.getMessage());
        }


        return mv;

    }

}
