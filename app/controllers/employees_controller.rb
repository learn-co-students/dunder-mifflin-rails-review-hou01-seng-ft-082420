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
        @new_employee = Employee.new(employ_params)
        if !@new_employee.valid?
            flash[:errors] = @new_employee.errors.full_messages 
            redirect_to new_employee_path 
        else
            @new_employee.save
            redirect_to employee_path(@new_employee)
        end
    end

    def edit
        @employee = Employee.find(params[:id])
        @dogs = Dog.all
    end

    def update
        @employee = Employee.find(params[:id])
        @employee.update(employ_params)
        if !@employee.valid?
            flash[:errors] = @employee.errors.full_messages
            redirect_to edit_employee_path(@employee)
        else
            redirect_to employee_path(@employee)
        end
    end

    private

    def employ_params
        params.require(:employee).permit(:first_name, :last_name, :alias, :title, :office, :dog_id)
    end

end
