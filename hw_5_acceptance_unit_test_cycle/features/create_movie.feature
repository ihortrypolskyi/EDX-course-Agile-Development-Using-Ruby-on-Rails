Feature: create movie
  As a Rottenpotatoes user
  So I can manage movies
  I can create movies

Background: movies in db
  Given the following movies exist:
  | title        | rating | director     | release_date |
  | Star Wars    | PG     | George Lucas |   1977-05-25 |
  | Blade Runner | PG     | Ridley Scott |   1982-06-25 |
  | Alien        | R      |              |   1979-05-25 |
  | THX-1138     | R      | George Lucas |   1971-03-11 |

Scenario: create a movie
  When I am on the RottenPotatoes home page
  And I follow "Add new movie"
  And I fill in "Title" with "Nice movie"
  And I select "G" from "Rating"
  And I select "2017" from "movie_release_date_1i"
  And I select "July" from "movie_release_date_2i"
  And I select "16" from "movie_release_date_3i"
  And I press "Save Changes"
  Then I should see "Nice movie was successfully created"
  And I should see "2017-07-16"
