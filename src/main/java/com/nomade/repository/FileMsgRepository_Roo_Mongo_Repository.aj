// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.nomade.repository;

import com.nomade.domain.FileMsg;
import com.nomade.repository.FileMsgRepository;
import java.math.BigInteger;
import org.springframework.data.repository.PagingAndSortingRepository;
import org.springframework.stereotype.Repository;

privileged aspect FileMsgRepository_Roo_Mongo_Repository {
    
    declare parents: FileMsgRepository extends PagingAndSortingRepository<FileMsg, BigInteger>;
    
    declare @type: FileMsgRepository: @Repository;
    
}