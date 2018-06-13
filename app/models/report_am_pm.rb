require 'csv'

class ReportAmPm
  def initialize(filename = 'data/report-am-pm.csv')
    @filename = filename
  end

  def self.parse
    Parser.new.parse
  end

  def parse
    res = {}
    data = CSV.read(@filename)
    data[1..-1].each do |row|
      datetime = DateTime.parse(row[0])
      date = datetime.to_date
      if row[1] == 'Blood Glucose'
        res[date] ||= []
        res[date] << row
      end
    end

    out = []
    CSV.open(@filename.gsub('.csv', '-out.csv'), 'wb') do |csv|
      csv << ['date', 'morning', 'bc', 'evening', 'bc']
      res.each do |k, rows|
        r = []
        date_morning = DateTime.parse(rows.first[0])
        date_evening = DateTime.parse(rows.last[0])
        r << k
        if date_morning.hour < 13
          r << date_morning.to_s(:time)
          r << rows.first[2]
        else
          r << [nil, nil]
        end
        if date_evening.hour > 12
          r << date_evening.to_s(:time)
          r << rows.last[2]
        else
          r << [nil, nil]
        end
        csv << r.flatten
      end
    end
  end
end
