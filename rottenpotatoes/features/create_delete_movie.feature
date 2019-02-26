Feature: Add and delete movie
 
  As an administrator
  So that I can manage the movies library
  I want to add new movie or delete movie

Background: movies have been added to database
  
  Given the following movies exist:
  | title        | rating | director     | release_date |
  | Star Wars    | PG     | George Lucas |   1977-05-25 |
  | Blade Runner | PG     | Ridley Scott |   1982-06-25 |
  | Alien        | R      |              |   1979-05-25 |
  | THX-1138     | R      | George Lucas |   1971-03-11 |

  And I am on the RottenPotatoes home page

Scenario: add a new movie
  When I follow "Add new movie"
  And  I fill in "Title" with "Alita: Battle Angel"
  And  I fill in "Director" with "Robert Rodriguez"
  And  I select "PG-13" from "Rating"
  And  I select "2019" from "movie_release_date_1i"
  And  I select "February" from "movie_release_date_2i"
  And  I select "14" from "movie_release_date_3i"
  And  I press "Save Changes"
  Then I should see "Alita: Battle Angel was successfully created."
  And  I should see "PG-13"
  And  I should see "2019-02-14 00:00:00 UTC"

Scenario: delete a movie
  Given I am on the details page for "Alien"
  When  I press "Delete"
  Then  I should see "Movie 'Alien' deleted."
  And   I should not see "1979-05-25 00:00:00 UTC" 