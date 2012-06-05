Happycities::Application.routes.draw do
  root :to => 'comparisons#home'
  post '/compare' => 'comparisons#compare'
end
