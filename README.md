# arcampuslife
This was my teams senior design project. Our team consisted of 5 people. Three of them were split off into sub teams to create the companion website and backend systems that powers the phone application. The other 2 members were on the phone application design team.

# The Website 
The website https://mstcampus.live
The site allows you to create accounts and create events around campus that are put into google firebase Realtime database. This then feeds the needed data to the mobile application.

# The Mobile Application, S&T Live
The mobile application (this repository) pulls the relevant data from the firebase Realtime database that's feed and generated
by the companion website https://mstcampus.live  The data that is then downloaded allows the phone application to feed the various features like apple maps navigation, twitter style event feed, and augmented reality viewer.

# How we created it
First, we came up with an overall design of what we wanted the project to be and what features we wanted for a retail product. Then we started resource requirements for our initial design of the whole system for phone application and website communication interlink. Once we figured out what we wanted to do (SWOT) we started out resource gathering requirements. We then employed the MOSCOW method to break down the application to what we thought we could reasonably get done in the semesters remaining time for each of our sprints. 

# The Final Application
The Sprint 3 application was our first prototype ware the system was exchanging data between the website and mobile application. The mobile application was exceptionally difficult given that nobody on the team had any experience with mobile development. It was not until after the semester had ended that we realized the mistake we made in the mobile application development in not following the MVC design pattern. We did not follow this as we just simply didn’t know about MVC it at the time. 

# Employed Practices
SWOT,
MOSCOW,
Agile Development,
Unit Testing,
Market Research ( We gave out surveys for people to answer that helped drive application design in what people wanted to see from the application),
Customer Feedback (we ambushed people on campus to try out our application)

# The long road to this application
Nobody on the team knew how to develop a mobile application, it was something we were all vastly unprepared for and underestimated the complexity of the mobile space. This repository is actually the fifth attempt at getting the correct technology stack to do what it we wanted the application to do. We tried everything from Android + ARCORE, React native + ARCORE/ARKIT, Viro Media setup with react Native, Unity3d with wikitude SDK, and finally settling on Apple ARKIT and native swift application with ARKIT + Corelocation. Their were lots of test applications built and a lot of dead ends to these technologies but we found one that supported all of the features that we needed to get to the point ware we are today.

# Why it was so challenging
For us on the mobile team, the only languages we knew when starting this project was C++, C#, Python, SQL. We didn’t know anything about JAva, Javascript, HTML, CSS, Swift, React, or React Native when we started this project. It was a crash course in learning new technology stacks in Rapid succession.

# What we learned
Don’t ever underestimate the complexity of something simple. It may appear to be simple on the surface but their are a lot of things working under the surface to make it all happen. Version control on iOS applications sucks (Apple in their damn single developer only accounts unless you pay them, we had to work around it). Initial project scope was on point for what we wanted to deliver by the end of the semester but to take the mobile application in to a full retail release it still has a long way to go.

# Project Goals

# Semesters End Product

# Mobile Application Team
Matthew Stroble, Liem Ho

# Website and Backend Team
Tho Nguyen, Quang Nguyen, Jack Kellogg

# Images and Video
https://youtu.be/7tNeaTzaRsQ

# Classrooms/Labs 1-18 
used https://www.gps-coordinates.net to grab exact coordinates

1  Bertelsmeyer Hall 
	1101 N. State St. Rolla MO 65409
	<br />	37.9526759, -91.7756332
  
2  Butler-Carlton Civil Engineering Hall 
	1401 North Pine Street, Rolla, MO 65409
	<br />	37.9556544,-91.7717959

3  Computer Science Building 
	500 West 15th Street, Rolla, MO 65409
	<br />	37.9559439,-91.774293
  
4  Emerson Hall 
	301 West 16th Street, Rolla, MO 65409
	<br />	37.956126,-91.7726284
  
5  Engineering Management Building 
	600 West 14th Street, Rolla, MO 65409
	<br />	37.9553218,-91.7750268
  
6  Fulton Hall 	
  301 West 14th Street, Rolla, MO 65409
	<br />	37.9549271,-91.7730291

7  Gale Bullman Multi-Purpose Building 
	705 West 10th Street, Rolla, MO 65409
	<br />	37.9549271,-91.7730291
  
8  Harris Hall 
	500 West 13th Street, Rolla, MO 65409
	<br />	37.9545961,-91.774628
  
9  Humanities and Social Sciences Building 
	500 West 14th Street, Rolla, MO 65409
	<br />	37.9553103,-91.7742387
  
10  IDE Building 
	1215 North Pine Street, Rolla, MO 65409
	<br />	37.9539748,-91.7720439
  
11  Kennedy Experimental Mine 
	12350 Private Drive 7002, Rolla, MO 65401
	<br />	37.937662,-91.789469
  
12  V.H. McNutt Hall 
	1400 North Bishop Avenue, Rolla, MO 65409
	<br />	37.955952,-91.7761095


13  Physics Building 
	1315 North Pine Street, Rolla, MO 65409
	<br />	37.9548854,-91.772087
  
14  Pine Building  //doesnt exist anymore

15 Rock Mechanics and Explosive Research Center 
	1006 Kingshighway, Rolla, MO 65409
	<br />	37.9471219,-91.7793533

16 Rolla Building 
	400 West 12th Street, Rolla, MO 65409
	<br />	37.9535584,-91.7741189

17 Schrenk Hall 
	400 West 11th Street, Rolla, MO 65409
	<br />	37.9528779,-91.7740627

18 Toomey Hall 
	400 West 13th Street, Rolla, MO 65409
	<br />	37.9542786,-91.7740034
