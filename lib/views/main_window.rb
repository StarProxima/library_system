# frozen_string_literal: true

require 'glimmer-dsl-libui'
require_relative 'tab_students'
require './lib/author/ui/author_view'
require './lib/author/ui/author_list_view'

class MainWindow
  include Glimmer

  def initialize
    @view_tab_students = TabStudentsView.new
  end

  def create
    window('Библиотека', 900, 600) {
      tab {
        tab_item('Авторы') {
          AuthorListView.new.create
        }


        tab_item('Студенты') {
          @view_tab_students.create
        }
      }
    }
  end
end
