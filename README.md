# ChimeSongRequest-iOS-

Chime Song Request: Request The Song that You Love!

Link(s) of GitHub repo of this app:
Backend:https://github.com/franklindtx/Chime-Song-Request-Backend
Design: https://www.figma.com/file/rBVuNon8vdcHqt4ObMJBPc/chime-song-requester?node-id=1%3A3

I have added a Log-in feature to the app in order to make users put their own song requests by using their names. However, the process is completely anonymous so even if the user logged in with their names, other users are not able to see who requested which songs.

After logging in to the app, users can choose either to request songs with the button “Request a Song” in the main screen or to see which songs are requested on the board by tapping the button “View Requested Songs”. 

In the “Request a Song” screen, users can type a song name, a reason why they want the song to be played, and details of the song (like a version of the song they want to be played). In the text fields, upon each time users tap on the text box, the placeholder disappears and users can type their own words inside each box. If users do not type anything inside the box and move to the next textbox, the placeholder would reappear. After entering all the fields, they can tap the “Submit Request” button to submit the request and the app will go back to the main screen if the request was successful. 

If users tap “View Requested Songs” in the main screen, the “Request Details” screen will pop up, showing the list of all songs that were requested by users. Users can tap each row to upvote the song they like after reading the reason for requesting the songs and the details. (Upvote functionality is not implemented for now though.)

A short description of your app (its purpose and features)
It is well known that Cornell students can request songs that they want Chimemasters to play in specific time periods (like Monday at 5:30 to 5:35 or so). However, since many students do not know about how to request songs that they want to be played, I tried making this app in order to make the requesting process easier and more convenient. 

Students are limited to requesting only one song per a day that they must request a week beforehand and three songs to be played per day: one for the song that gets the most votes from other students and two based on the selection of Chimemasters after reading song requests with their reasons why they want that song.

![image5](https://raw.githubusercontent.com/franklindtx/Chime-Song-Request-Backend/master/image5.png)
I integrated the app with its API. After a user logs in to the app by using the log-in feature of the app on the very first screen (by entering his/her name and tapping the “Sign In” button,) the app automatically creates a new user object and saves it in the server with his/her name as shown above. Also, when the user inputs the details of the song that he/she wants to be played in “Request a Song” screen, the app automatically creates a song object and saves it in the User object that the user has previously created.
