# Specifications for the Rails Assessment

Specs:
- [x] Using Ruby on Rails for the project
- [x] Include at least one has_many relationship (x has_many y; e.g. User has_many Recipes) 

	User        has_many :reviews 
	Restaurant 	has_many :reviews 
    Cuisine     has_many :restaurants

- [x] Include at least one belongs_to relationship (x belongs_to y; e.g. Post belongs_to User)

    Review 	    belons_to :user 
    Review 	    belons_to :restaurant
    Restaurant  belongs_to :cuisine

- [x] Include at least two has_many through relationships (x has_many y through z; e.g. Recipe has_many Items through Ingredients)

	Restaurant 	has_many users, through: reviews
	User 		has_many restaurants, through: reviews

- [x] Include at least one many-to-many relationship (x has_many y through z, y has_many x through z; e.g. Recipe has_many Items through Ingredients, Item has_many Recipes through Ingredients)

        ** Same as Above **

- [x] The "through" part of the has_many through includes at least one user submittable attribute, that is to say, some attribute other than its foreign keys that can be submitted by the app's user (attribute_name e.g. ingredients.quantity)
    
    Reviews - have content and a rating

- [x] Include reasonable validations for simple model objects (list of model objects with validations e.g. User, Recipe, Ingredient, Item)

	Review:     validates content and rating are present
	Restaurant: restaurnat_name ans cuisine are present
	User:       validates email is unique and email and name are present

- [x] Include a class level ActiveRecord scope method (model object & class method name and URL to see the working feature e.g. User.most_recipes URL: /users/most_recipes)

        scope :high_rated, -> {where("rating > 3")}
        Only shows reviews with ratings higher than 3 on restaurant show page

- [x] Include signup (how e.g. Devise)
- [x] Include login (how e.g. Devise)
- [x] Include logout (how e.g. Devise)

- [x] Include third party signup/login (how e.g. Devise/OmniAuth)

    Log in with Google

- [x] Include nested resource show or index (URL e.g. users/2/recipes)
	
        Restaurants/1/reviews

    resources :restaurants do 
        resources :reviews, only: [:new, :index]
    end

- [x] Include nested resource "new" form (URL e.g. recipes/1/ingredients/new)
	
    restaurants/1/reviews/new
    a new review for "Swell Taco"

- [x] Include form display of validation errors (form URL e.g. /recipes/new)
        use flash messages and have an _error_messages partial for validations

Confirm:
- [x] The application is pretty DRY
- [x] Limited logic in controllers
- [x] Views use helper methods if appropriate
- [x] Views use partials if appropriate