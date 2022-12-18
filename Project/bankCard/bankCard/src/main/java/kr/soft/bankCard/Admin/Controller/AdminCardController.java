package kr.soft.bankCard.Admin.Controller;

import kr.soft.bankCard.Admin.Service.CardBrandService;
import kr.soft.bankCard.Admin.Service.CardService;
import kr.soft.bankCard.Admin.Service.PlaceService;
import kr.soft.bankCard.VO.*;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.PropertySource;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import java.io.File;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

@Controller
@RequestMapping("/admin/card")
@PropertySource(value= "classpath:message/message.properties", encoding="UTF-8")
public class AdminCardController {

    Logger logger = LoggerFactory.getLogger(this.getClass());

    @Value("${file_upload}")
    private String FILE_UPLOAD;

    @Value("${server_file_upload}")
    private String SERVER_FILE_UPLOAD;


    @Autowired
    CardService cardService;

    @Autowired
    PlaceService placeService;


    @GetMapping("/cardList.do")
    public String CardList(@RequestParam(value = "nowPage", required = false) String nowPage,
							@RequestParam(value = "cntPerPage", required = false) String cntPerPage,
							@RequestParam(value = "searchSelect", required = false) String searchSelect,
							@RequestParam(value = "searchInput", required = false) String searchInput, Model model) {
    	
    	if (nowPage == null && cntPerPage == null) {
            nowPage = "1";
            cntPerPage = "10";
        } else if (nowPage == null) {
            nowPage = "1";
        } else if (cntPerPage == null) {
            cntPerPage = "10";
        }
    	
    	if (searchSelect == null || searchInput == null || searchInput.equals("")) // 전체 리스트 출력 (검색어 X)
		{
    		int completeCount = cardService.cardCount();
    		
    		PagingVO completePaging = new PagingVO(completeCount, Integer.parseInt(nowPage), Integer.parseInt(cntPerPage));
    		model.addAttribute("completePaging", completePaging);
    		
    		List<CardVO> cardList = cardService.SelectCardList(completePaging);
    		
    		model.addAttribute("cardList", cardList);
		} else if(searchSelect.equals("searchCardname")) {	// 카드 이름 검색 출력
			
			int completeCount = cardService.cardNameCount(searchInput);
			
			PagingVO completePaging = new PagingVO(completeCount, Integer.parseInt(nowPage), Integer.parseInt(cntPerPage));
			model.addAttribute("completePaging", completePaging);
			
			completePaging.setCardName(searchInput);
			
			List<CardVO> cardList = cardService.selectCardNameList(completePaging);
			
			model.addAttribute("cardList", cardList);
			model.addAttribute("searchSelect", "searchCardname");
			model.addAttribute("searchInput", searchInput);
		} else if(searchSelect.equals("searchCardCompany")) {	// 카드사 검색 출력
			
			int completeCount = cardService.cardCompanyCount(searchInput);
			
			PagingVO completePaging = new PagingVO(completeCount, Integer.parseInt(nowPage), Integer.parseInt(cntPerPage));
			model.addAttribute("completePaging", completePaging);
			
			completePaging.setCardCompanyName(searchInput);
			
			List<CardVO> cardList = cardService.selectCardCompanyList(completePaging);
			
			model.addAttribute("cardList", cardList);
			model.addAttribute("searchSelect", "searchCardCompany");
			model.addAttribute("searchInput", searchInput);
			
		}

        return "admin/card/card_list";
    }
    
    @GetMapping("/placeGroupList.ajax")
    @ResponseBody
    public ModelAndView placeGroupList() {

        ModelAndView mv = new ModelAndView("jsonView");

        try {

            List<PlaceMstVO> placeList = placeService.selectPlaceGroupList();

            if(placeList.size() != 0) {
                mv.addObject("placeList", placeList);
                mv.addObject("RST_CD", 0);
            }
            else {
                mv.addObject("RST_CD", -1);
            }

        }
        catch (Exception e) {
            mv.addObject("RST_CD", -2);
            e.printStackTrace();
        }
        return mv;
    }


    /**
     * 사용 안함
     * @param placeMstVO
     * @return
     */
    @GetMapping("/placeList.ajax")
    @ResponseBody
    public ModelAndView placeList(PlaceMstVO placeMstVO) {

        ModelAndView mv = new ModelAndView("jsonView");

        try {

            logger.warn("");
            logger.info("");
            logger.error("");


            List<PlaceMstVO> placeList = placeService.selectPlaceFindTypeList(placeMstVO);

            if(placeList.size() != 0) {
                mv.addObject("placeList", placeList);
                mv.addObject("RST_CD", 0);
            }

            else {
                mv.addObject("RST_CD", -1);
            }


        }
        catch (Exception e) {
            mv.addObject("RST_CD", -2);
            e.printStackTrace();
        }

        return mv;
    }

