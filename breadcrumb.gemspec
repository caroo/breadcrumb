# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{breadcrumb}
  s.version = "0.0.1"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Caroo GmbH Development"]
  s.date = %q{2009-11-02}
  s.description = %q{FIX (describe your package)}
  s.email = ["dev@pkw.de"]
  s.extra_rdoc_files = ["History.txt", "Manifest.txt", "PostInstall.txt"]
  s.files = ["History.txt", "Manifest.txt", "PostInstall.txt", "README.rdoc", "Rakefile", "breadcrumb.gemspec", "lib/breadcrumb.rb", "lib/breadcrumb/controller_methods.rb", "lib/breadcrumb/view_helper.rb", "script/console", "script/destroy", "script/generate", "test/test_breadcrumb.rb", "test/test_controller_methods.rb", "test/test_helper.rb", "test/test_view_helper.rb"]
  s.has_rdoc = true
  s.homepage = %q{http://github.com/#{github_username}/#{project_name}}
  s.rdoc_options = ["--main", "README.rdoc"]
  s.require_paths = ["lib"]
  s.rubyforge_project = %q{breadcrumb}
  s.rubygems_version = %q{1.3.1}
  s.summary = %q{FIX (describe your package)}
  s.test_files = ["test/test_breadcrumb.rb", "test/test_controller_methods.rb", "test/test_helper.rb", "test/test_view_helper.rb"]

  if s.respond_to? :specification_version then
    current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
    s.specification_version = 2

    if Gem::Version.new(Gem::RubyGemsVersion) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<actionpack>, [">= 2.2.2"])
      s.add_development_dependency(%q<hoe>, [">= 2.3.3"])
    else
      s.add_dependency(%q<actionpack>, [">= 2.2.2"])
      s.add_dependency(%q<hoe>, [">= 2.3.3"])
    end
  else
    s.add_dependency(%q<actionpack>, [">= 2.2.2"])
    s.add_dependency(%q<hoe>, [">= 2.3.3"])
  end
end
