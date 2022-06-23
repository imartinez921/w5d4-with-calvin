# == Schema Information
#
# Table name: shortened_urls
#
#  id         :bigint           not null, primary key
#  long_url   :string
#  short_url  :string           not null
#  user_id    :integer          not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class ShortenedUrl < ApplicationRecord
    #Validations
    validates :user_id, presence: true
    validates :short_url, presence: true, uniqueness: true
    validates :long_url, presence: true

    #Factory Method to generate our shortened-urls
    def self.random_code(user, long_url)
        #want to return a 22 character long string that has not been used before
        generated = SecureRandom.urlsafe_base64
        if ShortenedUrl.exists?(:short_url => generated)
            ShortenedUrl.random_code(user, long_url)
        else
            return generated
        end
    end

    belongs_to :submitter,
        primary_key: :id,
        foreign_key: :user_id,
        class_name: :User

    has_many :visitors,
        primary_key: :id,
        foreign_key: :user_id,
        class_name: :User

end
