# encoding: utf-8

require 'csv'

class OutputDocument
  attr_accessor :id,
                :format,
                :variant,
                :attendee_name,
                :attendee_address_line_1,
                :attendee_address_line_2,
                :attendee_address_line_3,
                :attendee_town,
                :attendee_county,
                :attendee_postcode,
                :attendee_country,
                :lead,
                :guider_first_name,
                :guider_organisation,
                :appointment_date,
                :supplementary_benefits,
                :supplementary_debt,
                :supplementary_ill_health,
                :supplementary_defined_benefit_pensions

  def initialize(id:,
                 format: 'standard',
                 variant:,
                 attendee_name:,
                 attendee_address_line_1:,
                 attendee_address_line_2: nil,
                 attendee_address_line_3: nil,
                 attendee_town:,
                 attendee_county: nil,
                 attendee_postcode:,
                 attendee_country:,
                 lead:,
                 guider_first_name: nil,
                 guider_organisation: nil,
                 appointment_date: nil,
                 supplementary_benefits: nil,
                 supplementary_debt: nil,
                 supplementary_ill_health: nil,
                 supplementary_defined_benefit_pensions: nil)

    self.id = id
    self.format = format
    self.variant = variant
    self.attendee_name = attendee_name
    self.attendee_address_line_1 = attendee_address_line_1
    self.attendee_address_line_2 = attendee_address_line_2
    self.attendee_address_line_3 = attendee_address_line_3
    self.attendee_town = attendee_town
    self.attendee_county = attendee_county
    self.attendee_postcode = attendee_postcode
    self.attendee_country = attendee_country
    self.lead = lead
    self.guider_first_name = guider_first_name
    self.guider_organisation = guider_organisation
    self.appointment_date = appointment_date
    self.supplementary_benefits = supplementary_benefits
    self.supplementary_debt = supplementary_debt
    self.supplementary_ill_health = supplementary_ill_health
    self.supplementary_defined_benefit_pensions = supplementary_defined_benefit_pensions
  end

  def attendee_address
    [
      attendee_address_line_1,
      attendee_address_line_2,
      attendee_address_line_3,
      attendee_town,
      attendee_county,
      attendee_postcode
    ]
  end

  def attendee_country=(value)
    @attendee_country = value && value.upcase
  end

  def to_array
    [
      id,
      format,
      variant,
      attendee_name,
      attendee_address_line_1,
      attendee_address_line_2,
      attendee_address_line_3,
      attendee_town,
      attendee_county,
      attendee_postcode,
      attendee_country,
      lead,
      supplementary_benefits,
      supplementary_debt,
      supplementary_ill_health,
      supplementary_defined_benefit_pensions
    ]
  end

  def to_s
    CSV.generate(col_sep: '|', encoding: 'UTF-8') { |csv| csv << to_array }
  end
end
