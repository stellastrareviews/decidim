# frozen_string_literal: true

module Decidim
  autoload :ActionAuthorizationHelper, "decidim/action_authorization_helper"
  autoload :ResourceHelper, "decidim/resource_helper"

  class ViewModel < Cell::ViewModel
    include ActionView::Helpers::TranslationHelper
    include ::Cell::Translation
    include Decidim::ResourceHelper
    include Decidim::ScopesHelper
    include ActionController::Helpers
    include Decidim::ActionAuthorization
    include Decidim::ActionAuthorizationHelper
    include Decidim::ReplaceButtonsHelper
    include Cell::Caching::Notifications
    include Decidim::MarkupHelper
    include Decidim::FilterParamsHelper

    delegate :current_organization, to: :controller

    cache :show, if: :perform_caching? do
      cache_hash
    end

    def current_user
      context&.dig(:current_user) || controller&.current_user
    end

    private

    def perform_caching?
      cache_hash.present?
    end

    def cache_hash
      nil
    end

    def decidim
      Decidim::Core::Engine.routes.url_helpers
    end
  end
end
