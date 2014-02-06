package com.nomade.web;

import java.math.BigInteger;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.roo.addon.web.mvc.controller.scaffold.RooWebScaffold;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.nomade.domain.BeanHistorique;
import com.nomade.domain.DangerPratique;
import com.nomade.domain.EtapeVehicule;
import com.nomade.domain.EtapeVoyage;
import com.nomade.domain.InfoPratique;
import com.nomade.domain.UserNomade;
import com.nomade.security.Security;
import com.nomade.service.EtapeVehiculeService;
import com.nomade.service.EtapeVoyageService;
import com.nomade.service.InfoPratiqueService;

@RequestMapping("/dangerpratiques")
@Controller
@RooWebScaffold(path = "dangerpratiques", formBackingObject = DangerPratique.class)
public class DangerPratiqueController {
	
	@Autowired
	Security securite ;
	@Autowired
	EtapeVoyageService voyageService;
	@Autowired
	EtapeVehiculeService vehiculeService;
	@Autowired
	InfoPratiqueService infoPratiqueService;
	
	
	private void beanHistoriqueDecoration(Model uiModel, UserNomade nomade) {
		Page<EtapeVoyage> listEtapeVoy = voyageService.findByNomade(
				nomade, 0);
		Page<EtapeVehicule> listEtapeVeh = vehiculeService.findByNomade(
				nomade, 0);
		Page<DangerPratique> listDanger = dangerPratiqueService.findByNomade(nomade, 0);
		Page<InfoPratique> listInfo = infoPratiqueService.findByNomade(nomade, 0);
		
		BeanHistorique beanHistorique = new BeanHistorique();
		beanHistorique.setListEtapeVoy(listEtapeVoy);
		beanHistorique.setListEtapeVeh(listEtapeVeh);
		beanHistorique.setListDanger(listDanger);
		beanHistorique.setListInfo(listInfo);
		beanHistorique.setNomade(nomade);
		uiModel.addAttribute("beanHistorique", beanHistorique);
	}


    @RequestMapping("/save")
    public String save(DangerPratique dangerPratique,  Model uiModel, HttpServletRequest request) {
    	
    	UserNomade userNomade = securite.getUserNomade(); 
    	
    	double[] location = new double[]{dangerPratique.getLocationLng(), dangerPratique.getLocationLat()};
    	dangerPratique.setGeoLocation(location);
    	dangerPratique.setNomade(userNomade);
    	dangerPratiqueService.saveDangerPratique(dangerPratique);
    	beanHistoriqueDecoration(uiModel,userNomade);
    	uiModel.addAttribute("dangerPratique", new DangerPratique());
    	uiModel.addAttribute("saveInfoDanger", "saveInfoDanger");
    	return "public/danger";
    }
    
    @RequestMapping(value = "votePlus/{idInfo}")
	@ResponseBody
	public String votePositif(@PathVariable("idInfo") String idInfo, Model uiModel) {
    	BigInteger bigInteger = new BigInteger(idInfo);
 
    	DangerPratique dangerPratique = dangerPratiqueService.findDangerPratique(bigInteger);
    	dangerPratique.incrementVotePositif();
    	dangerPratiqueService.updateDangerPratique(dangerPratique);
    	return ""+dangerPratique.getVotePositif();
    }
    
    @RequestMapping(value = "voteMinus/{idInfo}")
   	@ResponseBody
   	public String voteMinus(@PathVariable("idInfo") String idInfo, Model uiModel) {
       	BigInteger bigInteger = new BigInteger(idInfo);
       	DangerPratique dangerPratique = dangerPratiqueService.findDangerPratique(bigInteger);
    	dangerPratique.incrementVoteNegatif();;
    	dangerPratiqueService.updateDangerPratique(dangerPratique);
    	return ""+dangerPratique.getVoteNegatif();
       }
    
    @RequestMapping(value = "detail/{idInfo}")
   	public String detail(@PathVariable("idInfo") String idInfo, Model uiModel) {
       	BigInteger bigInteger = new BigInteger(idInfo);
    
       	DangerPratique dangerPratique = dangerPratiqueService.findDangerPratique(bigInteger);
       	uiModel.addAttribute("dangerPratique", dangerPratique);
       	return "public/dangerDetail";
       }
    
    @RequestMapping("/dangerSuiv/{id}/{page}")
	public String nomad(@PathVariable("id")String id, @PathVariable("page")int page ,HttpServletRequest request, Model uiModel) {
		UserNomade nomade = userService.findUserNomade(new BigInteger(id)); 
		Page<DangerPratique> listDanger = dangerPratiqueService.findByNomade(
				nomade, page);
		BeanHistorique beanHistorique = new BeanHistorique();
		beanHistorique.setListDanger(listDanger);
		beanHistorique.setNomade(nomade);
		uiModel.addAttribute("beanHistorique", beanHistorique);
		return "public/nomad";
	}
}
