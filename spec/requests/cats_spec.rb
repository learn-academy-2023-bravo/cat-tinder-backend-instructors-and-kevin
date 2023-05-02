require 'rails_helper'

RSpec.describe "Cats", type: :request do
  describe "GET /index" do
    it "gets a list of cats" do
      Cat.create(
    name: 'Kevin',
    age:9,
    enjoys: 'talk to the dogs who walk by the window',
    image: 'https://c2.peakpx.com/wallpaper/591/784/17/cat-animal-pet-cat-face-head-black-wallpaper-preview.jpg'
      )
      # make our request to the specfic endpoint
      get '/cats'

      # we want our response to be formatted in JSON
      cat = JSON.parse(response.body)
      expect(response).to have_http_status(200)
      expect(cat.length).to eq 1
    end
  end

  describe "POST /create" do
    it "creates a cat" do
      # remember with create we need params
    cat_params = {
      cat: {
        name: 'Kevin',
        age:9,
        enjoys: 'talk to the dogs who walk by the window',
        image: 'https://c2.peakpx.com/wallpaper/591/784/17/cat-animal-pet-cat-face-head-black-wallpaper-preview.jpg'
      }
    }
    # make the request to the specific endpoint 
    post "/cats", params: cat_params
    expect(response).to have_http_status(200)
    cat = Cat.first 
    expect(cat.name).to eq 'Kevin'
    expect(cat.age).to eq 9
    expect(cat.enjoys).to eq 'talk to the dogs who walk by the window'
    expect(cat.image).to eq 'https://c2.peakpx.com/wallpaper/591/784/17/cat-animal-pet-cat-face-head-black-wallpaper-preview.jpg'
  end 
  end

  describe 'cannot create a cat without valid attributes' do
    it 'cannot create a cat without a name' do
      cat_params = {
        cat: {
          age: 2,
          enjoys: 'cuddles and belly rubs',
          image: 'normalcat.jpg'
        }
      }
    post '/cats', params: cat_params
    cat = JSON.parse(response.body)
    puts "******** ", response.body

    expect(response).to have_http_status(422)
    expect(cat['name']).to include "can't be blank"
    end

    it 'cannot create a cat without an age' do
     cat_params = {
      cat: {
        name: 'Boo',
        enjoys: 'being very cute',
        image: 'somecutepic.jpg'
      }
     }
     post '/cats', params: cat_params
     cat = JSON.parse(response.body)
     expect(response).to have_http_status(422)
     expect(cat['age']).to include "can't be blank"
    end
  end

describe "cannot update a cat without valid attributes" do
  it 'cannot update a cat without a name' do
    # first create a cat with a name
    cat_params = {
      cat: {
        name: 'Boo',
        age: 2,
        enjoys:'laying in the sun',
        image: 'somepic.com'
      }
    }
    post '/cats', params: cat_params
    cat = Cat.first
    # Then create updated params
    update_params = {
      cat: {
        name: "",
        age: 2,
        enjoys: 'lots of love and attention',
        image: 'cat.com'
      }
    }
    patch "/cats/#{cat.id}", params: update_params
    cat = JSON.parse(response.body)
    expect(response).to have_http_status(422)
    expect(cat['name']).to include "can't be blank"
  end
end


end
