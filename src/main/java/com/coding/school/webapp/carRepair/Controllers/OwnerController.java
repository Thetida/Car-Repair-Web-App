package com.coding.school.webapp.carRepair.Controllers;

import com.coding.school.webapp.carRepair.Converters.OwnerConverter;
import com.coding.school.webapp.carRepair.Domain.Owner;
import com.coding.school.webapp.carRepair.Domain.Repair;
import com.coding.school.webapp.carRepair.Domain.Vehicle;
import com.coding.school.webapp.carRepair.Model.RegisterForm;
import com.coding.school.webapp.carRepair.Model.SearchForm;
import com.coding.school.webapp.carRepair.Services.OwnerService;
import com.coding.school.webapp.carRepair.Services.RepairService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.MessageSource;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;
import java.util.List;

@Controller
public class OwnerController {

    @Autowired
    OwnerService ownerService;

    @Autowired
    RepairService repairService;

    @Autowired
    private MessageSource messageSource;

    private static final String SEARCH_FORM = "searchForm";

    public static final String OWNER = "owner";

    public static final String VEHICLES = "vehicle";

    private static final String REGISTER_FORM = "user";

    private static final String EDIT_FORM = "ownerEditForm";

    private static final String REPAIRS = "repairs";

    private static final int NUMBER_OF_REPAIRS = 10;


    @RequestMapping(value = "/admin/registerOwner", method = RequestMethod.POST)
    String addUser(@Valid @ModelAttribute(REGISTER_FORM) RegisterForm registerForm, BindingResult bindingResult,
                   HttpSession session, RedirectAttributes redirectAttributes){
        if (bindingResult.hasErrors()) {
            String message = messageSource.getMessage(bindingResult.getAllErrors().get(0), null);
            redirectAttributes.addFlashAttribute("errorMessage", message);
        }else{
            try{
                Owner owner = OwnerConverter.buildUserObject(registerForm);
                ownerService.registerOwner(owner);
                redirectAttributes.addFlashAttribute("message", "owner "+ owner.getFirstName()
                        + " " + owner.getLastName() + " successfully inserted! :)");
            }catch (Exception e){
                redirectAttributes.addFlashAttribute("errorMessage", e.getMessage());
            }
        }

        return "redirect:/admin/home";
    }

    @RequestMapping(value = "/admin/searchOwner", method = RequestMethod.GET)
    public String getSearchView(Model model) {

        return "ownerEditForm";
    }

    @RequestMapping(value = "/admin/searchOwner", method = RequestMethod.POST)
    public String doSearch(@ModelAttribute(SEARCH_FORM) SearchForm searchForm,
                           HttpSession session,
                           RedirectAttributes redirectAttributes) {

        Owner owner = ownerService.findByEmailOrVat(searchForm.getEmail() , searchForm.getEmail());
        Vehicle vehicle = null;

        if (owner == null) {
            redirectAttributes.addFlashAttribute("errorMessage", "Owner not found");
        }else {
            vehicle = owner.getVehicle();
        }

        redirectAttributes.addFlashAttribute(OWNER, owner);
        redirectAttributes.addFlashAttribute(VEHICLES, vehicle);

        return "redirect:/admin/searchOwner";
    }

    @RequestMapping(value = "/admin/editOwner", method = RequestMethod.POST)
    String editUser(@Valid @ModelAttribute(EDIT_FORM) RegisterForm updateForm, BindingResult bindingResult,
                   HttpSession session, RedirectAttributes redirectAttributes){

        try{

        }catch (Exception e){
            redirectAttributes.addFlashAttribute("errorMessage", "Ooops something went wrong\nOwner was not updated!");
        }
        ownerService.updateOwner(OwnerConverter.buildUserObject(updateForm));
        List<Repair> repairs = repairService.findNextRepairs(NUMBER_OF_REPAIRS);
        session.setAttribute(REPAIRS, repairs);
        redirectAttributes.addFlashAttribute("message", "User Updated :)");

        return "redirect:/admin/home";
    }

    @RequestMapping(value = "/admin/deleteOwner", method = RequestMethod.POST)
    String deleteUser(@Valid @ModelAttribute(EDIT_FORM) RegisterForm deleteForm, BindingResult bindingResult,
                    HttpSession session, RedirectAttributes redirectAttributes){

        try{
            Owner owner = ownerService.findByEmail(deleteForm.getEmail());
            ownerService.deleteOwner(owner);
            List<Repair> repairs = repairService.findNextRepairs(NUMBER_OF_REPAIRS);
            session.setAttribute(REPAIRS, repairs);
            redirectAttributes.addFlashAttribute("message", "User Deleted");
        }catch (Exception e){
            redirectAttributes.addFlashAttribute("errorMessage", "Ooops something went wrong\nUser was not deleted!");
        }

        return "redirect:/admin/home";
    }
}
