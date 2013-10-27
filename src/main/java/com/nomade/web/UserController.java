package com.nomade.web;

import java.util.Arrays;
import java.util.Collection;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.roo.addon.web.mvc.controller.scaffold.RooWebScaffold;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.nomade.domain.BeanRegister;
import com.nomade.domain.Confidentiality;
import com.nomade.domain.Country;
import com.nomade.domain.Gender;
import com.nomade.domain.Langue;
import com.nomade.domain.Nationality;
import com.nomade.domain.Profil;
import com.nomade.domain.RoleName;
import com.nomade.domain.UserNomade;
import com.nomade.domain.VehiculeState;
import com.nomade.domain.VehiculeType;
import com.nomade.email.NotificationService;
import com.nomade.security.SecurityUtil;
import com.nomade.tools.ImageUploadException;
import com.nomade.tools.ImageUtil;
import com.nomade.tools.ValideEmailUtil;

@RequestMapping("/users")
@Controller
@RooWebScaffold(path = "users", formBackingObject = UserNomade.class)
public class UserController {
	
	@Autowired
	NotificationService notificationService;
	SecurityUtil securite = new SecurityUtil();
	
	@RequestMapping("/register")
    public String register(@Valid BeanRegister beanRegister, BindingResult bindingResult, Model uiModel, HttpServletRequest httpServletRequest) {
		
		if(!beanRegister.getPassword().equals(beanRegister.getConfirmPassword())){
			bindingResult.rejectValue("password", "password_diff_confirmPassword");
			
		}
		
		List<UserNomade> list = userService.findByUserName(beanRegister.getUserName());
		if(list!=null && list.size()>0){
			bindingResult.rejectValue("userName", "username_already_exist", "username already exist!");
			
		}
		
		List<UserNomade> list1 = userService.findByEmail(beanRegister.getEmail());
		if(list1!=null && list1.size()>0){
			bindingResult.rejectValue("email", "email_already_exist", "email already exist!");
			
		}
		if(beanRegister.getUserName().equals(beanRegister.getPassword())==true){
			bindingResult.rejectValue("password", "password_as_username", "password can't be same as username");
		}
        if (bindingResult.hasErrors()) {
           uiModel.addAttribute("beanRegister", beanRegister);
            return "login";
        }
        uiModel.asMap().clear();
        Set<RoleName> roleNames = new HashSet<RoleName>();
		roleNames.add(RoleName.ROLE_SIMPLE_USER);
        UserNomade nomade = new UserNomade(beanRegister.getUserName(), beanRegister.getPassword(), true, false, roleNames);
        nomade.getCompte().setEmail(beanRegister.getEmail());
        StringBuilder stringBuilder = new StringBuilder().append("<b>Active your profil by cliking the link bellow</b>")
        				   .append("<br/>")
        				   .append("\n")
        				   .append("http://localhost:8900/users/activate/")
        				   .append(nomade.getUserName());
        				   
        try {
			notificationService.sendMessage(beanRegister.getEmail(), stringBuilder.toString());
			
			userService.saveUserNomade(nomade);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			nomade.setDisableLogin(false);
			userService.saveUserNomade(nomade);
		}
        return "succesRegister";
    }
	
	@RequestMapping("/activate/{username}")
    public String activate(@PathVariable("username") String username, Model uiModel, HttpServletRequest httpServletRequest) {
		UserNomade nomade;
		try {
			nomade = userService.findByUserName(username).get(0);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			uiModel.addAttribute("error", "bad link!");
			return "accountActivate";
		}
		nomade.setDisableLogin(false);
		userService.updateUserNomade(nomade);
		return "accountActivate";
		
	}
	
	@RequestMapping("/private/{page}")
    public String pagePersoForm(@PathVariable("page") String page, Model uiModel, HttpServletRequest httpServletRequest,
    		@RequestParam(value="message", required=false) String message) {
		
		uiModel.addAttribute("message", message);
		uiModel.addAttribute("nomade", securite.getUserNomade());
		return "profil/"+page;
		
	}
	
	@RequestMapping("/updateField")
    public String updateField(Model uiModel, HttpServletRequest httpServletRequest,
    		@RequestParam("name") String name, @RequestParam("pk") String pk, @RequestParam("value") String value) {
		System.out.print("name: "+name);
		System.out.print("pk: "+pk);
		System.out.print("value: "+value);
		
		
		return "profil/";
		
	}
	
