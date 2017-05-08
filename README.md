# shoebill_api
 A Grape API mounted on Rails for the graduates in our cohort
 
# Production Host
https://shoebill-api.herokuapp.com/graduates

# GET /v1/graduates
Returns an array with of all the students
https://shoebill-api.herokuapp.com/api/v1/graduates/

# GET /v1/graduates/1
Returns an array of each student sorted by ID. 
https://shoebill-api.herokuapp.com/api/v1/graduates/1

# RUN
bundle install<BR>
rails s

# DOCS
https://github.com/ruby-grape/grape

# EXAMPLES
http://www.ruby-grape.org/examples/

-----------------------------------------------------
# BUILDING 

gem 'grape'<br>
-Grape's DSL to easily construct an API out of our Rails backend

gem 'rack-cors', :require => 'rack/cors'<br>
-shares our backend resources with others using Cross Origin Resource protocol.
-(Cross-site HTTP requests are HTTP requests for resources from a different domain than the domain of the resource making the request. - MDN)

gem 'grape-active_model_serializers'<br>
-Serializer takes the return value of calling Graduate.all and converts it from an array of Ruby objects into valid JSON.


API file structure <br>
 -nest your base.rb and endpoints inside of a folder in your controller        
 -Grape supports versioning
 
ENDPOINT
 -inside of graduates is where we define our endpoint and logic
   
    get "", root: :graduates do
      Graduate.all
    end
        
    params do
      requires :id, type: String, desc: "ID of the 
        graduate"
    end
    get ":id", root: "graduate" do
      Graduate.where(id: permitted_params[:id]).first!
    end
    
ROUTING
   Rails.application.routes.draw do  
     mount API::Base, at: "/"
   end
   
SERIALIZING   
  -Serializer takes the return value of calling Graduate.all and converts it from an array of Ruby objects into JSON.  
  
  app/serializers/graduate_serializer.rb
  -class GraduateSerializer < ActiveModel::Serializer
  attributes :id, :first_name, :last_name, :cohort, 
        :bio, :website, :picture, 
       :created_at, :updated_at
  end  
  -If you decide to seed your own database, make sure to match the attributes with the columns in your database 
  
