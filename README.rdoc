wdi_project_1
=============

Link:  http://guarded-brushlands-3613.herokuapp.com/

Gems Used
=============
gem 'rails', '4.1.0'
gem 'pg'
gem 'sass-rails', '~> 4.0.3'
gem 'uglifier', '>= 1.3.0'
gem 'coffee-rails', '~> 4.0.0'
gem 'jquery-rails'
gem 'turbolinks'
gem 'jbuilder', '~> 2.0'
gem 'sdoc', '~> 0.4.0'
gem 'httparty'
gem 'pry-rails'
gem 'pry'
gem 'faker'
gem 'bcrypt'
gem 'rails_12factor'

A frequent question that every man has asked or has been asked is “where can I take a girl to our first date?”  When that issue has been addressed, the question of where to take the girl on the next date still lingers.  Second Date seeks to make life easier by giving men an easy source of options without being overburdened with immense databases of restaurants. 

APIs

The app uses Foursquare API and categorizes the venues into date 1-3 & Bad spots with the option for fellow peers to give feedback.  The static googe map API was also utilitized

Going forward...
Looking into modifying models to optimize performance and decrease the number of queries.


May 21, 2014
Published on Heroku


===================================================================

Scope

user should be able to log in
user should be able to browse date spots according to date number
user can view detailed information of a venue
approval rating of categorization for each venue by percentage
ex. date1 10% date2 10% date3 10% etc
user can give an approval or downgrade for the venue
user can post a short comment
user can edit a short comment
user can delete a comment

(the venues should be displaying in categories in which it has the highest approval rating for a %)
(the venue can be removed if it has enough negative votes?)


Milestones
May 16 Friday
create rails project and create database+tables
finalize decision on boolean for joiner columns or integer
create basic routes
connect to api
begin create user/log in

May 17 Saturday
having working HTTP requests on desired data from API
start trying to seed tables
create spot ratings


May 18 Sunday
finish seeding tables
finish categorizing by dates
categorize spots by approval ratings on dates

May 19 Monday
User CRUD on comments
work on all edge cases and validation

May 20 Tuesday
continue to validate
work on unfinished stuff
if finished attempt to parse through “tips” of the api for keywords
refactor
May 21 Wednesday
CSS

