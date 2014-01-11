// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.nomade.service;

import com.nomade.domain.Parcours;
import com.nomade.repository.ParcoursRepository;
import com.nomade.service.ParcoursServiceImpl;
import java.math.BigInteger;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

privileged aspect ParcoursServiceImpl_Roo_Service {
    
    declare @type: ParcoursServiceImpl: @Service;
    
    declare @type: ParcoursServiceImpl: @Transactional;
    
    @Autowired
    ParcoursRepository ParcoursServiceImpl.parcoursRepository;
    
    public long ParcoursServiceImpl.countAllParcourses() {
        return parcoursRepository.count();
    }
    
    public void ParcoursServiceImpl.deleteParcours(Parcours parcours) {
        parcoursRepository.delete(parcours);
    }
    
    public Parcours ParcoursServiceImpl.findParcours(BigInteger id) {
        return parcoursRepository.findOne(id);
    }
    
    public List<Parcours> ParcoursServiceImpl.findAllParcourses() {
        return parcoursRepository.findAll();
    }
    
    public List<Parcours> ParcoursServiceImpl.findParcoursEntries(int firstResult, int maxResults) {
        return parcoursRepository.findAll(new org.springframework.data.domain.PageRequest(firstResult / maxResults, maxResults)).getContent();
    }
    
    public void ParcoursServiceImpl.saveParcours(Parcours parcours) {
        parcoursRepository.save(parcours);
    }
    
    public Parcours ParcoursServiceImpl.updateParcours(Parcours parcours) {
        return parcoursRepository.save(parcours);
    }
    
}
