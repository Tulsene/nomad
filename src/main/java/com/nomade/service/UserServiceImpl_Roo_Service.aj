// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.nomade.service;

import com.nomade.domain.UserNomade;
import com.nomade.repository.UserRepository;
import com.nomade.service.UserServiceImpl;
import java.math.BigInteger;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

privileged aspect UserServiceImpl_Roo_Service {
    
    declare @type: UserServiceImpl: @Service;
    
    declare @type: UserServiceImpl: @Transactional;
    
    @Autowired
    UserRepository UserServiceImpl.userRepository;
    
    public long UserServiceImpl.countAllUserNomades() {
        return userRepository.count();
    }
    
    public void UserServiceImpl.deleteUserNomade(UserNomade userNomade) {
        userRepository.delete(userNomade);
    }
    
    public UserNomade UserServiceImpl.findUserNomade(BigInteger id) {
        return userRepository.findOne(id);
    }
    
    public List<UserNomade> UserServiceImpl.findAllUserNomades() {
        return userRepository.findAll();
    }
    
    public List<UserNomade> UserServiceImpl.findUserNomadeEntries(int firstResult, int maxResults) {
        return userRepository.findAll(new org.springframework.data.domain.PageRequest(firstResult / maxResults, maxResults)).getContent();
    }
    
    public void UserServiceImpl.saveUserNomade(UserNomade userNomade) {
        userRepository.save(userNomade);
    }
    
    public UserNomade UserServiceImpl.updateUserNomade(UserNomade userNomade) {
        return userRepository.save(userNomade);
    }
    
}
