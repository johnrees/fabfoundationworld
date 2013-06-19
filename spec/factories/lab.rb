FactoryGirl.define do
  factory :lab do
    kind 0
    name "MIT Media Lab"
    address "75 Amherst St, Cambridge, MA "
    notes "Cool lab"
    postal_code "02139"
    country_code "US"
    latitude 30.2490428
    longitude -13.2249820
    urls ["http://www.media.mit.edu/‎", "https://twitter.com/medialab"]
    # Phone:+1 617-253-5960
    # Hours:
    #   Monday  9:00 am – 5:00 pm
    #   Tuesday 9:00 am – 5:00 pm
    #   Wednesday 9:00 am – 5:00 pm
    #   Thursday  9:00 am – 5:00 pm
    #   Friday  9:00 am – 5:00 pm
    #   Saturday  Closed
    #   Sunday  Closed
  end
end
