require_dependency "backfire_rails/application_controller"

module BackfireRails
  class BackfireControlsController < ApplicationController
    # GET /backfire_controls
    # GET /backfire_controls.json
    def index
      @backfire_controls = BackfireControl.paginate(per_page: 8, page: params[:page])
  
      respond_to do |format|
        format.html # index.html.erb
        format.json { render json: @backfire_controls }
      end
    end
  
    # GET /backfire_controls/1
    # GET /backfire_controls/1.json
    def show
      @backfire_control = BackfireControl.find(params[:id])
      @backfire_queries = @backfire_control.backfire_queries.paginate(per_page: 6, page: params[:query_page])
      @backfire_rules = @backfire_control.backfire_rules.paginate(per_page:6, page: params[:rule_page])
  
      respond_to do |format|
        format.html # show.html.erb
        format.json { render json: @backfire_control }
      end
    end
  
    # GET /backfire_controls/new
    # GET /backfire_controls/new.json
    def new
      @backfire_control = BackfireControl.new
  
      respond_to do |format|
        format.html # new.html.erb
        format.json { render json: @backfire_control }
      end
    end
  
    # GET /backfire_controls/1/edit
    def edit
      @backfire_control = BackfireControl.find(params[:id])
    end
  
    # POST /backfire_controls
    # POST /backfire_controls.json
    def create
      @backfire_control = BackfireControl.new(params[:backfire_control])
  
      respond_to do |format|
        if @backfire_control.save
          format.html { redirect_to @backfire_control, notice: 'Backfire control was successfully created.' }
          format.json { render json: @backfire_control, status: :created, location: @backfire_control }
        else
          format.html { render action: "new" }
          format.json { render json: @backfire_control.errors, status: :unprocessable_entity }
        end
      end
    end
  
    # PUT /backfire_controls/1
    # PUT /backfire_controls/1.json
    def update
      @backfire_control = BackfireControl.find(params[:id])
  
      respond_to do |format|
        if @backfire_control.update_attributes(params[:backfire_control])
          format.html { redirect_to @backfire_control, notice: 'Backfire control was successfully updated.' }
          format.json { head :no_content }
        else
          format.html { render action: "edit" }
          format.json { render json: @backfire_control.errors, status: :unprocessable_entity }
        end
      end
    end
  
    # DELETE /backfire_controls/1
    # DELETE /backfire_controls/1.json
    def destroy
      @backfire_control = BackfireControl.find(params[:id])
      @backfire_control.destroy
  
      respond_to do |format|
        format.html { redirect_to backfire_controls_url }
        format.json { head :no_content }
      end
    end
  end
end
