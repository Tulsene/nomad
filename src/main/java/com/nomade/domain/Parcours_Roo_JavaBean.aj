// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.nomade.domain;

import com.nomade.domain.Parcours;
import com.nomade.domain.UserNomade;
import java.util.Date;

privileged aspect Parcours_Roo_JavaBean {
    
    public String Parcours.getStartAdress() {
        return this.startAdress;
    }
    
    public void Parcours.setStartAdress(String startAdress) {
        this.startAdress = startAdress;
    }
    
    public String Parcours.getEndAdress() {
        return this.endAdress;
    }
    
    public void Parcours.setEndAdress(String endAdress) {
        this.endAdress = endAdress;
    }
    
    public double[] Parcours.getStart() {
        return this.start;
    }
    
    public void Parcours.setStart(double[] start) {
        this.start = start;
    }
    
    public double[] Parcours.getEnd() {
        return this.end;
    }
    
    public void Parcours.setEnd(double[] end) {
        this.end = end;
    }
    
    public Date Parcours.getCreated() {
        return this.created;
    }
    
    public void Parcours.setCreated(Date created) {
        this.created = created;
    }
    
    public UserNomade Parcours.getNomad() {
        return this.nomad;
    }
    
    public void Parcours.setNomad(UserNomade nomad) {
        this.nomad = nomad;
    }
    
}