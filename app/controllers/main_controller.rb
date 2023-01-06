class MainController < ApplicationController
    protect_from_forgery

    before_action :main

    protected

    def main
        @carros = Carro.take(3)
    end
end