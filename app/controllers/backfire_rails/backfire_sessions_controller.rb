require_dependency "backfire_rails/application_controller"
module BackfireRails
  class BackfireSessionsController < ApplicationController

    def show
      @backfire_session = BackfireSession.find(params[:id])
      @backfire_control = @backfire_session.backfire_control
      respond_to do |format|
        format.html # show.html.erb
      end
    end

    def new
      # create session on the fly if it's not there.
      @backfire_session = BackfireSession.new
      #if @backfire_session.nil?
      #  @backfire_control = BackfireControl.find(params[:backfire_control_id])
      #  @backfire_session = BackfireSession.instance(browser_token, @backfire_control)
      #else
      #  @backfire_control = @backfire_session.control_params
      #end
      respond_to do |format|
        format.html # show.html.erb
      end
    end

    def edit

      @backfire_control = BackfireControl.find(params[:id])
      respond_to do |format|
        format.html # show.html.erb
      end
    end

    # here we are using create to initialize the session workspace
    def create
      puts "PARAMETERS = #{params.inspect}"
      @backfire_control = BackfireControl.find(params[:backfire_control_id])
      attr=params[:backfire_session]
      attr[:session_key] = browser_token
      @backfire_session = @backfire_control.backfire_sessions.create(attr)
      respond_to do |format|
        unless @backfire_session.nil?
#         format.html { redirect_to @backfire_session,  notice: 'Session initialized.' } THIS FORM DOES NOT WORK, ends up with engine prefixing which controller doesn't have matching methods for
          format.html { redirect_to backfire_control_backfire_session_url(@backfire_control, 1), notice: 'Session initialized.' }
        else
          flash.now[:error] = 'Unable to initialize session.'
        end
      end
    end

    def update
      @backfire_session = BackfireSession.find(params[:id])
      if @backfire_session.update_attributes(params[:backfire_session])
        respond_to do |format|
          unless @backfire_session.state == Backfire::Model::Workspace::STATE_ERROR
            format.html { redirect_to backfire_session_url(@backfire_session) }
          else
            flash.now[:error] = 'Unable to initialize session.'
          end
        end
      else
        format.html { render action: "edit" }
      end
    end

    def destroy
      @backfire_session = BackfireSession.find(params[:id])
      @backfire_session.destroy

      respond_to do |format|
        format.html { redirect_to backfire_controls_url }
      end
    end

    private

    def browser_token
      cookies[:session_id] = SecureRandom.urlsafe_base64 if cookies[:session_id].nil?
      return cookies[:session_id]
    end

  end
end