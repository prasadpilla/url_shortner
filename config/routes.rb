Rails.application.routes.draw do
  
  #Keeping these as get requests so that it would be easy for manual test
  get '/:hex' => "shortner#process_and_redirect"
  post '/generate' => "shortner#generate"
  
end
