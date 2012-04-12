# feedback_popup

Simple feedback popup for Rails 3 applications.

## Installation

Add to your `Gemfile`:

```ruby
gem 'feedback_popup'
```

Run `bundle install`

`config/initializers/feedback_popup.rb`:

```ruby
FeedbackPopup.setup do |config|
  config.mail_to   = 'you@example.com'
  config.mail_from = 'sender@example.com'
end
```

Add to your `app/assets/stylesheets/application.css' or equivalent,
normally just before the `require_tree` line:

```
 *= require feedback_popup
```

Add to your `app/assets/javascripts/application.js' or equivalent,
normally just before the `require_tree` line:

```
//= require feedback_popup
```

Add to your layout:

```
<%= feedback_popup %>
```

Make sure you have ActionMailer configured.

Restart your app.

## Copyright

See the MIT-LICENSE file.
