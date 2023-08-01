class FurimaController < ApplicationController
  def index
    @furimas = furima.all
  end
end
