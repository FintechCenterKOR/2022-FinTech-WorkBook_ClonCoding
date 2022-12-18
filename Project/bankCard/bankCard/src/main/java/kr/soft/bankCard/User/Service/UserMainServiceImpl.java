package kr.soft.bankCard.User.Service;

import kr.soft.bankCard.User.Mapper.UserMainMapper;
import kr.soft.bankCard.VO.BenefitVO;
import kr.soft.bankCard.VO.CardVO;
import kr.soft.bankCard.VO.MileageVO;

import org.apache.ibatis.annotations.Mapper;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.WeakHashMap;

@Service
public class UserMainServiceImpl implements UserMainService{

    Logger logger = LoggerFactory.getLogger(this.getClass());

    @Autowired
    UserMainMapper userMainMapper;


    @Override
    public List<CardVO> SelectBestBenefitList(BenefitVO benefitVO){



        HashMap<Integer, BenefitVO> cardParseList = new HashMap<Integer, BenefitVO>();
        List<CardVO> cardResultList = null;

        //선택된 PlaceMst가 있을 경우 돌아간다.
        if(benefitVO.getArrPriceValue() != null && benefitVO.getArrPriceValue().length > 0) {
            List<BenefitVO> list = new ArrayList<BenefitVO>();
            for(int i =0; i < benefitVO.getArrPriceName().length; i++) {
                BenefitVO benefit = new BenefitVO();
                benefit.setPlaceName(benefitVO.getArrPriceName()[i]);
                benefit.setCardPrice(Integer.parseInt(benefitVO.getArrPriceValue()[i]));
                list.add(benefit);
            }

            List<BenefitVO> result = userMainMapper.SelectBestBenefitList(list);


            for(BenefitVO li : result) {

                int SaleValue= 0;   //할인 된 값

                //가격할인이 Percent로 할인 할 경우. //Sale값에 '%' 유무 파악하기
                //indexOf에서 '-1'은 존재하지 않음. 결과가 false이면, true조건을 둔다.
                if(li.getCardSale().indexOf("%") != -1) {
                    //%는 마지막에 붙으므로, Sale의 마지막 값 '%'을 제거한다.
                    //제거된 Sale값은 2% => 2로 변환된다.
                    //2는 String Type이므로, int 타입으로 변환한다.
                    int percent = Integer.parseInt(li.getCardSale().substring(0, li.getCardSale().length()-1));

                    //할인된 값을 표현한다.
                    //할인된 값을 int에 담는다.
                    SaleValue = li.getCardMoneyValue()/100*percent;
                } else {
                    //할인된 값을 int에 담는다.
                    SaleValue = Integer.parseInt(li.getCardSale());
                }

                System.out.println("KEY : "+li.getCardSeq()+" / Value = "+SaleValue);
                //HashMap특성을 활용하여 중복을 확인한다.
                //Key 졵재 여부 확인, Key는 중복될 수가 없다.
                //Key가 존재할 경우 True, 없을 경우 False를 반환한다.
                if(cardParseList.containsKey(li.getCardSeq())) {

                    //이전에 저장된 값을 불러온 후, 새로 추가한다.
                    BenefitVO beneVO = cardParseList.get(li.getCardSeq());
                    beneVO.setCardMoneyValue(beneVO.getCardMoneyValue()+SaleValue);
                    cardParseList.put(li.getCardSeq(), beneVO);

                } else {
                    BenefitVO beneVO = new BenefitVO();
                    beneVO.setCardMoneyValue(SaleValue);
                    //해당부분은 중복이 아닐 경우, 넣는 부분이므로 여기구간만 넣으면 된다.
                    //Map검색을 위한 용이다.
                    beneVO.setArr_cardTypeName(benefitVO.getArr_cardTypeName());
                    logger.info(beneVO.getArr_cardTypeName()[0]);

                    if(benefitVO.getArr_BrandName() != null && benefitVO.getArr_BrandName().length >0) {
                        beneVO.setArr_BrandName(benefitVO.getArr_BrandName());
                    }
                    if(benefitVO.getArr_cardCompanyName() != null && benefitVO.getArr_cardCompanyName().length > 0) {
                        beneVO.setArr_cardCompanyName(benefitVO.getArr_cardCompanyName());
                    }
                    cardParseList.put(li.getCardSeq(), beneVO);
                }

                System.out.println("결과 : KEY : "+li.getCardSeq()+" / Value = "+cardParseList.get(li.getCardSeq()));
            }

            if(cardParseList.size() > 0) {
            	cardResultList = userMainMapper.selectBestCardList(cardParseList);
            }else {
            	BenefitVO df2 = new BenefitVO();
            	df2.setPlaceName(null);
            	df2.setBenefitSeq(0);
            	df2.setCardSeq(0);
            	df2.setCardSale(null);
            	df2.setCardPrice(0);
            	df2.setCardMoneyValue(0);
            	cardParseList.put(0, df2);
            }
            
            System.out.println(benefitVO.getArr_BrandName());
            System.out.println(benefitVO.getArr_cardCompanyName());
        }

        return cardResultList;
    }
    

    
    // 마일리지 베스트 목록
    @Override
    public List<CardVO> selectBestMileageList(MileageVO mileageVO)
    {

        HashMap<Integer, MileageVO> cardParseList = new HashMap<Integer, MileageVO>();
        List<CardVO> cardResultList = null;

    	int sum = 0;
    	int result = 0;
    	
    	for (String Value : mileageVO.getArrPriceValue())
		{
			sum += Integer.parseInt(Value);
		}
    	
    	System.out.println("Impl : " + mileageVO.toString());
    	System.out.println("CardMoneyValue : " + mileageVO.getCardMoneyValue());
    	
    	if (mileageVO.getCardMoneyValue() > sum)
		{
    		result = mileageVO.getCardMoneyValue() - sum;
		}
    	
    	System.out.println("result : " + result);
    	
    	List<MileageVO> list = userMainMapper.selectBestMileageCardList(result);


        for(MileageVO li : list) {



            MileageVO mileVO = new MileageVO();
            mileVO.setCardMoneyValue(li.getCardMoneyValue());
            //해당부분은 중복이 아닐 경우, 넣는 부분이므로 여기구간만 넣으면 된다.
            //Map검색을 위한 용이다.
            mileVO.setArr_cardTypeName(mileageVO.getArr_cardTypeName());

            if(mileageVO.getArr_BrandName().length >0) {
                mileVO.setArr_BrandName(mileageVO.getArr_BrandName());
            }
            if(mileageVO.getArr_cardCompanyName().length > 0) {
                mileVO.setArr_cardCompanyName(mileageVO.getArr_cardCompanyName());
            }

            cardParseList.put(li.getCardSeq(), mileVO);
        }

        if(list.size() > 0) {
            logger.info("size : "+list.size());
            cardResultList = userMainMapper.selectMileageCardList(cardParseList);
        }

        for(CardVO li : cardResultList) {
            logger.info("seq : "+li.getCardSeq());
        }
    	
    	
    	
    	return cardResultList;
    }



