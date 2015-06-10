require 'open-uri'

class TeamsController < ApplicationController
  def index
    @teams = Team.all
    #render "/teams"
  end

  def show_chats
    @team = Team.find(params[:id])
    #redirect_to "/teams/#{@team.id}"
    render :layout => false
  end

  def show
    @team = Team.find(params[:id])

    raw_data = open("http://www.reddit.com/r/#{@team.team_name}/.json").read

    require 'json'

    parsed_data = JSON.parse(raw_data)
    data = parsed_data["data"]
    @children = data["children"]

    # @teamnews_title = Array.new
    # @teamnews_link = Array.new
    # # @teamnews = Array.new {Hash.new("title","url")}
    # children.each do |children_value|
    #   # @teamnews["title"] << children_value["data"]["title"]
    #   # @teamnews["url"] << children_value["data"]["url"]
    #   @teamnews_title << children_value["data"]["title"]
    #   @teamnews_link << children_value["data"]["url"]
    # end

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
