RSpec::Matchers.define :have_field do |model, name, ftype, dtype, options = {}|
  match do |rendered|
    # define the field key
    field_key = "#{model.class.to_s.downcase}_#{name.to_s.downcase}"

    # build the check string
    checkstring = "#{dtype}"
    checkstring = "#{checkstring}.required" if options[:required]

    # do our checks
    return false unless rendered.should have_selector("form div.control-group.#{checkstring}.#{field_key} label.#{checkstring}")
    return false unless rendered.should have_selector("form div.control-group.#{checkstring}.#{field_key} #{ftype}.#{checkstring}##{field_key}")

    # done
    true
  end
end

RSpec::Matchers.define :have_input_field do |model, name, options = {}|
  match do |rendered|
    rendered.should have_field(model, name, 'input[type=text]','string', options)
  end
end

RSpec::Matchers.define :have_textarea_field do |model, name, options = {}|
  match do |rendered|
    rendered.should have_field(model, name, 'textarea','text', options)
  end
end