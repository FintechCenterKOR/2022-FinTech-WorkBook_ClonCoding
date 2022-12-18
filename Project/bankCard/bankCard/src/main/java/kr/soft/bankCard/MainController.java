package kr.soft.bankCard;


import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class MainController {


    @GetMapping("/")
    public String default01() {

        System.out.println("main");


        return "user/best/best_card";
    }

    @GetMapping("/test")
    public String test() {

        //JsoupFun um = new JsoupFun();


        System.out.println("test123");


        return "main";
    }
}
