# SimpleToDoListForTeaching

This is a very small project that I used to teach an introduction to iOS development seminar. 

The project is a very simple To-Do List that I build along with the students. The aim of this project is to hit some important
topics in iOS development and give them familiarity with the platform so they can move forward and be able to pick up common practices
that will be helpful in learning other APIs in Apple's ecosystem. 

The audience taught was familiar with Java and so swift was used for its similarity in syntax.

### Topics:
- MVC Design
  - Had students write their own model
  - Taught them how to mediate control between presentation and data backend
- Custom Views (xib files)
  - After using Apple's default UI I showed students how to build their own views and how to use xib files to subclass UIView and load those views in code
- Delegate Patterns
  - Explained purpose of delegates and why it is different from general console programming that they are used to. Why we need things to happen asynchronously and be notfied on changes that occur in other modules
- UIKit and Animation
  - Styled user's views and added animation to add a nicer UI to the base application
- iOS storyboard and View Controller Designs
  - Navigation Controller use, how to connect outlets, eventually we moved away from storyboard to design our applicaiton layout through code which I find to be a lot more useful in general practice. 
  - Gave basic familiarity with autolayout constraints and the motivation behind its use. 
