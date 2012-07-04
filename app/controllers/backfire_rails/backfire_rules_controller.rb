require_dependency "backfire_rails/application_controller"

module BackfireRails
  class BackfireRulesController < ApplicationController
  
    # GET /backfire_rules/1
    # GET /backfire_rules/1.json
    def show
      @backfire_rule = BackfireRule.find(params[:id])
      @backfire_control = @backfire_rule.backfire_control
  
      respond_to do |format|
        format.html # show.html.erb
        format.json { render json: @backfire_rule }
      end
    end
  
    # GET /backfire_rules/new
    # GET /backfire_rules/new.json
    def new
      @backfire_rule = BackfireRule.new
      @backfire_control = BackfireControl.find(params[:backfire_control_id])
  
      respond_to do |format|
        format.html # new.html.erb
        format.json { render json: @backfire_rule }
      end
    end
  
    # GET /backfire_rules/1/edit
    def edit
      @backfire_rule = BackfireRule.find(params[:id])
      @backfire_control = @backfire_rule.backfire_control
    end
  
    # POST /backfire_rules
    # POST /backfire_rules.json
    def create
      @backfire_control = BackfireControl.find(params[:backfire_control_id])
      @backfire_rule = @backfire_control.backfire_rules.create(params[:backfire_rule])

      respond_to do |format|
        if @backfire_rule.save
          format.html { redirect_to @backfire_rule, notice: 'Backfire rule was successfully created.' }
          format.json { render json: @backfire_rule, status: :created, location: @backfire_rule }
        else
          format.html { render action: "new" }
          format.json { render json: @backfire_rule.errors, status: :unprocessable_entity }
        end
      end
    end
  
    # PUT /backfire_rules/1
    # PUT /backfire_rules/1.json
    def update
      @backfire_rule = BackfireRule.find(params[:id])
  
      respond_to do |format|
        if @backfire_rule.update_attributes(params[:backfire_rule])
          format.html { redirect_to @backfire_rule, notice: 'Backfire rule was successfully updated.' }
          format.json { head :no_content }
        else
          format.html { render action: "edit" }
          format.json { render json: @backfire_rule.errors, status: :unprocessable_entity }
        end
      end
    end
  
    # DELETE /backfire_rules/1
    # DELETE /backfire_rules/1.json
    def destroy
      @backfire_rule = BackfireRule.find(params[:id])
      @backfire_control = @backfire_rule.backfire_control
      @backfire_rule.destroy
  
      respond_to do |format|
        format.html { redirect_to @backfire_control }
        format.json { head :no_content }
      end
    end
  end
end
