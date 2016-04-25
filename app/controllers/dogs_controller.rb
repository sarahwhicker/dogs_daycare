class DogsController < ApplicationController
  def index
  	@dogs = Dog.all
  end

  def new
  	@dog = Dog.new
  end

  def create
  	@dog = Dog.new(dog_params)
  	if @dog.save
  		redirect_to dogs_url, notice: "Successfully Saved!"
  	else
  		flash.now[:notice] = "Something went wrong. Didn't save your dog."
  	end
  end

  def show
    @dog = Dog.find(params[:id])
  end

  def edit
    @dog = Dog.find(params[:id])
  end

  def update
    @dog = Dog.find(params[:id])
    if @dog.update(dog_params)
      redirect_to dogs_url, notice: "Successfully updated!"
    else
      flash.now[:notice] = "Something went wrwong. Didn't update your dog."
      render:edit
    end
  end

  def destroy
    @dog = Dog.find(params[:id])
    if @dog.destroy
      redirect_to dogs_url, notice: "Successfully deleted!"
    else
      redirect_to dogs_url, notice: "Could not delete."
  end
end

private
  def dog_params
  	params.require(:dog).permit(:name, :breed, :age, :owner)
  end

end
