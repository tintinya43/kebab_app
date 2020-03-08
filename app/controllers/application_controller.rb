class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

 def hello
render html:   "i love kebab!!!!!!!!!"
 end
end
