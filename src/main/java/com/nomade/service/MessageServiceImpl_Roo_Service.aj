// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.nomade.service;

import com.nomade.domain.Message;
import com.nomade.repository.MessageRepository;
import com.nomade.service.MessageServiceImpl;
import java.math.BigInteger;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

privileged aspect MessageServiceImpl_Roo_Service {
    
    declare @type: MessageServiceImpl: @Service;
    
    declare @type: MessageServiceImpl: @Transactional;
    
    @Autowired
    MessageRepository MessageServiceImpl.messageRepository;
    
    public long MessageServiceImpl.countAllMessages() {
        return messageRepository.count();
    }
    
    public void MessageServiceImpl.deleteMessage(Message message) {
        messageRepository.delete(message);
    }
    
    public Message MessageServiceImpl.findMessage(BigInteger id) {
        return messageRepository.findOne(id);
    }
    
    public List<Message> MessageServiceImpl.findAllMessages() {
        return messageRepository.findAll();
    }
    
    public List<Message> MessageServiceImpl.findMessageEntries(int firstResult, int maxResults) {
        return messageRepository.findAll(new org.springframework.data.domain.PageRequest(firstResult / maxResults, maxResults)).getContent();
    }
    
    public void MessageServiceImpl.saveMessage(Message message) {
        messageRepository.save(message);
    }
    
    public Message MessageServiceImpl.updateMessage(Message message) {
        return messageRepository.save(message);
    }
    
}
