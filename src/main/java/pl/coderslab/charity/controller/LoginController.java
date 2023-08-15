package pl.coderslab.charity.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class LoginController {


    @Autowired
    public LoginController() {

    }


    @RequestMapping("/login")
    public String loginPageDisplay(){
        return "login";
    }
}
