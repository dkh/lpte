# frozen_string_literal: true

module Lpte
  class Senario < Base
    CONTEXT_CLASSES = {
      MY_SUBJECTS = 'my_subjects' => Contexts::MySubjects,
      REGULAR = 'regular' => Contexts::Regular
    }.freeze

    def initialize(driver, context: REGULAR)
      @driver = driver
      @context = context || REGULAR
    end

    def call
      CONTEXT_CLASSES.fetch(context) { Contexts::Regular }.new(driver).run
    end

    private

    private_constant :CONTEXT_CLASSES, :MY_SUBJECTS, :REGULAR

    attr_reader :driver, :context
  end
end
