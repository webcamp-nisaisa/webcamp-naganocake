Rails.application.routes.draw do
  devise_for :admin,skip:[:regstrations,:passwords],controllers:{
    sessions:"admin/sessions"
  }
  namespace :admin do
    root to:"homes#top"
    resources:customers,except:[:new,:create,:destroy]
    resources:items,exept:[:destroy]
    resources:genres,except:[:new,:show,:destroy]
    resources:orders,only:[:show,:update]
    resources:order_items,only:[]
  end

  devise_for :customers,skip:[:passwords],controllers:{
    registrations:"customer/registrations",except:[:edit],
    sessions:"customer/sessions"
  }

  scope module: :customer do
    root to: "homes#top"
    get "/about" => "homes#about"
    resources:items,only:[:index,:show]
    resources:cart_items,only:[:index,:create,:update,:destroy]
    delete "/cart_items/" => "cart_items#destroy_all",as:"destroy_all"
    resources:orders,only:[:new,:create,:index,:show]
    post "/orders/confirm" => "orders#confirm"
    get "/orders/complete" => "orders#complete"
    resource:customers,only:[:show,:edit,:update]
    get "/customers/unsubscribe" => "customers#unsubscribe"
    patch "/customers/withdraw" => "customers#withdraw"
    resources:shippings,except:[:new,:show]
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end