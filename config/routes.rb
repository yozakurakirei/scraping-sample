Rails.application.routes.draw do
  get 'yahoo_apis/index'
  get 'yahoo_apis/work'
  get 'news/index'
  root 'news#yahoo'
  get 'scrapes/test'
  get 'scrapes/green'
  get 'scrapes/indeed'
  get 'scrapes/type'
  get 'scrapes/wantedly'
  get 'scrapes/hellowork'
  get 'webs/index'
  get 'webs/green'
  get 'webs/indeed'
  get 'webs/test'
  get 'webs/paypay'


end
