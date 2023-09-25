class BallsController < ApplicationController
    # 追加箇所
  before_action :authenticate_user!, only: [:new, :create]
  # ここまで
  #追加箇所
  def index
    if params[:search] != nil && params[:search] != ''
      #部分検索かつ複数検索
      search = params[:search]
      @balls = Ball.joins(:user).where("body LIKE ? OR user_id LIKE ?", "%#{search}%", "%#{search}%")
    else
      @balls = Ball.all
    end
  end

 # ここまで
    #追加箇所
def new
    @ball = Ball.new
  end

  def create
    ball = Ball.new(ball_params)
    ball.user_id = current_user.id
    if ball.save
      redirect_to :action => "index"
    else
      redirect_to :action => "new"
    end
  end

  def show
    @ball = Ball.find(params[:id])
  end

  def edit
    @ball = Ball.find(params[:id])
  end

  def update
    ball = Ball.find(params[:id])
    if ball.update(ball_params)
      redirect_to :action => "show", :id => ball.id
    else
      redirect_to :action => "new"
    end
  end

  def destroy
    ball = Ball.find(params[:id])
    ball.destroy
    redirect_to action: :index
  end

  private
  def ball_params
    params.require(:ball).permit(:body, :address, :title, :teamname, :image, :video, :lat,:lng)
  end

 #ここまで
end
