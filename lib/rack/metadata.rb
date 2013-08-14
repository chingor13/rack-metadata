module Rack
  class Metadata

    def initialize(app, options = {})
      @app = app
    end

    def call(env)
      env['rack.metadata'] = {}
      status, headers, response = @app.call(env)

      if headers['Content-Type'].to_s.include?('text/html') # Only update HTML bodies
        if env['rack.metadata']
          env['rack.metadata'].each do |k, v|
            response.each do |part|
              if part.rindex('</head>')
                tag = message(k, v)
                part.gsub!('</head>', tag + '</head>')
                headers['Content-Length'] = (headers['Content-Length'].to_i + tag.length).to_s
              end
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
