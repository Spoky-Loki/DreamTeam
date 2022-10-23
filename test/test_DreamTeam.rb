# frozen_string_literal: true

require_relative '../test/test_helper'

class TestDreamTeam < Minitest::Test
  def test_that_it_has_a_version_number
    refute_nil ::DreamTeam::VERSION
  end
end