    @PostMapping("/InsertCard.do")
    public String InsertCard(@RequestParam MultipartFile card_image, HttpServletRequest request
                            ,CardVO cardVO) {

        try {


            int cardCnt = cardService.InsertCard(request, card_image, cardVO);

            System.out.println("max : "+cardCnt);


        }
        catch (Exception e) {
            e.printStackTrace();
        }

        return "redirect:/admin/card/cardList.do";
    }


    /**
     * 카드 혜택 리스트 불러오기
     * @param benefitVO
     * @return
     */
    @PostMapping("/SelectBenefitList.ajax")
    public ModelAndView SelectBenefitList(BenefitVO benefitVO) {

        ModelAndView mv = new ModelAndView("jsonView");
        try {


            List<BenefitVO> benefitList = cardService.SelectBenefitList(benefitVO);

            if(benefitList.size() > 0) {
                mv.addObject("benefitList", benefitList);
                mv.addObject("RST_CD", 0);
            } else {

                mv.addObject("RST_CD", -1);
            }
        }
        catch (Exception e) {
            e.printStackTrace();
            mv.addObject("RST_CD", -2);
        }

        return mv;
    }


    @PostMapping("/deleteBenefit.do")
    public ModelAndView deleteBenefit(BenefitVO benefitVO) {

        ModelAndView mv = new ModelAndView("jsonView");

        try {

            int resultCard = cardService.deleteBenefit(benefitVO);


            if(resultCard > 0) {
                mv.addObject("RST_CD", 0);
            } else {
                mv.addObject("RST_CD", -1);
            }
        }
        catch (Exception e) {
            mv.addObject("RST_CD", -2);
            e.printStackTrace();
        }

        return mv;
    }


    /**
     * 카드 적립 / 혜택 추가하기
     * @param benefitVO
     * @return
     */
    @PostMapping("/InsertBenefit.ajax")
    @ResponseBody
    public ModelAndView InsertBenefit(BenefitVO benefitVO) {

        logger.info(benefitVO.toString());

        ModelAndView mv = new ModelAndView("jsonView");
        try {

            int ResultBenefit = cardService.InsertBenefit(benefitVO);
            if(ResultBenefit != 0) {
                mv.addObject("RST_CD", 0);
            } else {
                mv.addObject("RST_CD", -1);
            }

        }
        catch (Exception e) {
            mv.addObject("RST_CD", -2);
            e.printStackTrace();
        }

        return mv;
    }


    /**
     * 카드 마일리지 등록하기
     * @param mileageVO
     * @return
     */
    @PostMapping("/InsertMileage.ajax")
    @ResponseBody
    public ModelAndView InsertMileage(MileageVO mileageVO) {

        ModelAndView mv = new ModelAndView("jsonView");

        try {

            int resultMileage = cardService.InsertMileage(mileageVO);
            if(resultMileage != 0) {
                mv.addObject("RST_CD", 0);
            }
            else {
                mv.addObject("RST_CD", -1);
            }

        }
        catch (Exception e) {
            mv.addObject("RST_CD", -2);
            e.printStackTrace();
        }

        return mv;
    }



    @PostMapping("/SelectMileageList.ajax")
    @ResponseBody
    public ModelAndView SelectMileageList(MileageVO mileageVO) {

        ModelAndView mv = new ModelAndView("jsonView");

        try {

            List<MileageVO> mileageList = cardService.SelectMileageList(mileageVO);
            if(mileageList.size() > 0) {
                mv.addObject("RST_CD", 0);
                mv.addObject("mileageList", mileageList);
            }
            else {
                mv.addObject("RST_CD", -1);
            }

        }
        catch (Exception e) {
            mv.addObject("RST_CD", -2);
            e.printStackTrace();
        }

        return mv;
    }

    @PostMapping("/deleteMileage.ajax")
    @ResponseBody
    public ModelAndView deleteMileage(MileageVO mileageVO) {

        ModelAndView mv = new ModelAndView("jsonView");

        try {

            int resultMileage = cardService.DeleteMileage(mileageVO);
            if(resultMileage != 0) {
                mv.addObject("RST_CD", 0);
            }

            else {
                mv.addObject("RST_CD", -1);
            }

        }
        catch (Exception e) {
            mv.addObject("RST_CD", -2);
            e.printStackTrace();
        }

        return mv;
    }

    @GetMapping("/cardDetail.do")
    public String cardDetail(Model model, CardVO cardVO) {


        CardVO cardResult = cardService.selectCardDetail(cardVO);

        model.addAttribute("result", cardResult);

        return "admin/card/card_detail";
    }
    
    @PostMapping("/cardState.ajax")
    @ResponseBody
    public void cardState(@RequestParam("cardSeq") String cardSeq) {
    	
    	cardService.cardState(Integer.parseInt(cardSeq));
    	
    }
    
    
    
}
