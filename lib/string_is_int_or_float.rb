class String
  def is_int_or_float?
    case self
      when /^[-+]?[0-9]+$/
        :int
      when /^[-+]?[0-9]*\.?[0-9]+$/
        :float
      else
        :not_int_or_float
    end
  end
end