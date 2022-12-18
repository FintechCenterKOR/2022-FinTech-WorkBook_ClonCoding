package kr.soft.bankCard.Admin.Service;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import kr.soft.bankCard.Admin.Mapper.CardMapper;
import kr.soft.bankCard.VO.BenefitVO;
import kr.soft.bankCard.VO.CardVO;
import kr.soft.bankCard.VO.MileageVO;
import kr.soft.bankCard.VO.PagingVO;

@Service
public class CardServiceImpl implements CardService{

    @Value("${file_upload}")
    private String FILE_UPLOAD;

    @Value("${server_file_upload}")
    private String SERVER_FILE_UPLOAD;

    @Autowired
    CardMapper cardMapper;

    public int InsertCard(HttpServletRequest request, MultipartFile card_image, CardVO cardVO) {

        Logger logger = LoggerFactory.getLogger(this.getClass());
        

        String cardBrand = "";
        
        
        String contextPath = request.getSession().getServletContext().getRealPath("/");
		String member_image = "";
		System.out.println("contextPath : " + contextPath);
		System.out.println("new_file : " + card_image);
		
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy년MM월dd일HH시mm분ss초");
        Calendar c1 = Calendar.getInstance();
        String strToday = sdf.format(c1.getTime());
		
        File dest = new File(contextPath + "../resources/static/card/" + strToday + "_" + card_image.getOriginalFilename());
        
        if (!(card_image.getOriginalFilename().equals(""))) {
        	 member_image = strToday + "_" + card_image.getOriginalFilename();
        } else {
            member_image = "";
        }
        
        try {
        	card_image.transferTo(dest);
        } catch (Exception e) {
            e.printStackTrace();
        }
        
        cardVO.setCardImage(member_image);
        

        int resultCnt = 0;  //Insert 결과값 0 실패 1 성공

        //checkBox를 통해서 가져온 결과값을 담는다.
        if (cardVO.getCardBrandList().size() > 0) {
        	for (int i = 0; i < cardVO.getCardBrandList().size(); i++) {
        		cardBrand += cardVO.getCardBrandList().get(i) + ",";
        	}
        }
        
        cardVO.setCardBrand(cardBrand);
        
        
        resultCnt = cardMapper.InsertCard(cardVO);
        
        
        


        return resultCnt;
    }

    // 카드 총 갯수
    @Override
    public int cardCount()
    {
    	return cardMapper.cardCount();
    }
    
    // 카드 이름 검색 총 갯수
    @Override
    public int cardNameCount(String cardName)
    {
    	return cardMapper.cardNameCount(cardName);
    }
    
    // 카드사 검색 총 갯수
    @Override
    public int cardCompanyCount(String cardCompany)
    {
    	return cardMapper.cardCompanyCount(cardCompany);
    }
    
    @Override
    public List<CardVO> SelectCardList(PagingVO pagingVO) {

        return cardMapper.SelectCardList(pagingVO);
    }
    
    // 카드 정보 이름 검색 List 출력하기
    @Override
    public List<CardVO> selectCardNameList(PagingVO pagingVO)
    {
    	return cardMapper.selectCardNameList(pagingVO);
    }
    
    // 카드사 검색 List 출력하기
    @Override
    public List<CardVO> selectCardCompanyList(PagingVO pagingVO)
    {
    	return cardMapper.selectCardCompanyList(pagingVO);
    }
    
    
    @Override
    public List<BenefitVO> SelectBenefitList(BenefitVO benefitVO) {
        return cardMapper.SelectBenefitList(benefitVO);
    }

    @Override
    public int deleteBenefit(BenefitVO benefitVO) {
        System.out.println(benefitVO.getBenefitSeq());
        return cardMapper.deleteBenefit(benefitVO);
    }

    @Override
    public int InsertBenefit(BenefitVO benefitVO) {
        return cardMapper.InsertBenefit(benefitVO);
    }

    @Override
    public int InsertMileage(MileageVO mileageVO) {
        return cardMapper.InsertMileage(mileageVO);
    }

    @Override
    public List<MileageVO> SelectMileageList(MileageVO mileageVO) {
        return cardMapper.SelectMileageList(mileageVO);
    }

    @Override
    public int DeleteMileage(MileageVO mileageVO) {
        return cardMapper.DeleteMileage(mileageVO);
    }

    @Override
    public CardVO selectCardDetail(CardVO cardVO) {
        return cardMapper.selectCardDetail(cardVO);
    }
    
    @Override
    public void cardState(int cardSeq) {
    	cardMapper.cardState(cardSeq);
    }

}
