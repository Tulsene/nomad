// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.nomade.domain;

import com.nomade.domain.Confidentiality;
import com.nomade.domain.SubTopic;
import com.nomade.domain.Topic;
import com.nomade.domain.UserNomade;
import java.util.Date;

privileged aspect SubTopic_Roo_JavaBean {
    
    public String SubTopic.getTitle() {
        return this.title;
    }
    
    public void SubTopic.setTitle(String title) {
        this.title = title;
    }
    
    public String SubTopic.getContent() {
        return this.content;
    }
    
    public void SubTopic.setContent(String content) {
        this.content = content;
    }
    
    public Confidentiality SubTopic.getConfidentiality() {
        return this.confidentiality;
    }
    
    public void SubTopic.setConfidentiality(Confidentiality confidentiality) {
        this.confidentiality = confidentiality;
    }
    
    public UserNomade SubTopic.getNomade() {
        return this.nomade;
    }
    
    public void SubTopic.setNomade(UserNomade nomade) {
        this.nomade = nomade;
    }
    
    public Date SubTopic.getCreated() {
        return this.created;
    }
    
    public void SubTopic.setCreated(Date created) {
        this.created = created;
    }
    
    public Topic SubTopic.getParentTopic() {
        return this.parentTopic;
    }
    
    public void SubTopic.setParentTopic(Topic parentTopic) {
        this.parentTopic = parentTopic;
    }
    
    public SubTopic SubTopic.getParentSubTopic() {
        return this.parentSubTopic;
    }
    
    public void SubTopic.setParentSubTopic(SubTopic parentSubTopic) {
        this.parentSubTopic = parentSubTopic;
    }
    
    public Boolean SubTopic.getFrozen() {
        return this.frozen;
    }
    
    public void SubTopic.setFrozen(Boolean frozen) {
        this.frozen = frozen;
    }
    
}
