class Admin::BaseController < ApplicationController
    http_basic_authenticate_with name: 'kashima', password: 'grandsphere'
end