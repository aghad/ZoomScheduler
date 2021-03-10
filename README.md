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
<img src="https://cdn.discordapp.com/attachments/811058864295510016/818929365567930408/IMG_6456.jpeg" width="300" height="650">
<img src="https://cdn.discordapp.com/attachments/811058864295510016/818929371502215178/IMG_6457.jpeg" width="300" height="650">
<img src="https://cdn.discordapp.com/attachments/811058864295510016/818929389877329920/IMG_6458.jpeg" width="300" height="650">
<img src="https://cdn.discordapp.com/attachments/811058864295510016/818929402103857192/IMG_6459.jpeg" width="300" height="650">

 ## Installation/Usage
 > Instructions on installing and running your application
 ## Testing
 > How was your project tested/validated? If you used CI, you should have a "build passing" badge in this README.
 
