package com.nomade.domain;
import org.springframework.roo.addon.javabean.RooJavaBean;
import org.springframework.roo.addon.layers.repository.mongo.RooMongoEntity;
import org.springframework.roo.addon.tostring.RooToString;
import javax.validation.constraints.NotNull;
import javax.persistence.Enumerated;
import javax.persistence.ManyToOne;
import java.util.Date;
import javax.persistence.Column;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import org.springframework.format.annotation.DateTimeFormat;

@RooJavaBean
@RooToString
@RooMongoEntity
public class Topic {

    /**
     */
    @NotNull
    private String title;

    /**
     * The label that describe this topic
     */
    private String content;

    /**
     */
    @NotNull
    @Enumerated
    private Confidentiality confidentiality;

    /**
     */
    @NotNull
    @ManyToOne
    private UserNomade nomade;

    /**
     */
    @NotNull
    @Column(updatable = false)
    @Temporal(TemporalType.TIMESTAMP)
    @DateTimeFormat(pattern = "dd-MM-yyyy HH:mm")
    private Date created = new Date();
}
