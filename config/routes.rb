Rails.application.routes.draw do
  get 'news/index'
  get 'news/data'
  get 'scrapes/test'
  get 'scrapes/green'
  get 'scrapes/indeed'
  get 'scrapes/type'
  get 'scrapes/wantedly'
  get 'scrapes/hellowork'
  get 'paypays/index'
  root 'webs#index'
  get 'webs/green'
  get 'webs/indeed'
  get 'webs/test'
  get 'webs/result'


end
