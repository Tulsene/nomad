// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.nomade.domain;

import com.nomade.domain.InfoPratique;
import java.math.BigInteger;
import org.springframework.data.annotation.Id;
import org.springframework.data.annotation.Persistent;

privileged aspect InfoPratique_Roo_Mongo_Entity {
    
    declare @type: InfoPratique: @Persistent;
    
    @Id
    private BigInteger InfoPratique.id;
    
    public BigInteger InfoPratique.getId() {
        return this.id;
    }
    
    public void InfoPratique.setId(BigInteger id) {
        this.id = id;
    }
    
}
