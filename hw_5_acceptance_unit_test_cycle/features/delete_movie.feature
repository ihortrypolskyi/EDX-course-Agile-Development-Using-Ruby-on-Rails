Feature: delete movie
  As a Rottenpotatoes user
  So I can manage movies
  I can delete movies

Background: movies in db
  Given the following movies exist:
  | title        | rating | director     | release_date |
  | Star Wars    | PG     | George Lucas |   1977-05-25 |
  | Blade Runner | PG     | Ridley Scott |   1982-06-25 |
  | Alien        | R      |              |   1979-05-25 |
  | THX-1138     | R      | George Lucas |   1971-03-11 |

Scenario: delete a movie
  When I am on the RottenPotatoes home page
  And I follow "More about Star Wars"
  Then I am on the details page for "Star Wars"
  And I press "Delete"
  Then I should see "Movie 'Star Wars' deleted"
  But I should not see "1977-05-25"