module Shiftable
  def self.shifts(key, date)
    date_offset = ((date.to_i) * (date.to_i)).to_s[-4..-1]
    a_shift = key[0, 2].to_i + date_offset[0].to_i
    b_shift = key[1, 2].to_i + date_offset[1].to_i
    c_shift = key[2, 2].to_i + date_offset[2].to_i
    d_shift = key[3, 2].to_i + date_offset[3].to_i
    [a_shift, b_shift, c_shift, d_shift]
  end
end
