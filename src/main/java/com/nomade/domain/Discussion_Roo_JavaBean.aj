// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.nomade.domain;

import com.nomade.domain.Comment;
import com.nomade.domain.Confidentiality;
import com.nomade.domain.Discussion;
import com.nomade.domain.SubTopic;
import com.nomade.domain.UserNomade;
import java.util.Date;
import java.util.Set;

privileged aspect Discussion_Roo_JavaBean {
    
    public String Discussion.getTitle() {
        return this.title;
    }
    
    public void Discussion.setTitle(String title) {
        this.title = title;
    }
    
    public String Discussion.getContent() {
        return this.content;
    }
    
    public void Discussion.setContent(String content) {
        this.content = content;
    }
    
    public Set<Comment> Discussion.getComments() {
        return this.comments;
    }
    
    public void Discussion.setComments(Set<Comment> comments) {
        this.comments = comments;
    }
    
    public UserNomade Discussion.getNomade() {
        return this.nomade;
    }
    
    public void Discussion.setNomade(UserNomade nomade) {
        this.nomade = nomade;
    }
    
    public Confidentiality Discussion.getConfidentiality() {
        return this.confidentiality;
    }
    
    public void Discussion.setConfidentiality(Confidentiality confidentiality) {
        this.confidentiality = confidentiality;
    }
    
    public Date Discussion.getCreated() {
        return this.created;
    }
    
    public void Discussion.setCreated(Date created) {
        this.created = created;
    }
    
    public SubTopic Discussion.getSubTopic() {
        return this.subTopic;
    }
    
    public void Discussion.setSubTopic(SubTopic subTopic) {
        this.subTopic = subTopic;
    }
    
    public Boolean Discussion.getFrozen() {
        return this.frozen;
    }
    
    public void Discussion.setFrozen(Boolean frozen) {
        this.frozen = frozen;
    }
    
}
