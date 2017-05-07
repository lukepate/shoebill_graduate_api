class GraduatesController < ApplicationController
  def index
    @graduates = Graduate.all
  end
  def show
    @graduates = Graduate.find_by(id: params[:id])
  end
end
