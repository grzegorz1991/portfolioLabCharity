package pl.coderslab.charity.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import pl.coderslab.charity.entity.Category;
import pl.coderslab.charity.entity.Donation;
import pl.coderslab.charity.entity.Institution;
import pl.coderslab.charity.service.CategoryService;
import pl.coderslab.charity.service.DonationService;
import pl.coderslab.charity.service.InstitutionService;

import java.util.List;

@Controller
public class DonationController {

    private final InstitutionService institutionService;

    private final DonationService donationService;

    private final CategoryService categoryService;

    @ModelAttribute("categories")
    public List<Category> getAllCategories() {
        return categoryService.getAllCategories();
    }

    @ModelAttribute("institutions")
    public List<Institution> getAllInstitutions() {
        return institutionService.getAllInstitutions();
    }

    @ModelAttribute("donations")
    public List<Donation> getAllDonations() {
        return donationService.getAllDonations();
    }

    @Autowired
    public DonationController(InstitutionService institutionService, DonationService donationService, CategoryService categoryService) {
        this.institutionService = institutionService;
        this.donationService = donationService;
        this.categoryService = categoryService;
    }

    @RequestMapping("/form")
    public String showDonationForm(Model model) {
        Donation donation = new Donation();
        model.addAttribute("donation", donation);
        System.out.println("Donation object at step 1: " + donation);
        return "form";
    }
    @PostMapping("/form-confirmation")
    public String formConfirmationPage(@ModelAttribute Donation donation, @RequestParam("selectedCategoryIds") List<Long> selectedCategoryIds ){

        List<Category> selectedCategories = categoryService.getCategoriesByIds(selectedCategoryIds);
        donation.setCategories(selectedCategories);

        donationService.saveDonation(donation);
        System.out.println("Donation object at confirmation step: " + donation);

        return "form-confirmation";
    }
}

