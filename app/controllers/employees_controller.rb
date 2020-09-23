class EmployeesController < ApplicationController

    def index
        @employees = Employee.all
    end

    def show
        @employee = Employee.find(params[:id])
    end

    def new
        @employee = Employee.new
    end

    def create
        @employee = Employee.new(employee_params(:first_name, :last_name, :alias, :title, :office, :dog_id, :img_url))
        if !@employee.valid?
            byebug
            flash[:errors] = @employee.errors.full_messages
            redirect_to new_employee_path
        else
            @employee.save
            redirect @employee
        end
    end

    private

    def employee_params(*args)
        params.require(:employee).permit(*args)
    end

end