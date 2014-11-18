##Yelp Clone


#### Learning about the Ruby on Rails framework by recreating a clone of the yelp.co.uk website. This was a week-time project during Week 8 at Maker's Academy. 


###The Objective

The goal of the project was to gain familiarity with Rails, focusing especially on:

+ Creating Rails applications
+ The structure of Rails apps (MVC, the router, helpers)
+ TDD in Rails, with RSpec & Capybara 
+ Associations
+ Validations
+ AJAX in Rails

### Requirements
* Users can add / delete a restaurant
* Users can only edit/delete restaurants that they've created
* Users cannot create a restaurant with the same name - uniqueness validation
* Each restaurnat can have a photo upload 
* A default photo is assigned to a restaurant if none's uploaded
* Restaurant name length is validated
* Reviews can be left for each restaurant
* A user can only leave one review per restaurant
* Users can delete only their own reviews
* Users can log in via Facebook
* A user must be logged in to create restaurants
* A restaurant must display an average star rating
* A user can endorse someone elses review
* The number of endorsements for a review should automatically update (AJAX)


### How To Use

To run locally:  
```$ cd yelp_clone```  
```$ rails s```


### Technologies Used
* Rails
* Ruby
* PostgreSQL
* RSpec
* Capybara
* Poltergiest
* Devise Gem 
* Omniauth 
* Facebook API
* AJAX in Rails


### To do 
- [ ] Get 'Endorse' button to stop showing once you have endorsed a restaurant.  
- [ ] Beautify with CSS
- [ ] Deploy to Heroku/AWS


