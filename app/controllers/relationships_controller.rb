class RelationshipsController < ApplicationController
  def create
    current_user.relationships.build(follower_id: params[:user_id]).save
    redirect_to request.referrer || root_url
  end

  def destroy
    current_user.relationships.find_by(follower_id: params[:user_id]).destroy
    redirect_to request.referrer || root_url
  end
end
