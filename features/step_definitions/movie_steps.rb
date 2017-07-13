Given(/^the following movies exist:/) do |movies|
    movies.hashes.each do |movie|
        Movie.create(movie)
    end
end

Then(/^the director of "([^"]*)" should be "([^"]*)"$/) do |movie_title, director|
    movie = Movie.where(title: movie_title).first
    expect(movie.director).to eql(director)
end