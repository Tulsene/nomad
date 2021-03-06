package com.nomade.service;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;


import com.nomade.domain.Etape;
import com.nomade.domain.Marker;
import com.nomade.domain.UserNomade;

public class EtapeServiceImpl implements EtapeService {
	
	public List<Etape> findByCode(String code){
		
		return findByCode(code);
	}
	
	public Etape lastEtape(UserNomade nomad) {
		List<Etape> findByNomadOrderByDay = null;
		
		Etape etape=null;
		if(findByNomadOrderByDay!=null && findByNomadOrderByDay.size()>0){
			etape = findByNomadOrderByDay.get(0);
		}
		
		return etape;
	}
	
private String linkBase(HttpServletRequest httpServletRequest){
		
		StringBuilder stringBuilder = new StringBuilder()
		.append("http://")
		.append(httpServletRequest.getServerName())
		.append(":").append(httpServletRequest.getServerPort())
		.append("/resources/img")
		.append("/mapicon/veh");
		
		return stringBuilder.toString();
		
	}

	public String buildMakers(List<UserNomade> nomads, HttpServletRequest httpServletRequest) {
		
		String linkBase = linkBase(httpServletRequest);
		List<Marker> listMarkers = new ArrayList<Marker>();
		Marker mark = null;
		for(UserNomade nomad:nomads){
			Etape lastEtape = lastEtape(nomad);
			if(lastEtape!=null){
				double[] latLng = {lastEtape.getLat(), lastEtape.getLng()};
				 mark = new Marker(latLng, nomad.toString());
		
				mark.setTag("nomad");
				mark.setId(nomad.getId().toString());
				String icon = linkBase+"/"+nomad.getVehicule().getIcon();
				mark.getOptions().setIcon(icon);
				//mark.getOptions().setIcon("http://maps.google.com/mapfiles/marker_whiteN.png");
				listMarkers.add(mark);
			}
			
		}
		return Marker.toJsonArray(listMarkers);
	}
	
	
}
