# frozen_string_literal: true

require 'glimmer-dsl-libui'
require_relative '../controllers/author_list_controller'
require_relative '../controllers/author_controller'
require_relative 'author_input_form'

class Person
  attr_accessor :country, :country_options

  def initialize
    self.country_options = ["", "Canada", "US", "Mexico"]
    self.country = "Canada"
  end

  def reset_country
    self.country = "Canada"
  end
end

class AuthorListView
  include Glimmer

  PAGE_SIZE = 20

  def initialize
    @controller = AuthorListController.new(self)
    @current_page = 1
    @total_count = 0
  end

  def on_create
    @controller.on_view_created
    @controller.refresh_data(@current_page, PAGE_SIZE)
  end

  # Метод наблюдателя datalist
  # def on_datalist_changed(new_table)
  #   arr = new_table.to_2d_array
  #   arr.map do |row|
  #     row[3] = [row[3][:value], contact_color(row[3][:type])] unless row[3].nil?
  #   end
  #   @table.model_array = arr
  # end

  def update(authors)
    @items = []

    i = 0
    item_num = 0
    authors.each do |author|
      i += 1
      item_num = ((@current_page - 1) * PAGE_SIZE) + i
      @items << Struct.new(:№, :id, :имя_автора, :фамилия_автора, :отчество).new(item_num, author.author_id, author.first_name, author.last_name, author.father_name)
    end

    @table.model_array = @items
    @page_label.text = "#{@current_page} / #{(@total_count / PAGE_SIZE.to_f).ceil}"
  end

  def update_student_count(new_cnt)
    @total_count = new_cnt
    @page_label.text = "#{@current_page} / #{(@total_count / PAGE_SIZE.to_f).ceil}"
  end

  def create
    person = Person.new

    root_container = horizontal_box {
      # Секция 1
      vertical_box {
        stretchy false

        form {
          stretchy false

          @filter_first_name = entry {
            label 'Имя автора'
          }

          @filter_last_name = entry {
            label 'Фамилия автора'
          }


        }

        vertical_box {
          stretchy false

          label {
            text 'Отчество'
          }
          combobox { |c|
            items ['Не важно','Есть','Нет']
            selected 0
            on_selected do
              @controller.filter_father_name(@current_page, PAGE_SIZE, c.selected)
            end
          }

          label {
            text 'Сортировка'
          }
          combobox { |c|
            items ['ID','Имя автора','Фамилия автора', 'Отчество']
            selected 0
            on_selected do
              @controller.sort(@current_page, PAGE_SIZE, c.selected)
            end
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
            '№' => :text,
            'ID' => :text,
            'Имя автора' => :text,
            'Фамилия автора' => :text,
            'Отчество' => :text,
          },
          per_page: PAGE_SIZE,

        )

        @pages = horizontal_box {
          stretchy false

          button("<") {
            stretchy true

            on_clicked do
              @current_page = [@current_page - 1, 1].max
              @controller.refresh_data(@current_page, PAGE_SIZE)
            end

          }
          @page_label = label("...") { stretchy false }
          button(">") {
            stretchy true

            on_clicked do
              @current_page = [@current_page + 1, (@total_count / PAGE_SIZE.to_f).ceil].min
              @controller.refresh_data(@current_page, PAGE_SIZE)
            end
          }
        }
      }

      # Секция 3
      vertical_box {
        stretchy false

        button('Добавить') {
          stretchy false

          on_clicked {
            @controller.show_modal_add
          }
        }
        button('Изменить') {
          stretchy false

          on_clicked {
            @controller.show_modal_edit(@current_page, PAGE_SIZE, @table.selection) unless @table.selection.nil?
          }
        }
        button('Удалить') {
          stretchy false

          on_clicked {
            @controller.delete_selected(@current_page, PAGE_SIZE, @table.selection) unless @table.selection.nil?
            @controller.refresh_data(@current_page, PAGE_SIZE)
          }
        }
        button('Обновить') {
          stretchy false

          on_clicked {
            @controller.refresh_data(@current_page, PAGE_SIZE)
          }
        }
      }
    }
    on_create
    root_container
  end
end
