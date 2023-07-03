# frozen_string_literal: true

module Decidim
  # Helpers related to icons
  module CardHelper
    # Public: Returns a card given an instance of a Component.
    #
    # model - The component instance to generate the card for.
    # options - a Hash with options, for the size of the card
    #
    # Returns an HTML.
    def card_for(model, options = {})
      cell_name = options.delete(:force_redesign) ? "decidim/redesigned_card" : "decidim/card"
      cell cell_name, model, options
    end
  end
end
