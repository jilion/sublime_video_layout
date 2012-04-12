module SiteToken

  class << self
    TOKENS = {
      www:  'ibvjcopp',
      my:   'mtrrhukx',
      docs: 'z2g631ff',
      test: 'mtf8cxlm'
    }

    def [](name)
      TOKENS[name]
    end
  end

end
