require_relative './sample_output_document'

module DSL
  def with(supplementary_information)
    SampleOutputDocument.new.tap do |output_document|
      output_document.supplementary_benefits = false
      output_document.supplementary_debt = false
      output_document.supplementary_ill_health = false
      output_document.supplementary_defined_benefit_pensions = false

      Array(supplementary_information).each { |s_i| output_document.public_send(:"#{s_i}=", true) }
    end
  end
end
