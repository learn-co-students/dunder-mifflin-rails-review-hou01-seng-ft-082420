class EmployeesController < ApplicationController
    before_action :current_employee, only: [:show, :edit, :update]

    def current_employee
        @employee = Employee.find(params[:id])
    end

    def index
        @employees = Employee.all
    end


    def show
    end

    def new
        @employee = Employee.new
        @dogs = Dog.all
    end
    
    def create
        new_employee = Employee.create(employee_params)
        if !new_employee.valid?
            flash[:errors] = new_employee.errors.full_messages
            redirect_to new_employee_path
        else
            new_employee.save
            redirect_to employee_path(new_employee)
        end
    end
    
    def edit
        @dogs = Dog.all
    end
    
    def update
        @employee.update(employee_params)
        redirect_to employee_path(@employee)
    end
    
    private 

        def employee_params
            params.require(:employee).permit(:first_name, :last_name, :alias, :office, :dog_id, :img_url)
        end
    
    
end
