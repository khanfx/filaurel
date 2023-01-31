require "active_record"

class Ebill < ActiveRecord::Base
    validates_presence_of :amount
    has_many :Payment
    has_many :EbillUpdate
end

class EbillUpdate < ActiveRecord::Base
    belongs_to :ebill
end

class Payment < ActiveRecord::Base
    belongs_to :ebill
end

  