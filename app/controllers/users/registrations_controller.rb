# frozen_string_literal: true

module Users
  class RegistrationsController < Devise::RegistrationsController
    protected

    def after_sign_up_path_for(_resource)
      posts_path # 失敗投稿一覧画面へのパス
    end
  end
end
