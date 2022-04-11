# ProjectShare-iOS

<img src='https://github.com/larafonse/Project03-Group5/blob/main/img/project_share_logo.png' title='Video Walkthrough' width='' alt='Video Walkthrough' />

## Table of Contents
1. [Overview](#Overview)
2. [Product Spec](#Product-Spec)
3. [Wireframes](#Wireframes)
4. [Schema](#Schema)
5. [Walkthroughs](#Walkthroughs)

## Overview

### Description
Users are able to post project ideas, open source projects, and or collaborative projects! Users can share these projects that can provide opportunities to others to learn new technologies, work in a group setting, and build networking skills.

### App Evaluation
- **Category:** Productivity
- **Mobile:** Mobile first experience
- **Story:** Allows users to find projects and mentors
- **Market:** Students and Schools.
- **Habit:** Chat feature will have users communicate with eachother.
- **Scope:** Can be used by any or all students.

## Product Spec

### 1. User Stories (Required and Optional)
* Users should be able to login or create an account
* post projects
* view all projects that are posted
* comment on projects
* update accounts.
* Search through existing projects
* Join Project
* Chat feature to have students and mentors communicate with each other


**Optional Nice-to-have Stories**
* Use Google maps to find projects near by
* Different account types:
* Student account : search and join projects
* Mentor: post projects and communicate with students
* Upgrade student account to mentor account

### 2. Screen Archetypes

* Login/Sign 
   * The User will be able to login/Sign up
* Home 
   * User will view latest projects they can join
* Project Detail Page
    * User can view project in detail and join
* Mentor Page 
    * User can contact mento
* Profile
    * User can view saved projects


### 3. Navigation

**Flow Navigation**

* Login / Sign up 
   * Home
* Home 
   * Project Detail Page
   * Profile
   * Mentor (other user)
* Project Detail Page
   * Mentor (other user)
   * Home
* Mentor (other user) page
   * Home
* Profile 
  * Home
  * Project Detail Page

  

## Wireframes
<img src = 'https://github.com/larafonse/Project03-Group5/raw/main/img/Project03Wireframe.png'>

## Technology Stack

#### Required
* Firebase
* Google Maps API	


## Schema 

### Firebase Models
#### User 

   | Property      | Type     | Description |
   | ------------- | -------- | ------------|
   | userId        | String   | unique id for the user (default field) |
   | userName      | String   | full name of the user |
   | mentor | bool | will indicate what kind of account they are using|
   
#### Project
   | Property      | Type     | Description |
   | ------------- | -------- | ------------|
   | datetime        | String   | date of when is was posted |
   | active | bool | indicate if project is looking for students|
   | mentorId      | String   | keep track on which mentor is associated with prjects |
   | tech  | array strings | store tech stack to make it searchable |
   
      
## Networking
- Profile 
  - (Read/GET) Query all projects saved by user
  ```FirebaseAuth auth = FirebaseAuth.getInstance();
  db = FirebaseFirestore.getInstance();
  FirebaseUser firebaseUser = auth.getCurrentUser();
  final String userID = firebaseUser.getUid();
  Query query = db.collection("projects").whereEqualTo("id", userID);
  ```
  - (Delete) Leave project
  - (Update/PUT) Update User info
- Home
  - (Read/GET) Query all projects posted 
  - (Read/GET) Search for projects
  - (Create/POST) Join Project
- Post
  - (Create/POST) Create a new project
 - Detail
  - (Create/POST) Join Project
  
