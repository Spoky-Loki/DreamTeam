# frozen_string_literal: true

require_relative "lib/DreamTeam/version"

Gem::Specification.new do |spec|
  spec.name = "DreamTeam"
  spec.version = DreamTeam::VERSION
  spec.authors = ["Spooky_Loki", "Rogalik", "dkozlikina", "ekaterina432"]
  spec.email = ["viter02@inbox.ru"]

  spec.summary = "The Steam and Films parser is a Ruby library created as an exercise by Mehmat students."
  spec.description = "This gem allows you to get information about the steam user's games and the top 250 IMDb movies.
                       Information about steam games includes:
                       -Name
                       -Picture
                       -Price
                       -Developer
                       -Release date
                       -Description
                       -Number of recommendations
                       -Time spent in the game.
                       Information about the films includes:
                       -Place in the rating
                       -Film name
                       -Full name
                       -Release date
                       -Picture
                       -The actors
                       -Rating
                       -Rating Count"
  spec.homepage = "https://github.com/Spoky-Loki/DreamTeam"
  spec.license = "MIT"
  spec.required_ruby_version = ">= 2.6.0"

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = "https://github.com/Spoky-Loki/DreamTeam.git"

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files = Dir.chdir(__dir__) do
    `git ls-files -z`.split("\x0").reject do |f|
      (f == __FILE__) || f.match(%r{\A(?:(?:bin|test|spec|features)/|\.(?:git|travis|circleci)|appveyor)})
    end
  end
  spec.bindir = "exe"
  spec.executables = spec.files.grep(%r{\Aexe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  # Uncomment to register a new dependency of your gem
  spec.add_dependency "rake", "~> 13.0"
  spec.add_dependency "minitest", "~> 5.0"
  spec.add_dependency "nokogiri"
end
