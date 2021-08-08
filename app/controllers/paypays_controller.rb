class PaypaysController < ApplicationController

  include Paypay

  def index
    if params[:format] == "paypay"
      @paypay = paypay
    end
    @paypay = Paypay.new
  end
end
