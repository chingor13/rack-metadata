require 'test_helper'
require 'pp'

class MetadataTest < MiniTest::Unit::TestCase

  def test_embeds_meta_at_end_of_html_head
    response = request({
      description: "My page's meta description",
      keywords: "Foo, bar"
    })
    doc = Nokogiri::HTML(response.body)
    metas = doc.search('html head meta')
    assert_equal(2, metas.count)

    description = metas.first
    assert_equal("description", description['name'])
    assert_equal("My page's meta description", description['content'])

    keywords = metas.last
    assert_equal("keywords", keywords['name'])
    assert_equal("Foo, bar", keywords['content'])
  end

  def test_does_nothing_on_non_html
    response = request({
      description: "My page's meta description",
      keywords: "Foo, bar"
    }, {content_type: 'text/javascript'})
    assert_equal(HTML_DOC, response.body)
  end

  def test_does_nothing_when_no_head_tag
    response = request({
      description: "My page's meta description",
      keywords: "Foo, bar"
    }, {body: ["Some text"]})
    assert_equal("Some text", response.body)
  end

  protected

  HTML_DOC = <<-EOF
    <html>
      <head>
        <title>Rack::Metadata</title>
      </head>
      <body>
        <h1>Rack::Metadata</h1>
      </body>
    </html>
  EOF

  def request(metadata = {}, opts = {})
    body = opts.delete(:body) || [HTML_DOC]
    content_type = opts.delete(:content_type) || "text/html"
    app = lambda { |env| 
      env['rack.metadata'] = metadata
      [200, {'Content-Type' => content_type}, body]
    }
    @application = Rack::Metadata.new(app, opts)
    @request = Rack::MockRequest.new(@application).get("/")
    yield(@application, @request) if block_given?
    @request
  end

end 