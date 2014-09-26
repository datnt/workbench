# Example usage: GoDaddyReseller::ProductTable::HASH['Enterprise Level DNS']
module GoDaddyReseller
  module ProductPrice
    ARRAY =  [
      ['$7.49', '1 Year Domain New Registration .COM'],
      ['$14.98', '2 Year Domain New Registration .COM'],
      ['$22.47', '3 Year Domain New Registration .COM'],
      ['$29.96', '4 Year Domain New Registration .COM'],
      ['$37.45', '5 Year Domain New Registration .COM'],
      ['$44.94', '6 Year Domain New Registration .COM'],
      ['$52.43', '7 Year Domain New Registration .COM'],
      ['$59.92', '8 Year Domain New Registration .COM'],
      ['$67.41', '9 Year Domain New Registration .COM'],
      ['$74.90', '10 Year Domain New Registration .COM'],
      ['$7.49', '1 Year Domain New Registration .BIZ'],
      ['$14.98', '2 Year Domain New Registration .BIZ'],
      ['$22.47', '3 Year Domain New Registration .BIZ']
    ]

    HASH = ARRAY.inject({}) { |h, p| h[p[1]] = p[0]; h }

    def self.domain_registration_price(top_level_domain, num_years)
      GoDaddyReseller::ProductPrice::HASH["#{num_years} Year Domain New Registration .#{top_level_domain.to_s.upcase}"]
    end
  end
end
