# Zoom Scheduler
 
 > Authors: \<[Destiny Hochhalter](https://github.com/DestinyHochhalter)>\<[Aden Ghadimi](https://github.com/aghad)>\<[Francisco Bustamante](https://github.com/frab6562)>
 
**Project Description**\
Zoom Planner holds Zoom meeting links organized and in one place. With online learning Zoom meeting links are posted on Slack, iLearn, or emailed. This app helps alleviate the mental load of remembering where each Zoom meeting link is and when the meeting takes place. You can schedule your meetings and open your Zoom meeting through this app. Our app displays meetings in a schedule format, where you can add and edit meeting information, and open the Zoom app with your meeting URL.

**Languages/Tools**\
We will be using the programming language Swift to create a native iOS application. Zoom meetings will be stored offline using [Realm](https://realm.io) -local database for mobile.

**Input/Output**\
You can add Zoom meetings through filling out a form, where strings can be input for the meeting name, and options such as the day of the week will be selected using a picker view, which will be represented by an Int. The meetings you add will be displayed in a schedule like fashion, ordered by day chronologically.

**Design Patterns**

**Strategy**\
We promt the user to fill out a form with various fields to add a new Zoom meeting. We use textfields and picker views to allow the user to type in or select values. The probelm is that depending on the kind of data the user enters (meeting start time, URL) is that those paramaters must be validated differently. We are using the strategy pattern, where our form cells have an instance of the validate strategy. Depending on what we are validating (a string, URL, or time), we will let the strategy class handle that validation at runtime. This is a nice way to have less bloated code and to add new types of validation later if we need to.

**Singleton**\
We will implement a static instance of our custom class NotificationManager, which handles the logic of sending local notifications. This class will handle user permissions by checking the permission status and making requests. Our class will also schedule when notifications will be sent out and their content. We want a single instance of this class to avoid asking the user for permission multiple times, or sending out the same notification twice. 

 
# Class Diagram
![alt text](https://github.com/cs100/final-project-aghad003-dhoch002-fbust002/blob/master/CS100%20Final%20Project%20OMT%20Diagram.png?raw=true)

 ## Screenshots 
 
<img src="https://cdn.discordapp.com/attachments/811058864295510016/818929360329244732/IMG_6455.jpeg" width="300" height="650">

<img src="https://cdn.discordapp.com/attachments/796852533041299529/819298546830147688/IMG_6461.jpeg" width="300" height="650">

<img src="https://cdn.discordapp.com/attachments/796852533041299529/819298551795679262/IMG_6460.jpeg" width="300" height="650">

<img src="https://cdn.discordapp.com/attachments/811058864295510016/818929365567930408/IMG_6456.jpeg" width="300" height="650">

<img src="https://cdn.discordapp.com/attachments/811058864295510016/818929371502215178/IMG_6457.jpeg" width="300" height="650">

<img src="https://cdn.discordapp.com/attachments/811058864295510016/818929389877329920/IMG_6458.jpeg" width="300" height="650">

<img src="https://cdn.discordapp.com/attachments/811058864295510016/818929402103857192/IMG_6459.jpeg" width="300" height="650">

<img src="https://cdn.discordapp.com/attachments/796852533041299529/819298552361779200/IMG_6486.jpeg" width="300" height="650">

 ## Installation/Usage
Install this app by cloning the repository and opening it in Xcode. Then build and run the app either on an iPhone simulator in Xcode or on your iPhone by connecting your phone via an iPhone cable to your computer. The app will take a minute or less to download. From there you can use the app. If the program does not compile, it means that your local device is not compatible with the Realm dependency. To fix this, quit Xcode and change directories to the project in your terminal. Type in 'pod update' to make sure your CocoaPods are up to date. Now open Xcode again and the app should compile and run.

 ## Testing
Our project was tested and validated via a test suite of unit tests in Xcode using XCTest. Our test suite included multiple tests for each type of function in our program. For functions that took in either integers, strings, or objects; we tested those functions with both valid and invalid input to verify that our functions will give expected output and will not crash at runtime. We tested our strategy function to validate user input by unit testing our different strategies. Our ValidationStrategy validated either string, URL, time, or day input, all of which is validated differently. We tested our function to determine if a URL is valid or not, which was used in our ValidationStrategy class. We used integers to represent values such as the time of the day (ex: 5:00 pm), and tested functions which would convert the integer to its string representation. To schedule a notification, we used a meeting's start time to create time components for a timer trigger in our NotificationManager Singleton class. We tested this function to ensure our notifications fire at the expected time. 
 
