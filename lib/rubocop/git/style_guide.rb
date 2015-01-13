module RuboCop::Git
# ref. https://github.com/thoughtbot/hound/blob/d2f3933/app/models/style_guide.rb
class StyleGuide
  def initialize(rubocop_options, config_file, override_config_content = nil)
    @rubocop_options = rubocop_options
    @config_file = config_file
    @override_config_content = override_config_content
  end

  def violations(file)
    if ignored_file?(file)
      []
    else
      ::Reek::Examiner.new(Reek::Source::SourceFile.new(file.filename)).smells
    end
  end

  private

  def ignored_file?(file)
    !file.ruby? || file.removed? || excluded_file?(file)
  end

  def excluded_file?(file)
    config.file_to_exclude?(file.filename)
  end

  def parse_source(file)
    RuboCop::ProcessedSource.new(file.content)
  end

  def config
    if @config.nil?
      config = RuboCop::ConfigLoader.configuration_from_file(@config_file)
      combined_config = RuboCop::ConfigLoader.merge(config, override_config)
      @config = RuboCop::Config.new(combined_config, "")
    end

    @config
  end

  def rubocop_options
    if config["ShowCopNames"]
      { debug: true }
    else
      {}
    end.merge(@rubocop_options)
  end

  def override_config
    if @override_config_content
      config_content = YAML.load(@override_config_content)
      override_config = RuboCop::Config.new(config_content, "")
      override_config.add_missing_namespaces
      override_config.make_excludes_absolute
      override_config
    else
      {}
    end
  end
end
end
