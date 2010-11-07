class SiteUserInfosController < ApplicationController
  # GET /site_user_infos
  # GET /site_user_infos.xml
  def index
    @site_user_infos = SiteUserInfo.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @site_user_infos }
    end
  end

  # GET /site_user_infos/1
  # GET /site_user_infos/1.xml
  def show
    @site_user_info = SiteUserInfo.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @site_user_info }
    end
  end

  # GET /site_user_infos/new
  # GET /site_user_infos/new.xml
  def new
    @site_user_info = SiteUserInfo.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @site_user_info }
    end
  end

  # GET /site_user_infos/1/edit
  def edit
    @site_user_info = SiteUserInfo.find(params[:id])
  end

  # POST /site_user_infos
  # POST /site_user_infos.xml
  def create
    @site_user_info = SiteUserInfo.new(params[:site_user_info])

    respond_to do |format|
      if @site_user_info.save
        format.html { redirect_to(@site_user_info, :notice => 'Site user info was successfully created.') }
        format.xml  { render :xml => @site_user_info, :status => :created, :location => @site_user_info }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @site_user_info.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /site_user_infos/1
  # PUT /site_user_infos/1.xml
  def update
    @site_user_info = SiteUserInfo.find(params[:id])

    respond_to do |format|
      if @site_user_info.update_attributes(params[:site_user_info])
        format.html { redirect_to(@site_user_info, :notice => 'Site user info was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @site_user_info.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /site_user_infos/1
  # DELETE /site_user_infos/1.xml
  def destroy
    @site_user_info = SiteUserInfo.find(params[:id])
    @site_user_info.destroy

    respond_to do |format|
      format.html { redirect_to(site_user_infos_url) }
      format.xml  { head :ok }
    end
  end
end
