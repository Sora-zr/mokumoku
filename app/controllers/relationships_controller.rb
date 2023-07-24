class RelationshipsController < ApplicationController
  def create
    user_relationships = current_user.relationships
    if user_relationships.blank?
      new_following = user_relationships.build(follower_id: params[:user_id])
      new_following.save
      redirect_to request.referrer || root_url
    end
  end

  def destroy
    user_relationships = current_user.relationships
    user_relationships.find_by(follower_id: params[:user_id]).destroy!
    redirect_to request.referrer || root_url
  end
end
