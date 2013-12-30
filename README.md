# Rspec::Capybara::SimpleForm::Rails

A small rspec extension to verify simple form elements with the help of capybara.

## Installation

Add this line to your application's Gemfile:

    gem 'rspec-capybara-simple_form-rails'

And then execute:

    $ bundle

Add the following lines to your spec_helper.rb

    ```ruby
    # load capybara
    require 'capybara/rspec'
    require 'rspec/capybara/simple_form'
    ```

## Usage

In a view spec just use the following matchers

    ```ruby
    have_input_field(model, attribute, options)
    have_textarea_field(model, attribute, options)
    ```

The following example illustrates a full example:

    ```ruby
    it "renders the form correct" do

        # assign model
        @app = assign(:app, build(:app))

        # render the view
        render

        # do the checks
        rendered.should have_input_field(@app, :name, :required => true)
        rendered.should have_textarea_field(@app, :description, :required => true)
    end
    ```

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
