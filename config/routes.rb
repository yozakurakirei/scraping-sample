Rails.application.routes.draw do
  root 'webs#index'
  get 'webs/green'
  get 'webs/indeed'
  get 'webs/test'
  get 'webs/result'


end
