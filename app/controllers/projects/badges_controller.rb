class Projects::BadgesController < Projects::ApplicationController
  layout 'project_settings'
  before_action :authorize_admin_project!, only: [:index]
  before_action :no_cache_headers, except: [:index]

  def build
    badge = Gitlab::Badge::Build.new(project, params[:ref])

    respond_to do |format|
      format.html { render_404 }

      format.svg do
        render 'badge', locals: { badge: badge.template }
      end
    end
  end
end
