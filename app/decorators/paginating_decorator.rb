class PaginatingDecorator < Draper::CollectionDecorator
  delegate :page, :items, :outset, :size, :page_param, :params,
            :fragment, :link_extra, :i18n_key, :cycle, :request_path, :count
end