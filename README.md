rails-dict
==========

emberjs+rails dictionary


Dev notes:  
1. After installing of  client_side_validations-ember gem and executing "rails g client_side_validations:copy_assets"  I chenged
this   
 `App.User.reopen({validations: emberValidations});`   
to
 `model.reopen({validations: emberValidations});`    
in *app/assets/jsvascripts/rails.validations.ember.js.erb*      

2. Twitter/facebook authentication with omniauth, devise  by this tutorial: http://www.orhancanceylan.com/rails-twitter-and-facebook-authentications-with-omniauth-and-devise/
Looks like bug of gem