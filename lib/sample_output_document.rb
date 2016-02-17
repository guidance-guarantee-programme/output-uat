require_relative './output_document'
require 'faker'

Faker::Config.locale = 'en-GB'

class SampleOutputDocument < OutputDocument
  def initialize(id: nil,
                 format: 'standard',
                 variant: nil,
                 attendee_name: nil,
                 attendee_address_line_1: nil,
                 attendee_address_line_2: nil,
                 attendee_address_line_3: nil,
                 attendee_town: nil,
                 attendee_county: nil,
                 attendee_postcode: nil,
                 lead: nil,
                 guider_first_name: nil,
                 guider_organisation: nil,
                 appointment_date: nil,
                 supplementary_benefits: nil,
                 supplementary_debt: nil,
                 supplementary_ill_health: nil,
                 supplementary_defined_benefit_pensions: nil)

    id ||= rand(123456)

    attendee_name ||= [Faker::Name.prefix.gsub(/\./, ''),
                       Faker::Name.first_name,
                       Faker::Name.last_name].join(' ')

    attendee_address_line_1 ||= Faker::Address.street_address
    attendee_address_line_2 ||= [Faker::Address.secondary_address, nil].sample
    attendee_address_line_3 ||= attendee_address_line_2 && [Faker::Address.street_name, nil].sample
    attendee_town ||= Faker::Address.city
    attendee_county ||= [Faker::Address.county, nil].sample
    attendee_postcode ||= Faker::Address.postcode

    guider_first_name ||= Faker::Name.first_name
    guider_organisation ||= ['The Pensions Advisory Service', 'Pension Wise'].sample

    appointment_date ||= Faker::Date.forward(1_825).strftime('%-e %B %Y')

    supplementary_benefits = [true, false].sample
    supplementary_debt = [true, false].sample
    supplementary_ill_health = [true, false].sample
    supplementary_defined_benefit_pensions = [true, false].sample

    lead ||= 'You recently had a Pension Wise guidance appointment with ' +
      "#{guider_first_name} from #{guider_organisation} on #{appointment_date}."

    variant ||= 'standard'

    super
  end
end
