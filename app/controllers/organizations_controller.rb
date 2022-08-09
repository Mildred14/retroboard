class OrganizationsController < ApplicationController
  def index
    @organizations = Organization.all
    @organizations
  end

  def create
    @organization = Organization.new(params[:created_by, ])
    if @organization.save
      @organization
    else
      render 'new'
    end
  end
end