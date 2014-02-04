package com.nomade.tools;

import java.util.ArrayList;
import java.util.Collection;
import java.util.Date;
import java.util.HashSet;
import java.util.List;

import com.nomade.domain.Confidentiality;
import com.nomade.domain.Discussion;
import com.nomade.domain.SubTopic;
import com.nomade.domain.Topic;
import com.nomade.domain.UserNomade;

public class SubTopicBuilder {
	private List<SubTopic> subTopics = new ArrayList<SubTopic>();
	
	private SubTopicBuilder (){
		
	}
	/**
	 * Create an instance of a subtopic builder.
	 * @return {@link SubTopicBuilder SubTopicBuilder}
	 */
	public static SubTopicBuilder get(){
		return new SubTopicBuilder();
	}
	
	/**
	 * <p>Create a subtopic and add it to the list subtopics.</p>
	 * @param title
	 * @param content
	 * @param confidentiality
	 * @param nomade
	 * @param parentTopic
	 * @param discussions
	 * @return {@link SubTopicBuilder SubTopicBuilder}
	 */
	public SubTopicBuilder addSubTopic(String title,String content, Confidentiality confidentiality,UserNomade nomade, Topic parentTopic, Collection<Discussion> discussions){
		SubTopic subTopic = new SubTopic();
		subTopic.setConfidentiality(confidentiality);
		subTopic.setContent(content);
		subTopic.setCreated(new Date());
		subTopic.setDiscussions(new HashSet<Discussion>(discussions));
		subTopic.setNomade(nomade);
		subTopic.setParentTopic(parentTopic);
		subTopics.add(subTopic);
		return this;
	}
}
