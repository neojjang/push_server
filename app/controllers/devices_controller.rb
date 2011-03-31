class DevicesController < ApplicationController

  def index
    @devices = Device.all

    respond_to do |format|
      format.html # index.html.erb
      format.json  { render :json => @devices }
    end
  end

  def create
    @device = Device.new(params[:device])

    respond_to do |format|
      if @device.save
        format.html { redirect_to(@device, :notice => 'Device was successfully created.') }
        format.json  { render :json => @device, :status => :created, :location => @device }
      else
        format.html { render :action => "new" }
        format.json  { render :json => @device.errors, :status => :unprocessable_entity }
      end
    end
  end

  def destroy
    @device = Device.find_by_mobile_uuid(params[:id])
    @device.destroy

    respond_to do |format|
      format.html { redirect_to(devices_url) }
      format.json  { head :ok }
    end
  end

  def push
    @device = Device.find(params[:id])
    @device.push

    respond_to do |format|
      format.html { redirect_to(devices_url) }
    end
  end

end
