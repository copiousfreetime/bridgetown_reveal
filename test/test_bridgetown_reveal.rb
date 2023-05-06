# frozen_string_literal: true

require_relative "./helper"

class TestBridgetownReveal < Bridgetown::TestCase
  def setup
    Bridgetown.reset_configuration!
    @config = Bridgetown.configuration(
      "root_dir"    => root_dir,
      "source"      => source_dir,
      "destination" => dest_dir,
      "quiet"       => true,
      "collections" => {
        "slides" => {
          "sort_by" => "order",
          "name"    => "Deck",
        },
      }
    )
    @config.run_initializers! context: :static
    @site = Bridgetown::Site.new(@config)

    with_metadata title: "My Revealjs Site" do
      @site.process
    end
  end

  describe "BridgetownReveal" do
    before do
      @contents = File.read(dest_dir("index.html"))
    end

    it "outputs the overridden metadata" do
      assert_includes @contents, "<title>My Revealjs Site</title>"
    end

    it "contains the slide content" do
      assert_includes @contents, "<h1>A Slide</h1>"
      assert_includes @contents, "<h1>Another Slide</h1>"
      assert_includes @contents, "<h1>B Slide</h1>"
      assert_includes @contents, "<h1>B 2 Slide</h1>"
    end
  end
end
