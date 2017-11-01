# Paladin

* https://salty-everglades-69252.herokuapp.com/

This app is designed for players of the tabletop role-playing game, Dungeons and Dragons, to create and maintain characters and groups used in their games.

* Technologies Used
  This app was made with Ruby on Rails in the backend. It's front-end is embedded Ruby along with a small amount of javascript. I also used the CSS framework Materialize to style the app.

* Installation Steps
  Ensure that you have ruby and ruby on rails installed on your computer. When you open the app, ensure to run bundle install as well, to confirm all gems are installed. This is all you should need to do to have the app up and running.

* Wireframe Link
  https://balsamiq.cloud/sotpy/p9b0

* User Stories Link
  https://trello.com/b/jE4CSjjw/dnd-character-creator

* Entity Relationships
  A User -> Has Many Characters
  A Character -> Belongs To A Party
  A Party -> Belongs To A User

* Unsolved Problems and Future features
  The biggest struggle I had was getting data from the API I chose to use for this project. It required me to make lots of individual calls to the API in order to get specific information. It also did not contain all the information that I needed. Upon researching this further, I was unable to find an API that was easier to navigate through and/or one that had all the information I required. In order to solve this problem, I would have needed to hardcode all the data that was required to create a character.

  Future features for this app include a complete character creator with all the required data available. I would also like the party feature to be helpful for Dungeon Master's and provide more information about each character within the party.
