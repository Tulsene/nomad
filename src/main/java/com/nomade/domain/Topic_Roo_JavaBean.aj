// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.nomade.domain;

import com.nomade.domain.Confidentiality;
import com.nomade.domain.SubTopic;
import com.nomade.domain.Topic;
import com.nomade.domain.UserNomade;
import java.util.Date;
import java.util.Set;

privileged aspect Topic_Roo_JavaBean {
    
    public String Topic.getTitle() {
        return this.title;
    }
    
    public void Topic.setTitle(String title) {
        this.title = title;
    }
    
    public String Topic.getContent() {
        return this.content;
    }
    
    public void Topic.setContent(String content) {
        this.content = content;
    }
    
    public Confidentiality Topic.getConfidentiality() {
        return this.confidentiality;
    }
    
    public void Topic.setConfidentiality(Confidentiality confidentiality) {
        this.confidentiality = confidentiality;
    }
    
    public UserNomade Topic.getNomade() {
        return this.nomade;
    }
    
    public void Topic.setNomade(UserNomade nomade) {
        this.nomade = nomade;
    }
    
    public Date Topic.getCreated() {
        return this.created;
    }
    
    public void Topic.setCreated(Date created) {
        this.created = created;
    }
    
    public Set<SubTopic> Topic.getSubTopics() {
        return this.subTopics;
    }
    
    public void Topic.setSubTopics(Set<SubTopic> subTopics) {
        this.subTopics = subTopics;
    }
    
    public Boolean Topic.getFrozen() {
        return this.frozen;
    }
    
    public void Topic.setFrozen(Boolean frozen) {
        this.frozen = frozen;
    }
    
}
