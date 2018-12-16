# README
Notable changes to this project will be documented in this file.

> **Note:**
> + Look into adding Google service as extensions
 - contacts, docs, and drive

## [2.1.0.0]  **breaking controller and model changes**
### Added
+ >New template engine

## [2.0.0.0]  **breaking controller and model changes**
### Added
+ >module/exstention code
 - Calander and Notifications features as exstentions
 - admin extention manager
+ >three grid layout to document template to support dynamic layouts for modules
 - Allow users to pre-enter insurance and employer data DB for selecting from profiles
+ >Admin user setting operations
 - Create, edit, and delete users
+ > alert dialog when edits to profile have not been saved for `onbeforepageunload`
+ Help documentation for basic operations 
+ uploaded, edit and generated file operations
 - users will be able to upload profile picture
 - admin user will be able to delete files

### Changed
+ >(refactoring) Code for
 - `patient`, `insurace`, and `employer` models classes
 - `profile_insurance_policy` controller
+ >

###FIXED
+ Search queries for employer, insurance, and patients for more accurate results 
+ CSS style for mobile layout

## [1.2.0.0]
######NOTE
Look into moving the user log function to core user class
Make sure to add system notices to all profile pages (profile records does not have one)

### Added
+ >relation table for insurance `payor_id` and records tables
+ `profile_activity` controller for admin users (displays profile activity controller for the profile)
 - Show data from JOIN BD tables `user_log` and `user_session_activity` which are related to a given `patient_id`
 - Admin level user delete user activity operation
+ `profile_status` controller for admin users
 - Change profile status
+ >system alert controller class system notificatins
+ insurance modal class for insurance information related operations
+ >add core array filtering class
+ beta module/exstention code
+ >data-sandbox=value_changed to fields that should be check if values has changed before `onbeforeunload` event
 - Clear value when changes are saved

### Changed
+ >search method from users POST to GET for search query
+ `print_profile` controller to show profile information and no longer record information
 - including (basic info, contact, general info, Patient Info, insurance, and employer)
+ `print_record` to determine if profile is associated with another policy holder
 - Shows alert in print record template and gives link to policy holder profile

### Removed
+ the ability to add insurance information from profile controller
 - created new insureance model class
+ patient_id from `employer` table
 - due to the `patient_has_employer` table

## [1.1.0.0] - 2016-15-18  **breaking controller and template changes**

######NOTE
Remember to add <section data-alert="system"> to templates for new system notice function

### Changed
+ Controller structure to include header and footer
+ page template `document\page.tpl` to include header and footer variables
+ `page.tpl` to `document.tpl`
 - to support better application structure
+ DB structure for storing employer information
 - employer info is now stored as a relation to a patient 
+ model directory `patient` to `profile` and controller classes to `ControllerProfileClassName`
+ search results from showing profile address to insurance
 - now showing petient information
+ profile `print` controller to `print_profile`

### Removed
+ `insureance_id` from patient table
+ table `category`
+ action from `profile_notes_actions`
 - it was a pointless operation

### Added
+ header and footer controllers and templates
+ logging user activity in table `user_log` and `user_session_activity`
+ controller to show previously viewed profiles
+ `ProfileEvents` class for triggered events
+ employer info search to profile emploryer controller 

### Fixed
+ Notes and Call for profile feature
 - corrected Call date formatting

## [1.0.1.1] - 2016-11-14

### Added
+ Action/Notes to profile section(Call feature not implemented)
+ policy_eff_date to print profile feature
 - show the effective date data for given patient in the profile print layout

### Fixed
+ profile notes/call delete feature
 - Allow user to enter basic information regarding profile general profile actions and notes regarding a certain profile 
+ date instered into DB when creating new profile

## [1.0.0.1] - 2016-11-03 **breaking model changes**
### Added
+ search query for profiles by insurance and employe
+ JS search feature for pleasant UX
+ `patient_has_insurance` table to DB

### Changed
+ DB structure for storing insurance information
+ Removed row `insurance_id` from patient table
+ Core Patient model methods for retrieving data from relating DB tables ( `patient_has_insurance` )
+ JS modal box full window size

### TO FIX
>+ Ajax function for policy claim. Must rebind event to inserted dom elements
>+ capsulize sandbox js objects
>+ Move insurance information operations to their own controller
>+ Change Notes/Action/Call table lists to one controller that can be loaded using Ajax
