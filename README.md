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

Looks like bug of gem