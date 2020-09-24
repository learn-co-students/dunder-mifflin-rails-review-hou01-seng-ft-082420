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
        new_employee = Employee.new(employee_params)

        if !new_employee.valid?
            flash[:errors] = new_employee.errors.full_messages
            redirect_to new_employee_path
        else
            new_employee.save
            redirect_to employee_path(new_employee)
        end
    end

    def edit
        @employee = Employee.find(params[:id])
        @dogs = Dog.all
    end

    def update
        @employee = Employee.find(params[:id])
        @employee.update(employee_params)

        redirect_to @employee

    end

    private

    def employee_params
        params.require(:employee).permit(:first_name, :last_name, :alias, :title, :office, :img_url, :dog_id)
    end

end
