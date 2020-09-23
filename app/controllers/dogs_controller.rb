class DogsController < ApplicationController

    def index
        @dogs = Dog.all
    end

    def show
        @dog = Dog.find(params[:id])
    end

    def new
        @dog = Dog.new
    end

    private

    def dogs_params
        params.require(:dog).permit(:name, :breed, :age)
    end

end
