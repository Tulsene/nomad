// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.nomade.service;

import com.nomade.domain.DangerPratique;
import com.nomade.service.DangerPratiqueService;
import java.math.BigInteger;
import java.util.List;

privileged aspect DangerPratiqueService_Roo_Service {
    
    public abstract long DangerPratiqueService.countAllDangerPratiques();    
    public abstract void DangerPratiqueService.deleteDangerPratique(DangerPratique dangerPratique);    
    public abstract DangerPratique DangerPratiqueService.findDangerPratique(BigInteger id);    
    public abstract List<DangerPratique> DangerPratiqueService.findAllDangerPratiques();    
    public abstract List<DangerPratique> DangerPratiqueService.findDangerPratiqueEntries(int firstResult, int maxResults);    
    public abstract void DangerPratiqueService.saveDangerPratique(DangerPratique dangerPratique);    
    public abstract DangerPratique DangerPratiqueService.updateDangerPratique(DangerPratique dangerPratique);    
}
