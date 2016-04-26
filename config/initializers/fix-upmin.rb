module Upmin::Railties
  module Dashboard
    def group_by_day
      dates = where.not(created_at: nil).group('date(created_at)').order('date(created_at) ASC').count
      # Convert sqlite String date keys to Date keys
      if dates.keys.first.is_a? String
        dates.map { |k, v| [Date.parse(k), v] }
      else
        dates
      end
    end
  end
end