	@RequestMapping("/profil")
    public String profil(UserNomade userNomade, Model uiModel, HttpServletRequest httpServletRequest,
    		@RequestParam(value="photo", required=false)  MultipartFile photo) {
		 
		UserNomade userNomade2 = securite.getUserNomade();
		
		
		try {
			if(!photo.isEmpty()) {
				//validateImage(photo);
				ImageUtil.saveImage(userNomade2.getId() + "profil.jpg", photo); 
				userNomade.getProfil().setFile(userNomade2.getId() + "profil.jpg");
				userNomade2.setProfil(userNomade.getProfil());
				userService.updateUserNomade(userNomade2);
			}
			} catch (ImageUploadException e) {
				String message =e.getMessage();
				return "redirect:/users/private/profil?message="+message;
			}
		
		userNomade2.setProfil(userNomade.getProfil());
		userService.updateUserNomade(userNomade2);	
		String message ="vos modifications on ete pris en compte..";
		return "redirect:/users/private/profil?message="+message;
		
	}
	
	@RequestMapping("/compte")
    public String compte(UserNomade userNomade, Model uiModel, HttpServletRequest httpServletRequest
    		) {
		UserNomade userNomade2 = securite.getUserNomade();
		if(!ValideEmailUtil.isValid(userNomade.getCompte().getEmail())){
			String message ="adresse email invalid";
			return "redirect:/users/private/compte?message="+message;
		}
		List<UserNomade> findByEmail = userService.findByEmail(userNomade.getCompte().getEmail());
		if(findByEmail!=null && findByEmail.size()>0 && !findByEmail.get(0).getCompte().getEmail().equals(userNomade2.getCompte().getEmail())){
				String message ="email deja utilise";
				return "redirect:/users/private/compte?message="+message;
		}else{
			
			userNomade2.setCompte(userNomade.getCompte());
			userService.updateUserNomade(userNomade2);
			String message ="vos modifications on ete pris en compte..";
			return "redirect:/users/private/compte?message="+message;
		}	
		
	}
	
	@RequestMapping(value="/vehicule", method = RequestMethod.POST)
    public String vehicule(UserNomade userNomade, Model uiModel, HttpServletRequest httpServletRequest,
    		@RequestParam(value="photo", required=false)  MultipartFile photo) {
		 
		UserNomade userNomade2 = securite.getUserNomade();
		
		
		try {
			if(!photo.isEmpty()) {
				//validateImage(photo);
				ImageUtil.saveImage(userNomade2.getId() + "vehicule.jpg", photo); 
				userNomade.getVehicule().setPhoto(userNomade2.getId() + "vehicule.jpg");
			}
			} catch (ImageUploadException e) {
				
				userNomade2.setVehicule(userNomade.getVehicule());
				userService.updateUserNomade(userNomade2);
				String message =e.getMessage();
				return "redirect:/users/private/vehicule?message="+message;
			}
			
		userNomade2.setVehicule(userNomade.getVehicule());
		userService.updateUserNomade(userNomade2);
		String message ="vos modifications on ete pris en compte..";
		return "redirect:/users/private/vehicule?message="+message;
		
	}
	
	
	
	
	
	
	void addDateTimeFormatPatterns(Model uiModel) {
        uiModel.addAttribute("userNomade_accountexpiration_date_format", "dd-MM-yyyy HH:mm");
        uiModel.addAttribute("userNomade_credentialexpiration_date_format", "dd-MM-yyyy HH:mm");
    }
		
	 void populateEditForm(Model uiModel, UserNomade userNomade) {
	        uiModel.addAttribute("userNomade", userNomade);
	        addDateTimeFormatPatterns(uiModel);
	        uiModel.addAttribute("countrys", Arrays.asList(Country.values()));
	        uiModel.addAttribute("langues", Arrays.asList(Langue.values()));
	    }
	 
	 @ModelAttribute("countrys")
	    public Collection<Country> populateCountrys() {
	        return Arrays.asList(Country.values());
	    }
	 @ModelAttribute("vehiculeTypes")
	    public Collection<VehiculeType> vehiculeTypes() {
	        return Arrays.asList(VehiculeType.values());
	    }
	 @ModelAttribute("vehiculeStates")
	    public Collection<VehiculeState> vehiculeStates() {
	        return Arrays.asList(VehiculeState.values());
	    }
	 @ModelAttribute("nationalitys")
	    public Collection<Nationality> nationality() {
	        return Arrays.asList(Nationality.values());
	    }
	 @ModelAttribute("lan")
	    public Collection<Langue> populateLangue() {
	        return Arrays.asList(Langue.values());
	    }
	 @ModelAttribute("genders")
	    public Collection<Gender> genders() {
	        return Arrays.asList(Gender.values());
	    }
	 @ModelAttribute("confidentialitys")
	    public Collection<Confidentiality> confidentialitys() {
	        return Arrays.asList(Confidentiality.values());
	    }
}
