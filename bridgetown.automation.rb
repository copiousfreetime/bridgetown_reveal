add_gem("bridgetown_reveal")

add_yarn_for_gem("bridgetown_reveal")

add_initializer :bridgetown_reveal

create_file "frontend/javascript/bridgetown_reveal.js" do
  <<~JS
  import "reveal.js/dist/reset.css"
  import "reveal.js/dist/reveal.css"

  /*
   * Customize the theme by changing this line. The list of available themes:
   *
   *    https://revealjs.com/themes/
   *
   */
  import "reveal.js/dist/theme/solarized.css"

  /*
   * code highlighting is done via highlightjs and monokai.css is included
   * within reveal.js. `zenburn` is alos included, any others will need to be
   * manually downloaded from https://github.com/highlightjs/highlight.js/tree/main/src/styles
   * and add it to the styles directory
   */
  import "reveal.js/plugin/highlight/monokai.css"


  import Reveal from "reveal.js"
  import RevealNotes from "reveal.js/plugin/notes/notes.esm.js"
  import RevealMarkdown from "reveal.js/plugin/markdown/markdown.esm.js"
  import RevealHighlight from "reveal.js/plugin/highlight/highlight.esm.js"

  /*
   * The full configuration options for reveal.js are  documented at:
   *
   *  https://revealjs.com/config/
   *
   */
  Reveal.initialize({
    controls: false,
    progress: true,
    slideNumber: true,
    hash: true,

    plugins: [ RevealMarkdown, RevealHighlight, RevealNotes ]
  });

  console.info("Reveal is loaded!")
  JS

end

javascript_import do
  <<~JS
    import "./bridgetown_reveal.js"
  JS
end

append_to_file "bridgetown.config.yml" do
  <<~YAML

  # If you already have a collections section, then merge this with it
  collections:
    slides:
      sort_by: order
      name: Deck
  YAML
end

create_file "src/presentation.erb" do
  <<~ERB
  ---
  layout: bridgetown_reveal/deck
  ---

  <%= render ::BridgetownReveal::Deck.new(site: site, collection: 'slides') %>
  ERB
end

create_file "src/_slides/intro.html" do
  <<~HTML
  ---
  order: 0
  ---
  <section>
    <h1>The first slide of the Intro</h1>
  </section>

  <section>
    <h1>The 2nd slide of the Intro</h1>
  </section>
  HTML
end

create_file "src/_slides/closing.html" do
  <<~HTML
  ---
  order: 100
  ---
  <section>
    <h1>The penultimate slide of the talk.</h1>
  </section>

  <section>
    <h1>Thank you, and goodnight</h1>
  </section>
  HTML
end

# Read the Automations documentation: https://www.bridgetownrb.com/docs/automations
