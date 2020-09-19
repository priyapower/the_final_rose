class Bachelorettes::ContestantsController < BachelorettesController
  def index
    @bachelorette = Bachelorette.find(params[:bachelorette_id])
    @contestants = @bachelorette.contestants
    @hometowns = @contestants.distinct.pluck(:hometown)
  end
end
