Fabricator(:group) do
  name { sequence(:name) { |i| "Group #{i}" } }
  subdomain { |group| "#{group[:name].gsub(" ", "-").gsub("_", "-")[0..30]}#{rand(100)}"}
  legend {|group| "#{group[:name]} lengend"}
  description {|group| "#{group[:name]} description" }
  default_tags {["testing"]}
  state "active"
  languages ["en", "es", "fr"]
  owner(:fabricator => :user)
  notification_opts { Fabricate.build(:notification_config ) }
  shapado_version_id { 
    if ShapadoVersion.count==0
      ShapadoVersion.create :token=>"free",:price=>0
    end
    ShapadoVersion.first.id      
  }
  activity_rate 0.0
end
