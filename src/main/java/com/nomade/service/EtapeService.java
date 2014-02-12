package com.nomade.service;

import java.util.List;

import org.springframework.roo.addon.layers.service.RooService;

import com.nomade.domain.Etape;
import com.nomade.domain.UserNomade;

@RooService(domainTypes = { com.nomade.domain.Etape.class })
public interface EtapeService {
	
	public Etape lastEtape(UserNomade nomad);
	public String buildMakers(List<UserNomade> nomads);
	public List<Etape> drawParcours(UserNomade nomad);
}