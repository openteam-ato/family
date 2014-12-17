class ApplicationController < ActionController::Base
  protect_from_forgery

  before_filter :prepare_cms

  def index
    if subdomain.present? && subdomains.has_key?(subdomain) && subdomain_path.present?
      render template, :layout => 'subdomain'
    else
      render template, :layout => 'application'
    end
  end

  def show
  end

  alias_method :new, :show
  alias_method :create, :show

  private

    def prepare_cms
      render :file => "#{Rails.root}/public/404", :formats => [:html], :layout => false and return if request_status == 404

      page_regions.each do |region|
        eval "@#{region} = page.regions.#{region}"
      end

      @page_title = page.title
    end

    def template
      "templates/#{page.template}"
    end

    def cms_address
      "#{Settings['cms.url']}/nodes/#{Settings['cms.site_slug']}"
    end

    def subdomains
      @subdomains ||= YAML.load_file(Rails.root.join('config', 'subdomains.yml')).try(:[], 'subdomains')
    end

    def subdomain
      if request.subdomain.split('.').size > 1
        @subdomain ||= request.subdomain.split('.').first == 'www' ? request.subdomain.split('.').second : request.subdomain.split('.').first
      end

      @subdomain
    end

    def subdomain_path
      @subdomain_path ||= (subdomains[subdomain][:path] || subdomains[subdomain]['path']).to_s.squish if subdomain.present? && subdomains.has_key?(subdomain)
    end

    def remote_url
      request_path, parts_params = request.fullpath.split('?')
      request_path = "#{subdomain_path}/#{request_path}".gsub('//', '/') if subdomain_path.present? && request_path.gsub(/\/$/, '') != subdomain_path

      request_path = request_path.gsub(/\A(.*)\z/, "/ru\\1") if request_path.match(/\A\/users.*/) # routes for devise

      request_path = '/ru/my' if request_path.match(/\A\/my.*/) # routes for my register providers
      request_path = '/ru/reestr-postavschikov-sotsialnyh-uslug' if request_path.match(/\A\/ru\/reestr-postavschikov-sotsialnyh-uslug.*/) # routes for my register providers

      "#{cms_address}#{request_path.gsub('//', '/').split('/').compact.join('/')}.json?#{parts_params}"
    end

    def page
      @page ||= Hashie::Mash.new(request_json).page
    end

    def curl_request
      @curl_request ||= Curl::Easy.perform(remote_url) do |curl|
        curl.headers['Accept'] = 'application/json'
      end
    end

    def request_status
      @request_status ||= curl_request.response_code
    end

    def request_body
      @request_body ||= curl_request.body_str
    end

    def is_json?(str)
      begin
        !!JSON.parse(str)
      rescue
        false
      end
    end

    def request_json
      @request_json ||= begin
                          raise ActionController::RoutingError.new('Not Found') unless is_json?(request_body)
                          ActiveSupport::JSON.decode(request_body)
                        end
    end

    def page_regions
      @page_regions ||= page.regions.keys
    end
end
