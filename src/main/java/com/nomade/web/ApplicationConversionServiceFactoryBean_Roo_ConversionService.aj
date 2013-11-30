// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.nomade.web;

import com.nomade.domain.Account;
import com.nomade.domain.Album;
import com.nomade.domain.EtapeVehicule;
import com.nomade.domain.EtapeVoyage;
import com.nomade.domain.InfoPratique;
import com.nomade.domain.UserNomade;
import com.nomade.domain.Vehicule;
import com.nomade.service.AccountService;
import com.nomade.service.AlbumService;
import com.nomade.service.EtapeVehiculeService;
import com.nomade.service.EtapeVoyageService;
import com.nomade.service.InfoPratiqueService;
import com.nomade.service.UserService;
import com.nomade.service.VehiculeService;
import com.nomade.web.ApplicationConversionServiceFactoryBean;
import java.math.BigInteger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Configurable;
import org.springframework.core.convert.converter.Converter;
import org.springframework.format.FormatterRegistry;

privileged aspect ApplicationConversionServiceFactoryBean_Roo_ConversionService {
    
    declare @type: ApplicationConversionServiceFactoryBean: @Configurable;
    
    @Autowired
    AccountService ApplicationConversionServiceFactoryBean.accountService;
    
    @Autowired
    AlbumService ApplicationConversionServiceFactoryBean.albumService;
    
    @Autowired
    EtapeVehiculeService ApplicationConversionServiceFactoryBean.etapeVehiculeService;
    
    @Autowired
    EtapeVoyageService ApplicationConversionServiceFactoryBean.etapeVoyageService;
    
    @Autowired
    InfoPratiqueService ApplicationConversionServiceFactoryBean.infoPratiqueService;
    
    @Autowired
    UserService ApplicationConversionServiceFactoryBean.userService;
    
    @Autowired
    VehiculeService ApplicationConversionServiceFactoryBean.vehiculeService;
    
    public Converter<Account, String> ApplicationConversionServiceFactoryBean.getAccountToStringConverter() {
        return new org.springframework.core.convert.converter.Converter<com.nomade.domain.Account, java.lang.String>() {
            public String convert(Account account) {
                return new StringBuilder().append(account.getEmail()).append(' ').append(account.getFullName()).append(' ').append(account.getBirthDate()).append(' ').append(account.getAdress()).toString();
            }
        };
    }
    
    public Converter<BigInteger, Account> ApplicationConversionServiceFactoryBean.getIdToAccountConverter() {
        return new org.springframework.core.convert.converter.Converter<java.math.BigInteger, com.nomade.domain.Account>() {
            public com.nomade.domain.Account convert(java.math.BigInteger id) {
                return accountService.findAccount(id);
            }
        };
    }
    
    public Converter<String, Account> ApplicationConversionServiceFactoryBean.getStringToAccountConverter() {
        return new org.springframework.core.convert.converter.Converter<java.lang.String, com.nomade.domain.Account>() {
            public com.nomade.domain.Account convert(String id) {
                return getObject().convert(getObject().convert(id, BigInteger.class), Account.class);
            }
        };
    }
    
    public Converter<Album, String> ApplicationConversionServiceFactoryBean.getAlbumToStringConverter() {
        return new org.springframework.core.convert.converter.Converter<com.nomade.domain.Album, java.lang.String>() {
            public String convert(Album album) {
                return new StringBuilder().append(album.getNumPhoto()).append(' ').append(album.get_id()).append(' ').append(album.getName()).append(' ').append(album.getCreated()).toString();
            }
        };
    }
    
    public Converter<BigInteger, Album> ApplicationConversionServiceFactoryBean.getIdToAlbumConverter() {
        return new org.springframework.core.convert.converter.Converter<java.math.BigInteger, com.nomade.domain.Album>() {
            public com.nomade.domain.Album convert(java.math.BigInteger id) {
                return albumService.findAlbum(id);
            }
        };
    }
    
    public Converter<String, Album> ApplicationConversionServiceFactoryBean.getStringToAlbumConverter() {
        return new org.springframework.core.convert.converter.Converter<java.lang.String, com.nomade.domain.Album>() {
            public com.nomade.domain.Album convert(String id) {
                return getObject().convert(getObject().convert(id, BigInteger.class), Album.class);
            }
        };
    }
    
    public Converter<EtapeVehicule, String> ApplicationConversionServiceFactoryBean.getEtapeVehiculeToStringConverter() {
        return new org.springframework.core.convert.converter.Converter<com.nomade.domain.EtapeVehicule, java.lang.String>() {
            public String convert(EtapeVehicule etapeVehicule) {
                return new StringBuilder().append(etapeVehicule.getDescription()).append(' ').append(etapeVehicule.getDateEtape()).append(' ').append(etapeVehicule.getUserPhoto()).append(' ').append(etapeVehicule.getLocation()).toString();
            }
        };
    }
    
    public Converter<BigInteger, EtapeVehicule> ApplicationConversionServiceFactoryBean.getIdToEtapeVehiculeConverter() {
        return new org.springframework.core.convert.converter.Converter<java.math.BigInteger, com.nomade.domain.EtapeVehicule>() {
            public com.nomade.domain.EtapeVehicule convert(java.math.BigInteger id) {
                return etapeVehiculeService.findEtapeVehicule(id);
            }
        };
    }
    
    public Converter<String, EtapeVehicule> ApplicationConversionServiceFactoryBean.getStringToEtapeVehiculeConverter() {
        return new org.springframework.core.convert.converter.Converter<java.lang.String, com.nomade.domain.EtapeVehicule>() {
            public com.nomade.domain.EtapeVehicule convert(String id) {
                return getObject().convert(getObject().convert(id, BigInteger.class), EtapeVehicule.class);
            }
        };
    }
    
    public Converter<EtapeVoyage, String> ApplicationConversionServiceFactoryBean.getEtapeVoyageToStringConverter() {
        return new org.springframework.core.convert.converter.Converter<com.nomade.domain.EtapeVoyage, java.lang.String>() {
            public String convert(EtapeVoyage etapeVoyage) {
                return new StringBuilder().append(etapeVoyage.getDescription()).append(' ').append(etapeVoyage.getDateEtape()).append(' ').append(etapeVoyage.getUserPhoto()).append(' ').append(etapeVoyage.getLocation()).toString();
            }
        };
    }
    
    public Converter<BigInteger, EtapeVoyage> ApplicationConversionServiceFactoryBean.getIdToEtapeVoyageConverter() {
        return new org.springframework.core.convert.converter.Converter<java.math.BigInteger, com.nomade.domain.EtapeVoyage>() {
            public com.nomade.domain.EtapeVoyage convert(java.math.BigInteger id) {
                return etapeVoyageService.findEtapeVoyage(id);
            }
        };
    }
    
    public Converter<String, EtapeVoyage> ApplicationConversionServiceFactoryBean.getStringToEtapeVoyageConverter() {
        return new org.springframework.core.convert.converter.Converter<java.lang.String, com.nomade.domain.EtapeVoyage>() {
            public com.nomade.domain.EtapeVoyage convert(String id) {
                return getObject().convert(getObject().convert(id, BigInteger.class), EtapeVoyage.class);
            }
        };
    }
    
    public Converter<InfoPratique, String> ApplicationConversionServiceFactoryBean.getInfoPratiqueToStringConverter() {
        return new org.springframework.core.convert.converter.Converter<com.nomade.domain.InfoPratique, java.lang.String>() {
            public String convert(InfoPratique infoPratique) {
                return new StringBuilder().append(infoPratique.getTitle()).append(' ').append(infoPratique.getSelecteur()).append(' ').append(infoPratique.getSelecteur1()).append(' ').append(infoPratique.getLocation()).toString();
            }
        };
    }
    
    public Converter<BigInteger, InfoPratique> ApplicationConversionServiceFactoryBean.getIdToInfoPratiqueConverter() {
        return new org.springframework.core.convert.converter.Converter<java.math.BigInteger, com.nomade.domain.InfoPratique>() {
            public com.nomade.domain.InfoPratique convert(java.math.BigInteger id) {
                return infoPratiqueService.findInfoPratique(id);
            }
        };
    }
    
    public Converter<String, InfoPratique> ApplicationConversionServiceFactoryBean.getStringToInfoPratiqueConverter() {
        return new org.springframework.core.convert.converter.Converter<java.lang.String, com.nomade.domain.InfoPratique>() {
            public com.nomade.domain.InfoPratique convert(String id) {
                return getObject().convert(getObject().convert(id, BigInteger.class), InfoPratique.class);
            }
        };
    }
    
    public Converter<UserNomade, String> ApplicationConversionServiceFactoryBean.getUserNomadeToStringConverter() {
        return new org.springframework.core.convert.converter.Converter<com.nomade.domain.UserNomade, java.lang.String>() {
            public String convert(UserNomade userNomade) {
                return new StringBuilder().append(userNomade.getUserName()).append(' ').append(userNomade.getPassword()).append(' ').append(userNomade.getAccountExpiration()).append(' ').append(userNomade.getCredentialExpiration()).toString();
            }
        };
    }
    
    public Converter<BigInteger, UserNomade> ApplicationConversionServiceFactoryBean.getIdToUserNomadeConverter() {
        return new org.springframework.core.convert.converter.Converter<java.math.BigInteger, com.nomade.domain.UserNomade>() {
            public com.nomade.domain.UserNomade convert(java.math.BigInteger id) {
                return userService.findUserNomade(id);
            }
        };
    }
    
    public Converter<String, UserNomade> ApplicationConversionServiceFactoryBean.getStringToUserNomadeConverter() {
        return new org.springframework.core.convert.converter.Converter<java.lang.String, com.nomade.domain.UserNomade>() {
            public com.nomade.domain.UserNomade convert(String id) {
                return getObject().convert(getObject().convert(id, BigInteger.class), UserNomade.class);
            }
        };
    }
    
    public Converter<Vehicule, String> ApplicationConversionServiceFactoryBean.getVehiculeToStringConverter() {
        return new org.springframework.core.convert.converter.Converter<com.nomade.domain.Vehicule, java.lang.String>() {
            public String convert(Vehicule vehicule) {
                return new StringBuilder().append(vehicule.getVehiculeName()).append(' ').append(vehicule.getPhoto()).append(' ').append(vehicule.getModel()).append(' ').append(vehicule.getCouleur()).toString();
            }
        };
    }
    
    public Converter<BigInteger, Vehicule> ApplicationConversionServiceFactoryBean.getIdToVehiculeConverter() {
        return new org.springframework.core.convert.converter.Converter<java.math.BigInteger, com.nomade.domain.Vehicule>() {
            public com.nomade.domain.Vehicule convert(java.math.BigInteger id) {
                return vehiculeService.findVehicule(id);
            }
        };
    }
    
    public Converter<String, Vehicule> ApplicationConversionServiceFactoryBean.getStringToVehiculeConverter() {
        return new org.springframework.core.convert.converter.Converter<java.lang.String, com.nomade.domain.Vehicule>() {
            public com.nomade.domain.Vehicule convert(String id) {
                return getObject().convert(getObject().convert(id, BigInteger.class), Vehicule.class);
            }
        };
    }
    
    public void ApplicationConversionServiceFactoryBean.installLabelConverters(FormatterRegistry registry) {
        registry.addConverter(getAccountToStringConverter());
        registry.addConverter(getIdToAccountConverter());
        registry.addConverter(getStringToAccountConverter());
        registry.addConverter(getAlbumToStringConverter());
        registry.addConverter(getIdToAlbumConverter());
        registry.addConverter(getStringToAlbumConverter());
        registry.addConverter(getEtapeVehiculeToStringConverter());
        registry.addConverter(getIdToEtapeVehiculeConverter());
        registry.addConverter(getStringToEtapeVehiculeConverter());
        registry.addConverter(getEtapeVoyageToStringConverter());
        registry.addConverter(getIdToEtapeVoyageConverter());
        registry.addConverter(getStringToEtapeVoyageConverter());
        registry.addConverter(getInfoPratiqueToStringConverter());
        registry.addConverter(getIdToInfoPratiqueConverter());
        registry.addConverter(getStringToInfoPratiqueConverter());
        registry.addConverter(getUserNomadeToStringConverter());
        registry.addConverter(getIdToUserNomadeConverter());
        registry.addConverter(getStringToUserNomadeConverter());
        registry.addConverter(getVehiculeToStringConverter());
        registry.addConverter(getIdToVehiculeConverter());
        registry.addConverter(getStringToVehiculeConverter());
    }
    
    public void ApplicationConversionServiceFactoryBean.afterPropertiesSet() {
        super.afterPropertiesSet();
        installLabelConverters(getObject());
    }
    
}
