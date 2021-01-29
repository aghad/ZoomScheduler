# Zoom Scheduler
 
 > Authors: \<[Destiny Hochhalter](https://github.com/DestinyHochhalter)>\<[Aden Ghadimi](https://github.com/aghad)>\<[Francisco Bustamante](https://github.com/frab6562)>
 
**Project Description**\
Zoom Planner holds Zoom meeting links organized and in one place. With online learning Zoom meeting links are posted on Slack, iLearn, or emailed. This app helps alleviate the mental load of remembering where each Zoom meeting link is and when the meeting takes place. You can schedule your meetings and open your Zoom meeting through this app. Our app displays meetings in a schedule format, where you can add and edit meeting information, and open the Zoom app with your meeting URL.

**Languages/Tools**\
We will be using the programming language Swift to create a native iOS application. Zoom meetings will be stored offline using [Realm](https://realm.io) -local database for mobile.

**Input/Output**\
You can add Zoom meetings through filling out a form, where strings can be input for the meeting name, and options such as the day of the week will be selected using a picker view, which will be represented by an Int. The meetings you add will be displayed in a schedule like fashion, ordered by day chronologically./

**Design Patterns**

**Visitor**\
To add a new zoom meeting, we present the user with a form to fill out. Once each part of our form is filled out (meeting name, selecting the meeting time), we want to iterate over our form. The visitor pattern abstracts away how each part of the form needs to be handled and validated differntly. For example, a meeting end time is not valid if it is before the start time; this logic can be handled seperatly from handling the meeting URL validation. A benefit is if we decide to add new form fields later on, we can easily do so without changing our existing fields.

**Protocol Delegate**\
We use the protocol delegate pattern to identify what object is assoicated with a cell that the user taps. When the user taps on a meeting in a table view to open the Zoom app, the table view cell's delegate function will be called. This pattern helps avoid using bad methods such as tags when identifying exactly what cell corresponding to what object was tapped. We need to know what cell was tapped, because we want to pass the zoom meeting object's URL to a function that opens the Zoom app.

 > ## Phase II
 > In addition to completing the "Class Diagram" section below, you will need to 
 > * Set up your GitHub project board as a Kanban board for the project. It should have columns that map roughly to 
 >   * Backlog, TODO, In progress, In testing, Done
 >   * You can change these or add more if you'd like, but we should be able to identify at least these.
 > * There is no requirement for automation in the project board but feel free to explore those options.
 > * Create an "Epic" (note) for each feature and each design pattern and assign them to the appropriate team member. Place these in the `Backlog` column
 > * Complete your first *sprint planning* meeting to plan out the next 7 days of work.
 >   * Create smaller development tasks as issues and assign them to team members. Place these in the `Backlog` column.
 >   * These cards should represent roughly 7 days worth of development time for your team, taking you until your first meeting with the TA
># Class Diagram
 > Include a class diagram(s) for each design pattern and a description of the diagram(s). Your class diagram(s) should include all the main classes you plan for the project. This should be in sufficient detail that another group could pick up the project this point and successfully complete it. Use proper OMT notation (as discussed in the course slides). You may combine multiple design patterns into one diagram if you'd like, but it needs to be clear which portion of the diagram represents which design pattern (either in the diagram or in the description). 
 
 > ## Phase III
 > You will need to schedule a check-in with the TA (during lab hours or office hours). Your entire team must be present. 
 > * Before the meeting you should perform a sprint plan like you did in Phase II
 > * In the meeting with your TA you will discuss: 
 >   - How effective your last sprint was (each member should talk about what they did)
 >   - Any tasks that did not get completed last sprint, and how you took them into consideration for this sprint
 >   - Any bugs you've identified and created issues for during the sprint. Do you plan on fixing them in the next sprint or are they lower priority?
 >   - What tasks you are planning for this next sprint.

 > ## Final deliverable
 > All group members will give a demo to the TA during lab time. The TA will check the demo and the project GitHub repository and ask a few questions to all the team members. 
 > Before the demo, you should do the following:
 > * Complete the sections below (i.e. Screenshots, Installation/Usage, Testing)
 > * Plan one more sprint (that you will not necessarily complete before the end of the quarter). Your In-progress and In-testing columns should be empty (you are not doing more work currently) but your TODO column should have a full sprint plan in it as you have done before. This should include any known bugs (there should be some) or new features you would like to add. These should appear as issues/cards on your Kanban board. 
 
 ## Screenshots
 > Screenshots of the input/output after running your application
 
 ## Installation/Usage
 > Instructions on installing and running your application
 ## Testing
 > How was your project tested/validated? If you used CI, you should have a "build passing" badge in this README.
 
