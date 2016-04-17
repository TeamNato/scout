//
//  Constants.swift
//  Scout
//
//  Created by Johnny Pham on 4/16/16.
//  Copyright © 2016 Team Nato. All rights reserved.
//

import Foundation

/* TODO: Try struct format for constrants */
struct Constants {
  struct PF {
    struct User {
      static let ClassName = "_User"
    }
  }
}

/* Installation */
let PF_INSTALLATION_CLASS_NAME			= "_Installation"           //	Class name
let PF_INSTALLATION_OBJECTID			= "objectId"				//	String
let PF_INSTALLATION_USER				= "user"					//	Pointer to User Class

/* User */
let PF_USER_CLASS_NAME					= "_User"                   //	Class name
let PF_USER_OBJECTID            = "objectId"
let PF_USER_USERNAME            = "username"
let PF_USER_PASSWORD            = "password"
let PF_USER_EMAIL               = "email"
let PF_USER_FIRSTNAME           = "firstName"
let PF_USER_LASTNAME            = "lastName"
let PF_USER_PHONE               = "phone"
let PF_USER_FACEBOOKID					= "facebookId"
let PF_USER_AVATAR              = "avatarURL"
let PF_USER_AUTHDATA            = "authData"

/* Issue */
let PF_ISSUE_CLASS_NAME					= "Issue"
let PF_ISSUE_OBJECTID           = "objectId"
let PF_ISSUE_LOCATIONNAME				= "locationName"
let PF_ISSUE_PHOTOS             = "photos" //	Pointer to Photo Class
let PF_ISSUE_REPORTER           = "reporter" //	Pointer to User Class
let PF_ISSUE_ANONYMOUS					= "isAnonymous"
let PF_ISSUE_VOTECOUNT					= "voteCount"
let PF_ISSUE_STATUS             = "status"
let PF_ISSUE_LOCATIONCOORDINATE	= "locationCoordiante"
let PF_ISSUE_COMMENTS           = "comments"
let PF_ISSUE_DESCRIPTION				= "description"
let PF_ISSUE_CATEOGRY           = "category" //	Pointer to Category Class
let PF_ISSUE_CREATEDAT          = "createdAt"

/* Photo */
let PF_PHOTO_CLASS_NAME         = "Photo"
let PF_PHOTO_OBJECTID           = "objectId"
let PF_PHOTO_URL                = "url"

/* REGION */
let PF_REGION_CLASS_NAME        = "Region"

