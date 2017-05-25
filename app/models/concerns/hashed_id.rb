  module HashedId
    extend ActiveSupport::Concern

    included do
      before_create :create_hashed_id
    end

    private

    def create_hashed_id
      begin
        self.hashed_id = SecureRandom.hex(10)
      end while self.class.exists?(hashed_id: hashed_id)
    end
  end