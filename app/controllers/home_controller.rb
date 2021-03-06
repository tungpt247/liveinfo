class HomeController < ApplicationController
  def index
  end

  def products
    arr = []
    20.times do |i|
      arr << {
        "id" => i,
        "title" => Faker::Commerce.product_name,
        "photo" => Faker::Avatar.image
      }
    end

    json = arr.to_json
    render json: json, status: :ok
  end

  def login
    user_name = params[:username]
    pass_word = params[:password]
    unless user_name == "mvvm" && pass_word == "123"
      render json: nil, status: :bad_request
    else
      json = {
     "userName" => user_name ,
     "password" => pass_word
     }.to_json
    render json: json, status: :ok
    end
  end

end
