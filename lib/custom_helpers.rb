module CustomHelpers
  def chart_levels
    I18n.backend.send(:translations)[I18n.locale][:chart].values
  end

  def i18n_map(hash, key)
    hash.map{ |item| t(item[key]) }
  end
end
