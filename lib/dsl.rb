require_relative './sample_output_document'

module DSL
  def with(circumstances)
    SampleOutputDocument.new.tap do |output_document|
      output_document.continue_working = false
      output_document.leave_inheritance = false
      output_document.poor_health = false
      output_document.unsure = false
      output_document.wants_flexibility = false
      output_document.wants_lump_sum = false
      output_document.wants_security = false

      Array(circumstances).each { |c| output_document.public_send(:"#{c}=", true) }
    end
  end
end
