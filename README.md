# rack-metadata [![Build Status](https://travis-ci.org/chingor13/rack-metadata.png)](https://travis-ci.org/chingor13/rack-metadata)

Inject meta tags into your head.  This rack middleware collects meta data about a page and will inject meta tags into the head of your html content.

## Usage

```
# in your rack up/config file
use Rack::Metadata

# in your application
env['rack.metadata'] = {
  description: "My page's meta description",
  keywords: "Foo, bar"
}
```

It the request is `text/html`, the middleware will add meta tags for description and keywords:

```
<head>
  …
  <meta name="description" content="My page's meta description" />
  <meta name="keywords" content="Foo, bar" />
  …
</head>
```

All other content types are currently ignored.

