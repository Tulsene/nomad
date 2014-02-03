// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.nomade.domain;

import com.nomade.domain.Parcours;
import flexjson.JSONDeserializer;
import flexjson.JSONSerializer;
import java.util.ArrayList;
import java.util.Collection;
import java.util.List;

privileged aspect Parcours_Roo_Json {
    
    public String Parcours.toJson() {
        return new JSONSerializer()
        .exclude("*.class").serialize(this);
    }
    
    public String Parcours.toJson(String[] fields) {
        return new JSONSerializer()
        .include(fields).exclude("*.class").serialize(this);
    }
    
    public static Parcours Parcours.fromJsonToParcours(String json) {
        return new JSONDeserializer<Parcours>()
        .use(null, Parcours.class).deserialize(json);
    }
    
    public static String Parcours.toJsonArray(Collection<Parcours> collection) {
        return new JSONSerializer()
        .exclude("*.class").serialize(collection);
    }
    
    public static String Parcours.toJsonArray(Collection<Parcours> collection, String[] fields) {
        return new JSONSerializer()
        .include(fields).exclude("*.class").serialize(collection);
    }
    
    public static Collection<Parcours> Parcours.fromJsonArrayToParcourses(String json) {
        return new JSONDeserializer<List<Parcours>>()
        .use("values", Parcours.class).deserialize(json);
    }
    
}
