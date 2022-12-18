package kr.soft.bankCard.User.Controller;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import kr.soft.bankCard.User.Service.UserBoardService;
import kr.soft.bankCard.User.Service.UserMainService;
import kr.soft.bankCard.VO.BoardVO;
import kr.soft.bankCard.VO.CardVO;

@Controller
public class UserMainController {

    Logger logger = LoggerFactory.getLogger(this.getClass());
    @Autowired
	UserBoardService userBoardService;
    
    @Autowired
    UserMainService userMainService;

    @GetMapping("/test123")
    public String bestCard() {

        return "user/best/best_card";
    }


    @GetMapping("/user/cardList.do")
    public String UserBestCardList(@RequestParam(value="obj") String obj
                                ,@RequestParam(value="keyObject") String keyObject
                                   ,Model model) {


        System.out.println("cardList");
        logger.info(obj);
        if(obj != null && obj.length() > 5) {

            model.addAttribute("obj", obj); //모든값 전송

            //들어 있는 값 체크하기
            if(keyObject != null && keyObject.length() > 5) {

                logger.info(keyObject);

                model.addAttribute("keyValue", keyObject); //선택 된 값들 전송
                model.addAttribute("RST_CD", 1);
            }
            else {
                model.addAttribute("keyValue", "0");
                model.addAttribute("RST_CD", 0);
            }
        }
        else {
            model.addAttribute("obj", "0");
            model.addAttribute("RST_CD", -1);
        }



        return "user/best/card_list";
    }
    
    // 메인페이지
 	@RequestMapping("/Main.do")
 	public String userMain(Model model) {
 		
 		int min = userBoardService.userBoardMin();
 		int max = userBoardService.userBoardMax();
 		int randomSu;

 		BoardVO boardVO = null;
 		
 		do
 		{
 			randomSu = (int)((Math.random() * (max-min+1)) + min);
 			
 			if (userBoardService.userBoardState(randomSu).equals("Y"))
 			{
 				boardVO = userBoardService.userBoardContent(randomSu);
 				break;
 			}
 			
 		} while (randomSu > max || randomSu < min || userBoardService.userBoardState(randomSu).equals("N"));
 		
 		List<CardVO> cardList = userMainService.cardTopTen();
 		
 		model.addAttribute("BoardVO", boardVO);
 		model.addAttribute("cardList", cardList);
 		
 		return "main";
 	}
 	
 	// 유저 카드 상세보기
    @GetMapping("/user/card_detail.do")
    public String CardDetail(Model model, @RequestParam(value="seq", required = false) String seq
            ,@RequestParam(value="mst", required = false) String mst
            ,@RequestParam(value="cardMoneyValue", required = false) String cardMoneyValue) {

        logger.info("/cardDeatail.do");

        //Detail 정상적으로 할 경우
        if(seq != null && mst != null && cardMoneyValue != null) {
            model.addAttribute("seq", seq);
            model.addAttribute("mst", mst);
            model.addAttribute("cardMoneyValue", cardMoneyValue);
        }
        //Detail 정상적으로 사용하지 않을 경우.
        else {
            return "user/best/best_card";
        }


        return "user/best/card_detail";
    }
}
