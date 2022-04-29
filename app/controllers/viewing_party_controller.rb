class ViewingPartyController < ApplicationController
  before_action :authorized
  def new
    @users = User.all
    @host = User.find(session[:user_id])
    @movie = MovieFacade.new.details(params[:id])
end

  def create
    @host = User.find(session[:user_id])
    @party = Party.create!(
      start_date: "#{params['start_date(1i)']}-#{params['start_date(2i)']}-#{params['start_date(3i)']}",
      start_time: "#{params['start_time(4i)']}:#{params['start_time(5i)']}",
      duration: params["duration"],
      movie_id: params["id"],
      host_id: @host.id
    )
    UserParty.create!(user_id: @host.id, party_id: @party.id)
    params[:invitations].drop(1).each do |user_id|
      if user_id.to_i != @host.id
        UserParty.create!(user_id: user_id, party_id: @party.id)
      end
    end
    redirect_to dashboard_path
  end

  def destroy
    party = Party.find(params[:id])
    party.destroy
    redirect_to dashboard_path
  end
end
