def self.timeToNum t

  if /^([0-1][0-9]):([0-5][0-9]):([0-5][0-9])/ =~ t
    $1.to_i * 3600 + $2.to_i * 60 + $3.to_i
  else
    nil
  end
end