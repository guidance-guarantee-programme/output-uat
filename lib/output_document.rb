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
                :lead,
                :guider_first_name,
                :guider_organisation,
                :appointment_reference,
                :appointment_date,
                :continue_working,
                :unsure,
                :leave_inheritance,
                :wants_flexibility,
                :wants_security,
                :wants_lump_sum,
                :poor_health

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
                 lead:,
                 guider_first_name: nil,
                 guider_organisation: nil,
                 appointment_reference: nil,
                 appointment_date: nil,
                 continue_working: nil,
                 unsure: nil,
                 leave_inheritance: nil,
                 wants_flexibility: nil,
                 wants_security: nil,
                 wants_lump_sum: nil,
                 poor_health: nil)

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
    self.lead = lead
    self.guider_first_name = guider_first_name
    self.guider_organisation = guider_organisation
    self.appointment_reference = appointment_reference
    self.appointment_date = appointment_date
    self.continue_working = continue_working
    self.unsure = unsure
    self.leave_inheritance = leave_inheritance
    self.wants_flexibility = wants_flexibility
    self.wants_security = wants_security
    self.wants_lump_sum = wants_lump_sum
    self.poor_health = poor_health
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
      lead,
      guider_first_name,
      guider_organisation,
      appointment_reference,
      appointment_date,
      continue_working,
      unsure,
      leave_inheritance,
      wants_flexibility,
      wants_security,
      wants_lump_sum,
      poor_health
    ]
  end

  def to_s
    CSV.generate(col_sep: '|', encoding: 'UTF-8') { |csv| csv << to_array }
  end
end
