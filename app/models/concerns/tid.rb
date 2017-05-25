  module Tid
    extend ActiveSupport::Concern

    included do
      before_create :create_tid
    end

    private

    def create_tid
      begin
        self.tid = SecureRandom.hex(10)
      end while self.class.exists?(tid: tid)
    end
  end