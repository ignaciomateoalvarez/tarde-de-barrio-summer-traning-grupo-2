class AsistsController < ApplicationController
  def update
    @asist = Asist.find(update_params[:asist])
    @asist.asist = update_params[:value]
    @asist.save
  end

  private

  def update_params
    params.require(:asists).permit(:asist, :value)
  end
end
