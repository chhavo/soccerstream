class TeamsController < ApplicationController
  def index
    @teams = Team.all
  end

  def show
    @team = Team.find(params[:id])
  end

  def new
    @team = Team.new
    @teams = Team.all
  end

  def create
    @team = Team.new
    @team.team_name = params[:team_name]
    @team.live_game = params[:live_game]
    @team.upcoming_game = params[:upcoming_game]
    @team.team_news = params[:team_news]
    @team.live_commentary = params[:live_commentary]

    if @team.save
      redirect_to "/teams", :notice => "Team created successfully."
    else
      render 'new'
    end
  end

  def edit
    @team = Team.find(params[:id])
  end

  def update
    @team = Team.find(params[:id])

    @team.team_name = params[:team_name]
    @team.live_game = params[:live_game]
    @team.upcoming_game = params[:upcoming_game]
    @team.team_news = params[:team_news]
    @team.live_commentary = params[:live_commentary]

    if @team.save
      redirect_to "/teams", :notice => "Team updated successfully."
    else
      render 'edit'
    end
  end

  def destroy
    @team = Team.find(params[:id])

    @team.destroy

    redirect_to "/teams", :notice => "Team deleted."
  end
end
