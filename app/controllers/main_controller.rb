class MainController < ApplicationController
    protect_from_forgery

    before_action :index

    protected

    def index
        @carros = Carro.take(3)
    end
end