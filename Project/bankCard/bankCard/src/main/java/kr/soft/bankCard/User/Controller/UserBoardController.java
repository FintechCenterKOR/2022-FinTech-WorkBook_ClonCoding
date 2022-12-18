package kr.soft.bankCard.User.Controller;


import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import kr.soft.bankCard.User.Service.UserBoardService;
import kr.soft.bankCard.VO.BoardVO;

@Controller
@RequestMapping("/user/board")
public class UserBoardController {

	@Autowired
	UserBoardService userBoardService;
	
	// 매거진 상세보기
	@RequestMapping("/userBoardContent.do")
	public String userBoardMain(Model model, 
								@RequestParam Integer state, 
								@RequestParam(required = false) Integer boardSeq
								,HttpSession session) {

		int min = userBoardService.userBoardMin();
		int max = userBoardService.userBoardMax();
		int randomSu;

		BoardVO boardVO = null;
		
		if (state == 1)
		{
			do
			{
				randomSu = (int)((Math.random() * (max-min+1)) + min);
				
				if (userBoardService.userBoardState(randomSu).equals("Y"))
				{
					if (!(userBoardService.userBoardContent(randomSu).getMemberId().equals(session.getAttribute("admin_id"))))
					{
						System.out.println("여기");
						userBoardService.userBoardCount(randomSu);
					}
					boardVO = userBoardService.userBoardContent(randomSu);
					break;
				}
				
			} while (randomSu > max || randomSu < min || userBoardService.userBoardState(randomSu).equals("N"));
		} else {
			
			if (!(userBoardService.userBoardContent(boardSeq).getMemberId().equals(session.getAttribute("admin_id"))))
			{
				userBoardService.userBoardCount(boardSeq);
			}
			boardVO = userBoardService.userBoardContent(boardSeq);
		}
		
		model.addAttribute("BoardVO", boardVO);
		
		return "user/board/userBoardContent";
	}
	
	
}
