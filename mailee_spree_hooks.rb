class MaileeSpreeHooks < Spree::ThemeSupport::HookListener

  insert_after :signup_below_password_fields, 'news_field'

  

end
