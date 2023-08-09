package pl.coderslab.charity.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import pl.coderslab.charity.entity.Donation;
import pl.coderslab.charity.entity.Institution;
import pl.coderslab.charity.service.DonationService;
import pl.coderslab.charity.service.InstitutionService;

import java.util.List;


@Controller
public class HomeController {

    private final InstitutionService institutionService;

    private final DonationService donationService;



    @Autowired
    public HomeController(InstitutionService institutionService, DonationService donationService){
        this.institutionService = institutionService;
        this.donationService = donationService;
    }


    @RequestMapping("/")
    public String homeAction(Model model){

        List<Institution> institutionList = institutionService.getAllInstitutions();
        List<Donation> donationsList = donationService.getAllDonations();
        model.addAttribute("institutions", institutionList);
        model.addAttribute("donations", donationsList);
        return "index";
    }
}
