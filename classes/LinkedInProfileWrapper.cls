public with sharing class LinkedInProfileWrapper {
    
    public cls_firstName firstName;
	public String localizedFirstName;	//Bob
	public cls_headline headline;
	public String localizedHeadline;	//API Enthusiast at LinkedIn
	public String vanityName;	//bsmith
	public String id;	//yrZCpj2Z12
	public cls_lastName lastName;
	public String localizedLastName;	//Smith
	public cls_profilePicture profilePicture;
	public class cls_firstName {
		public cls_localized localized;
		public cls_preferredLocale preferredLocale;
	}
	public class cls_localized {
		public String en_US;	//Smith
	}
	public class cls_preferredLocale {
		public String country;	//US
		public String language;	//en
	}
	public class cls_headline {
		public cls_localized localized;
		public cls_preferredLocale preferredLocale;
	}
	public class cls_lastName {
		public cls_localized localized;
		public cls_preferredLocale preferredLocale;
	}
	public class cls_profilePicture {
		public String displayImage;	//urn:li:digitalmediaAsset:C4D00AAAAbBCDEFGhiJ
	}

	public static LinkedInProfileWrapper parse(String json){
		return (LinkedInProfileWrapper) System.JSON.deserialize(json, LinkedInProfileWrapper.class);
	}

    public static void parseDemo(){
        String json =		'{'+
		'   "firstName":{'+
		'      "localized":{'+
		'         "en_US":"Bob"'+
		'      },'+
		'      "preferredLocale":{'+
		'         "country":"US",'+
		'         "language":"en"'+
		'      }'+
		'   },'+
		'   "localizedFirstName": "Bob",'+
		'   "headline":{'+
		'      "localized":{'+
		'         "en_US":"API Enthusiast at LinkedIn"'+
		'      },'+
		'      "preferredLocale":{'+
		'         "country":"US",'+
		'         "language":"en"'+
		'      }'+
		'   },'+
		'   "localizedHeadline": "API Enthusiast at LinkedIn",'+
		'   "vanityName": "bsmith",'+
		'   "id":"yrZCpj2Z12",'+
		'   "lastName":{'+
		'      "localized":{'+
		'         "en_US":"Smith"'+
		'      },'+
		'      "preferredLocale":{'+
		'         "country":"US",'+
		'         "language":"en"'+
		'      }'+
		'   },'+
		'   "localizedLastName": "Smith",'+
		'   "profilePicture": {'+
		'        "displayImage": "urn:li:digitalmediaAsset:C4D00AAAAbBCDEFGhiJ"'+
		'   }'+
		'}';
		LinkedInProfileWrapper obj = parse(json);
        System.debug(obj.localizedHeadline);
    }
}
