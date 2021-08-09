Rails.application.routes.draw do
  get 'news/index'
  root 'news#yahoo'
  get 'scrapes/test'
  get 'scrapes/green'
  get 'scrapes/indeed'
  get 'scrapes/type'
  get 'scrapes/wantedly'
  get 'scrapes/hellowork'
  get 'paypays/index'
  get 'webs/index'
  get 'webs/green'
  get 'webs/indeed'
  get 'webs/test'
  get 'webs/result'


end
