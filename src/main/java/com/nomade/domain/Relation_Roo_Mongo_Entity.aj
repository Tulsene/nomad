// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.nomade.domain;

import com.nomade.domain.Relation;
import java.math.BigInteger;
import org.springframework.data.annotation.Id;
import org.springframework.data.annotation.Persistent;

privileged aspect Relation_Roo_Mongo_Entity {
    
    declare @type: Relation: @Persistent;
    
    @Id
    private BigInteger Relation.id;
    
    public BigInteger Relation.getId() {
        return this.id;
    }
    
    public void Relation.setId(BigInteger id) {
        this.id = id;
    }
    
}