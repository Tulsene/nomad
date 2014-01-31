package com.nomade.domain;

import java.util.Date;

import javax.persistence.Temporal;
import javax.persistence.TemporalType;

import org.springframework.data.mongodb.core.mapping.DBRef;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.roo.addon.javabean.RooJavaBean;
import org.springframework.roo.addon.json.RooJson;
import org.springframework.roo.addon.layers.repository.mongo.RooMongoEntity;
import org.springframework.roo.addon.tostring.RooToString;

@RooJavaBean
@RooToString
@RooMongoEntity
@RooJson
public class Parcours {
	
	private String startAdress;
	
	private String endAdress;
	
	private double[] start;

	private double[] end;

	@Temporal(TemporalType.TIMESTAMP)
	@DateTimeFormat(pattern = "dd-MM-yyyy HH:mm")
	private Date created = new Date();
	
	@DBRef
	private UserNomade nomad;

	public Parcours(double[] start, double[] end) {
		super();
		this.start = start;
		this.end = end;
	}

	public Parcours() {
		super();
	}
	


}
