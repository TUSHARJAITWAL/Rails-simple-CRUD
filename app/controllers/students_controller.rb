class StudentsController < ApplicationController
    before_action :set_student,only: %i[show edit update destroy]
    def index
        @students = Student.all
    end

    def new
        @student = Student.new
    end

    def create
        @student = Student.create(students_params)
        if @student.save
            redirect_to students_path,notice: "Student has been created successfully"
        else
            render :new, status: :unprocessable_entity
        end
    end

    def show
    end

    def edit
    end
    
    def update

        if @student.update(students_params)
            redirect_to student_path,notice: "Student has been updated successfully"
        else
            render :new
        end
    end

    def destroy
        @student = Student.find(params[:id])
        @student.destroy
        redirect_to students_path,notice: "Student has been deleted successfully"
    end

    private
    def students_params
        params.require(:student).permit(:first_name,:last_name,:email,:address,:college)
    end

    def set_student
        @student = Student.find(params[:id])
    end
end

