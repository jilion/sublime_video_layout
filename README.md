# SublimeVideoLayout

This engine provides a common layout (HTML, CSS) and utility JavaScript classes for all SublimeVideo apps.

### Deployement to http://gemfury.com/

Update `VERSION` in `lib/sublime_video_layout/version.rb` to `X.Y.Z` and then run the following commands:

``` bash
> bundle install
> rake build
sublime_video_layout X.Y.Z built to pkg/sublime_video_layout-X.Y.Z.gem
> bundle exec fury push pkg/sublime_video_layout-X.Y.Z.gem
```

### JS documentation

To generate the JS docs, run `gem install codo && codo ./app/assets/javascripts`

------------
Copyright (c) 2010 - 2012 Jilion(r) - SublimeVideo and Jilion are registered trademarks
