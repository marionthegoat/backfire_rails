require_dependency "backfire_rails/application_controller"

module BackfireRails
  class BackfireQueriesController < ApplicationController

    # GET /backfire_queries/1
    # GET /backfire_queries/1.json
    def show
      @backfire_query = BackfireQuery.find(params[:id])
      @backfire_control = @backfire_query.backfire_control
  
      respond_to do |format|
        format.html # show.html.erb
        format.json { render json: @backfire_query }
      end
    end
  
    # GET /backfire_queries/new
    # GET /backfire_queries/new.json
    def new
      @backfire_query = BackfireQuery.new
      @backfire_control = BackfireControl.find(params[:backfire_control_id])

      respond_to do |format|
        format.html # new.html.erb
        format.json { render json: @backfire_query }
      end
    end
  
    # GET /backfire_queries/1/edit
    def edit
      @backfire_query = BackfireQuery.find(params[:id])
      @backfire_control = @backfire_query.backfire_control
    end
  
    # POST /backfire_queries
    # POST /backfire_queries.json
    def create
      @backfire_control = BackfireControl.find(params[:backfire_control_id])
      @backfire_query = @backfire_control.backfire_queries.create(params[:backfire_query])
  
      respond_to do |format|
        if @backfire_query.save
          format.html { redirect_to @backfire_query, notice: 'Backfire query was successfully created.' }
          format.json { render json: @backfire_query, status: :created, location: @backfire_query }
        else
          format.html { render action: "new" }
          format.json { render json: @backfire_query.errors, status: :unprocessable_entity }
        end
      end
    end
  
    # PUT /backfire_queries/1
    # PUT /backfire_queries/1.json
    def update
      @backfire_query = BackfireQuery.find(params[:id])
  
      respond_to do |format|
        if @backfire_query.update_attributes(params[:backfire_query])
          format.html { redirect_to @backfire_query, notice: 'Backfire query was successfully updated.' }
          format.json { head :no_content }
        else
          format.html { render action: "edit" }
          format.json { render json: @backfire_query.errors, status: :unprocessable_entity }
        end
      end
    end
  
    # DELETE /backfire_queries/1
    # DELETE /backfire_queries/1.json
    def destroy
      @backfire_query = BackfireQuery.find(params[:id])
      @backfire_control = @backfire_query.backfire_control
      @backfire_query.destroy
  
      respond_to do |format|
        format.html { redirect_to @backfire_control }
        format.json { head :no_content }
      end
    end
  end
end
