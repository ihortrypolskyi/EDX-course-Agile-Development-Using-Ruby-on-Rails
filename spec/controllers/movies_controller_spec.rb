require 'rails_helper'

RSpec.describe MoviesController, type: :controller do
    describe 'get similar' do
        context 'with valid director' do
            before(:each) do
                allow(Movie).to receive(:find).and_return(
                    double(:movie, id: 198, title: 'dummy title', director: 'dummy director')
                )
            end
            
            after(:each) do
                get :similar, id: 198
            end
            
            it 'is a valid action' do
            end
            
            it 'gets a movie' do
                expect(Movie).to receive(:find)
            end
            
            it 'searches for director' do
                expect(Movie).to receive(:where).with(director: 'dummy director')
            end
        end
        
        context 'with not valid director' do
            before(:each) do
                allow(Movie).to receive(:find).and_return(
                    double(:movie, id: 198, title: 'dummy title', director: '')
                )
                get :similar, id: 198
            end
            
            it 'does not search for director' do
                # get :similar, id: 198
                expect(Movie).to_not receive(:where)
              
            end
            
            it 'redirects to home page' do
                # get :similar, id: 198
                expect(response).to redirect_to(movies_path)
            end
            
            it "rises warning" do
                # get :similar, id: 198
                expect(flash[:warning]).to match (/has no director info/)
            end
        end
    end
end