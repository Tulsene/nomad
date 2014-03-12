// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.nomade.service;

import com.nomade.domain.Topic;
import com.nomade.service.TopicService;
import java.math.BigInteger;
import java.util.List;

privileged aspect TopicService_Roo_Service {
    
    public abstract long TopicService.countAllTopics();    
    public abstract void TopicService.deleteTopic(Topic topic);    
    public abstract Topic TopicService.findTopic(BigInteger id);    
    public abstract List<Topic> TopicService.findAllTopics();    
    public abstract List<Topic> TopicService.findTopicEntries(int firstResult, int maxResults);    
    public abstract void TopicService.saveTopic(Topic topic);    
    public abstract Topic TopicService.updateTopic(Topic topic);    
}