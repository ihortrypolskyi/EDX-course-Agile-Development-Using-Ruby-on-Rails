Given(/^the following movies exist:/) do |movies|
    movies.hashes.each do |movie|
        Movie.create(movie)
    end
end

Then(/^the director of "([^"]*)" should be "([^"]*)"$/) do |movie_title, director|
    movie = Movie.where(title: movie_title).first
    expect(movie.director).to eql(director)
end

Then /I should see "(.*)" before "(.*)"/ do |e1, e2|
  #  ensure that that e1 occurs before e2.
  #  page.body is the entire content of the page as a string.
  expect(page.body).to have_content /(#{e1})(.+)(#{e2})/m
end

# Make it easier to express checking or unchecking several boxes at once
#  "When I uncheck the following ratings: PG, G, R"
#  "When I check the following ratings: G"

When /I (un)?check the following ratings: (.*)/ do |uncheck, rating_list|
  # HINT: use String#split to split up the rating_list, then
  #   iterate over the ratings and reuse the "When I check..." or
  #   "When I uncheck..." steps in lines 89-95 of web_steps.rb
  rating_list.split(/[\s,]/).each do |rating|
    if uncheck
      step "I uncheck \"ratings_#{rating}\""
      # step "I #{uncheck}check \"ratings_#{rating}\""
    else
      step "I check \"ratings_#{rating}\""
    end
  end
end

Then /I should see all the movies/ do
  # Make sure that all the movies in the app are visible in the table

    expect(page.all('table#movies tbody tr').count).to eq Movie.all.count
    # page.should have_selector('#movies tr', count: 11)
    # expect(page).to have_selector('#movies tr', count: 11)
end

