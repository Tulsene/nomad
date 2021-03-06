// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.nomade.service;

import com.nomade.domain.Parcours;
import com.nomade.service.ParcoursService;
import java.math.BigInteger;
import java.util.List;

privileged aspect ParcoursService_Roo_Service {
    
    public abstract long ParcoursService.countAllParcourses();    
    public abstract void ParcoursService.deleteParcours(Parcours parcours);    
    public abstract Parcours ParcoursService.findParcours(BigInteger id);    
    public abstract List<Parcours> ParcoursService.findAllParcourses();    
    public abstract List<Parcours> ParcoursService.findParcoursEntries(int firstResult, int maxResults);    
    public abstract void ParcoursService.saveParcours(Parcours parcours);    
    public abstract Parcours ParcoursService.updateParcours(Parcours parcours);    
}
