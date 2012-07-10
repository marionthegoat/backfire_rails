require_dependency "backfire_rails/application_controller"
module BackfireRails
  class BackfireSessionsController < ApplicationController

    def show
      # create session on the fly if it's not there.
      @backfire_session = BackfireSession.instance(browser_token)
      if @backfire_session.nil?
        @backfire_control = BackfireControl.find(params[:backfire_control_id])
        @backfire_session = BackfireSession.instance(browser_token, @backfire_control)
      else
        @backfire_control = @backfire_session.control_params
      end
      respond_to do |format|
        format.html # show.html.erb
      end
    end

    # here we are using create to initialize the session workspace
    def create
      @backfire_session = BackfireSession.instance(browser_token)
      if @backfire_session.nil?
        @backfire_control = BackfireControl.find(params[:backfire_control_id])
        @backfire_session = BackfireSession.instance(browser_token, @backfire_control)
      else
        @backfire_control = @backfire_session.control_params
      end
      @backfire_session.load_determinants
      @backfire_session.solve(params[:goal_fact])

      respond_to do |format|
        unless @backfire_session.nil?
#         format.html { redirect_to @backfire_session,  notice: 'Session initialized.' } THIS FORM DOES NOT WORK, ends up with engine prefixing which controller doesn't have matching methods for
          format.html { redirect_to backfire_control_backfire_session_url(@backfire_control,1),  notice: 'Session initialized.' }
        else
          flash.now[:error] = 'Unable to initialize session.'
        end
      end
    end

    def update
      @backfire_session = BackfireSession.instance(browser_token)
      @backfire_session.prompt_response = params[:prompt_response]
      @backfire_session.goal_fact = params[:goal_fact] unless params[:goal_fact].nil?

      respond_to do |format|
        unless @backfire_session.state == Backfire::Model::Workspace::STATE_ERROR
          format.html { redirect_to backfire_control_backfire_session_url(@backfire_control,1)}
        else
          format.html { redirect_to backfire_control_backfire_session_url(@backfire_control,1), notice: 'Response could not be processed.' }
        end
      end
    end

    def destroy
      BackfireSession.delete(browser_token)

      respond_to do |format|
        format.html { redirect_to backfire_controls_url }
      end
    end

    private

    def browser_token
      cookies[:session_id] = SecureRandom.urlsafe_base64 if cookies[:session_id].nil?
      return cookies[:session_id].to_sym
    end

  end
end