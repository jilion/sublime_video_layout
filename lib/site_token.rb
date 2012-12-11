module SiteToken

  class << self
    TOKENS = {
      www:    'ibvjcopp',
      badged: 't0cf1489',
      my:     'mtrrhukx',
      docs:   'z2g631ff',
      test:   'mtf8cxlm',
      gruber: 's96w44sn',
    }

    def [](name)
      TOKENS[name]
    end

    def tokens
      TOKENS.values
    end
  end

end
