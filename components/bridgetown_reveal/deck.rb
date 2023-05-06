# frozen_string_literal: true

module BridgetownReveal
  class Deck < Bridgetown::Component
    def initialize(site:, collection: "slides")
      super()
      @site, @collection = site, collection
      @resources = @site.collections[@collection].resources
    end

    def slides
      filtered_resources = @resources.select { |r| r.data.order }
      ordered_slides = filtered_resources.sort_by { |r| r.data.order }
      orders = Set.new
      ordered_slides.each do |slide|
        if orders.include?(slide.data.order)
          ::Bridgetown.logger.warn("Site:",
                                   "Duplicate slide #{slide.data.order} appears in #{slide}")
        else
          orders << slide.data.order
        end
      end

      ordered_slides
    end
  end
end
