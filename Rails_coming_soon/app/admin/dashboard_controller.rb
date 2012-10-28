module ActiveAdmin
  module Dashboards
    class DashboardController < ResourceController
      def index
        redirect_to admin_users_path
      end
    end
  end
end