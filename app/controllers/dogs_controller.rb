class DogsController < ApplicationController
    def index
        @dogs = Dog.all
    end

    def show
        @dog = Dog.find(params[:id])
    end

    def index
        #@dog = Dog.all(sort_by :employees)
        @dogs = Dog.billy
    end
end

