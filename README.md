# Bridgetown reveal.js Plugin

[Bridgetown](https://www.bridgetownrb.com) is a ruby powered static site
generation. [Reveal.js](https://revealjs.com) is an open source HTML
presentation framework.

This plugin wires the two together so that you can use bridgetown to host a
reveal.js presentation as a section of your site.

## Installation

### Using an Automation

The preferred method to install this plugin is to run the automation. There
are files to add / update to your site that uses this plugin and it is most
easily done through the automation.

```shell
bin/bridgetown apply https://github.com/copiousfreetime/bridgetown_reveal
```

### Manual Installation

Run this command to add this plugin to your site's Gemfile.

```shell
bundle add bridgetown_reveal
```

And then run the automation locally:

```shell
./bin/bridgetown apply $(bundle show bridgetown_reveal)/bridgetown.automation.rb
```

If you prefer NOT to run the automation, then look at the the automation file
and apply the updates manually:

<https://github.com/copiousfreetime/bridgetown_reveal/blob/main/bridgetown.automation.rb>

The steps are:

1. Add the initializer to your configuraiton in `config/initializers.rb`
    ```ruby
    init :bridgetown_reveal
    ```
2. Add `reveal.js` to your yarn package: `yarn add reveal.js`
3. Install the [javascript for bootstrapping reveal.js](https://github.com/copiousfreetime/bridgetown_reveal/blob/faec16917b99ae9646c771b7fb23c2c73a75b5db/bridgetown.automation.rb#L9-L49) and [import it](https://github.com/copiousfreetime/bridgetown_reveal/blob/faec16917b99ae9646c771b7fb23c2c73a75b5db/bridgetown.automation.rb#L56)
4. Update the `bridgetown.config.yml` to [add the `slides`](https://github.com/copiousfreetime/bridgetown_reveal/blob/faec16917b99ae9646c771b7fb23c2c73a75b5db/bridgetown.automation.rb#L63-L67) collection.
5. Install a [sample presentation](https://github.com/copiousfreetime/bridgetown_reveal/blob/faec16917b99ae9646c771b7fb23c2c73a75b5db/bridgetown.automation.rb#L71-L109)

## Usage

The plugin will add a new layout type of [`bridgetown_reveal/deck`](./layouts/bridgetown_reveal/deck.erb) and an
associated component of [`::BridgetownReveal::Deck`](./components/bridgetown_reveal/deck.rb).

Integrating a reveal.js presentation into your site involves 3 items:

- Setting a collection for the slides in the top level `bridgetown.config.yml`
- Create the single page for the presentation to live at
- Creating all the pages for the slides

For example, if to make a new presentation at output location `/slidey` you
would do the following:

Add the `slidey` collection to the `bridgetown.config.yml` file:

```yaml
collections:
    slidey:
      sort_by: order
      name: Slidey
```

Create the page for the presentation in `src/slidey.erb`

```erb
---
layout: bridgetown_reveal/deck
---

<%= render ::BridgetownReveal::Deck.new(site: site, collection: 'slidey') %>
```

Put all the slidey pages themselves in `src/_slidey/`. The pages will all be
combinded together and sorted based upon the `order` value in the frontmatter.

**`src/_slidey/intro.html`**
```html
---
order: 1
---
<section>
  <h1>The first slide of the Intro</h1>
</section>

<section>
  <h1>The 2nd slide of the Intro</h1>
</section>
```

**`src/_slidey/outro.html`**
```html
---
order: 100
---
<section>
  <h1>The penultimate slide of the talk.</h1>
</section>

<section>
  <h1>Thank you, and goodnight</h1>
</section>
```

All of the content is exactly [reveal.js](https://revealjs.com) content.

## Testing

* Run `bundle exec rake test` to run the test suite
* Or run `script/cibuild` to validate with Rubocop and Minitest together.

