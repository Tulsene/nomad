// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.nomade.domain;

import com.nomade.domain.Comment;
import com.nomade.domain.DangerPratique;
import com.nomade.domain.UserNomade;
import java.util.Date;
import java.util.List;

privileged aspect DangerPratique_Roo_JavaBean {
    
    public String DangerPratique.getTitle() {
        return this.title;
    }
    
    public void DangerPratique.setTitle(String title) {
        this.title = title;
    }
    
    public String DangerPratique.getSelecteur() {
        return this.selecteur;
    }
    
    public void DangerPratique.setSelecteur(String selecteur) {
        this.selecteur = selecteur;
    }
    
    public String DangerPratique.getSelecteur1() {
        return this.selecteur1;
    }
    
    public void DangerPratique.setSelecteur1(String selecteur1) {
        this.selecteur1 = selecteur1;
    }
    
    public String DangerPratique.getLocation() {
        return this.location;
    }
    
    public void DangerPratique.setLocation(String location) {
        this.location = location;
    }
    
    public double DangerPratique.getLocationLat() {
        return this.locationLat;
    }
    
    public void DangerPratique.setLocationLat(double locationLat) {
        this.locationLat = locationLat;
    }
    
    public double DangerPratique.getLocationLng() {
        return this.locationLng;
    }
    
    public void DangerPratique.setLocationLng(double locationLng) {
        this.locationLng = locationLng;
    }
    
    public double[] DangerPratique.getGeoLocation() {
        return this.geoLocation;
    }
    
    public void DangerPratique.setGeoLocation(double[] geoLocation) {
        this.geoLocation = geoLocation;
    }
    
    public String DangerPratique.getPhoto() {
        return this.photo;
    }
    
    public void DangerPratique.setPhoto(String photo) {
        this.photo = photo;
    }
    
    public int DangerPratique.getDure() {
        return this.dure;
    }
    
    public void DangerPratique.setDure(int dure) {
        this.dure = dure;
    }
    
    public boolean DangerPratique.isInfoVerif() {
        return this.infoVerif;
    }
    
    public void DangerPratique.setInfoVerif(boolean infoVerif) {
        this.infoVerif = infoVerif;
    }
    
    public int DangerPratique.getEstimationValidite() {
        return this.estimationValidite;
    }
    
    public void DangerPratique.setEstimationValidite(int estimationValidite) {
        this.estimationValidite = estimationValidite;
    }
    
    public String DangerPratique.getComment() {
        return this.comment;
    }
    
    public void DangerPratique.setComment(String comment) {
        this.comment = comment;
    }
    
    public int DangerPratique.getVotePositif() {
        return this.votePositif;
    }
    
    public void DangerPratique.setVotePositif(int votePositif) {
        this.votePositif = votePositif;
    }
    
    public int DangerPratique.getVoteNegatif() {
        return this.voteNegatif;
    }
    
    public void DangerPratique.setVoteNegatif(int voteNegatif) {
        this.voteNegatif = voteNegatif;
    }
    
    public Date DangerPratique.getCreated() {
        return this.created;
    }
    
    public void DangerPratique.setCreated(Date created) {
        this.created = created;
    }
    
    public List<Comment> DangerPratique.getComments() {
        return this.comments;
    }
    
    public void DangerPratique.setComments(List<Comment> comments) {
        this.comments = comments;
    }
    
    public UserNomade DangerPratique.getNomade() {
        return this.nomade;
    }
    
    public void DangerPratique.setNomade(UserNomade nomade) {
        this.nomade = nomade;
    }
    
}
