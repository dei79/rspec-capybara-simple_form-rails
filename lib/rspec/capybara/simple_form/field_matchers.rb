RSpec::Matchers.define :have_field do |model, name, ftype, dtype, options = {}|
  match do |rendered|
    # define the field key
    if (model.is_a?(ActiveRecord::Base))
      field_key = "#{model.class.to_s.underscore}_#{name.to_s.underscore}"
      field_key = field_key.gsub(/\//, '_')
    else
      field_key = "#{model.to_s.underscore}_#{name.to_s.underscore}"
    end

    # build the check string
    checkstring = "#{dtype}"
    checkstring = "#{checkstring}.required" if options[:required]

    # do our checks
    return false unless rendered.should have_selector("form div.control-group.#{checkstring}.#{field_key} label.#{checkstring}") unless options[:nolabel]
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

RSpec::Matchers.define :have_hidden_field do |model, name, options = {}|
  match do |rendered|
    options[:nolabel] = true
    rendered.should have_field(model, name, 'input[type=hidden]','hidden', options)
  end
end