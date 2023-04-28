require 'glimmer-dsl-libui'
require './lib/models/author'

class AuthorView
  include Glimmer

  PAGE_SIZE = 20

  def initialize
    # @controller = TabStudentsController.new(self)
    @items = []
    @current_page = 1
    @total_count = 0

    @items = [
      Author.new(1, 'Иван', 'Иванов'),
      Author.new(2, 'Петр', 'Петров'),
      Author.new(3, 'Сидор', 'Сидоров'),
    ]

  end

  def on_create
    update(@items)
    # @controller.on_view_created
    # @controller.refresh_data(@current_page, STUDENTS_PER_PAGE)
  end

  def update(authors)
    items = []

    authors.each do |author|
      items << Struct.new(:номер, :имя_автора, :фамилия_автора).new(author.id, author.first_name, author.last_name)
    end

    @table.model_array = items
  end

  def total_pages
    (@items.size.to_f / PAGE_SIZE).ceil
  end

  def selected_index
    (@current_page - 1) * PAGE_SIZE
  end

  def displayed_items
    @items[selected_index, PAGE_SIZE] || []
  end

  def build
    root_container = horizontal_box {
      # Секция 1
      vertical_box {
        stretchy false

        form {
          stretchy false

          @first_name = entry {
            label 'Имя автора'
          }

          @last_name = entry {
            label 'Фамилия автора'
          }
        }
      }

      # Секция 2
      vertical_box {
        @table = refined_table(
          table_editable: false,
          filter: lambda do |row_hash, query|
            utf8_query = query.force_encoding("utf-8")
            row_hash['Имя автора'].include?(utf8_query)
          end,
          table_columns: {
            'Номер' => :text,
            'Имя автора' => :text,
            'Фамилия автора' => :text,
          }

        )

        @pages = horizontal_box {
          stretchy false

          button("<") {
            stretchy true

            on_clicked do
              @current_page = [@current_page - 1, 1].max
              # @controller.refresh_data(@current_page, STUDENTS_PER_PAGE)
            end

          }
          @page_label = label("...") { stretchy false }
          button(">") {
            stretchy true

            on_clicked do
              @current_page = [@current_page + 1, (@total_count / STUDENTS_PER_PAGE.to_f).ceil].min
              # @controller.refresh_data(@current_page, STUDENTS_PER_PAGE)
            end
          }
        }
      }

      # Секция 3
      vertical_box {
        stretchy false

        button('Добавить') { stretchy false }
        button('Изменить') { stretchy false }
        button('Удалить') { stretchy false }
        button('Обновить') {
          stretchy false

          on_clicked {
            # @controller.refresh_data(@current_page, STUDENTS_PER_PAGE)
          }
        }
      }
    }
    on_create
    root_container
  end

end
