# Track

## Table of Contents
1. [Overview](#Overview)
1. [Product Spec](#Product-Spec)
1. [Wireframes](#Wireframes)
2. [Schema](#Schema)

## Overview
### Description
Track is a time management tool that helps you plan your week. It allows you to input your obligations and appointments and automatically sorts them out on your weekly calendar to give you the most optimal schedule based on your needs. As you complete deliverables throughtout your week, you gain rewards that could be reedemed.

### App Evaluation
- **Category:** Productivity
- **Mobile:** This app will primarily developed for mobile.
- **Story:** Organizes events that user inputs into a schedule optimized for the user's preferences/
- **Market:** Students, academics, professionals
- **Habit:** It is up to the user for how frequent the app will remind the user to complete their events.
- **Scope:** Help students manage their time better by suggesting more efficient times to complete tasks or schedule their weekly events and obligations.

## Product Spec

### 1. User Stories (Required and Optional)

**Required Must-have Stories**

* [x] User can log in or register
* [x] User can use Pomodoro timer
* [x] User logins to calendar view of all of their tasks/events
* [ ] User can add and remove tasks
* [ ] Progress view that shows weekly progress and how many tasks/events are done

**Optional Nice-to-have Stories**

* Pomodoro timer that can be used as a study aid 

### 2. Screen Archetypes

* Login
* Register
   * Upon Download/Reopening of the application, the user is prompted to log in to gain access to their profile information to be properly matched with another person.
* Calendar Screen
   * Displays weekly overview of tasks/events 
   * Allows users to expand calendar screen to daily overviews
   * Allows user to view tasks/events as a schedule
   * Allows user to add and remove tasks or events
* Tracking Screen
   * Shows weekly progress of tasks/events
   * Tracks rewards for task/event progress
* Pomodoro Screen
   * Pomodoro timer for focus time
   * Short break timer
   * Long break timer

### 3. Navigation

**Tab Navigation** (Tab to Screen)

* Calendar
* Track
* Pomodoro

**Flow Navigation** (Screen to Screen)

* Forced Log-in
   * Sign up
   * Login
* Calendar
   * Weekly (DEFAULT) 
   * Daily view
   * Schedule view
* Track
   * Track view that displays progress of tasks/events 
   * Shows stats in the center
   * Settings icon that toggles setting
* Pomodoro
   * Pomodoro timer for focus time
   * Short break timer
   * Long break timer
* Settings
   * Edit user name, email and password
## Wireframes
![CodePath-Track_App_Sketches](https://user-images.githubusercontent.com/72041087/138780466-6bf77f55-da4f-43ee-9215-fab6980b8014.jpg)

## Schema
### Models
#### User
| Property | Type | Description |
|----------|------|-------------|
| email | String | User email |
| password | String | User password |
| firstName | String | User first name |
| lastName | String | User last name |
| notificationFreq | Int | Frequency user wants to recieve reminders (weekly) |

#### Task
| Property | Type | Description |
|----------|------|-------------|
| userId | Pointer to User | Identify task owner
| taskDueDate | DateTime | Task due date |
| taskDeliverable | String | What is due for the task |
| taskEstTime | DateTime | Estimated time to complete deliverable |
| isCompleted | Bool | If task is completed or not |

#### Event
| Property | Type | Description |
|----------|------|-------------|
| userId | Pointer to User | Identify event owner
| eventStart | DateTime | Event start |
| eventEnd | DateTime | Event end |
| eventTitle | String | Event title/description |

### Networking
#### Login/Register
* [CREATE] user profile
* [POST] login with credentials

#### Calendar
* [GET] events and tasks
* [POST] create and send events and tasks

#### Track
* [GET] get total tasks

## Build Progress
### Sprint 1
- Created database and Xcode project that can connect to database
<img width="1498" alt="Screen Shot 2021-11-07 at 7 19 24 PM" src="https://user-images.githubusercontent.com/72041087/140667630-b2e69635-7e6a-4768-b494-f28b1f1a4880.png">
<img src="https://user-images.githubusercontent.com/72041087/141032643-6e8fe4ad-7e76-4cfe-9c73-dd169819763e.gif" width=250><br>

### Sprint 2
- User can sign up and login with their details
- User can select between Pomodoro sessions
<img src="https://user-images.githubusercontent.com/72041087/141873773-97a05a83-a7e3-47f8-8f3a-a1c0700a85ff.gif">
<img src="https://user-images.githubusercontent.com/72041087/141874069-0d09b614-8346-43a1-be9b-cd038cc07a1f.gif" width=250><br>

### Sprint 3
- User can login and view Calendar, Track, and Pomodoro screens
<img src="https://user-images.githubusercontent.com/72041087/143152338-be5f8398-50eb-403e-a203-4bceb549c1f5.gif" width=250>
