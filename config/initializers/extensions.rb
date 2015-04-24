module ActiveSupport
  class TimeWithZone
    def to_s
      strftime("%d.%m.%Y")
    end
  end
end