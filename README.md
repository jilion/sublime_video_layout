# SublimeVideoLayout

This engine provides a common layout (HTML, CSS) and utility JavaScript classes for all SublimeVideo apps.

### Deployement to http://gemfury.com/

``` bash
  bundle install
  rake build
  gem install gemfury
  fury push pkg/sublimevideo_layout-X.Y.Z.gem
```

### JS documentation

To generate the JS docs, run `gem install codo && codo ./app/assets/javascripts`

------------
Copyright (c) 2010 - 2012 Jilion(r) - SublimeVideo and Jilion are registered trademarks