
# Assignment 1 (Individual, 10 Points)

As your first assignment, you have to complete an app that we’ve provided for you. To do this, download the base project assignment_1_base_project.zip from the Übung 1 folder in Stud.IP and unzip it.

Open the folder with the code editor of your choice (for example, Android Studio or Visual Studio Code). Select an Android emulator or an iOS simulator and start the project.

The app shows a list with two Game of Thrones characters. After 3 seconds, another character is appended to the list. This simulates the reloading of characters from the Internet (which sometimes takes a while). When you tap on a character, nothing happens at the moment.

First of all, familiarize yourself with the project. On the left side you see the following project tree:

In the lib folder you will find 5 files that are relevant for this assignment:

 character.dart
 database.dart
 api.dart
 character_detail_screen.dart
 characters_list_screen.dart

Look through all the files at your leisure and try to understand as much as possible.


## Tasks


## Open the detail page of a character (1 point)
* Currently nothing happens when you tap on a character. Change this.
* You have to do this in the file characters_list_screen.dart, in line 55.

## Use the freely available GoT API from https://anapioficeandfire.com to download a list of at least 100 Game of Thrones characters from the Internet (4 points):
* The displayed characters must have at least one name, one gender and at least one alias. Do not save characters with any of the fields empty. Additionally, make sure that no character with the same name is saved twice.
* The API documentation (https://anapioficeandfire.com/Documentation) tells you how to load multiple pages of characters.
* Use the http package (https://pub.dev/packages/http) to download the API data.
* Download the GoT characters via the https://anapioficeandfire.com/api/characters route. See the api.dart file in the project. Revise the method fetchRemoteGoTCharacters. Here a list with the downloaded character objects should be returned at the end.
* The list of GoT characters is downloaded in the JSON format (https://de.wikipedia.org/wiki/JavaScript_Object_Notation). Convert the objects in it to character objects (see character.dart) so you can use them in the project.
 
## Save and load the downloaded characters to/from a database in the app (4 points)
* You can use any database for this task. We recommend the package hive.
* Extend the Database class (see the database.dart file) so that you can store the character objects created in Task 1 in a database. To do this, you will probably also have to modify the Character class (see the character.dart file). Tip: everything you need to know about this can be found in the documentation of the database you are using.
* In the database class (file database.dart) there already exists a method to save the downloaded character objects. Paste your code here. Be careful not to save characters multiple times just because you restart the app and the api is called again.
* If everything worked, the app should now do exactly what it is supposed to do. Note: downloaded characters are now saved (cached) in the database. This means that when you start the app again, the list will already be saved and you won't notice it being reloaded and saved. Delete the app from the emulator/simulator to test if everything works as you expect.

## Bonus task: make the app more beautiful (1 point + 1 bonus point)
* Let your creativity run wild and make the app a bit more beautiful. For example, play around with the colors and fonts, add more attributes to a character's details page, make the list of characters searchable, etc.
* The bonus point is awarded only if you have put extra effort into the embellishment.



# Deadline: Sun., 25.04.2021, 23:59 hrs

Archive the project you finished as a .zip file (the whole project folder) and name it like this:
lastname_firstname_uebung_1.zip -> put in your last and first name, of course. I.e. a correct submission would be named as follows: autzen_nico_uebung_1.zip.

If your submission is not named correctly, we will not be able to assign it to you and you will not receive any points.

Upload your submission to the folder 'Übung 1/Abgaben' in Stud.IP, until Sun. 25.04.2021, 23:59 at the latest. Attention: the folder closes automatically!

If your submission is too large for Stud.IP, you can do the following:
* Instead of archiving the entire project folder, copy all the folders and files in it except the build folder to a new folder and archive it.
* The build folder is very large and is not needed to build the project.
* Also the hidden files are not submitted in this way. These are also not needed by us.
