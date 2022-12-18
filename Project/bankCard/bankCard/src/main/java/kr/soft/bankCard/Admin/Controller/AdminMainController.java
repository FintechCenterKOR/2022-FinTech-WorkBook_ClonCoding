package kr.soft.bankCard.Admin.Controller;

import kr.soft.bankCard.Admin.Service.*;
import kr.soft.bankCard.VO.*;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

@Controller
@RequestMapping("/admin")
public class AdminMainController {

    Logger logger = LoggerFactory.getLogger(this.getClass());

    @Autowired
    CardService cardService;
    
    @Autowired
    CardTypeService cardTypeService;

    @Autowired
    CardCompanyService cardCompanyService;

    @Autowired
    CardBrandService cardBrandService;

    @Autowired
    PlaceService placeService;

    
    @GetMapping("/adminLogin.do")
    public String adminLogin() {
    	return "admin/member/admin_login";
    }

    @GetMapping("/memberInsert.do")
    public String memberInsert() {

        return "admin/member/member_insert";
    }

    /**
     * 어드민 페이지 생성
     *
     * @return
     */
    @GetMapping("/main.do")
    public String default01() {

        System.out.println("왜 안나오지");

        return "admin/card/card_list";
    }

    

    @GetMapping("/cardInsert.do")
    public String cardInsert(Model model) {

        //카드 타입 가져오기
        List<CardTypeVO> cardTypeList = cardTypeService.selectCardTypeList();

        //카드 회사 불러오기
        List<CardCompanyVO> cardCompanyList = cardCompanyService.selectCardCompanyList();

        //카드 브랜드 불러오기
        List<CardBrandVO> cardBrandList = cardBrandService.selectCardBrandList();

        //카드 혜택회사 분류 가져오기
        List<PlaceMstVO> placeGroupList = placeService.selectPlaceGroupList();


        model.addAttribute("cardTypeList", cardTypeList);

        model.addAttribute("cardCompanyList", cardCompanyList);

        model.addAttribute("cardBrandList", cardBrandList);

        model.addAttribute("placeGroupList", placeGroupList);

        return "admin/card/card_insert";
    }

    @GetMapping("/loginCheck.do")
    public String loginCheck() {
    	
    	return "admin/member/loginCheck";
    }


    @GetMapping("/boardInsert.do")
    public String boardInsert() {

        return "admin/board/board_insert";
    }
}


