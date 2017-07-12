Given(/^the following movies exist:/) do |movies|
    movies.hashes.each do |movie|
        Movie.create(movie)
    end
end

When(/^(?:|I )go to (.+)$/) do |page_name|
  visit path_to(page_name)
end