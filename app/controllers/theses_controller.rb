class ThesesController < ApplicationController
  def index
    @theses = Thesis.all
  end

  def new
    @thesis = Thesis.new
  end

  def create
    @thesis = Thesis.new(thesis_params)

    if @thesis.save
      redirect_to(theses_path, notice: "The thesis #{@thesis.name} has been uploaded.")
    else
      render "new"
    end
  end

  def destroy
    @thesis = Thesis.find(params[:id])
    @thesis.destroy
    redirect_to(theses_path, notice: "The thesis #{@thesis.name} has been deleted.")
  end

  private
  def thesis_params
    params.require(:thesis).permit(:name, :attachment)
  end

end
