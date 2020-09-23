class EmployeesController < ApplicationController
    def index
        @employees = Employee.all
    end

    def show
        @employee = Employee.find(params[:id])
    end

    def new
        @employee = Employee.new
        @dogs = Dog.all
    end

    def create
        #byebug
        employee = Employee.new(employee_params)

    if !employee.valid? #if charcater is NOT valid, meaning the data is wrong 
     # if errors, redirect_to the new form WITH errors available to us for user to see
                # byebug
        flash[:errors] = employee.errors.full_messages #add errors from model to our flash hash
            redirect_to new_employee_path #redirect
        else
            employee.save #save 
            redirect_to employee_path(employee) #go to show page of THAT character
        end                  
    end 
        
    def employee_params
        params.require(:employee).permit(:first_name, :last_name, :alias, :title, :office, :dog_id)
    end

    def edit
        @employee = Employee.find(params[:id])
        @dogs = Dog.all
    end

    def update
        @employee = Employee.find(params[:id])
        @employee.update(employee_params)
        redirect_to employee_path(@employee)
    end    
end
