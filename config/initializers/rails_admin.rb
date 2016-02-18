RailsAdmin.config do |config|
  config.authorize_with do
    unless current_user && current_user.admin
      redirect_to(
        main_app.root_path,
        alert: "You are not permitted to view this page"
      )
    end
  end

  config.current_user_method { current_user }

  ### Popular gems integration

  ## == Devise ==
  # config.authenticate_with do
  #   warden.authenticate! scope: :user
  # end
  # config.current_user_method(&:current_user)

  ## == Cancan ==
  # config.authorize_with :cancan

  ## == Pundit ==
  # config.authorize_with :pundit

  ## == PaperTrail ==
  # config.audit_with :paper_trail, 'User', 'PaperTrail::Version' # PaperTrail >= 3.0.0

  ### More at https://github.com/sferik/rails_admin/wiki/Base-configuration

  config.actions do
    dashboard                     # mandatory
    index                         # mandatory
    new do
      except ["Order"]
    end
    export
    bulk_delete
    show
    edit
    delete
    show_in_app

    ## With an audit adapter, you can add:
    # history_index
    # history_show
  end

  config.model 'Book' do
    edit do
      field :title
      field :description
      field :price
      field :books_in_stock
      field :author
      field :category
    end
  end

  config.model 'Author' do
    edit do
      field :firstname
      field :lastname
      field :biography
    end
  end

  config.model 'Category' do
    edit do
      field :title
    end
  end

  config.model 'Delivery' do
    edit do
      field :price
      field :name
    end
  end

  config.model 'Order' do
    list do
      field :total_price_with_delivery
      field :aasm_state do
        label "Order States"
      end
    end

    edit do
      field :aasm_state, :enum do
        enum do
          ['in_processing', 'in_delivery', 'delivered', 'canceled']
        end
      end
      field :aasm_state do
        label "Order State"
      end
    end
  end

  config.model "Review" do
    edit do
      field :title
      field :content
      field :approved
    end
  end

  config.model "User" do
    edit do
      field :admin
      field :email
      field :password
    end
  end

  config.model 'Address' do
    visible false
  end

  config.model 'CreditCard' do
    visible false
  end

  config.model 'OrderItem' do
    visible false
  end

  config.model 'BillingAddress' do
    visible false
  end

  config.model 'ShippingAddress' do
    visible false
  end

  config.model 'Authorization' do
    visible false
  end

end
