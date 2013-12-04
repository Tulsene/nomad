// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.nomade.web;

import com.nomade.domain.DangerPratique;
import com.nomade.service.DangerPratiqueService;
import com.nomade.service.UserService;
import com.nomade.web.DangerPratiqueController;
import java.io.UnsupportedEncodingException;
import java.math.BigInteger;
import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.util.UriUtils;
import org.springframework.web.util.WebUtils;

privileged aspect DangerPratiqueController_Roo_Controller {
    
    @Autowired
    DangerPratiqueService DangerPratiqueController.dangerPratiqueService;
    
    @Autowired
    UserService DangerPratiqueController.userService;
    
    @RequestMapping(method = RequestMethod.POST, produces = "text/html")
    public String DangerPratiqueController.create(@Valid DangerPratique dangerPratique, BindingResult bindingResult, Model uiModel, HttpServletRequest httpServletRequest) {
        if (bindingResult.hasErrors()) {
            populateEditForm(uiModel, dangerPratique);
            return "dangerpratiques/create";
        }
        uiModel.asMap().clear();
        dangerPratiqueService.saveDangerPratique(dangerPratique);
        return "redirect:/dangerpratiques/" + encodeUrlPathSegment(dangerPratique.getId().toString(), httpServletRequest);
    }
    
    @RequestMapping(params = "form", produces = "text/html")
    public String DangerPratiqueController.createForm(Model uiModel) {
        populateEditForm(uiModel, new DangerPratique());
        return "dangerpratiques/create";
    }
    
    @RequestMapping(value = "/{id}", produces = "text/html")
    public String DangerPratiqueController.show(@PathVariable("id") BigInteger id, Model uiModel) {
        addDateTimeFormatPatterns(uiModel);
        uiModel.addAttribute("dangerpratique", dangerPratiqueService.findDangerPratique(id));
        uiModel.addAttribute("itemId", id);
        return "dangerpratiques/show";
    }
    
    @RequestMapping(produces = "text/html")
    public String DangerPratiqueController.list(@RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size, Model uiModel) {
        if (page != null || size != null) {
            int sizeNo = size == null ? 10 : size.intValue();
            final int firstResult = page == null ? 0 : (page.intValue() - 1) * sizeNo;
            uiModel.addAttribute("dangerpratiques", dangerPratiqueService.findDangerPratiqueEntries(firstResult, sizeNo));
            float nrOfPages = (float) dangerPratiqueService.countAllDangerPratiques() / sizeNo;
            uiModel.addAttribute("maxPages", (int) ((nrOfPages > (int) nrOfPages || nrOfPages == 0.0) ? nrOfPages + 1 : nrOfPages));
        } else {
            uiModel.addAttribute("dangerpratiques", dangerPratiqueService.findAllDangerPratiques());
        }
        addDateTimeFormatPatterns(uiModel);
        return "dangerpratiques/list";
    }
    
    @RequestMapping(method = RequestMethod.PUT, produces = "text/html")
    public String DangerPratiqueController.update(@Valid DangerPratique dangerPratique, BindingResult bindingResult, Model uiModel, HttpServletRequest httpServletRequest) {
        if (bindingResult.hasErrors()) {
            populateEditForm(uiModel, dangerPratique);
            return "dangerpratiques/update";
        }
        uiModel.asMap().clear();
        dangerPratiqueService.updateDangerPratique(dangerPratique);
        return "redirect:/dangerpratiques/" + encodeUrlPathSegment(dangerPratique.getId().toString(), httpServletRequest);
    }
    
    @RequestMapping(value = "/{id}", params = "form", produces = "text/html")
    public String DangerPratiqueController.updateForm(@PathVariable("id") BigInteger id, Model uiModel) {
        populateEditForm(uiModel, dangerPratiqueService.findDangerPratique(id));
        return "dangerpratiques/update";
    }
    
    @RequestMapping(value = "/{id}", method = RequestMethod.DELETE, produces = "text/html")
    public String DangerPratiqueController.delete(@PathVariable("id") BigInteger id, @RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size, Model uiModel) {
        DangerPratique dangerPratique = dangerPratiqueService.findDangerPratique(id);
        dangerPratiqueService.deleteDangerPratique(dangerPratique);
        uiModel.asMap().clear();
        uiModel.addAttribute("page", (page == null) ? "1" : page.toString());
        uiModel.addAttribute("size", (size == null) ? "10" : size.toString());
        return "redirect:/dangerpratiques";
    }
    
    void DangerPratiqueController.addDateTimeFormatPatterns(Model uiModel) {
        uiModel.addAttribute("dangerPratique_created_date_format", "dd-MM-yyyy");
    }
    
    void DangerPratiqueController.populateEditForm(Model uiModel, DangerPratique dangerPratique) {
        uiModel.addAttribute("dangerPratique", dangerPratique);
        addDateTimeFormatPatterns(uiModel);
        uiModel.addAttribute("usernomades", userService.findAllUserNomades());
    }
    
    String DangerPratiqueController.encodeUrlPathSegment(String pathSegment, HttpServletRequest httpServletRequest) {
        String enc = httpServletRequest.getCharacterEncoding();
        if (enc == null) {
            enc = WebUtils.DEFAULT_CHARACTER_ENCODING;
        }
        try {
            pathSegment = UriUtils.encodePathSegment(pathSegment, enc);
        } catch (UnsupportedEncodingException uee) {}
        return pathSegment;
    }
    
}
