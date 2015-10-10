class Instructor::LessonsController < ApplicationController
	before_action :authenticate_user!
	before_action :remove_authorized_for_current_session

	def new
		@lesson = Lesson.new
	end

	def create
		@lesson = current_session.lessons.create(lesson_params)
		redirect_to instructor_course_path(current_session.course)
	end

	private 

	def remove_authorized_for_current_session
		if current_session.course.user != current_user
			return render :text 'Unauthorized', :status => :unauthorized
		end
	end

	helper_method :current_session
	def current_session
		@current_session ||= Section.find(params[:section_id])
	end

	def lesson_params
		params.require(:lesson).permit(:title, :subtitle)
	end

end
