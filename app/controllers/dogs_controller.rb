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

<<<<<<< HEAD
    def create

    end

    def edit

    end

    def update

    end

    
    
    
    
    
=======
>>>>>>> 862afd2750da96d1fe654aaf16df8394495dbf61
    private

    def dogs_params
        params.require(:dog).permit(:name, :breed, :age)
    end

end
