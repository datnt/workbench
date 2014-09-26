# Example usage: GoDaddyReseller::CountryTable::HASH['Australia']
module GoDaddyReseller 
  module CountryTable
    PRODUCT_COUNTRIES = {
      'Australia' => [
        'Capital Territory',
        'New South Wales',
        'Northern Territory' ,
        'Queensland',
        'South Australia' ,
        'Tasmania' ,
        'Victoria' ,
        'Western Australia'
      ],
      'Belgium' => [
        'Antwerpen',
        'Brabant Wallon',
        'Brussels',
        'Hainaut',
        'Luxembourg',
        'Liege',
        'Limburg',
        'Namur',
        'Oost-Vlaanderen',
        'Vlaams Brabant',
        'West-Vlaanderen'
      ],
      'Brazil' => [
        'Acre', 'Alagoas', 'Amapa', 'Amazonas',
        'Bahia', 'Ceara', 'Distrito Federal', 'Espirito Santo',
        'Goias', 'Maranhao', 'Mato Grosso', 'Mato Grosso do Sul',
        'Minas', 'Gerais', 'Para', 'Paraiba', 'Parana',
        'Pernambuco', 'Piaui', 'Rondonia', 'Roraima',
        'Santa Catarina', 'Sao Paulo', 'Sergipe', 'Tocantins',
        'Rio Grande do Norte', 'Rio Grande do Sul'
      ],
      'Canada' => [
        'Alberta', 'British Columbia', 'Manitoba', 'New Brunswick',
        'Newfoundland', 'Northwest Territories', 'Nova Scotia', 'Nunavut',
        'Ontario', 'Prince Edward Island', 'Quebec', 'Saskatchewan',
        'Yukon Territory'
      ],
      'India' => [
        'Andaman and Nicobar Islands','Andhra Pradesh', 'Arunachal Pradesh', 'Assam',
        'Bihar', 'Chandigarh', 'Chhattisgarh', 'Dadra and Nagar Haveli',
        'Daman and Diu', 'Delhi', 'Goa', 'Gujarat',
        'Haryana', 'Himachal Pradesh', 'Jammu and Kashmir', 'Jharkhand',
        'Karnataka', 'Kerala', 'Lakshadweep', 'Madhya Pradesh',
        'Maharashtra', 'Manipur', 'Meghalaya', 'Mizoram',
        'Nagaland', 'Orissa', 'Puducherry', 'Punjab',
        'Rajasthan', 'Sikkim', 'Tamil Nadu', 'Tripura',
        'Uttar Pradesh', 'Uttarakhand', 'West Benga'
      ],
      'Japan' => [
        'Aichi', 'Akita', 'Aomori', 'Chiba',
        'Ehime', 'Fukui', 'Fukuoka', 'Fukushima',
        'Gifu', 'Gumma', 'Hiroshima', 'Hokkaido',
        'Hyogo', 'Ibaraki', 'Ishikawa', 'Iwate',
        'Kagawa', 'Kagoshima', 'Kanagawa', 'Kouchi',
        'Kumamoto', 'Kyoto', 'Mie', 'Miyagi',
        'Miyazaki', 'Nagano', 'Nagasaki', 'Nara',
        'Niigata', 'Oita', 'Okayama', 'Okinawa',
        'Osaka', 'Saga', 'Saitama', 'Shiga',
        'Shimane', 'Shizuoka', 'Tochigi', 'Tokushima',
        'Tokyo', 'Tottori', 'Toyama', 'Wakayama',
        'Yamagata', 'Yamaguchi', 'Yamanashi'        
      ],
      'Mexico' => [
        'Aguascalientes', 'Baja', 'California', 'Baja California Sur', 'Campeche',
        'Chiapas', 'Chihuahua', 'Coahuila', 'Colima',
        'Distrito Federal', 'Durango', 'Guanajuato', 'Guerrero',
        'Hidalgo', 'Jalisco', 'Mexico', 'Michoacan',
        'Morelos', 'Nayarit', 'Nuevo Leon', 'Oaxaca',
        'Puebla', 'Queretaro', 'Quintana Roo', 'San Luis Potosi',
        'Sinaloa', 'Sonora', 'Tabasco', 'Tamaulipas',
        'Tlaxcala', 'Veracruz', 'Yucatan', 'Zacatecas'
      ],
      'United States' => [
        'Alabama', 'Alaska', 'American Samoa', 'Arizona',
        'Arkansas', 'Armed Forces America', 'Armed Forces Other Areas', 'Armed Forces Pacific',
        'California', 'Colorado', 'Connecticut', 'Delaware',
        'District of Columbia', 'Federated States of Micronesia', 'Florida', 'Georgia',
        'Guam', 'Hawaii', 'Idaho', 'Illinois',
        'Indiana', 'Iowa', 'Kansas', 'Kentucky',
        'Louisiana', 'Maine', 'Marshall Islands', 'Maryland',
        'Massachusetts', 'Michigan', 'Minnesota', 'Mississippi',
        'Missouri', 'Montana', 'Nebraska', 'Nevada',
        'New Hampshire', 'New Jersey', 'New Mexico', 'New York',
        'North Carolina', 'North Dakota', ' Northern Mariana Islands', 'Ohio',
        'Oklahoma', 'Oregon', 'Palau', 'Pennsylvania',
        'Puerto Rico', 'Rhode Island', 'South Carolina', 'South Dakota',
        'Tennessee', 'Texas', 'Virgin Islands', 'Utah',
        'Vermont', 'Virginia', 'Washington', 'West Virginia',
        'Wisconsin', 'Wyoming'
      ]
    }
    def self.by_name(country_name)
      GoDaddyReseller::CountryTable::PRODUCT_COUNTRIES["#{country_name}"]
    end
    def self.all
      GoDaddyReseller::CountryTable::PRODUCT_COUNTRIES.keys
    end
  end
end
    