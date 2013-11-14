// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.nomade.web;

import com.nomade.domain.Album;
import com.nomade.service.AlbumService;
import com.nomade.web.AlbumController;
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

privileged aspect AlbumController_Roo_Controller {
    
    @Autowired
    AlbumService AlbumController.albumService;
    
    @RequestMapping(params = "form", produces = "text/html")
    public String AlbumController.createForm(Model uiModel) {
        populateEditForm(uiModel, new Album());
        return "albums/create";
    }
    
    @RequestMapping(value = "/{id}", produces = "text/html")
    public String AlbumController.show(@PathVariable("id") BigInteger id, Model uiModel) {
        addDateTimeFormatPatterns(uiModel);
        uiModel.addAttribute("album", albumService.findAlbum(id));
        uiModel.addAttribute("itemId", id);
        return "albums/show";
    }
    
    @RequestMapping(produces = "text/html")
    public String AlbumController.list(@RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size, Model uiModel) {
        if (page != null || size != null) {
            int sizeNo = size == null ? 10 : size.intValue();
            final int firstResult = page == null ? 0 : (page.intValue() - 1) * sizeNo;
            uiModel.addAttribute("albums", albumService.findAlbumEntries(firstResult, sizeNo));
            float nrOfPages = (float) albumService.countAllAlbums() / sizeNo;
            uiModel.addAttribute("maxPages", (int) ((nrOfPages > (int) nrOfPages || nrOfPages == 0.0) ? nrOfPages + 1 : nrOfPages));
        } else {
            uiModel.addAttribute("albums", albumService.findAllAlbums());
        }
        addDateTimeFormatPatterns(uiModel);
        return "albums/list";
    }
    
    @RequestMapping(method = RequestMethod.PUT, produces = "text/html")
    public String AlbumController.update(@Valid Album album, BindingResult bindingResult, Model uiModel, HttpServletRequest httpServletRequest) {
        if (bindingResult.hasErrors()) {
            populateEditForm(uiModel, album);
            return "albums/update";
        }
        uiModel.asMap().clear();
        albumService.updateAlbum(album);
        return "redirect:/albums/" + encodeUrlPathSegment(album.getId().toString(), httpServletRequest);
    }
    
    @RequestMapping(value = "/{id}", params = "form", produces = "text/html")
    public String AlbumController.updateForm(@PathVariable("id") BigInteger id, Model uiModel) {
        populateEditForm(uiModel, albumService.findAlbum(id));
        return "albums/update";
    }
    
    void AlbumController.addDateTimeFormatPatterns(Model uiModel) {
        uiModel.addAttribute("album_created_date_format", "dd-MM-yyyy HH:mm");
    }
    
    void AlbumController.populateEditForm(Model uiModel, Album album) {
        uiModel.addAttribute("album", album);
        addDateTimeFormatPatterns(uiModel);
    }
    
    String AlbumController.encodeUrlPathSegment(String pathSegment, HttpServletRequest httpServletRequest) {
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
