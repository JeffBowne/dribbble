class HomeController < ActionController::Base

  def index
    @shots = APIS::Dribbble.new.dribbble_get_shots
  end

  def shot
    if params[:id]
      @shot = APIS::Dribbble.new.dribbble_get_shot params[:id]
    else
      redirect_to :root
    end
  end

  def rebounds
    if params[:id]
      @shots = APIS::Dribbble.new.dribbble_get_rebounds params[:id]
    else
      redirect_to :root
    end
  end

end