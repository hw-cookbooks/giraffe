if defined?(ChefSpec)
  def create_giraffe_instance(name)
    ChefSpec::Matchers::ResourceMatcher.new(:giraffe_instance, :create, name)
  end

  def delete_giraffe_instance(name)
    ChefSpec::Matchers::ResourceMatcher.new(:giraffe_instance, :delete, name)
  end
end
