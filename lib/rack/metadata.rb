module Rack
  class Metadata
    MAGIC_COMMENT = '<!--rack-metadata-->'.freeze

    def initialize(app, options = {})
      @app = app
    end

    def call(env)
      env['rack.metadata'] = {}
      status, headers, response = @app.call(env)

      if headers['Content-Type'].to_s.include?('text/html') # Only update HTML bodies
        if env['rack.metadata']
          body = ""
          response.each { |part| body << part }

          index = nil
          if index = body.rindex(MAGIC_COMMENT)
            body.slice!(index, MAGIC_COMMENT.length)
          else
            index = body.rindex('</head>')
          end

          if index
            body.insert(index, env['rack.metadata'].map { |k, v| message(k, v) }.join(''))
            headers['Content-Length'] = body.bytesize.to_s
            response = [body]
          end
        end
      end

      [status, headers, response]
    end

    private

    def message(name, content)
      %{<meta name="#{name}" content="#{content}" />}
    end
  end
end
