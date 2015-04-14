Spree::Order.class_eval do
    def ensure_available_shipping_rates
      if shipments.empty? || shipments.any? { |shipment| shipment.shipping_rates.blank? }
        # After this point, order redirects back to 'address' state and asks user to pick a proper address
        # Therefore, shipments are not necessary at this point.
        shipments.delete_all
        errors.add(:base, Spree.t(:items_cannot_be_shipped)) and return false
      end
    end
end
