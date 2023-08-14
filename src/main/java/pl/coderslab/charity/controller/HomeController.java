package pl.coderslab.charity.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import pl.coderslab.charity.entity.Category;
import pl.coderslab.charity.entity.Donation;
import pl.coderslab.charity.entity.Institution;
import pl.coderslab.charity.service.CategoryService;
import pl.coderslab.charity.service.DonationService;
import pl.coderslab.charity.service.InstitutionService;

import java.util.List;


@Controller
public class HomeController {


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
    public List<Donation> getAllDonations(){
        return donationService.getAllDonations();
    }



    @Autowired
    public HomeController(InstitutionService institutionService, DonationService donationService, CategoryService categoryService){
        this.institutionService = institutionService;
        this.donationService = donationService;
        this.categoryService = categoryService;
    }


    @RequestMapping("/")
    public String homeAction(Model model){
        List<Institution> institutions = institutionService.getAllInstitutions();
        if (institutions.isEmpty()) {
            System.out.println("Initialising institutions database");
            createInitialDatabaseRecords();
        }
        List<Category> categories = categoryService.getAllCategories();
        if (categories.isEmpty()) {
            // If no categories exist, create initial category records
            createInitialCategoryRecords();
        }

        return "index";
    }

    private void createInitialCategoryRecords() {
        Category category1 = new Category();
        category1.setName("ubrania, które nadają się do ponownego użycia");
        categoryService.saveCategory(category1);

        Category category2 = new Category();
        category2.setName("ubrania, do wyrzucenia");
        categoryService.saveCategory(category2);

        Category category3 = new Category();
        category3.setName("zabawki");
        categoryService.saveCategory(category3);

        Category category4 = new Category();
        category4.setName("książki");
        categoryService.saveCategory(category4);

        Category category5 = new Category();
        category5.setName("inne");
        categoryService.saveCategory(category5);
    }

    private void createInitialDatabaseRecords() {
        Institution foundation1 = new Institution();
        foundation1.setName("Dbam o Zdrowie");
        foundation1.setDescription("Pomoc dzieciom z ubogich rodzin.");
        institutionService.saveInstitution(foundation1);

        Institution foundation2 = new Institution();
        foundation2.setName("A kogo");
        foundation2.setDescription("Pomoc wybudzaniu dzieci ze śpiączki.");
        institutionService.saveInstitution(foundation2);

        Institution foundation3 = new Institution();
        foundation3.setName("Dla dzieci");
        foundation3.setDescription("Pomoc osobom znajdującym się w trudnej sytuacji życiowej.");
        institutionService.saveInstitution(foundation3);

        Institution foundation4 = new Institution();
        foundation4.setName("Bez domu");
        foundation4.setDescription("Pomoc dla osób nie posiadających miejsca zamieszkania.");
        institutionService.saveInstitution(foundation4);

    }
}
