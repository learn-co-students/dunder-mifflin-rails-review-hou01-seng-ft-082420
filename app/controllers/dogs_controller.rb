class DogsController < ApplicationController

    def index
        @dogs = Dog.all.group(:owners).count
        byebug
    end

    def show
        @dog = Dog.find(params[:id])
    end


end
