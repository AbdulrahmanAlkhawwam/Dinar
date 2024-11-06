# Dinar

cash flow mobile app 

## Video Demo:

[youtube video demo](https://www.youtube.com/watch?v=DLoSJ-Sw42Q)

## Tech Was used :-

this project was build step by step with clean [Architecture](https://resocoder.com/2019/08/27/flutter-tdd-clean-architecture-course-1-explanation-project-structure/)
in flutter , and use figma website to design the UI/UX , but it is not very perfect ... 
i am learned more things in this app like :-
    
  - SQL in flutter framework which named [sqflite](https://pub.dev/packages/sqflite)
  - Flutter from [docs](https://docs.flutter.dev/get-started/learn-flutter)
  - Architecture for flutter project which named [clean Architecture](https://resocoder.com/2019/08/27/flutter-tdd-clean-architecture-course-1-explanation-project-structure/)

## Description:

- When you open the application for the first time, you will see this interface and 2 others similar
  in design and you will be asked to add your own `categories` and the `wallets` you own ...

- Someone might say what are the categories and how do I know my own categories ??
  Perhaps one day you bought food for your family and on the way back you took a taxi ... This means
  that you have within your categories the categories of `food` and `transportation` … etc.

- And as another says, what are wallets and what is the benefit of more than one???
  When you are in a financial transaction with many people... like a candy seller or a pizza
  restaurant and you don’t pay the bills immediately and collect them at the beginning or end of the
  month ... Having multiple wallets helps you for not to overlap data and quickly reach your goal

- After completing this, the application will take you to the `home page` that allows you to save
  the purchases or collections operation that you did , and take you a list of previously operation
  which added before.

- In the home page there are Four main sections which are:
  ```
   * Add Operation Section
   * Wallets Section
   * Categories Section
   * History Section
  ```

- When you add an `Operation` , add page will appear and asking you to enter (the operation name,
  its value, the type of category , the wallet that performed that operation, and the date if you
  want to add it { and if you don’t add a date ... it takes the date the operation was saved} and
  saved in history )

- On the `details page`, you will see all the operations related to a specific category or wallet ,
  along with the total amounts paid or earned from these operations.

- If you want to delete this `category` or `wallet`, you must delete all operations related to it.
  As for deleting an operation , you can delete any operation by long pressing on it and confirming
  the deletion operation, noting that it is not possible to recover anything that has been deleted.