    @Override
    public int selectRecommandMileage(MileageVO mileageVO)
    {
    	System.out.println("impl입니다.");
    	System.out.println("1 : " + mileageVO.getArrPriceValue());
    	int sum = 0;
    	int result = 0;
    	
    	for (String Value : mileageVO.getArrPriceValue())
		{
			sum += Integer.parseInt(Value);
		}
    	
    	if (mileageVO.getCardMoneyValue() > sum)
		{
    		result = mileageVO.getCardMoneyValue() - sum;
		}
    	
    	
    	int recommandResult = userMainMapper.selectRecommandMileage(result); 
    	
    	return recommandResult;
    }
    
    @Override
    public List<CardVO> cardTopTen()
    {
    	return userMainMapper.cardTopTen();
    }

    @Override
    public CardVO cardDetailCheck(CardVO cardVO) {
    	userMainMapper.cardHitCount(cardVO.getCardSeq());
    	
        return userMainMapper.cardDetailCheck(cardVO);
    }

    @Override
    public BenefitVO cardDeatailBenefit(BenefitVO benefitVO) {

        BenefitVO beneVO = userMainMapper.cardDeatailBenefit(benefitVO);
        //가격할인이 Percent로 할인 할 경우. //Sale값에 '%' 유무 파악하기
        //indexOf에서 '-1'은 존재하지 않음. 결과가 false이면, true조건을 둔다.
        if(beneVO != null && beneVO.getCardSale().indexOf("%") != -1) {
            //%는 마지막에 붙으므로, Sale의 마지막 값 '%'을 제거한다.
            //제거된 Sale값은 2% => 2로 변환된다.
            //2는 String Type이므로, int 타입으로 변환한다.
            int percent = Integer.parseInt(beneVO.getCardSale().substring(0, beneVO.getCardSale().length() - 1));

            //할인된 값을 표현한다.
            //할인된 값을 int에 담는다.
            //할인된 가격 = 사용한 금액/(Sale 된 금액*100)%
            beneVO.setCardMoneyValue(benefitVO.getCardPrice() / 100 * percent);
        } else if(beneVO != null){
            beneVO.setCardMoneyValue(Integer.parseInt(beneVO.getCardSale()));
        }

        return beneVO;
    };


    @Override
    public MileageVO cardDetailMileage(MileageVO mileageVO) {
        return userMainMapper.cardDetailMileage(mileageVO);
    }
}
