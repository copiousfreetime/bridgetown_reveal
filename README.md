# Bridgetown feval.js Plugin

[Bridgetown](https://www.bridgetownrb.org) is a ruby powered static site
generation. [Reveal.js](https://revealjs.com) is an open source HTML
presentation framework.

This plugin wires the two together so that you can use bridgetown to host a
reveal.js presentation as a section of your site.

## Installation

### Using an Automation

The preferred method to install this plugin is to run the automation. There
files to add / update to your site that uses this plugin and it is most easily
done through the automation.

```shell
bin/bridgetown apply https://github.com/copiousfreetime/bridgetown_reveal
```

### Manual Installation

Run this command to add this plugin to your site's Gemfile:

```shell
bundle add bridgetown_reveal
```

Then add the initializer to your configuration in `config/initializers.rb`:

```ruby
init :bridgetown_reveal
```

## Usage

The plugin will add a new layout type of `deck`

### Optional configuration options


## Testing

* Run `bundle exec rake test` to run the test suite
* Or run `script/cibuild` to validate with Rubocop and Minitest together.

## Contributing
