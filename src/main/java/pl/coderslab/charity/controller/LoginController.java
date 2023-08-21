package pl.coderslab.charity.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class LoginController {


    @Autowired
    public LoginController() {

    }


    @RequestMapping( value ={"/login"}, method = RequestMethod.GET)
    public String loginPageDisplay(){
        return "login";
    }
}
